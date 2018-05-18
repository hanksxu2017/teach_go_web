package cn.jeeweb.modules.sys.service.impl;

import cn.jeeweb.core.common.service.impl.CommonServiceImpl;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.CourseRecord;
import cn.jeeweb.modules.sys.entity.CourseStudentRecord;
import cn.jeeweb.modules.sys.mapper.CourseRecordMapper;
import cn.jeeweb.modules.sys.mapper.CourseStudentRecordMapper;
import cn.jeeweb.modules.sys.service.ICourseRecordService;
import cn.jeeweb.modules.sys.service.ICourseStudentRecordService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class CourseStudentRecordServiceImpl extends CommonServiceImpl<CourseStudentRecordMapper, CourseStudentRecord> implements ICourseStudentRecordService {



    @Override
    public void signIn(String courseRecId, String studentIds) {
        if(StringUtils.isBlank(studentIds)) {
            // 全部设置为缺席
            // TODO
            this.baseMapper.updateStatus(CourseStudentRecord.CourseStudentRecordStatus.LEAVE.name(),
                    null, courseRecId);
            return;
        }

        EntityWrapper<CourseStudentRecord> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("course_rec_id", courseRecId);
        List<CourseStudentRecord> courseStudentRecordList = this.selectList(entityWrapper);

        List<String> inStudentIdList = Arrays.asList(studentIds.split(","));
        this.baseMapper.updateStatus(CourseStudentRecord.CourseStudentRecordStatus.NORMAL.name(),
                inStudentIdList, courseRecId);

        List<String> allStudentIdList = this.getAllStudentIdList(courseStudentRecordList);
        allStudentIdList.removeAll(inStudentIdList);
        this.baseMapper.updateStatus(CourseStudentRecord.CourseStudentRecordStatus.LEAVE.name(),
                allStudentIdList, courseRecId);

        // TODO 缺席学生查看缺席记录



    }

    /**
     *
     * @param courseStudentRecordList
     * @return
     */
    private List<String> getAllStudentIdList(List<CourseStudentRecord> courseStudentRecordList) {
        List<String> allStudentIdList = new ArrayList<>();
        for(CourseStudentRecord courseStudentRecord : courseStudentRecordList) {
            allStudentIdList.add(courseStudentRecord.getStudentId());
        }
        return allStudentIdList;
    }

}
