package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.sys.entity.Teacher;
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

    @RequestMapping(value = "{id}/course", method = RequestMethod.GET)
    public String course(@PathVariable("id") String id, Model model, HttpServletRequest request,
                                 HttpServletResponse response) {

        Teacher teacher = teacherService.selectById(id);
        model.addAttribute("teacher", teacher);

        return display("setCourse");
    }

    @RequestMapping(value = "{teacherId}/{courseId}/removeCourse", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson removeCourse(@PathVariable("teacherId") String teacherId,
                               @PathVariable("courseId") String courseId,
                               HttpServletRequest request, HttpServletResponse response) throws Exception {

        this.teacherService.removeCourse(teacherId, courseId);

        AjaxJson ajaxJson = new AjaxJson();
        ajaxJson.success("课程移除成功");
        return ajaxJson;
    }

    @RequestMapping(value = "{teacherId}/{courseId}/addCourse", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson addCourse(@PathVariable("teacherId") String teacherId,
                                            @PathVariable("courseId") String courseId,
                                            HttpServletRequest request, HttpServletResponse response) throws Exception {

        this.teacherService.addCourse(teacherId, courseId);

        AjaxJson ajaxJson = new AjaxJson();
        ajaxJson.success("课程加入成功");
        return ajaxJson;
    }

}
