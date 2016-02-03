package com.hesc.user.pojo;

import com.hesc.core.pojo.Identifiable;

/**
 * 用户
 * @author mike.gu
 * @version 1.0 2015-11-25
 */
public class User implements Identifiable {

    private String id;

    //姓名
    private String name;

    //电话
    private String phone;

    // 所属组
    private String groupId;

    //创建时间
    private Long createTime;

    //状态
    private String state;

    //角色id
    private String roleId;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
    public String getGroupId() {
        return groupId;
    }
    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }
    public Long getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
    public String getRoleId() {
        return roleId;
    }
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }
}