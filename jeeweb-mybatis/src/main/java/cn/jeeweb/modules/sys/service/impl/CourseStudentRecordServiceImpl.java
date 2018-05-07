package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.CourseRecord;
import cn.jeeweb.modules.sys.entity.CourseStudentRecord;
import cn.jeeweb.modules.sys.mapper.CourseRecordMapper;
import cn.jeeweb.modules.sys.mapper.CourseStudentRecordMapper;
import cn.jeeweb.modules.sys.service.ICourseRecordService;
import cn.jeeweb.modules.sys.service.ICourseStudentRecordService;
import org.springframework.stereotype.Service;

@Service
public class CourseStudentRecordServiceImpl extends CommonServiceImpl<CourseStudentRecordMapper, CourseStudentRecord> implements ICourseStudentRecordService {


}
