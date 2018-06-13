package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.ObjectUtils;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.codegen.codegenerator.data.DbTableInfo;
import cn.jeeweb.modules.codegen.entity.Table;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.service.*;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("${admin.url.prefix}/sys/student")
@RequiresPathPermission("sys:user")
public class StudentController extends BaseCRUDController<Student, String> {

    @Autowired
    private IStudentService studentService;

    @Autowired
    private IStudentCourseRelService studentCourseRelService;

    @Autowired
    private ICourseService courseService;

    @Autowired
    private ISchoolService schoolService;

    @Autowired
    private IStudySchoolService studySchoolService;

    public StudentController() {
        setCommonService(studentService);
    }

    @Override
    public String showCreate(Student student, Model model, HttpServletRequest request, HttpServletResponse response) {
        EntityWrapper<School> entityWrapper = new EntityWrapper<>();
        model.addAttribute("schools", schoolService.selectList(entityWrapper));
        return display("create");
    }

    @Override
    public void preSave(Student entity, HttpServletRequest request, HttpServletResponse response) {
        super.preSave(entity, request, response);
        if (ObjectUtils.isNullOrEmpty(entity.getId())) {
            entity.setRemainCourse(entity.getTotalCourse());
        }
    }

    @RequestMapping(value = "{id}/course", method = RequestMethod.GET)
    public String course(@PathVariable("id") String id, Model model, HttpServletRequest request,
                         HttpServletResponse response) {

        Student student = studentService.selectById(id);
        model.addAttribute("student", student);

        return display("setCourse");
    }

    @RequestMapping(value = "{id}/addCourse", method = RequestMethod.GET)
    public String addCourse(@PathVariable("id") String id, Model model, HttpServletRequest request,
                              HttpServletResponse response) {
        Student entity = studentService.selectById(id);
        model.addAttribute("data", entity);
        return display("addCourse");
    }

    @RequestMapping(value = "{id}/addCourse", method = RequestMethod.POST)
    @ResponseBody
    public AjaxJson addCourse(Model model, @Valid @ModelAttribute("data") Student student, BindingResult result,
                           HttpServletRequest request, HttpServletResponse response) {

        AjaxJson ajaxJson = new AjaxJson();
        ajaxJson.success("课时增加成功");

        Student dbStudent = this.studentService.selectById(student.getId());
        if(null != dbStudent && Student.STATUS_DELETE != dbStudent.getStatus()) {
            dbStudent.setTotalCourse(dbStudent.getTotalCourse() + student.getAddCourse());
            dbStudent.setRemainCourse(dbStudent.getRemainCourse() + student.getAddCourse());
            this.studentService.updateById(dbStudent);
        }

        return ajaxJson;
    }

    @Override
    public void preEdit(Student entity, Model model, HttpServletRequest request, HttpServletResponse response) {
        super.preEdit(entity, model, request, response);
        EntityWrapper<School> entityWrapper = new EntityWrapper<>();
        model.addAttribute("schools", schoolService.selectList(entityWrapper));

        EntityWrapper<StudySchool> studySchoolEntityWrapper = new EntityWrapper<>();
        model.addAttribute("studySchools", studySchoolService.selectList(studySchoolEntityWrapper));
    }


    @RequestMapping(value = "{id}/changeCourse", method = RequestMethod.GET)
    public String changeCourse(@PathVariable("id") String id, Model model, HttpServletRequest request,
                         HttpServletResponse response) {

        Student student = this.studentService.selectById(id);
        model.addAttribute("student", student);

        return display("changeCourse");
    }

}
