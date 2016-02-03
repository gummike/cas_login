package com.hesc.core.pojo;

import java.io.Serializable;

public interface Identifiable extends Serializable {
    String getId();

    void setId(String var1);

    String getState();

    void setState(String var1);

    Long getCreateTime();

    void setCreateTime(Long var1);
}
