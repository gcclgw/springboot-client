package com.jk.model.business;

import java.io.Serializable;

public class Business implements Serializable {

    private static final long serialVersionUID = 1479434128105615873L;
    //private static final long serialVersionUID = 1479434128105615873L;
    private Integer qid;

    private String qname;

    private Integer qstatus;

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public String getQname() {
        return qname;
    }

    public void setQname(String qname) {
        this.qname = qname == null ? null : qname.trim();
    }

    public Integer getQstatus() {
        return qstatus;
    }

    public void setQstatus(Integer qstatus) {
        this.qstatus = qstatus;
    }



}
