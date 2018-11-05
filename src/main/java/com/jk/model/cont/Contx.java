package com.jk.model.cont;


import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Contx implements Serializable {
private static final long serialVersionUID = 3428334157285335304L;
private Integer htid;
private String htname;
private String htstatus;
private String startdate;
private String endtime;
private String qid;
private String creatdate;
private String htinfo;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getHtid() {
        return htid;
    }

    public void setHtid(Integer htid) {
        this.htid = htid;
    }

    public String getHtname() {
        return htname;
    }

    public void setHtname(String htname) {
        this.htname = htname;
    }

    public String getHtstatus() {
        return htstatus;
    }

    public void setHtstatus(String htstatus) {
        this.htstatus = htstatus;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getCreatdate() {
        return creatdate;
    }

    public void setCreatdate(String creatdate) {
        this.creatdate = creatdate;
    }

    public String getHtinfo() {
        return htinfo;
    }

    public void setHtinfo(String htinfo) {
        this.htinfo = htinfo;
    }
}
