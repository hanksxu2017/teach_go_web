package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

@TableName("tg_course_teplate")
@Getter
@Setter
public class CourseTempalte extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    private String code;

    private String description;

    // 格式: HH:mm
    private String startTime;
//
    @TableField(exist = false)
    private String startTimeHour;
    private String startTimeMinute;

    // 格式: HH:mm
    private String endTime;
//
    private String endTimeHour;
    private String endTimeMinute;

    // 时长,单位分钟
    private int duration;

    private CourseStatus status = CourseStatus.NORMAL;

    public String getStatusStr() {
        return this.status.getMsg();
    }

    private WeekInfo weekInfo;

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
