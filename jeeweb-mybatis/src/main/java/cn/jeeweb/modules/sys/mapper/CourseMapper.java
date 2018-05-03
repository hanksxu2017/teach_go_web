package cn.jeeweb.modules.sys.mapper;

import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.Teacher;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper extends BaseMapper<Course> {

    /**
     *
     * @param page
     * @param wrapper
     * @return
     */
    List<Course> selectCourseList(Pagination page, @Param("ew") Wrapper<Course> wrapper);

}
