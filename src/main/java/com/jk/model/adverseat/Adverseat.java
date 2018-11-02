package com.jk.model.adverseat;

import java.io.Serializable;

public class Adverseat implements Serializable {
    private static final long serialVersionUID = -1711474116214011072L;

    /**
     * 广告位id
     */
    private  Integer  seatid;

    /**
     * 广告位名称
     */
    private String seatname;

    /**
     *广告尺寸
     */
    private  Integer seatprice;

    /**
     *合同id
     */
    private Integer htid;

    private Integer adverid;

    private Integer qid;

    public Integer getSeatid() {
        return seatid;
    }

    public void setSeatid(Integer seatid) {
        this.seatid = seatid;
    }

    public String getSeatname() {
        return seatname;
    }

    public void setSeatname(String seatname) {
        this.seatname = seatname;
    }

    public Integer getSeatprice() {
        return seatprice;
    }

    public void setSeatprice(Integer seatprice) {
        this.seatprice = seatprice;
    }

    public Integer getHtid() {
        return htid;
    }

    public void setHtid(Integer htid) {
        this.htid = htid;
    }

    public Integer getAdverid() {
        return adverid;
    }

    public void setAdverid(Integer adverid) {
        this.adverid = adverid;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}
