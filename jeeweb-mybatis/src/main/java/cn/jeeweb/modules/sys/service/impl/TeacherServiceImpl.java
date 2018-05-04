package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.mapper.CourseMapper;
import cn.jeeweb.modules.sys.mapper.TeacherMapper;
import cn.jeeweb.modules.sys.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TeacherServiceImpl extends CommonServiceImpl<TeacherMapper, Teacher> implements ITeacherService {

    @Autowired
    private CourseMapper courseMapper;
    @Override
    public boolean insert(Teacher entity) {
        entity.setCreateDate(new Date());
        return super.insert(entity);
    }

    @Override
    public void removeCourse(String teacherId, String courseId) throws Exception {
        TeacherMapper teacherMapper = (TeacherMapper) this.baseMapper;
        teacherMapper.deleteTeacherCourseRel(teacherId, courseId);
        courseMapper.blankTeacher(courseId);
    }

    @Override
    public void addCourse(String teacherId, String courseId) throws Exception {
        TeacherMapper teacherMapper = (TeacherMapper) this.baseMapper;
        teacherMapper.addTeacherCourseRel(StringUtils.randomUUID(), teacherId, courseId);
        courseMapper.relatedTeacher(courseId, teacherId);
    }
}
