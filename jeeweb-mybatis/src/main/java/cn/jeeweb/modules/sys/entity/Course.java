package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import cn.jeeweb.core.common.entity.TreeEntity;
import cn.jeeweb.core.common.entity.tree.TreeNode;
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

    private WeekInfo weekInfo;

    private String teacherId;

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

    public enum WeekInfo {
        Monday("星期一"),
        Tuesday("星期二"),
        Wednesday("星期三"),
        Thursday("星期四"),
        Friday("星期五"),
        Saturday("星期六"),
        Sunday("星期天")
        ;

        private String msg;

        WeekInfo(String msg) {
            this.msg = msg;
        }

        public String getMsg() {
            return this.msg;
        }
    }

}
