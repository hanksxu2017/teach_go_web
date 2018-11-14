package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.ObjectUtils;
import cn.jeeweb.modules.sys.entity.School;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.entity.StudentClassRel;
import cn.jeeweb.modules.sys.entity.StudySchool;
import cn.jeeweb.modules.sys.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping("${admin.url.prefix}/sys/student/class")
@RequiresPathPermission("sys:user")
public class StudentClassController extends BaseCRUDController<StudentClassRel, String> {

    @Autowired
    private IStudentClassRelService studySchoolService;

    public StudentClassController() {
        setCommonService(studySchoolService);
    }
}
