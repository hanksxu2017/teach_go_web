package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.StudyClassroom;
import cn.jeeweb.modules.sys.entity.StudySchool;
import cn.jeeweb.modules.sys.mapper.SchoolClassroomMapper;
import cn.jeeweb.modules.sys.mapper.StudySchoolMapper;
import cn.jeeweb.modules.sys.service.IStudyClassroomService;
import cn.jeeweb.modules.sys.service.IStudySchoolService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class StudySchoolServiceImpl extends CommonServiceImpl<StudySchoolMapper, StudySchool> implements IStudySchoolService {

    private final String CACHE_NAME = "sysCache";

    // 缓存读取
    @Cacheable(value=CACHE_NAME, key="'studySchool' + #id")
    @Override
    public StudySchool selectById(Serializable id) {
        return super.selectById(id);
    }

    // 删除缓存
    @CacheEvict(value=CACHE_NAME, key="'studySchool' + #id")
    @Override
    public boolean deleteById(Serializable id) {
        return super.deleteById(id);
    }

    // 更新缓存
    @CachePut(value=CACHE_NAME,key="'studySchool' + #entity.getId()")
    @Override
    public boolean updateById(StudySchool entity) {
        return super.updateById(entity);
    }

}
