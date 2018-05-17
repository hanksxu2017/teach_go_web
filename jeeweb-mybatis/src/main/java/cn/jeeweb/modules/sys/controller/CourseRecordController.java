package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.JeewebPropertiesUtil;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.CourseRecord;
import cn.jeeweb.modules.sys.entity.CourseStudentRecord;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.service.ICourseRecordService;
import cn.jeeweb.modules.sys.service.ICourseStudentRecordService;
import cn.jeeweb.modules.sys.service.ITeacherService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("${admin.url.prefix}/sys/course/record")
@RequiresPathPermission("sys:user")
public class CourseRecordController extends BaseCRUDController<CourseRecord, String> {

    @Autowired
    private ICourseRecordService courseRecordService;

    @Autowired
    private ITeacherService teacherService;

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

        String teacherRealName = request.getParameter("teacherRealName");
        if(StringUtils.isNotBlank(teacherRealName)) {

            EntityWrapper<Teacher> teacherEntityWrapper = new EntityWrapper<>();
            teacherEntityWrapper.like("real_name", teacherRealName);
            List<Teacher> teacherList = this.teacherService.selectList(teacherEntityWrapper);
            if(CollectionUtils.isNotEmpty(teacherList)) {
                List<String> teacherIdList = new ArrayList<>();
                for(Teacher teacher : teacherList) {
                    teacherIdList.add(teacher.getId());
                }
                entityWrapper.in("teacher_id", teacherIdList);
            }
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
        model.addAttribute("courseRecId", courseRecId);
        return display("signIn");
    }

    @RequestMapping(value = "findStudents", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson findStudentsUnderCourseRecord(@RequestParam("courseRecId") String courseRecId,
                           HttpServletRequest request,
                           HttpServletResponse response) {
        AjaxJson ajaxJson = new AjaxJson();
        ajaxJson.success("成功");
        EntityWrapper<CourseStudentRecord> entityWrapper = new EntityWrapper();
        entityWrapper.eq("course_rec_id", courseRecId);
        List<CourseStudentRecord> courseStudentRecordList = courseStudentRecordService.selectList(entityWrapper);
        if(CollectionUtils.isEmpty(courseStudentRecordList)) {
            ajaxJson.fail("无学生数据");
        } else {
            ajaxJson.setData(courseStudentRecordList);
        }
        return ajaxJson;
    }

    @RequestMapping(value = "{id}/signIn", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson signIn(@PathVariable("id") String courseRecId, HttpServletRequest request,
                                   HttpServletResponse response) {
        AjaxJson ajaxJson = new AjaxJson();
        ajaxJson.success("签到完成");

        String studentIds = request.getParameter("studentIds");
        this.courseStudentRecordService.signIn(courseRecId, studentIds);
        // TODO


        return ajaxJson;
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