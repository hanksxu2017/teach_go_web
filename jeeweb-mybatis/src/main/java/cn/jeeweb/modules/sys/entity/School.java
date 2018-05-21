package cn.jeeweb.modules.sys.entity;

import cn.jeeweb.core.common.entity.DataEntity;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Getter;
import lombok.Setter;

/**
 * 学校信息
 */
@TableName("tg_school")
@Getter
@Setter
public class School extends DataEntity<String> {

    @TableId(value = "id", type = IdType.UUID)
    private String id;

    private String name;

    private String address;

}
