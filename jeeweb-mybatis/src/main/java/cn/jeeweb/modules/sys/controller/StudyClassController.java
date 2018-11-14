package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.service.*;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("${admin.url.prefix}/sys/study/class")
@RequiresPathPermission("sys:user")
public class StudyClassController extends BaseCRUDController<StudyClass, String> {

    @Autowired
    private IStudyClassService studyClassService;

    @Autowired
    private ITeacherService teacherService;

    @Autowired
    private IStudySchoolService studySchoolService;

    public StudyClassController() {
        setCommonService(studyClassService);
    }

    @Override
    public void preList(Model model, HttpServletRequest request, HttpServletResponse response) {
        String schoolId = request.getParameter("studySchoolId");
        if(StringUtils.isNotBlank(schoolId)) {
            StudySchool studySchool = studySchoolService.selectById(schoolId);
            if(null != studySchool) {
                model.addAttribute("studySchool", studySchool);
            }
        }
    }

    @Override
    public void preAjaxList(Queryable queryable, EntityWrapper<StudyClass> entityWrapper, HttpServletRequest request,
                            HttpServletResponse response) {
        String schoolId = request.getParameter("studySchoolId");
        if(StringUtils.isNotBlank(schoolId)) {
            entityWrapper.eq("study_school_id", schoolId);
        }

        String studentId = request.getParameter("studentId");
        if(StringUtils.isNotBlank(studentId)) {
            entityWrapper.eq("student_id", studentId);
        }
    }

    @Override
    public void preEdit(StudyClass entity, Model model, HttpServletRequest request, HttpServletResponse response) {

        model.addAttribute("schools", this.findValidSchool());
        model.addAttribute("teachers", this.findValidTeacher());

    }

    private List<StudySchool> findValidSchool(){
        EntityWrapper<StudySchool> StudySchoolEntityWrapper = new EntityWrapper<>();
        StudySchoolEntityWrapper.eq("status", "NORMAL");
        List<StudySchool> list = this.studySchoolService.selectList(StudySchoolEntityWrapper);
        return list;
    }

    private List<Teacher> findValidTeacher() {
        EntityWrapper<Teacher> teacherEntityWrapper = new EntityWrapper<>();
        teacherEntityWrapper.eq("status", "NORMAL");
        return this.teacherService.selectList(teacherEntityWrapper);
    }

    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson removeCourse(@RequestParam(value = "studySchoolId") String studySchoolId,
                                            HttpServletRequest request, HttpServletResponse response) throws Exception {
        AjaxJson ajaxJson = new AjaxJson();
        ajaxJson.success("查询成功");

        EntityWrapper<StudyClass> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("study_school_id", studySchoolId);
        List<StudyClass> studyClassList = this.studyClassService.selectList(entityWrapper);
        if(CollectionUtils.isEmpty(studyClassList)) {
            ajaxJson.fail("无班级信息");
        } else {
            ajaxJson.setData(this.packageList(studyClassList));
        }

        return ajaxJson;
    }

    private List<SimpleEntity> packageList(List<StudyClass> studyClassList) {
        List<SimpleEntity> studyClassSimpleList = new ArrayList<>();
        if(CollectionUtils.isNotEmpty(studyClassList)) {
            for(StudyClass studyClass : studyClassList) {
                studyClassSimpleList.add(new SimpleEntity(studyClass.getId(), studyClass.getName()));
            }
        }
        return studyClassSimpleList;
    }

}