package cn.jeeweb.modules.sys.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SimpleEntity {

    private String id;

    private String name;

    public SimpleEntity(String id, String name) {
        this.id = id;
        this.name = name;
    }
}
