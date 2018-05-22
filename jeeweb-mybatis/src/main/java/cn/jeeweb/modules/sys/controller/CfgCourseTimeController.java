package cn.jeeweb.modules.sys.controller;


import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.CfgCourseTime;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.service.ICfgCourseTimeService;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
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
@RequestMapping("${admin.url.prefix}/sys/cfg/course/time")
@RequiresPathPermission("sys:user")
public class CfgCourseTimeController extends BaseCRUDController<CfgCourseTime, String> {

    @Autowired
    private ICfgCourseTimeService cfgCourseTimeService;

    public CfgCourseTimeController() {
        setCommonService(cfgCourseTimeService);
    }

    @Override
    public void preAjaxList(Queryable queryable, EntityWrapper<CfgCourseTime> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        super.preAjaxList(queryable, entityWrapper, request, response);

        String weekInfo = request.getParameter("weekInfoId");
        if (StringUtils.isNotBlank(weekInfo)) {
            entityWrapper.eq("week_info", weekInfo);
        }

        entityWrapper.orderBy("week_info");
        entityWrapper.orderBy("sort");
    }

    @Override
    public String showCreate(CfgCourseTime entity, Model model, HttpServletRequest request, HttpServletResponse response) {
        return display("create");
    }
}