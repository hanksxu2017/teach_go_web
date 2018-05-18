package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.sys.entity.CourseStudentRecord;
import cn.jeeweb.modules.sys.service.ICourseStudentRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("${admin.url.prefix}/sys/course/record/student")
@RequiresPathPermission("sys:user")
public class CourseStudentRecordController extends BaseCRUDController<CourseStudentRecord, String> {

    @Autowired
    private ICourseStudentRecordService courseStudentRecordService;

    @Override
    public void setCommonService(ICommonService<CourseStudentRecord> commonService) {
        super.setCommonService(this.courseStudentRecordService);
    }


}
