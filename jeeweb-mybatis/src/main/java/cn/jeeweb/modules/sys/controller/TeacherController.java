package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.Dict;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.entity.User;
import cn.jeeweb.modules.sys.service.IStudentService;
import cn.jeeweb.modules.sys.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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

    @RequestMapping(value = "removeCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> removeCourse(@RequestParam(value = "teacherId") String teacherId,
                               @RequestParam(value = "courseId") String courseId,
                               HttpServletRequest request, HttpServletResponse response) throws Exception {

        this.teacherService.removeCourse(teacherId, courseId);

        Map<String, Object> result = new HashMap<>();
        result.put("statusCode", 0);
        return result;
    }

    @RequestMapping(value = "addCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCourse(@RequestParam(value = "teacherId") String teacherId,
                                            @RequestParam(value = "courseId") String courseId,
                                            HttpServletRequest request, HttpServletResponse response) throws Exception {

        this.teacherService.addCourse(teacherId, courseId);

        Map<String, Object> result = new HashMap<>();
        result.put("statusCode", 0);
        return result;
    }

}
