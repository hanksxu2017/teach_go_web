package cn.jeeweb.modules.sys.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.modules.sys.entity.CourseStudentRecord;

public interface ICourseStudentRecordService extends ICommonService<CourseStudentRecord> {

    void signIn(String courseRecId, String studentIds);

    void cancelRecord(String studyClassId, String courseId, String studentId);
}
