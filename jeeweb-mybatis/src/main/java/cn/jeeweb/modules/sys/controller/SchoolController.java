package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.School;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.ISchoolService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
import cn.jeeweb.modules.task.entity.ScheduleJob;
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
@RequestMapping("${admin.url.prefix}/sys/school")
@RequiresPathPermission("sys:user")
public class SchoolController extends BaseCRUDController<School, String> {

    @Autowired
    private ISchoolService schoolService;

    public SchoolController() {
        setCommonService(schoolService);
    }

    @Override
    public String showCreate(School school, Model model, HttpServletRequest request, HttpServletResponse response) {
        return display("create");
    }


}