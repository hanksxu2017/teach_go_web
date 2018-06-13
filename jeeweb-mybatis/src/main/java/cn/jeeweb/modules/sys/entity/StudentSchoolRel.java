package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

@TableName("tg_student_school_rel")
@Getter
@Setter
public class StudentSchoolRel extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    @TableField(value = "study_school_id")
    private String studySchoolId;

    @TableField(value = "student_id")
    private String studentId;

    private StudentSchoolRelStatus status = StudentSchoolRelStatus.NORMAL;

    @TableField(exist = false)
    private String studySchoolName;

    public enum StudentSchoolRelStatus {
        NORMAL("正常"), CANCEL("取消");

        @Getter
        private String msg;

        StudentSchoolRelStatus(String msg) {
            this.msg = msg;
        }
    }


}
