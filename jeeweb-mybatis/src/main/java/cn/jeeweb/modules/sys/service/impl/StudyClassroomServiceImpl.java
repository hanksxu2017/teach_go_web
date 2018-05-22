package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.StudyClassroom;
import cn.jeeweb.modules.sys.mapper.SchoolClassroomMapper;
import cn.jeeweb.modules.sys.service.IStudyClassroomService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class StudyClassroomServiceImpl extends CommonServiceImpl<SchoolClassroomMapper, StudyClassroom> implements IStudyClassroomService {

    private final String CACHE_NAME = "sysCache";

    // 缓存读取
    @Cacheable(value=CACHE_NAME, key="#id")
    @Override
    public StudyClassroom selectById(Serializable id) {
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
    public boolean updateById(StudyClassroom entity) {
        return super.updateById(entity);
    }

}
