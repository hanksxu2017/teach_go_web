package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.common.service.ICommonService;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.service.*;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("${admin.url.prefix}/sys/student/course")
@RequiresPathPermission("sys:user")
public class StudentCourseRelController extends BaseCRUDController<StudentCourseRel, String> {

    @Autowired
    private IStudentCourseRelService studentCourseRelService;

    @Autowired
    private IStudentService studentService;

    @Override
    public void setCommonService(ICommonService<StudentCourseRel> commonService) {
        setCommonService(this.studentCourseRelService);
    }

    @Override
    public void preAjaxList(Queryable queryable, EntityWrapper<StudentCourseRel> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        String studentId = request.getParameter("studentId");
        if(StringUtils.isNotBlank(studentId)) {
            entityWrapper.eq("student_id", studentId);
        }

        if(null == this.commonService) {
            this.commonService = this.studentCourseRelService;
        }
    }

    @Override
    public void preList(Model model, HttpServletRequest request, HttpServletResponse response) {

        String studentId = request.getParameter("studentId");
        if(StringUtils.isNotBlank(studentId)) {
            Student student = studentService.selectById(studentId);
            if(null != student) {
                model.addAttribute("student", student);
            }
        }
    }

    @Autowired
    private ICourseService courseService;
    @Autowired
    private IStudySchoolService studySchoolService;
    @Autowired
    private IStudyClassService studyClassService;
    @Autowired
    private ICfgCourseTimeService cfgCourseTimeService;

    @Override
    public String showCreate(StudentCourseRel entity, Model model, HttpServletRequest request, HttpServletResponse response) {
        String studentId = request.getParameter("studentId");
        if(StringUtils.isNotBlank(studentId)) {
            Student student = studentService.selectById(studentId);
            if(null != student) {
                model.addAttribute("student", student);

                if(StringUtils.isNotBlank(student.getStudySchoolId())) {
                    StudySchool studySchool = studySchoolService.selectById(student.getStudySchoolId());
                    if(null != studySchool) {
                        model.addAttribute("studySchool", studySchool);
                    }
                }

                if(StringUtils.isNotBlank(student.getStudyClassId())) {
                    StudyClass studyClass = studyClassService.selectById(student.getStudyClassId());
                    if(null != studyClass) {
                        model.addAttribute("studyClass", studyClass);
                    }

                    EntityWrapper<Course> courseEntityWrapper = new EntityWrapper<>();
                    courseEntityWrapper.eq("study_class_id", student.getStudyClassId());
                    List<String> relatedIdList = this.selectCourseIdRelatedWithStudent(studentId);
                    courseEntityWrapper.notIn("id", relatedIdList);
                    List<Course> courseList = this.courseService.selectList(courseEntityWrapper);
                    if(CollectionUtils.isNotEmpty(courseList)) {
                        for(Course course : courseList) {
                            if (StringUtils.isNotBlank(course.getCourseTimeId())) {
                                CfgCourseTime cfgCourseTime = this.cfgCourseTimeService.selectById(course.getCourseTimeId());
                                if(null != cfgCourseTime) {
                                    course.setStartTime(cfgCourseTime.getStartTime());
                                    course.setEndTime(cfgCourseTime.getEndTime());
                                }
                            }
                        }
                        model.addAttribute("courseList", courseList);
                    }
                }
            }
        }

        return display("create");
    }

    private List<String> selectCourseIdRelatedWithStudent(String studentId) {
        EntityWrapper<StudentCourseRel> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("student_id", studentId);
        List<StudentCourseRel> studentCourseRelList = this.studentCourseRelService.selectList(entityWrapper);

        List<String> idList = new ArrayList<>();
        if(CollectionUtils.isNotEmpty(studentCourseRelList)) {
            for(StudentCourseRel studentCourseRel : studentCourseRelList) {
                idList.add(studentCourseRel.getCourseId());
            }
        }
        return idList;
    }

    @Override
    public void preSave(StudentCourseRel entity, HttpServletRequest request, HttpServletResponse response) {
        if(null == this.commonService) {
            this.commonService = this.studentCourseRelService;
        }
    }

    @Autowired
    private ICourseRecordService courseRecordService;

    @Override
    public void afterSave(StudentCourseRel entity, HttpServletRequest request, HttpServletResponse response) {
        //
        courseRecordService.generateCourseRecordForCurWeek(entity.getCourseId(), entity.getStudentId());
    }
}
