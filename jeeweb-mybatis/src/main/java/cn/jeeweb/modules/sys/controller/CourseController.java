package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.CfgCourseTime;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.StudyClass;
import cn.jeeweb.modules.sys.service.ICfgCourseTimeService;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
import cn.jeeweb.modules.sys.service.IStudyClassService;
import org.apache.commons.collections.CollectionUtils;
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
    private IStudyClassService studyClassService;

    @Autowired
    private ICfgCourseTimeService cfgCourseTimeService;

    public CourseController() {
        setCommonService(courseService);
    }

    @Override
    public String showCreate(Course course, Model model, HttpServletRequest request, HttpServletResponse response) {

        EntityWrapper<StudyClass> studyClassEntityWrapper = new EntityWrapper<>();
        studyClassEntityWrapper.eq("status", "NORMAL");
        model.addAttribute("studyClassList", this.studyClassService.selectList(studyClassEntityWrapper));
        return display("create");
    }

    @Override
    public String _showUpdate(String s, Model model, HttpServletRequest request, HttpServletResponse response) {
        String view = super._showUpdate(s, model, request, response);
        EntityWrapper<CfgCourseTime> cfgCourseTimeEntityWrapper = new EntityWrapper<>();
        cfgCourseTimeEntityWrapper.eq("status", "NORMAL");
        model.addAttribute("cfgCourseTimeList", cfgCourseTimeService.selectList(cfgCourseTimeEntityWrapper));

        EntityWrapper<StudyClass> studyClassEntityWrapper = new EntityWrapper<>();
        studyClassEntityWrapper.eq("status", "NORMAL");
        model.addAttribute("studyClassList", this.studyClassService.selectList(studyClassEntityWrapper));
        return view;
    }

    @Override
    public void preSave(Course entity, HttpServletRequest request, HttpServletResponse response) {
        super.preSave(entity, request, response);
    }

    @RequestMapping(value = "bootstrapTreeData")
    public void bootstrapTreeData(HttpServletResponse response, PropertyPreFilterable propertyPreFilterable) throws IOException {
        String content = "[{\"href\":\"weekinfo\",\"nodes\":[{\"href\":\"1\",\"tags\":[],\"text\":\"星期一\"},{\"href\":\"2\",\"tags\":[],\"text\":\"星期二\"},{\"href\":\"3\",\"tags\":[],\"text\":\"星期三\"},{\"href\":\"4\",\"tags\":[],\"text\":\"星期四\"},{\"href\":\"5\",\"tags\":[],\"text\":\"星期五\"},{\"href\":\"6\",\"tags\":[],\"text\":\"星期六\"},{\"href\":\"7\",\"tags\":[],\"text\":\"星期天\"}],\"tags\":[],\"text\":\"星期\"}]";
        StringUtils.printJson(response, content);
    }

    @Override
    public void preAjaxList(Queryable queryable, EntityWrapper<Course> entityWrapper, HttpServletRequest request,
                            HttpServletResponse response) {

        // 课程页面
        String weekInfo = request.getParameter("weekInfoId");
        if (StringUtils.isNotBlank(weekInfo)) {
            entityWrapper.eq("week_info", weekInfo);
        }

        entityWrapper.orderBy("week_info");
    }

}