package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.StudentCourseRel;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.mapper.CourseMapper;
import cn.jeeweb.modules.sys.mapper.StudentCourseRelMapper;
import cn.jeeweb.modules.sys.mapper.TeacherMapper;
import cn.jeeweb.modules.sys.service.ICourseService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl extends CommonServiceImpl<CourseMapper, Course> implements ICourseService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private StudentCourseRelMapper studentCourseRelMapper;

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

        Teacher teacher;
        EntityWrapper<StudentCourseRel> entityWrapper = new EntityWrapper<>();
        for(Course course : courseList) {
            if(StringUtils.isNotBlank(course.getTeacherId())) {
                teacher = this.teacherMapper.selectById(course.getTeacherId());
                if(null != teacher) {
                    course.setTeacherRealName(teacher.getRealName());
                }
            }

            entityWrapper.eq("course_id", course.getId());
            entityWrapper.eq("status", StudentCourseRel.StudentCourseRelStatus.NORMAL.name());
            course.setStudentCount(this.studentCourseRelMapper.selectCount(entityWrapper));
        }

    }
}
