package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("${admin.url.prefix}/sys/course")
@RequiresPathPermission("sys:user")
public class CourseController extends BaseCRUDController<Course, String> {

    @Autowired
    private ICourseService courseService;

    @Autowired
    private IStudentCourseRelService studentCourseRelService;

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

        int duration = 60 * (Integer.valueOf(endTimeHour) - Integer.valueOf(startTimeHour)) +
                (Integer.valueOf(endTimeMinute) - Integer.valueOf(startTimeMinute));
        if(duration <= 0) {
            throw new RuntimeException("错误的开始时间和结束时间");
        }

        entity.setStartTime(startTimeHour + ":" + startTimeMinute);
        entity.setEndTime(endTimeHour + ":" + endTimeMinute);
        entity.setDuration(duration);
    }

    @RequestMapping(value = "bootstrapTreeData")
    public void bootstrapTreeData(HttpServletResponse response, PropertyPreFilterable propertyPreFilterable) throws IOException {
        // TODO
        String content = "[{\"href\":\"weekinfo\",\"nodes\":[{\"href\":\"1\",\"tags\":[],\"text\":\"星期一\"},{\"href\":\"2\",\"tags\":[],\"text\":\"星期二\"},{\"href\":\"3\",\"tags\":[],\"text\":\"星期三\"},{\"href\":\"4\",\"tags\":[],\"text\":\"星期四\"},{\"href\":\"5\",\"tags\":[],\"text\":\"星期五\"},{\"href\":\"6\",\"tags\":[],\"text\":\"星期六\"},{\"href\":\"7\",\"tags\":[],\"text\":\"星期天\"}],\"tags\":[],\"text\":\"星期\"}]";
        StringUtils.printJson(response, content);
    }

    @Override
    public void preAjaxList(Queryable queryable, EntityWrapper<Course> entityWrapper, HttpServletRequest request,
                            HttpServletResponse response) {

        // 教师排课页面
        String blank = request.getParameter("blank");
        if(StringUtils.isNotBlank(blank) && 1 == Integer.parseInt(blank)) {
            entityWrapper.isNull("teacher_id");
        } else {
            String teacherId = request.getParameter("teacherId");
            if (StringUtils.isNotBlank(teacherId)) {
                entityWrapper.eq("teacher_id", teacherId);
            }
        }

        // 课程页面
        String weekInfo = request.getParameter("weekInfoId");
        if (StringUtils.isNotBlank(weekInfo)) {
            entityWrapper.eq("week_info", weekInfo);
        }

        // 学生排课页面
        List<String> courseIdListRelatedWithStudent = new ArrayList<>();
        String studentId = request.getParameter("studentId");
        if(StringUtils.isNotBlank(studentId)) {
            courseIdListRelatedWithStudent = this.studentCourseRelService.selectCourseIdRelatedWithStudentId(studentId);
        }

        String sBlank = request.getParameter("s_blank");
        if(StringUtils.isNotBlank(sBlank)) {
            entityWrapper.notIn(true, "id", courseIdListRelatedWithStudent);
        } else {
            entityWrapper.in(true, "id", courseIdListRelatedWithStudent);
        }

        entityWrapper.orderBy("week_info");
    }





}