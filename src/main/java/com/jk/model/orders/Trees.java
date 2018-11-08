package com.jk.model.orders;

import com.jk.utils.PageUtil;

import java.io.Serializable;
import java.util.List;

public class Trees extends PageUtil implements Serializable {

    private static final long serialVersionUID = -6760607400872654131L;
    private Integer id ;

    private String text;

    private String url;

    private String pid ;

    private Boolean checked;

    private List<Trees> nodes;

    private Boolean leaf;

    private Boolean selectable;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public List<Trees> getNodes() {
        return nodes;
    }

    public void setNodes(List<Trees> nodes) {
        this.nodes = nodes;
    }

    public Boolean getLeaf() {
        return leaf;
    }

    public void setLeaf(Boolean leaf) {
        this.leaf = leaf;
    }

    public Boolean getSelectable() {
        return selectable;
    }

    public void setSelectable(Boolean selectable) {
        this.selectable = selectable;
    }
}
