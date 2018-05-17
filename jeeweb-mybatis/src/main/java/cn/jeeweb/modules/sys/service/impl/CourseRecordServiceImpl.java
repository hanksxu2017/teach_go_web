package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.utils.DateUtils;
import cn.jeeweb.modules.sys.entity.Course;
import cn.jeeweb.modules.sys.entity.CourseRecord;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.mapper.CourseMapper;
import cn.jeeweb.modules.sys.mapper.CourseRecordMapper;
import cn.jeeweb.modules.sys.service.ICourseRecordService;
import cn.jeeweb.modules.sys.service.ICourseService;
import cn.jeeweb.modules.sys.service.ITeacherService;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseRecordServiceImpl extends CommonServiceImpl<CourseRecordMapper, CourseRecord> implements ICourseRecordService {

    @Autowired
    private ICourseService courseService;

    @Autowired
    private ITeacherService teacherService;

    @Override
    public Page<CourseRecord> list(Queryable queryable, Wrapper<CourseRecord> wrapper) {
        Page<CourseRecord> courseRecordPage = super.list(queryable, wrapper);
        List<CourseRecord> courseRecordList = courseRecordPage.getContent();
        if (CollectionUtils.isNotEmpty(courseRecordList)) {
            this.packageCourseRecord(courseRecordList);
        }
        return courseRecordPage;
    }

    private void packageCourseRecord(List<CourseRecord> courseRecordList) {
        Teacher teacher;
        Course course;
        for(CourseRecord courseRecord : courseRecordList) {
            teacher = this.teacherService.selectById(courseRecord.getTeacherId());
            if (null != teacher) {
                courseRecord.setTeacherRealName(teacher.getRealName());
            }

            course = this.courseService.selectById(courseRecord.getCourseId());
            if (null != course) {
                courseRecord.setCourseCode(course.getCode());
            }

            courseRecord.setDuration(DateUtils.subDate(courseRecord.getCourseEndDate(), courseRecord.getCourseStartDate()));
        }
    }

    @Override
    public void signIn(String courseId, String studentIds) {

    }
}
