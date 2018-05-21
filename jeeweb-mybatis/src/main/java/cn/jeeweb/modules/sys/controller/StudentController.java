package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.codegen.codegenerator.data.DbTableInfo;
import cn.jeeweb.modules.codegen.entity.Table;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.ISchoolService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
import cn.jeeweb.modules.sys.service.IStudentService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        entity.setCreateDate(new Date());
        entity.setTotalCourse(entity.getTotalCourse() + entity.getAddCourse());
    }

    @RequestMapping(value = "{id}/course", method = RequestMethod.GET)
    public String course(@PathVariable("id") String id, Model model, HttpServletRequest request,
                         HttpServletResponse response) {

        Student student = studentService.selectById(id);
        model.addAttribute("student", student);

        return display("setCourse");
    }

    @RequestMapping(value = "removeCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> removeCourse(@RequestParam(value = "studentId") String studentId,
                                            @RequestParam(value = "courseId") String courseId,
                                            HttpServletRequest request, HttpServletResponse response) throws Exception {

        EntityWrapper<StudentCourseRel> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("course_id", courseId);
        entityWrapper.eq("student_id", studentId);
        StudentCourseRel studentCourseRel = this.studentCourseRelService.selectOne(entityWrapper);
        if(null != studentCourseRel && !StudentCourseRel.StudentCourseRelStatus.CANCEL.equals(studentCourseRel.getStatus())) {
            studentCourseRel.setStatus(StudentCourseRel.StudentCourseRelStatus.CANCEL);
            studentCourseRel.setUpdateDate(new Date());
            this.studentCourseRelService.updateById(studentCourseRel);
        }

        Map<String, Object> result = new HashMap<>();
        result.put("statusCode", 0);
        return result;
    }

    @RequestMapping(value = "addCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCourse(@RequestParam(value = "studentId") String studentId,
                                         @RequestParam(value = "courseId") String courseId,
                                         HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> result = new HashMap<>();
        result.put("statusCode", 0);

        Course conflictCourse = this.isHaveCourseInPeriod(studentId, courseId);
        if(null != conflictCourse) {
            result.put("statusCode", -1);
            result.put("errMsg", "目标课程所属时间段内存在冲突课程[" + conflictCourse.getCode() + "],请选择其他课程!");
            return result;
        }

        EntityWrapper<StudentCourseRel> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("course_id", courseId);
        entityWrapper.eq("student_id", studentId);
        StudentCourseRel studentCourseRel = this.studentCourseRelService.selectOne(entityWrapper);
        if(null == studentCourseRel) {
            studentCourseRel = new StudentCourseRel();
            studentCourseRel.setCourseId(courseId);
            studentCourseRel.setStudentId(studentId);
            studentCourseRel.setStatus(StudentCourseRel.StudentCourseRelStatus.NORMAL);
            studentCourseRel.setCreateDate(new Date());
            this.studentCourseRelService.insert(studentCourseRel);
        } else {
            if(StudentCourseRel.StudentCourseRelStatus.CANCEL.equals(studentCourseRel.getStatus())) {
                studentCourseRel.setStatus(StudentCourseRel.StudentCourseRelStatus.NORMAL);
                studentCourseRel.setUpdateDate(new Date());
                this.studentCourseRelService.updateById(studentCourseRel);
            }
        }

        return result;
    }

    /**
     * 判断在目标课程时段，是否存在其他关联的课程信息
     * @param studentId
     * @param courseId
     * @return
     */
    private Course isHaveCourseInPeriod(String studentId, String courseId) {
        Course targetCourse = this.courseService.selectById(courseId);
        EntityWrapper<StudentCourseRel> studentCourseRelEntityWrapper = new EntityWrapper<>();
        studentCourseRelEntityWrapper.eq("student_id", studentId);
        List<StudentCourseRel> studentCourseRelList = this.studentCourseRelService.selectList(studentCourseRelEntityWrapper);
        if(CollectionUtils.isNotEmpty(studentCourseRelList)) {
            Course relatedCourse;
            for(StudentCourseRel studentCourseRel : studentCourseRelList) {
                relatedCourse = this.courseService.selectById(studentCourseRel.getCourseId());
                if(null != relatedCourse && !relatedCourse.getId().equalsIgnoreCase(targetCourse.getId()) && relatedCourse.getWeekInfo() == targetCourse.getWeekInfo()) {
                    if (less(relatedCourse.getStartTime(), targetCourse.getStartTime()) && greater(relatedCourse.getEndTime(), targetCourse.getEndTime())) {
                        return relatedCourse;
                    }
                    if(greater(relatedCourse.getStartTime(), targetCourse.getStartTime()) && less(relatedCourse.getStartTime(), targetCourse.getEndTime())) {
                        return relatedCourse;
                    }
                    if(greater(relatedCourse.getEndTime(), targetCourse.getStartTime()) && less(relatedCourse.getEndTime(), targetCourse.getEndTime())) {
                        return relatedCourse;
                    }
                }
            }
        }
        return null;
    }


}
