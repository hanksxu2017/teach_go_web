package cn.jeeweb.modules.sys.mapper;

import cn.jeeweb.modules.sys.entity.CourseStudentRecord;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseStudentRecordMapper extends BaseMapper<CourseStudentRecord> {

    void updateStatus(@Param("status")String status, @Param("studentIdList")List<String> studentIdList,
                      @Param("courseRecId") String courseRecId);
}
