package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.CfgCourseTime;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.StudentCourseRel;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.mapper.CfgCourseTimeMapper;
import cn.jeeweb.modules.sys.mapper.CourseMapper;
import cn.jeeweb.modules.sys.mapper.StudentCourseRelMapper;
import cn.jeeweb.modules.sys.mapper.TeacherMapper;
import cn.jeeweb.modules.sys.service.ICfgCourseTimeService;
import cn.jeeweb.modules.sys.service.ICourseService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CfgCourseTimeServiceImpl extends CommonServiceImpl<CfgCourseTimeMapper, CfgCourseTime> implements ICfgCourseTimeService {

}
