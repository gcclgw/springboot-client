package com.jk.model.categorysecond;

import java.io.Serializable;

public class Categorysecond implements Serializable {

    private static final long serialVersionUID = 2987268117480984430L;
    private Integer csid;

    private String csname;

    private Integer cid;

    private String cname;//业务字段


    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public String getCsname() {
        return csname;
    }

    public void setCsname(String csname) {
        this.csname = csname == null ? null : csname.trim();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
}