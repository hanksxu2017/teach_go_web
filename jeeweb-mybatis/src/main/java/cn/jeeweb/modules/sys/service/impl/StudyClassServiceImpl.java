package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.Dict;
import cn.jeeweb.modules.sys.entity.StudyClass;
import cn.jeeweb.modules.sys.entity.Teacher;
import cn.jeeweb.modules.sys.mapper.StudyClassMapper;
import cn.jeeweb.modules.sys.service.IStudyClassService;
import cn.jeeweb.modules.sys.service.ITeacherService;
import cn.jeeweb.modules.sys.utils.DictUtils;
import com.baomidou.mybatisplus.mapper.Wrapper;
import cn.jeeweb.core.query.data.Page;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyClassServiceImpl extends CommonServiceImpl<StudyClassMapper, StudyClass> implements IStudyClassService {

    @Override
    public Page<StudyClass> list(Queryable queryable, Wrapper<StudyClass> wrapper) {
        Page<StudyClass> resPage = super.list(queryable, wrapper);
        this.packageStudyClassList(resPage.getContent());
        return resPage;
    }

    private void packageStudyClassList(List<StudyClass> studyClassList) {
        if(CollectionUtils.isEmpty(studyClassList)) {
            return;
        }

        for(StudyClass studyClass : studyClassList) {
            studyClass.setStudyPlaceName(this.getStudyPlaceName(studyClass.getStudyPlace()));
            studyClass.setSubjectName(this.getSubjectName(studyClass.getSubject()));
            studyClass.setTeacherName(this.getTeacherName(studyClass.getTeacherId()));

            // TODO 查询学生数量

        }

    }

    @Value("${dict.code.studyPlace}")
    private String dictCodeForStudyPlace;

    private String getStudyPlaceName(String studyPlace) {
        return this.getDictLabel(this.dictCodeForStudyPlace, studyPlace);
    }

    @Value("${dict.code.subject}")
    private String dictCodeForSubject;

    private String getSubjectName(String subject) {
        return this.getDictLabel(this.dictCodeForSubject, subject);
    }

    private String getDictLabel(String code, String value) {
        List<Dict> dictList = DictUtils.getDictList(code);
        if(CollectionUtils.isNotEmpty(dictList)) {
            for(Dict dict : dictList) {
                if(StringUtils.equals(dict.getValue(), value)) {
                    return dict.getLabel();
                }
            }
        }

        return null;
    }

    @Autowired
    private ITeacherService teacherService;

    private String getTeacherName(String teacherId) {
        if(StringUtils.isNotBlank(teacherId)) {
            Teacher teacher = this.teacherService.selectById(teacherId);
            if(null != teacher) {
                return teacher.getRealName();
            }
        }
        return null;
    }




}
