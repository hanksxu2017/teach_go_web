package cn.jeeweb.modules.sys.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.model.ResultBean;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.CourseRecord;

public interface ICourseRecordService extends ICommonService<CourseRecord> {

    /**
     * 生成未来一周的授课信息
     * @return
     */
    ResultBean generateCourseRecordForNextWholeWeek();

    /**
     *
     * @param courseId
     * @return
     */
    ResultBean generateCourseRecordForCurWeek(String courseId);

    /**
     *
     * @param courseId
     * @param studentId
     * @return
     */
    ResultBean generateCourseRecordForCurWeek(String courseId, String studentId);
}
