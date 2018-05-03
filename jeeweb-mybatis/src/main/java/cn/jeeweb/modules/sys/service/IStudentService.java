package cn.jeeweb.modules.sys.service;

import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.modules.sys.entity.Student;

public interface IStudentService  extends ICommonService<Student> {

    /**
     * 修改状态
     *
     * @param studentId
     * @param newStatus
     */
    public void changeStatus(String studentId, String newStatus);
}
