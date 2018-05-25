package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import cn.jeeweb.modules.sys.Constants;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

/**
 * 课程表
 */
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

    private CourseStatus status = CourseStatus.NORMAL;

    public String getStatusStr() {
        return this.status.getMsg();
    }

    private int weekInfo;

    @TableField(exist = false)
    private String weekDay;

    public String getWeekDay() {
        return Constants.WEEK_DAYS[weekInfo];
    }
    // 课时信息
    private String courseTimeId;
    // 班级信息
    private String studyClassId;

    @TableField(exist = false)
    private String studyClassName;

    @TableField(exist = false)
    private String teacherRealName;

    @TableField(exist = false)
    private int studentCount;

    @TableField(exist = false)
    private String startTime;

    @TableField(exist = false)
    private String endTime;

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
