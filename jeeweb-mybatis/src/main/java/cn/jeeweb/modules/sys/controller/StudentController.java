package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.entity.User;
import cn.jeeweb.modules.sys.service.IStudentService;
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
@RequestMapping("${admin.url.prefix}/sys/student")
@RequiresPathPermission("sys:student")
public class StudentController extends BaseCRUDController<Student, String> {

    @Autowired
    private IStudentService studentService;

    public StudentController() {
        setCommonService(studentService);
    }

    @Override
    public String showCreate(Student student, Model model, HttpServletRequest request, HttpServletResponse response) {
        return display("create");
    }

    @Override
    public void preSave(Student entity, HttpServletRequest request, HttpServletResponse response) {
        super.preSave(entity, request, response);
        entity.setCreateDate(new Date());
    }

    @RequestMapping(value = "{id}/changeStatus", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson changeStatus(@PathVariable("id") String id, HttpServletRequest request,
                                   HttpServletResponse response) {
        AjaxJson ajaxJson = new AjaxJson();
        ajaxJson.success("状态修改成功");

        try {
            String status = request.getParameter("status");
            studentService.changeStatus(id, status);
        } catch (Exception e) {
            e.printStackTrace();
            ajaxJson.fail("密码修改失败");
        }
        return ajaxJson;
    }

}
