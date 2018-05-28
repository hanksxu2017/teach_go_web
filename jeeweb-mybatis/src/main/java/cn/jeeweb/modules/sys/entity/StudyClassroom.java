package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

/**
 * 学校信息
 */
@TableName("tg_study_classroom")
@Getter
@Setter
public class StudyClassroom extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    private String name;

    private String studySchoolId;

    @TableField(exist = false)
    private String studySchoolName;

}
