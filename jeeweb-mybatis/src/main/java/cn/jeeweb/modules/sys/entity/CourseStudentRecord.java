package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@TableName("tg_course_student_record")
@Getter
@Setter
public class CourseStudentRecord extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    @TableField(value = "course_rec_id")
    private String courseRecId;

    @TableField(value = "student_id")
    private String studentId;

    @TableField(value = "student_real_name")
    private String studentRealName;

    @TableField(value = "status")
    private CourseStudentRecordStatus status;

    @TableField(value = "have_adjust")
    private CourseRecord.HaveAdjust haveAdjust;

    public enum CourseStudentRecordStatus {
        NORMAL("正常"), LEAVE("未到");

        @Getter
        private String msg;

        CourseStudentRecordStatus(String msg) {
            this.msg = msg;
        }
    }


}
