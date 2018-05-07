package cn.jeeweb.modules.task.task;

import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.utils.DateUtils;
import cn.jeeweb.core.utils.SpringContextHolder;
import cn.jeeweb.modules.oa.entity.OaNotification;
import cn.jeeweb.modules.oa.service.IOaNotificationService;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.CourseRecord;
import cn.jeeweb.modules.sys.entity.CourseStudentRecord;
import cn.jeeweb.modules.sys.entity.StudentCourseRel;
import cn.jeeweb.modules.sys.service.ICourseRecordService;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.ICourseStudentRecordService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
import com.baomidou.mybatisplus.mapper.Wrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 每周日晚上22点执行
 * 0 30 22 ? * L
 *
 */
@Slf4j
@Component(value = "courseTask")
public class CourseTask {

    private ICourseService courseService = SpringContextHolder.getBean(ICourseService.class);

    private IOaNotificationService oaNotificationService = SpringContextHolder.getBean(IOaNotificationService.class);;

    private ICourseRecordService courseRecordService = SpringContextHolder.getBean(ICourseRecordService.class);;

    private ICourseStudentRecordService courseStudentRecordService = SpringContextHolder.getBean(ICourseStudentRecordService.class);;

    private IStudentCourseRelService studentCourseRelService = SpringContextHolder.getBean(IStudentCourseRelService.class);;

    public void run() {

        int curDayOfWeek = this.getCurDayOfWeek();
        if(curDayOfWeek != 0) {
            log.info("-------非周日时段,无法执行排课任务!");
            return;
        }

        List<Course> courseList = this.findCourse();
        if(CollectionUtils.isEmpty(courseList)) {
            log.error("-------无有效课程信息,请及时处理!");
            oaNotificationService.insert(this.initOaNotification("排课任务失败", "无有效课程信息,请及时处理!"));
            return;
        }

        this.doCoursePlan(courseList);

    }

    /**
     *
     * @return
     */
    private int getCurDayOfWeek() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        return w;
    }

    /**
     *
     * @return  课程模板中所有正常的课程信息
     */
    private List<Course> findCourse() {
        return courseService.selectList(new EntityWrapper<Course>().eq("status", Course.CourseStatus.NORMAL.name()));
    }

    /**
     *
     * @param courseList
     */
    private void doCoursePlan(List<Course> courseList) {

        List<CourseRecord> courseRecordList = new ArrayList<>();
        List<CourseStudentRecord> courseStudentRecordList = new ArrayList<>();

        CourseRecord courseRecord;
        for(Course course : courseList) {
            courseRecord = this.initCourseRecord(course);
            courseRecordList.add(courseRecord);
            courseStudentRecordList.addAll(this.generateCourseStudentRecord(courseRecord));
        }

        if(CollectionUtils.isEmpty(courseRecordList)) {
            this.notifyError();
            return;
        }

        this.courseRecordService.insertBatch(courseRecordList);

        if(CollectionUtils.isNotEmpty(courseStudentRecordList)) {
            this.courseStudentRecordService.insertBatch(courseStudentRecordList);
        }
    }

    private void notifyError() {
        Date nextDate = DateUtils.addDay(new Date(), 1);
        String nextMonStr = DateUtils.formatDate(nextDate, "yyyy/MM/dd");
        String nextSunStr = DateUtils.formatDate(DateUtils.addDay(nextDate, 6), "yyyy/MM/dd");
        log.error("-------本周课程表制作失败,请及时处理!");
        oaNotificationService.insert(this.initOaNotification("排课任务失败",
                "本周[" + nextMonStr + " - " + nextSunStr + "]课程表制作失败,请及时处理!"));
    }

    /**
     *
     * @param course
     * @return
     */
    private CourseRecord initCourseRecord(Course course) {
        CourseRecord courseRecord = new CourseRecord();

        courseRecord.setCourseId(course.getId());
        courseRecord.setTeacherId(course.getTeacherId());
        this.calculateDate(course, courseRecord);

        courseRecord.setHaveAdjust(CourseRecord.HaveAdjust.NO);

        courseRecord.setStudentQuantityPlan(this.getStudentCourseRelCount(course.getId()));

        courseRecord.setCreateDate(new Date());

        return courseRecord;
    }

    /**
     *
     * @param course
     * @param courseRecord
     */
    private void calculateDate(Course course, CourseRecord courseRecord) {

        String curDay = DateUtils.formatDate(new Date(), "yyyy-MM-dd");
        String startDate = curDay + " " + course.getStartTime();
        String endDate = curDay + " " + course.getEndTime();

        int offset = course.getWeekInfo();

        courseRecord.setCourseStartDate(DateUtils.addDay(DateUtils.parseDate(startDate), offset));
        courseRecord.setCourseStartDate(DateUtils.addDay(DateUtils.parseDate(endDate), offset));
    }

    /**
     *
     * @param courseId
     * @return
     */
    private int getStudentCourseRelCount(String courseId) {
        Wrapper<StudentCourseRel> entityWrapper = new EntityWrapper<>(StudentCourseRel.class);
        entityWrapper.eq("course_id", courseId);
        return this.studentCourseRelService.selectCount(entityWrapper);
    }

    private List<CourseStudentRecord> generateCourseStudentRecord(CourseRecord courseRecord) {
        List<CourseStudentRecord> courseStudentRecordList = new ArrayList<>();

        List<StudentCourseRel> studentCourseRelList = this.getStudentCourseRelList(courseRecord.getCourseId());
        if(CollectionUtils.isNotEmpty(studentCourseRelList)) {
            for(StudentCourseRel studentCourseRel : studentCourseRelList) {
                courseStudentRecordList.add(this.initCourseStudentRecord(studentCourseRel, courseRecord));
            }
        }

        return courseStudentRecordList;
    }

    /**
     *
     * @param studentCourseRel
     * @param courseRecord
     * @return
     */
    private CourseStudentRecord initCourseStudentRecord(StudentCourseRel studentCourseRel, CourseRecord courseRecord) {
        CourseStudentRecord courseStudentRecord = new CourseStudentRecord();
        courseStudentRecord.setCourseRecId(courseRecord.getId());
        courseStudentRecord.setStudentId(studentCourseRel.getStudentId());
        courseStudentRecord.setStatus(CourseStudentRecord.CourseStudentRecordStatus.NORMAL);
        courseStudentRecord.setHaveAdjust(CourseRecord.HaveAdjust.NO);
        courseStudentRecord.setCreateDate(new Date());
        return courseStudentRecord;
    }

    /**
     *
     * @param courseId
     * @return
     */
    private List<StudentCourseRel> getStudentCourseRelList(String courseId) {
        Wrapper<StudentCourseRel> entityWrapper = new EntityWrapper<>(StudentCourseRel.class);
        entityWrapper.eq("course_id", courseId);
        return this.studentCourseRelService.selectList(entityWrapper);
    }

    /**
     *
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

}
