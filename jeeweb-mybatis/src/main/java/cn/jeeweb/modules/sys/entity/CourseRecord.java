package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@TableName("tg_course_record")
@Getter
@Setter
public class CourseRecord extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    @TableField(value = "course_id")
    private String courseId;

    @TableField(value = "teacher_id")
    private String teacherId;

    @TableField(value = "course_start_date")
    private Date courseStartDate;

    @TableField(value = "course_end_date")
    private Date courseEndDate;

    @TableField(value = "student_quantity_plan")
    private int studentQuantityPlan;

    @TableField(value = "student_quantity_actual")
    private int studentQuantityActual;

    @TableField(value = "status")
    private CourseRecordStatus status = CourseRecordStatus.NORMAL;

    @TableField(value = "have_adjust")
    private HaveAdjust haveAdjust;

    public enum CourseRecordStatus {
        NORMAL("正常");

        @Getter
        private String msg;

        CourseRecordStatus(String msg) {
            this.msg = msg;
        }
    }

    public enum HaveAdjust {
        YES("存在调整"), NO("无调整");

        @Getter
        private String msg;

        HaveAdjust(String msg) {
            this.msg = msg;
        }
    }



}
