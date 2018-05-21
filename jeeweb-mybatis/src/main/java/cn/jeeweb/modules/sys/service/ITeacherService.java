package cn.jeeweb.modules.sys.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.modules.sys.entity.Teacher;

public interface ITeacherService extends ICommonService<Teacher> {

    void removeCourse(String teacherId, String courseId) throws Exception;

    void addCourse(String teacherId, String courseId) throws Exception;
}
