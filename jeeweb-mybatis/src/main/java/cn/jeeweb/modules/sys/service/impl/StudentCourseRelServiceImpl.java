package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.modules.sys.entity.CourseRecord;
import cn.jeeweb.modules.sys.entity.StudentCourseRel;
import cn.jeeweb.modules.sys.mapper.CourseRecordMapper;
import cn.jeeweb.modules.sys.mapper.StudentCourseRelMapper;
import cn.jeeweb.modules.sys.service.ICourseRecordService;
import cn.jeeweb.modules.sys.service.IStudentCourseRelService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class StudentCourseRelServiceImpl extends CommonServiceImpl<StudentCourseRelMapper, StudentCourseRel> implements IStudentCourseRelService {

    @Override
    public List<String> selectCourseIdRelatedWithStudentId(String studentId) {
        EntityWrapper<StudentCourseRel> studentCourseRelEntityWrapper = new EntityWrapper<>();
        studentCourseRelEntityWrapper.eq("student_id", studentId);
        studentCourseRelEntityWrapper.eq("status", StudentCourseRel.StudentCourseRelStatus.NORMAL.name());
        List<StudentCourseRel> studentCourseRelList = this.selectList(studentCourseRelEntityWrapper);
        Set<String> idSet = new HashSet<>();
        if(CollectionUtils.isNotEmpty(studentCourseRelList)) {
            for(StudentCourseRel studentCourseRel : studentCourseRelList) {
                idSet.add(studentCourseRel.getCourseId());
            }
        }
        return new ArrayList<>(idSet);
    }
}
