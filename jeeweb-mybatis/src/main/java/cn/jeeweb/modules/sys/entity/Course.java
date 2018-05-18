package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import cn.jeeweb.modules.sys.utils.ConstantUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

@TableName("tg_course")
@Getter
@Setter
public class Course extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;
    @TableId(value = "index", type = IdType.AUTO)
    private int index;
    // 课程编号,固定格式: 课程01#周一(早8点-早9点15分)
    @TableField(exist = false)
    private String code;

    public String getCode() {
        return "课程#" + index;
    }

    private String description;

    // 格式: HH:mm
    private String startTime;

    @TableField(exist = false)
    private String startTimeHour;
    @TableField(exist = false)
    private String startTimeMinute;

    // 格式: HH:mm
    private String endTime;

    @TableField(exist = false)
    private String endTimeHour;
    @TableField(exist = false)
    private String endTimeMinute;

    // 时长,单位分钟
    private int duration;

    private CourseStatus status = CourseStatus.NORMAL;

    public String getStatusStr() {
        return this.status.getMsg();
    }

    private int weekInfo;

    @TableField(exist = false)
    private String weekDay;

    public String getWeekDay() {
        return ConstantUtils.WEEK_DAYS[weekInfo];
    }

    private String teacherId;

    @TableField(exist = false)
    private String teacherRealName;

    @TableField(exist = false)
    private int studentCount;

    public enum CourseStatus {
        NORMAL("正常");

        private String msg;

        CourseStatus(String msg) {
            this.msg = msg;
        }

        public String getMsg() {
            return this.msg;
        }
    }

}
