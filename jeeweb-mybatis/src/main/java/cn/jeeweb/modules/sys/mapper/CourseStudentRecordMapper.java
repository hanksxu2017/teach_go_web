package cn.jeeweb.modules.sys.mapper;

import cn.jeeweb.modules.sys.entity.CourseStudentRecord;
import com.baomidou.mybatisplus.mapper.BaseMapper;

public interface CourseStudentRecordMapper extends BaseMapper<CourseStudentRecord> {

    void updateStatus(CourseStudentRecord.CourseStudentRecordStatus status);
}
