package com.jk.model.mywork;

import java.io.Serializable;
import java.util.Date;

public class Contxract implements Serializable {

    private static final long serialVersionUID = 4368851814090799453L;
    private Integer htid;
    private String htname;
    private String htstatus;
    private String startdate;
    private Date endtime;
    private String qid;
    private String creatdate;
    private String htinfo;

    private  Integer htstate;

    private Integer page;

    private Integer rows;

    private String htphone;


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

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
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

    public Integer getHtstate() {
        return htstate;
    }

    public void setHtstate(Integer htstate) {
        this.htstate = htstate;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public String getHtphone() {
        return htphone;
    }

    public void setHtphone(String htphone) {
        this.htphone = htphone;
    }
}
