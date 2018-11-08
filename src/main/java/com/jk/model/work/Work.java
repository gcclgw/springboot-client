package com.jk.model.work;

import java.io.Serializable;

public class Work implements Serializable {
    private static final long serialVersionUID = 7200940277730389370L;
    private Integer workid;

    private Integer htid;

    private String text;

    private Integer htstate;

    private Integer workstyle;

    //业务字段
    private  String htname;
    private  String htphone;
    private  String endtime;
    private  String startdate;
    private  String qname;
    private  String hinfo;

    public String getHtname() {
        return htname;
    }

    public void setHtname(String htname) {
        this.htname = htname;
    }

    public String getHtphone() {
        return htphone;
    }

    public void setHtphone(String htphone) {
        this.htphone = htphone;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getQname() {
        return qname;
    }

    public void setQname(String qname) {
        this.qname = qname;
    }

    public String getHinfo() {
        return hinfo;
    }

    public void setHinfo(String hinfo) {
        this.hinfo = hinfo;
    }

    public Integer getWorkid() {
        return workid;
    }

    public void setWorkid(Integer workid) {
        this.workid = workid;
    }

    public Integer getHtid() {
        return htid;
    }

    public void setHtid(Integer htid) {
        this.htid = htid;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public Integer getHtstate() {
        return htstate;
    }

    public void setHtstate(Integer htstate) {
        this.htstate = htstate;
    }

    public Integer getWorkstyle() {
        return workstyle;
    }

    public void setWorkstyle(Integer workstyle) {
        this.workstyle = workstyle;
    }
}