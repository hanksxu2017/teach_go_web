package cn.jeeweb.modules.sys.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.modules.sys.entity.CourseStudentRecord;
import cn.jeeweb.modules.sys.entity.StudentCourseRel;

import java.util.List;

public interface IStudentCourseRelService extends ICommonService<StudentCourseRel> {


    List<String> selectCourseIdRelatedWithStudentId(String studentId);
}
