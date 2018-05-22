package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Page;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.School;
import cn.jeeweb.modules.sys.entity.Student;
import cn.jeeweb.modules.sys.entity.StudyClass;
import cn.jeeweb.modules.sys.mapper.StudentMapper;
import cn.jeeweb.modules.sys.service.ISchoolService;
import cn.jeeweb.modules.sys.service.IStudentService;
import cn.jeeweb.modules.sys.service.IStudyClassService;
import cn.jeeweb.modules.sys.utils.DictUtils;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl extends CommonServiceImpl<StudentMapper, Student> implements IStudentService {



    @Override
    public void changeStatus(String studentId, String newStatus) {

    }

    @Override
    public Page<Student> list(Queryable queryable, Wrapper<Student> wrapper) {
        Page<Student> studentPage = super.list(queryable, wrapper);
        this.packageStudent(studentPage);
        return studentPage;
    }

    @Value("${dict.code.studyPlace}")
    private String dictCodeForStudyPlace;

    @Autowired
    private ISchoolService schoolService;

    @Autowired
    private IStudyClassService studyClassService;

    private void packageStudent(Page<Student> studentPage) {
        if(null == studentPage) {
            return;
        }
        List<Student> studentList = studentPage.getContent();
        if(CollectionUtils.isEmpty(studentList)) {
            return;
        }

        School school;
        StudyClass studyClass;
        for(Student student : studentList) {
            student.setStudyPlaceName(DictUtils.getDictLabel(this.dictCodeForStudyPlace, student.getStudyPlace()));

            if(StringUtils.isNotBlank(student.getSchoolId())) {
                school = schoolService.selectById(student.getSchoolId());
                if(null != school) {
                    student.setSchoolName(school.getName());
                }
            }

            if(StringUtils.isNotBlank(student.getStudyClassId())) {
                studyClass = studyClassService.selectById(student.getStudyClassId());
                if(null != studyClass) {
                    student.setStudyClassName(studyClass.getName());
                }
            }
        }
    }


}
