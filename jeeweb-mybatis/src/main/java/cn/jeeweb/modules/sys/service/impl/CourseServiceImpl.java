package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.mapper.CourseMapper;
import cn.jeeweb.modules.sys.service.ICourseService;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl extends CommonServiceImpl<CourseMapper, Course> implements ICourseService {
}
