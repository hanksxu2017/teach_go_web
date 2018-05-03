package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import cn.jeeweb.core.utils.DateUtils;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * Created by Administrator on 2018/4/29 0029.
 */
@TableName("tg_teacher")
@Getter
@Setter
public class Teacher extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    private String realName;

    private String phone;

    private TeacherStatus status = TeacherStatus.NORMAL;

    public String getStatusStr() {
        return this.status.getMsg();
    }

    public String getCreateDateStr() {
        return DateUtils.formatDate(this.createDate, "yyyy-MM-dd HH:mm:ss");
    }

    public enum TeacherStatus {
        NORMAL("正常"), VACATION("休假中"), QUIT("已离职");

        private String msg;

        TeacherStatus(String msg) {
            this.msg = msg;
        }

        public String getMsg() {

            return msg;
        }
    }

}
