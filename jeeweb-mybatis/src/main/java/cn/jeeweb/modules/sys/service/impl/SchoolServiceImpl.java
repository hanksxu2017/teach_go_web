package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.School;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.mapper.SchoolMapper;
import cn.jeeweb.modules.sys.mapper.StudentMapper;
import cn.jeeweb.modules.sys.service.ISchoolService;
import cn.jeeweb.modules.sys.service.IStudentService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class SchoolServiceImpl extends CommonServiceImpl<SchoolMapper, School> implements ISchoolService {

    private final String CACHE_NAME = "sysCache";

    // 缓存读取
    @Cacheable(value=CACHE_NAME, key="#id")
    @Override
    public School selectById(Serializable id) {
        return super.selectById(id);
    }

    // 删除缓存
    @CacheEvict(value=CACHE_NAME, key="#id")
    @Override
    public boolean deleteById(Serializable id) {
        return super.deleteById(id);
    }

    // 更新缓存
    @CachePut(value=CACHE_NAME,key="#entity.getId()")
    @Override
    public boolean updateById(School entity) {
        return super.updateById(entity);
    }

}
