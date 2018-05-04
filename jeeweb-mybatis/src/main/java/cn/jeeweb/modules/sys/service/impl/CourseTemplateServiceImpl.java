package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.CourseTempalte;
import cn.jeeweb.modules.sys.mapper.CourseTemplateMapper;
import cn.jeeweb.modules.sys.service.ICourseTemplateService;
import org.springframework.stereotype.Service;

@Service
public class CourseTemplateServiceImpl extends CommonServiceImpl<CourseTemplateMapper, CourseTempalte> implements ICourseTemplateService {
}
