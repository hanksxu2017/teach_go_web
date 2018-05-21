package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.School;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.mapper.SchoolMapper;
import cn.jeeweb.modules.sys.mapper.StudentMapper;
import cn.jeeweb.modules.sys.service.ISchoolService;
import cn.jeeweb.modules.sys.service.IStudentService;
import org.springframework.stereotype.Service;

@Service
public class SchoolServiceImpl extends CommonServiceImpl<SchoolMapper, School> implements ISchoolService {


}
