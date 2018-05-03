package cn.jeeweb.modules.sys.mapper;

import cn.jeeweb.modules.sys.entity.Student;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper extends BaseMapper<Student> {

    /**
     *
     * @param page
     * @param wrapper
     * @return
     */
    List<Student> selectStudentList(Pagination page, @Param("ew") Wrapper<Student> wrapper);
}
