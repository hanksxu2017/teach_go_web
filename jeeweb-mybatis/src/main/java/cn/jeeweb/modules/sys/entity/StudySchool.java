package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

@TableName("tg_study_school")
@Getter
@Setter
public class StudySchool extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;
    //
    private String name;
    //
    private String address;
    //
    private String manager;
    //
    private String managerPhone;
    //
    private String tel;
    //
    private StudySchoolStatus status = StudySchoolStatus.NORMAL;

    public enum StudySchoolStatus {
        NORMAL("正常"), DISSOLVE("已解散");

        @Getter
        private String msg;

        StudySchoolStatus(String msg) {
            this.msg = msg;
        }
    }

    @TableField(exist = false)
    private String studyPlaceName;

    @TableField(exist = false)
    private String subjectName;

    @TableField(exist = false)
    private String teacherName;

    @TableField(exist = false)
    private int studentCount;

    public String getStatusStr() {
        return null != this.status ? this.status.getMsg() : null;
    }
}
