package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

@TableName("tg_student_course_rel")
@Getter
@Setter
public class StudentCourseRel extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    @TableField(value = "course_id")
    private String courseId;

    @TableField(value = "student_id")
    private String studentId;

    private StudentCourseRelStatus status;

    public enum StudentCourseRelStatus {
        NORMAL("正常"), CANCEL("取消");

        @Getter
        private String msg;

        StudentCourseRelStatus(String msg) {
            this.msg = msg;
        }
    }


}
