package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.StudentCourseRel;
import cn.jeeweb.modules.sys.entity.StudyClass;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
import cn.jeeweb.modules.sys.service.IStudyClassService;
import cn.jeeweb.modules.sys.service.ITeacherService;
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

    public StudyClassController() {
        setCommonService(studyClassService);
    }

    @Override
    public String showCreate(StudyClass entity, Model model, HttpServletRequest request, HttpServletResponse response) {

        model.addAttribute("teachers", this.findValidTeacher());
        return display("create");
    }

    @Override
    public void preEdit(StudyClass entity, Model model, HttpServletRequest request, HttpServletResponse response) {
        super.preEdit(entity, model, request, response);

        model.addAttribute("teachers", this.findValidTeacher());
    }

    private List<Teacher> findValidTeacher() {
        EntityWrapper<Teacher> teacherEntityWrapper = new EntityWrapper<>();
        teacherEntityWrapper.eq("status", "NORMAL");
        return this.teacherService.selectList(teacherEntityWrapper);
    }

    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson removeCourse(@RequestParam(value = "studyPlace") String studyPlace,
                                            HttpServletRequest request, HttpServletResponse response) throws Exception {
        AjaxJson ajaxJson = new AjaxJson();
        ajaxJson.success("查询成功");

        EntityWrapper<StudyClass> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("study_place", studyPlace);
        List<StudyClass> studyClassList = this.studyClassService.selectList(entityWrapper);
        if(CollectionUtils.isEmpty(studyClassList)) {
            ajaxJson.fail("无班级信息");
        } else {
            ajaxJson.setData(this.packageList(studyClassList));
        }

        return ajaxJson;
    }

    private List<StudyClassSimple> packageList(List<StudyClass> studyClassList) {
        List<StudyClassSimple> studyClassSimpleList = new ArrayList<>();
        if(CollectionUtils.isNotEmpty(studyClassList)) {
            for(StudyClass studyClass : studyClassList) {
                studyClassSimpleList.add(new StudyClassSimple(studyClass.getId(), studyClass.getName()));
            }
        }
        return studyClassSimpleList;
    }

    @Getter
    @Setter
    class StudyClassSimple {
        private String id;
        private String name;

        StudyClassSimple(String id, String name) {
            this.id = id;
            this.name = name;
        }
    }


}