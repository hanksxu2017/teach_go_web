package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.service.ICourseService;
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
@RequestMapping("${admin.url.prefix}/sys/course")
@RequiresPathPermission("sys:course")
public class CourseController extends BaseCRUDController<Course, String> {

    @Autowired
    private ICourseService courseService;

    public CourseController() {
        setCommonService(courseService);
    }

    @Override
    public String showCreate(Course course, Model model, HttpServletRequest request, HttpServletResponse response) {
        return display("create");
    }

    @Override
    public void preSave(Course entity, HttpServletRequest request, HttpServletResponse response) {
        super.preSave(entity, request, response);

        String startTimeHour = entity.getStartTimeHour();
        String startTimeMinute = entity.getStartTimeMinute();

        String endTimeHour = entity.getEndTimeHour();
        String endTimeMinute = entity.getEndTimeMinute();

        if(Integer.valueOf(startTimeHour + startTimeMinute.replace(":", "")) >=
                Integer.valueOf(endTimeHour + endTimeMinute.replace(":", ""))) {
            throw new RuntimeException("错误的开始时间和结束时间");
        }
    }
}
