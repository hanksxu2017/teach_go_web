package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.service.ICourseRecordService;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.ICourseStudentRecordService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("${admin.url.prefix}/sys/course/record")
@RequiresPathPermission("sys:user")
public class CourseRecordController extends BaseCRUDController<CourseRecord, String> {

    @Autowired
    private ICourseRecordService courseRecordService;

    @Autowired
    private ICourseStudentRecordService courseStudentRecordService;

    public CourseRecordController() {
        setCommonService(courseRecordService);
    }


    @Override
    public void preAjaxList(Queryable queryable, EntityWrapper<CourseRecord> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        super.preAjaxList(queryable, entityWrapper, request, response);

        String weekDay = request.getParameter("weekDay");
        if (StringUtils.isNotBlank(weekDay)) {
            entityWrapper.eq("week_info", Integer.valueOf(weekDay));
        }
    }

    /**
     * 学生签到
     * @param courseRecId
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "{id}/signIn", method = RequestMethod.GET)
    public String signIn(@PathVariable("id") String courseRecId, Model model, HttpServletRequest request,
                         HttpServletResponse response) {

        EntityWrapper<CourseStudentRecord> entityWrapper = new EntityWrapper();
        entityWrapper.eq("course_rec_id", courseRecId);
        List<CourseStudentRecord> courseStudentRecordList = courseStudentRecordService.selectList(entityWrapper);
        model.addAttribute("courseStudentRecordList", courseStudentRecordList);
        model.addAttribute("courseRecId", courseRecId);

        return display("signIn");
    }

    /**
     * 授课老师调整
     * @param id
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "{id}/adjust", method = RequestMethod.GET)
    public String adjust(@PathVariable("id") String id, Model model, HttpServletRequest request,
                         HttpServletResponse response) {

        return display("setCourse");
    }
}