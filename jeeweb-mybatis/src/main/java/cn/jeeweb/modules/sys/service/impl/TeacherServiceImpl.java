package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.mapper.CourseMapper;
import cn.jeeweb.modules.sys.mapper.TeacherMapper;
import cn.jeeweb.modules.sys.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.Date;

@Service
public class TeacherServiceImpl extends CommonServiceImpl<TeacherMapper, Teacher> implements ITeacherService {

    private final String CACHE_NAME = "teacherCache";

    @Autowired
    private CourseMapper courseMapper;

    @Autowired
    private EhCacheCacheManager springCacheManager;

    // 缓存读取
    @Cacheable(value=CACHE_NAME, key="#id")
    @Override
    public Teacher selectById(Serializable id) {
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
    public boolean updateById(Teacher entity) {
        return super.updateById(entity);
    }

    @Override
    public boolean insert(Teacher entity) {
        entity.setCreateDate(new Date());
        boolean ret = super.insert(entity);
        if(ret) {
            springCacheManager.getCache(CACHE_NAME).put(entity.getId(), entity);
        }
        return ret;
    }

    @Override
    public void removeCourse(String teacherId, String courseId) throws Exception {
        TeacherMapper teacherMapper = (TeacherMapper) this.baseMapper;
        teacherMapper.deleteTeacherCourseRel(teacherId, courseId);
        courseMapper.blankTeacher(courseId);
    }

    @Override
    public void addCourse(String teacherId, String courseId) throws Exception {
        TeacherMapper teacherMapper = (TeacherMapper) this.baseMapper;
        teacherMapper.addTeacherCourseRel(StringUtils.randomUUID(), teacherId, courseId);
        courseMapper.relatedTeacher(courseId, teacherId);
    }

}
