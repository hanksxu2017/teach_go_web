package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

@TableName("tg_student_class_rel")
@Getter
@Setter
public class StudentClassRel extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    @TableField(value = "study_class_id")
    private String studyClassId;

    @TableField(value = "student_id")
    private String studentId;

    @TableField(value = "status")
    private StudentClassRelStatus status = StudentClassRelStatus.NORMAL;

    @TableField(exist = false)
    private String studyClassName;

    public enum StudentClassRelStatus {
        NORMAL("正常"), CANCEL("取消");

        @Getter
        private String msg;

        StudentClassRelStatus(String msg) {
            this.msg = msg;
        }
    }


}
