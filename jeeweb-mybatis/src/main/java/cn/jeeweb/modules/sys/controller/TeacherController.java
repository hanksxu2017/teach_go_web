package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.ITeacherService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("${admin.url.prefix}/sys/teacher")
@RequiresPathPermission("sys:user")
public class TeacherController extends BaseCRUDController<Teacher, String> {

    @Autowired
    private ITeacherService teacherService;

    @Autowired
    private ICourseService courseService;

    public TeacherController() {
        setCommonService(teacherService);
    }

    @Override
    public String showCreate(Teacher teacher, Model model, HttpServletRequest request, HttpServletResponse response) {
        return display("create");
    }

    @RequestMapping(value = "{id}/course", method = RequestMethod.GET)
    public String course(@PathVariable("id") String id, Model model, HttpServletRequest request,
                         HttpServletResponse response) {

        Teacher teacher = teacherService.selectById(id);
        model.addAttribute("teacher", teacher);

        return display("setCourse");
    }

    @RequestMapping(value = "removeCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> removeCourse(@RequestParam(value = "teacherId") String teacherId,
                                            @RequestParam(value = "courseId") String courseId,
                                            HttpServletRequest request, HttpServletResponse response) throws Exception {

        this.teacherService.removeCourse(teacherId, courseId);

        Map<String, Object> result = new HashMap<>();
        result.put("statusCode", 0);
        return result;
    }

    @RequestMapping(value = "addCourse", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCourse(@RequestParam(value = "teacherId") String teacherId,
                                         @RequestParam(value = "courseId") String courseId,
                                         HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> result = new HashMap<>();
        result.put("statusCode", 0);

        Course conflictCourse = this.isHaveCourseInPeriod(teacherId, courseId);
        if(null != conflictCourse) {
            result.put("statusCode", -1);
            result.put("errMsg", "目标课程所属时间段内存在冲突课程[" + conflictCourse.getCode() + "],请选择其他课程!");
            return result;
        }

        this.teacherService.addCourse(teacherId, courseId);

        return result;
    }

    /**
     * 判断在目标课程时段，是否存在其他关联的课程信息
     *
     * @param teacherId
     * @param courseId
     * @return
     */
    private Course isHaveCourseInPeriod(String teacherId, String courseId) {
        Course targetCourse = this.courseService.selectById(courseId);

        EntityWrapper<Course> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("teacher_id", teacherId);
        List<Course> relatedCourseList = this.courseService.selectList(entityWrapper);

        if (CollectionUtils.isNotEmpty(relatedCourseList)) {
            for (Course relatedCourse : relatedCourseList) {
                if(null != relatedCourse && !relatedCourse.getId().equalsIgnoreCase(targetCourse.getId()) && relatedCourse.getWeekInfo() == targetCourse.getWeekInfo()) {
                    if (less(relatedCourse.getStartTime(), targetCourse.getStartTime()) && greater(relatedCourse.getEndTime(), targetCourse.getEndTime())) {
                        return relatedCourse;
                    }
                    if (greater(relatedCourse.getStartTime(), targetCourse.getStartTime()) && less(relatedCourse.getStartTime(), targetCourse.getEndTime())) {
                        return relatedCourse;
                    }
                    if (greater(relatedCourse.getEndTime(), targetCourse.getStartTime()) && less(relatedCourse.getEndTime(), targetCourse.getEndTime())) {
                        return relatedCourse;
                    }
                }
            }
        }
        return null;
    }

}
