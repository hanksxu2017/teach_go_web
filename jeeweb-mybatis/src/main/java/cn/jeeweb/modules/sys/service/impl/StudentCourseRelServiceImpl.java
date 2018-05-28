package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.Constants;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.mapper.CourseRecordMapper;
import cn.jeeweb.modules.sys.mapper.StudentCourseRelMapper;
import cn.jeeweb.modules.sys.service.*;
import com.baomidou.mybatisplus.mapper.Wrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@Service
public class StudentCourseRelServiceImpl extends CommonServiceImpl<StudentCourseRelMapper, StudentCourseRel> implements IStudentCourseRelService {


    @Override
    public Page<StudentCourseRel> list(Queryable queryable, Wrapper<StudentCourseRel> wrapper) {
        Page<StudentCourseRel> studentCourseRelPage = super.list(queryable, wrapper);
        this.packageStudentCourseRel(studentCourseRelPage.getContent());
        return studentCourseRelPage;
    }

    private void packageStudentCourseRel(List<StudentCourseRel> studentCourseRelList) {
        if (CollectionUtils.isNotEmpty(studentCourseRelList)) {
            for (StudentCourseRel studentCourseRel : studentCourseRelList) {
                this.packageStudentCourseRel(studentCourseRel);
            }
        }
    }

    @Autowired
    private ICourseService courseService;
    @Autowired
    private IStudyClassService studyClassService;
    @Autowired
    private ITeacherService teacherService;
    @Autowired
    private IStudySchoolService studySchoolService;
    @Autowired
    private ICfgCourseTimeService cfgCourseTimeService;

    private void packageStudentCourseRel(StudentCourseRel studentCourseRel) {
        String courseId = studentCourseRel.getCourseId();
        if (StringUtils.isBlank(courseId)) {
            log.error("[数据配置错误]-[学生课程关系]-[关系{}未设置课程ID]", studentCourseRel.getId());
            return;
        }
        Course course = courseService.selectById(courseId);
        if (null == course) {
            log.error("[数据配置错误]-[学生课程关系]-[课程{}不存在]", studentCourseRel.getCourseId());
            return;
        }
        studentCourseRel.setWeekDay(Constants.WEEK_DAYS[course.getWeekInfo()]);

        if(StringUtils.isBlank(course.getCourseTimeId())) {
            log.error("[数据配置错误]-[学生课程关系]-[课程{}未设置课时]", course.getId());
            return;
        }
        CfgCourseTime cfgCourseTime = this.cfgCourseTimeService.selectById(course.getCourseTimeId());
        if(null == cfgCourseTime) {
            log.error("[数据配置错误]-[学生课程关系]-[课时{}不存在]", course.getCourseTimeId());
            return;
        }
        course.setStartTime(cfgCourseTime.getStartTime());
        course.setEndTime(cfgCourseTime.getEndTime());
        studentCourseRel.setCourseDesc(course.getCode());

        if (StringUtils.isBlank(course.getStudyClassId())) {
            log.error("[数据配置错误]-[学生课程关系]-[课程{}未设置班级信息]", studentCourseRel.getCourseId());
            return;
        }

        StudyClass studyClass = this.studyClassService.selectById(course.getStudyClassId());
        if (null == studyClass) {
            log.error("[数据配置错误]-[学生课程关系]-[班级{}不存在]", course.getStudyClassId());
            return;
        }
        studentCourseRel.setStudyClassName(studyClass.getName());

        if(StringUtils.isBlank(studyClass.getTeacherId())) {
            log.error("[数据配置错误]-[学生课程关系]-[班级{}未设置教师信息]", studyClass.getId());
            return;
        }
        Teacher teacher = teacherService.selectById(studyClass.getTeacherId());
        if(null == teacher) {
            log.error("[数据配置错误]-[学生课程关系]-[教师{}不存在]", studyClass.getTeacherId());
            return;
        }
        studentCourseRel.setTeacherName(teacher.getRealName());

        if(StringUtils.isBlank(studyClass.getStudySchoolId())) {
            log.error("[数据配置错误]-[学生课程关系]-[班级{}未设置校区信息]", studyClass.getId());
            return;
        }
        StudySchool studySchool = this.studySchoolService.selectById(studyClass.getStudySchoolId());
        if(null == studySchool) {
            log.error("[数据配置错误]-[学生课程关系]-[校区{}不存在]", studyClass.getStudySchoolId());
            return;
        }
        studentCourseRel.setStudySchoolName(studySchool.getName());
    }

    @Autowired
    private ICourseStudentRecordService courseStudentRecordService;

    @Override
    public boolean deleteBatchIds(List<? extends Serializable> idList) {
        boolean res = super.deleteBatchIds(idList);
        if(res) {
            // 删除已还未开始的课程记录
            EntityWrapper<StudentCourseRel> studentCourseRelEntityWrapper = new EntityWrapper<>();
            studentCourseRelEntityWrapper.in("id", idList);
            List<StudentCourseRel> studentCourseRelList = this.selectList(studentCourseRelEntityWrapper);
            if(CollectionUtils.isNotEmpty(studentCourseRelList)) {
                for(StudentCourseRel studentCourseRel : studentCourseRelList) {
                    courseStudentRecordService.cancelRecord(studentCourseRel.getStudyClassId(), studentCourseRel.getCourseId(), studentCourseRel.getStudentId());
                }
            }
        }

        return res;
    }
}
