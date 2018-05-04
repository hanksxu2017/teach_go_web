package cn.jeeweb.modules.sys.mapper;

import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.Teacher;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper extends BaseMapper<Course> {

    int blankTeacher(@Param("courseId") String courseId);

    int relatedTeacher(@Param("courseId") String courseId, @Param("teacherId") String teacherId);
}
