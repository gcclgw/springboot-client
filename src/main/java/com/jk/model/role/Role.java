package com.jk.model.role;

import com.jk.utils.PageUtil;

import java.io.Serializable;
import java.util.List;

public class Role extends PageUtil implements Serializable {

    /**
     * 角色id
     */
    private Integer rid;

    /**
     * 角色名称
     */
    private String rolename;

    /**
     * 节点
     */
    private  Integer pid;

    private String roleIds;

    private List<String> roleIdsList;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public List<String> getRoleIdsList() {
        return roleIdsList;
    }

    public void setRoleIdsList(List<String> roleIdsList) {
        this.roleIdsList = roleIdsList;
    }
}
