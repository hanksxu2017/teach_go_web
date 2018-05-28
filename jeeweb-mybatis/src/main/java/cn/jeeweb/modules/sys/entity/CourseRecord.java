package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import cn.jeeweb.core.utils.DateUtils;
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

    // 课程编号
    @TableField(value = "course_id")
    private String courseId;

    // 开始时间
    @TableField(value = "course_start_date")
    private String courseStartDate;
    // 结束时间
    @TableField(value = "course_end_date")
    private String courseEndDate;

    // 校区编号
    @TableField(value = "study_school_id")
    private String studySchoolId;
    // 班级编号
    @TableField(value = "study_class_id")
    private String studyClassId;
    // 教室编号
    @TableField(value = "study_classroom_id")
    private String studyClassroomId;

    // 教师编号
    @TableField(value = "teacher_id")
    private String teacherId;

    // 应到
    @TableField(value = "student_quantity_plan")
    private int studentQuantityPlan;
    // 实到
    @TableField(value = "student_quantity_actual")
    private int studentQuantityActual;

    // 状态
    @TableField(value = "status")
    private CourseRecordStatus status = CourseRecordStatus.WAITING;
    // 是否调整
    @TableField(value = "have_adjust")
    private HaveAdjust haveAdjust;



    @TableField(exist = false)
    private String courseCode;

    @TableField(exist = false)
    private String teacherRealName;

    @TableField(exist = false)
    private String haveAdjustStr;

    @TableField(exist = false)
    private String courseStartDateStr;

    @TableField(exist = false)
    private String courseEndDateStr;

    @TableField(exist = false)
    private String statusStr;

    @TableField(exist = false)
    private String weekName;

    public String getHaveAdjustStr() {
        return this.haveAdjust.getMsg();
    }

    public String getStatusStr() {
        return status.getMsg();
    }

    public enum CourseRecordStatus {
        NORMAL("正常"), FINISHED("已完结"), DOING("进行中"), WAITING("未开始"), CANCELED("已取消");

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
