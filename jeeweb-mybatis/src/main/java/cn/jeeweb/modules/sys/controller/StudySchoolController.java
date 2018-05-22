package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.sys.entity.StudyClass;
import cn.jeeweb.modules.sys.entity.StudySchool;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.service.IStudyClassService;
import cn.jeeweb.modules.sys.service.IStudySchoolService;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("${admin.url.prefix}/sys/study/school")
@RequiresPathPermission("sys:user")
public class StudySchoolController extends BaseCRUDController<StudySchool, String> {

    @Autowired
    private IStudySchoolService studySchoolService;

    @Autowired
    private ITeacherService teacherService;

    public StudySchoolController() {
        setCommonService(studySchoolService);
    }

    @Override
    public String showCreate(StudySchool entity, Model model, HttpServletRequest request, HttpServletResponse response) {
        return display("create");
    }
}