package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.mapper.CourseMapper;
import cn.jeeweb.modules.sys.mapper.StudentCourseRelMapper;
import cn.jeeweb.modules.sys.mapper.TeacherMapper;
import cn.jeeweb.modules.sys.service.ICfgCourseTimeService;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.IStudyClassService;
import cn.jeeweb.modules.sys.service.ITeacherService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl extends CommonServiceImpl<CourseMapper, Course> implements ICourseService {

    @Autowired
    private ITeacherService teacherService;
    @Autowired
    private IStudyClassService studyClassService;
    @Autowired
    private ICfgCourseTimeService cfgCourseTimeService;

    @Override
    public Page<Course> list(Queryable queryable, Wrapper<Course> wrapper) {
        Page<Course> coursePage = super.list(queryable, wrapper);
        this.packageCourse(coursePage.getContent());

        return coursePage;
    }

    private void packageCourse(List<Course> courseList) {
        if(CollectionUtils.isEmpty(courseList)) {
            return;
        }

        StudyClass studyClass;
        Teacher teacher;
        CfgCourseTime cfgCourseTime;

        for(Course course : courseList) {
            if(StringUtils.isNotBlank(course.getStudyClassId())) {
                studyClass = this.studyClassService.selectById(course.getStudyClassId());
                if(null != studyClass) {
                    course.setStudyClassName(studyClass.getName());
                    if(StringUtils.isNotBlank(studyClass.getTeacherId())) {
                        teacher = this.teacherService.selectById(studyClass.getTeacherId());
                        if(null != teacher) {
                            course.setTeacherRealName(teacher.getRealName());
                        }
                    }
                }
            }

            if(StringUtils.isNotBlank(course.getCourseTimeId())) {
                cfgCourseTime = cfgCourseTimeService.selectById(course.getCourseTimeId());
                if(null != cfgCourseTime) {
                    course.setStartTime(cfgCourseTime.getStartTime());
                    course.setEndTime(cfgCourseTime.getEndTime());
                }
            }
        }
    }
}
