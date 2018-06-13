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

@TableName("tg_student")
@Getter
@Setter
public class Student  extends DataEntity<String> {

    /**
     * 是否锁定（1：正常；-1：退学；0：锁定；）
     */
    public static final int STATUS_DELETE = -1;
    public static final int STATUS_LOCKED = 0;
    public static final int STATUS_NORMAL = 1;
    public static final int STATUS_ARREARS = 2;
    public static final int STATUS_PAUSE = 3;

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    private String realName;
    // 1-男, 2-女
    private char sex;

    private String birthday;
    // 就读学校编号
    private String schoolId;
    // 培训学校编号
    private String studySchoolId;
    // 班级编号
    private String studyClassId;

    private String idCard;

    private int level;

    private String phone;

    private int totalCourse;
    // 剩余课程
    private int remainCourse;

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
        if(2 == this.status) {
            return "欠费";
        }
        if(3 == this.status) {
            return "休学";
        }
        return "未设置";
    }

    @TableField(exist = false)
    private int addCourse;

    public String getCreateDateStr() {
        return DateUtils.formatDate(this.createDate, "yyyy-MM-dd HH:mm");
    }

    public String getSexStr() {
        return '1' == this.sex ? "男" : "女";
    }
}
