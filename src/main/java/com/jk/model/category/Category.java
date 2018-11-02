package com.jk.model.category;

import java.io.Serializable;

public class Category implements Serializable {


    private static final long serialVersionUID = 7437414550419358268L;

    private Integer cid;

    private String cname;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }
}