package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import cn.jeeweb.core.utils.DateUtils;
import cn.jeeweb.modules.sys.Constants;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@TableName("tg_cfg_time")
@Getter
@Setter
public class CfgCourseTime extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    private int weekInfo;

    private String startTime;

    private String endTime;

    private int sort;

    private CfgCourseTimeStatus status = CfgCourseTimeStatus.NORMAL;

    @TableField(exist = false)
    private String weekDay;

    @TableField(exist = false)
    private String sortName;

    public String getSortName() {
        return this.getWeekDay() + "_#" + sort;
    }

    public String getWeekDay() {
        return Constants.WEEK_DAYS[weekInfo];
    }

    public enum CfgCourseTimeStatus {
        NORMAL("正常");

        @Getter
        private String msg;

        CfgCourseTimeStatus(String msg) {
            this.msg = msg;
        }
    }

}
