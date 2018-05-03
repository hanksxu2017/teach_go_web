package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.service.IStudentService;
import cn.jeeweb.modules.sys.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Controller
@RequestMapping("${admin.url.prefix}/sys/teacher")
@RequiresPathPermission("sys:teacher")
public class TeacherController extends BaseCRUDController<Teacher, String> {

    @Autowired
    private ITeacherService teacherService;

    public TeacherController() {
        setCommonService(teacherService);
    }

    @Override
    public String showCreate(Teacher teacher, Model model, HttpServletRequest request, HttpServletResponse response) {
        return display("create");
    }

}
