package cn.jeeweb.modules.sys.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.sys.entity.CourseTempalte;
import cn.jeeweb.modules.sys.service.ICourseTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("${admin.url.prefix}/sys/courseTemplate")
@RequiresPathPermission("sys:courseTemplate")
public class CourseTemplateController extends BaseCRUDController<CourseTempalte, String> {

    @Autowired
    private ICourseTemplateService courseTemplateService;

    public CourseTemplateController() {
        setCommonService(courseTemplateService);
    }
}
