package cn.jeeweb.modules.sys.mapper;

import cn.jeeweb.modules.sys.entity.Teacher;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper extends BaseMapper<Teacher> {


    /**
     *
     * @param page
     * @param wrapper
     * @return
     */
    List<Teacher> selectTeacherList(Pagination page, @Param("ew") Wrapper<Teacher> wrapper);

}
