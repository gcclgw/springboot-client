package com.jk.model.power;

import com.jk.utils.Page;

import java.io.Serializable;
import java.util.List;

public class PowerTree extends Page implements Serializable {

    private static final long serialVersionUID = -6760607400872654131L;
    private String id ;

    private String text;

    private String href;

    private String pid ;

    private Boolean checked;

    private List<PowerTree> nodes;

    private Boolean leaf;

    private Boolean selectable;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
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

    public List<PowerTree> getNodes() {
        return nodes;
    }

    public void setNodes(List<PowerTree> nodes) {
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
