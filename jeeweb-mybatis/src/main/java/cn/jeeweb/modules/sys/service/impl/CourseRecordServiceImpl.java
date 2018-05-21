package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.model.ResultBean;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.utils.DateUtils;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.oa.entity.OaNotification;
import cn.jeeweb.modules.oa.service.IOaNotificationService;
import cn.jeeweb.modules.sys.Constants;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.mapper.CourseMapper;
import cn.jeeweb.modules.sys.mapper.CourseRecordMapper;
import cn.jeeweb.modules.sys.service.*;
import com.baomidou.mybatisplus.mapper.Wrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class CourseRecordServiceImpl extends CommonServiceImpl<CourseRecordMapper, CourseRecord> implements ICourseRecordService {

    @Autowired
    private ICourseService courseService;

    @Autowired
    private ITeacherService teacherService;

    @Autowired
    private IStudentService studentService;

    @Autowired
    private ICourseStudentRecordService courseStudentRecordService;

    @Autowired
    private IStudentCourseRelService studentCourseRelService;

    @Autowired
    private IOaNotificationService oaNotificationService;

    @Override
    public Page<CourseRecord> list(Queryable queryable, Wrapper<CourseRecord> wrapper) {
        Page<CourseRecord> courseRecordPage = super.list(queryable, wrapper);
        List<CourseRecord> courseRecordList = courseRecordPage.getContent();
        if (CollectionUtils.isNotEmpty(courseRecordList)) {
            this.packageCourseRecord(courseRecordList);
        }
        return courseRecordPage;
    }

    @Override
    public List<CourseRecord> selectList(Wrapper<CourseRecord> wrapper) {
        List<CourseRecord> courseRecordList = super.selectList(wrapper);
        this.packageCourseRecord(courseRecordList);
        return courseRecordList;
    }

    private void packageCourseRecord(List<CourseRecord> courseRecordList) {
        Teacher teacher;
        Course course;
        Date curDate = new Date();
        for (CourseRecord courseRecord : courseRecordList) {
            teacher = this.teacherService.selectById(courseRecord.getTeacherId());
            if (null != teacher) {
                courseRecord.setTeacherRealName(teacher.getRealName());
            }

            course = this.courseService.selectById(courseRecord.getCourseId());
            if (null != course) {
                courseRecord.setCourseCode(course.getCode());

                courseRecord.setWeekName(Constants.WEEK_DAYS[course.getWeekInfo()]);

                courseRecord.setDuration(course.getDuration());
            }

            if(courseRecord.getCourseStartDate().before(curDate) && courseRecord.getCourseEndDate().after(curDate)) {
                if(!CourseRecord.CourseRecordStatus.DOING.equals(courseRecord.getStatus())) {
                    courseRecord.setStatus(CourseRecord.CourseRecordStatus.DOING);
                    courseRecord.setUpdateDate(new Date());
                    this.updateById(courseRecord);
                }
            } else if(courseRecord.getCourseEndDate().before(curDate)) {
                if(!CourseRecord.CourseRecordStatus.FINISHED.equals(courseRecord.getStatus())) {
                    courseRecord.setStatus(CourseRecord.CourseRecordStatus.FINISHED);
                    courseRecord.setUpdateDate(new Date());
                    this.updateById(courseRecord);
                }
            }
        }
    }

    /**
     * @return
     */
    @Override
    public ResultBean generateCourseRecordForNextWholeWeek() {

        int curDayOfWeek = this.getCurDayOfWeek();
        if (curDayOfWeek != 0) {
            oaNotificationService.insert(this.initOaNotification("排课失败", "非周日时段执行排课任务,联系研发!"));
            return ResultBean.FAILED("非周日时段无法进行排课");
        }

        List<Course> courseList = this.findCourse();

        if (CollectionUtils.isEmpty(courseList)) {
            oaNotificationService.insert(this.initOaNotification("排课失败", "无有效课程模板,请及时处理!"));
            return ResultBean.FAILED("无有效课程模板");
        }

        this.doCoursePlan(courseList, curDayOfWeek);

        return ResultBean.SUCCESS();
    }

    /**
     * @return
     */
    private int getCurDayOfWeek() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        return w;
    }

    /**
     * @return 课程模板中所有正常的课程信息
     */
    private List<Course> findCourse() {
        return courseService.selectList(new EntityWrapper<Course>().eq("status", Course.CourseStatus.NORMAL.name()));
    }

    /**
     * @param title
     * @param content
     * @return
     */
    private OaNotification initOaNotification(String title, String content) {
        OaNotification oaNotification = new OaNotification();
        oaNotification.setContent(content);
        oaNotification.setTitle(title);
        oaNotification.setStatus("1");
        oaNotification.setCreateDate(new Date());
        return oaNotification;
    }

    /**
     * @param courseList
     */
    private void doCoursePlan(List<Course> courseList, int curDayOfWeek) {

        List<CourseStudentRecord> courseStudentRecordList = new ArrayList<>();

        CourseRecord courseRecord;
        for (Course course : courseList) {

            if (StringUtils.isBlank(course.getTeacherId())) {
                log.error("-------课程[{}]未设置授课老师,请及时处理!", course.getCode());
                oaNotificationService.insert(this.initOaNotification("排课失败", "课程[" + course.getCode() + "]未设置授课老师,请及时处理!"));
                continue;
            }

            // 非周日时段，只能生成本周的授课信息
            if (curDayOfWeek > 0 && curDayOfWeek >= course.getWeekInfo()) {
                log.error("-------只允许生成本周的授课信息");
                continue;
            }
            courseRecord = this.initCourseRecord(course, curDayOfWeek);
            if (!this.checkIfExisted(courseRecord)) {
                this.insert(courseRecord);
            }

            // 生成学生信息
            courseStudentRecordList.addAll(this.generateCourseStudentRecord(courseRecord));
        }

        if (CollectionUtils.isNotEmpty(courseStudentRecordList)) {
            this.courseStudentRecordService.insertBatch(courseStudentRecordList);
            // 检查剩余数量，为0时不再继续排课，同时发送系统通知
            this.filterStudent(courseStudentRecordList);
        }
    }

    /**
     * @param courseRecord
     * @return
     */
    private boolean checkIfExisted(CourseRecord courseRecord) {
        EntityWrapper<CourseRecord> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("course_id", courseRecord.getCourseId());
        entityWrapper.eq("course_start_date", courseRecord.getCourseStartDate());
        CourseRecord dbRec = this.selectOne(entityWrapper);
        if (null != dbRec) {
            courseRecord.setId(dbRec.getId());
        }
        return null != dbRec;
    }

    /**
     * @param course
     * @return
     */
    private CourseRecord initCourseRecord(Course course, int curDayOfWeek) {
        CourseRecord courseRecord = new CourseRecord();

        courseRecord.setCourseId(course.getId());
        courseRecord.setTeacherId(course.getTeacherId());
        this.calculateDate(curDayOfWeek, course, courseRecord);

        courseRecord.setHaveAdjust(CourseRecord.HaveAdjust.NO);

        courseRecord.setStudentQuantityPlan(this.getStudentCourseRelCount(course.getId()));

        courseRecord.setCreateDate(new Date());

        courseRecord.setCourseCode(course.getCode());

        return courseRecord;
    }

    /**
     * @param course
     * @param courseRecord
     */
    private void calculateDate(int curDayOfWeek, Course course, CourseRecord courseRecord) {

        int offset = course.getWeekInfo() - curDayOfWeek;

        // 下周的课程不在非周日时段生成授课信息
/*        if(course.getWeekInfo() <= curDayOfWeek) {
            offset = (7 - curDayOfWeek) + course.getWeekInfo();
        }*/

        String curDay = DateUtils.formatDate(new Date(), "yyyy-MM-dd");
        String startDate = curDay + " " + course.getStartTime();
        String endDate = curDay + " " + course.getEndTime();

        courseRecord.setCourseStartDate(DateUtils.addDay(DateUtils.parseDate(startDate), offset));
        courseRecord.setCourseEndDate(DateUtils.addDay(DateUtils.parseDate(endDate), offset));
    }

    /**
     * @param courseId
     * @return
     */
    private int getStudentCourseRelCount(String courseId) {
        Wrapper<StudentCourseRel> entityWrapper = new EntityWrapper<>(StudentCourseRel.class);
        entityWrapper.eq("course_id", courseId);
        entityWrapper.eq("status", StudentCourseRel.StudentCourseRelStatus.NORMAL.name());
        return this.studentCourseRelService.selectCount(entityWrapper);
    }

    /**
     * 根据课程模板关系设置本节课程的学生信息
     *
     * @param courseRecord
     * @return
     */
    private List<CourseStudentRecord> generateCourseStudentRecord(CourseRecord courseRecord) {
        List<CourseStudentRecord> courseStudentRecordList = new ArrayList<>();

        List<StudentCourseRel> studentCourseRelList = this.getStudentCourseRelList(courseRecord.getCourseId());
        if (CollectionUtils.isNotEmpty(studentCourseRelList)) {
            for (StudentCourseRel studentCourseRel : studentCourseRelList) {
                CourseStudentRecord courseStudentRecord = this.initCourseStudentRecord(studentCourseRel, courseRecord);
                if (null != courseStudentRecord && !this.checkIfExisted(courseStudentRecord)) {
                    courseStudentRecordList.add(courseStudentRecord);
                }
            }
        } else {
            oaNotificationService.insert(this.initOaNotification("排课失败",
                    "课程[" + courseRecord.getCourseCode() + "]未设置学生信息,请及时处理!"));
        }

        return courseStudentRecordList;
    }

    /**
     * @param courseId
     * @return
     */
    private List<StudentCourseRel> getStudentCourseRelList(String courseId) {
        Wrapper<StudentCourseRel> entityWrapper = new EntityWrapper<>(StudentCourseRel.class);
        entityWrapper.eq("course_id", courseId);
        entityWrapper.eq("status", "NORMAL");
        return this.studentCourseRelService.selectList(entityWrapper);
    }

    /**
     * @param studentCourseRel
     * @param courseRecord
     * @return
     */
    private CourseStudentRecord initCourseStudentRecord(StudentCourseRel studentCourseRel, CourseRecord courseRecord) {

        Student student = this.studentService.selectById(studentCourseRel.getStudentId());
        if (null == student) {
            oaNotificationService.insert(this.initOaNotification("排课失败",
                    "编号[" + studentCourseRel.getStudentId() + "]的学生不存在,请检查数据有效性!"));
            return null;
        }

        if (student.getStatus() != Student.STATUS_NORMAL) {
            oaNotificationService.insert(this.initOaNotification("排课失败",
                    "学生[" + student.getRealName() + "]处于非正常状态,无法进行排课!"));
            return null;
        }

        CourseStudentRecord courseStudentRecord = new CourseStudentRecord();
        courseStudentRecord.setStudentRealName(student.getRealName());
        courseStudentRecord.setCourseRecId(courseRecord.getId());
        courseStudentRecord.setStudentId(studentCourseRel.getStudentId());
        courseStudentRecord.setStatus(CourseStudentRecord.CourseStudentRecordStatus.NORMAL);
        courseStudentRecord.setCreateDate(new Date());

        return courseStudentRecord;
    }

    private boolean checkIfExisted(CourseStudentRecord courseStudentRecord) {

        EntityWrapper<CourseStudentRecord> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("student_id", courseStudentRecord.getStudentId());
        entityWrapper.eq("course_rec_id", courseStudentRecord.getCourseRecId());

        CourseStudentRecord dbRec = this.courseStudentRecordService.selectOne(entityWrapper);
        if (null != dbRec) {
            courseStudentRecord.setId(dbRec.getId());
        }

        return null != dbRec;
    }

    private void filterStudent(List<CourseStudentRecord> courseStudentRecordList) {
        Student student;
        for (CourseStudentRecord courseStudentRecord : courseStudentRecordList) {

            student = this.studentService.selectById(courseStudentRecord.getStudentId());
            student.setRemainCourse(student.getRemainCourse() - 1);
            if (student.getRemainCourse() <= 0) {
                student.setStatus(Student.STATUS_ARREARS);
            }
            this.studentService.updateById(student);

            if (student.getRemainCourse() <= 0) {
                oaNotificationService.insert(this.initOaNotification("学生信息更新",
                        "学生[" + student.getRealName() + "]可用授课数量为0,无法继续排课!"));
            }
            if (student.getRemainCourse() <= 2) {
                oaNotificationService.insert(this.initOaNotification("学生信息更新",
                        "学生[" + student.getRealName() + "]可用授课数量已不足3课时,请及时通知补交学费!"));
            }
        }
    }

    @Override
    public ResultBean generateCourseRecordForCurWeek(String courseId) {
        if (StringUtils.isBlank(courseId)) {
            return ResultBean.FAILED("参数无效");
        }

        Course course = this.courseService.selectById(courseId);
        if (null == course || !Course.CourseStatus.NORMAL.equals(course.getStatus())) {
            return ResultBean.FAILED("无有效课程");
        }

        if (StringUtils.isBlank(course.getTeacherId())) {
            return ResultBean.FAILED("课程[" + course.getCode() + "]未设置授课老师");
        }

        int curDayOfWeek = this.getCurDayOfWeek();
        if(curDayOfWeek >= course.getWeekInfo()) {
            return ResultBean.FAILED("本周内的课程[" + course.getCode() + "]已无法创建");
        }

        CourseRecord courseRecord = this.initCourseRecord(course, curDayOfWeek);
        if (!this.checkIfExisted(courseRecord)) {
            this.insert(courseRecord);
        }

        List<CourseStudentRecord> courseStudentRecordList = this.generateCourseStudentRecord(courseRecord);
        if(CollectionUtils.isEmpty(courseStudentRecordList)) {
            this.deleteById(courseRecord.getId());
            return ResultBean.FAILED("课程[" + courseRecord.getCourseCode() + "]未设置学生信息!");
        }

        this.courseStudentRecordService.insertBatch(courseStudentRecordList);
        // 检查剩余数量，更新学生课程数量信息，同时发送系统通知
        this.filterStudent(courseStudentRecordList);

        return ResultBean.SUCCESS();
    }

}
