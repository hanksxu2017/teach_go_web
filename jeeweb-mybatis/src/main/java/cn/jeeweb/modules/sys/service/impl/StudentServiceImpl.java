package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.mapper.StudentMapper;
import cn.jeeweb.modules.sys.service.IStudentService;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl extends CommonServiceImpl<StudentMapper, Student> implements IStudentService {

    @Override
    public void changeStatus(String studentId, String newStatus) {

    }
}
