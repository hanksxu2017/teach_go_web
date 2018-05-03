package cn.jeeweb.modules.sys.entity;


import cn.jeeweb.core.common.entity.DataEntity;
import cn.jeeweb.core.utils.DateUtils;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@TableName("tg_student")
@Getter
@Setter
public class Student  extends DataEntity<String> {

    /**
     * 是否锁定（1：正常；-1：删除；0：锁定；）
     */
    public static final int STATUS_DELETE = -1;
    public static final int STATUS_LOCKED = 0;
    public static final int STATUS_NORMAL = 1;

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    private String realName;

    private int level;

    private String salt;

    private int status = STATUS_NORMAL;

    public String getStatusStr() {
        if(1 == this.status) {
            return "正常";
        }
        if(-1 == this.status) {
            return "退学";
        }
        if(0 == this.status) {
            return "锁定";
        }
        return "未设置";
    }

    private int remainCourse;

    public String getCreateDateStr() {
        return DateUtils.formatDate(this.createDate, "yyyy-MM-dd HH:mm:ss");
    }

}
