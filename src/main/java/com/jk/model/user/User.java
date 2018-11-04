package com.jk.model.user;

import com.jk.utils.PageUtil;
import java.io.Serializable;
import java.util.List;

public class User  implements Serializable {

    private String userId;






    private static final long serialVersionUID = -1648598031541497891L;

    /**
     * 用户id
     */
    private  Integer uid;

    /**
     * 用户名称
     */
    private  String username;

    /**
     * 用户密码
     */
    private  String password;

    /**
     * 角色id  1: 经理  2: 管理员  3:客服
     */
    private String  roleId;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 验证码
     */
    private String  userImgCode;

    private String sysImgCode;

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getSysImgCode() {
        return sysImgCode;
    }

    public void setSysImgCode(String sysImgCode) {
        this.sysImgCode = sysImgCode;
    }

    private  String ids;

    private List<String> idsList;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }


    public Integer getUid() {
        return uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getUserImgCode() {
        return userImgCode;
    }

    public void setUserImgCode(String userImgCode) {
        this.userImgCode = userImgCode;
    }

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public List<String> getIdsList() {
        return idsList;
    }

    public void setIdsList(List<String> idsList) {
        this.idsList = idsList;
    }
}
