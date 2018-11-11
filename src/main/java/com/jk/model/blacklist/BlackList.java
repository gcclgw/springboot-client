package com.jk.model.blacklist;

import java.io.Serializable;

public class BlackList implements Serializable {
    private static final long serialVersionUID = -3980738499449655716L;
    private Integer bid;

    private Integer uid;

    private String uphone;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone == null ? null : uphone.trim();
    }
}