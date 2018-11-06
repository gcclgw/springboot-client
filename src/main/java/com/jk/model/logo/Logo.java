package com.jk.model.logo;

import java.io.Serializable;

public class Logo implements Serializable {
    private static final long serialVersionUID = -7989702166767403470L;
    private Integer lid;

    private String logimg;

    public Integer getLid() {
        return lid;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public String getLogimg() {
        return logimg;
    }

    public void setLogimg(String logimg) {
        this.logimg = logimg == null ? null : logimg.trim();
    }
}