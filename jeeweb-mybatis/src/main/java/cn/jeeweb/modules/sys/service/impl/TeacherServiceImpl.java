package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.mapper.TeacherMapper;
import cn.jeeweb.modules.sys.service.ITeacherService;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TeacherServiceImpl extends CommonServiceImpl<TeacherMapper, Teacher> implements ITeacherService {

    @Override
    public boolean insert(Teacher entity) {
        entity.setCreateDate(new Date());
        return super.insert(entity);
    }
}
