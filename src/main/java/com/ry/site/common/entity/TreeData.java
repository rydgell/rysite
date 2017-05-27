package com.ry.site.common.entity;

import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class TreeData implements Cloneable{
	
	private String id;//节点的 id
	
	private String name;//要显示的节点文本
	
	private String state="closed";//节点状态
	
	private boolean checked =false;//指示节点是否被选中
	
	private String iconCls;
	
	private List<TreeData> children; //定义了一些子节点的节点数组
	
	private boolean nocheck = false;
	
	private boolean isParent = false;
	
	private String tips;
	
	private String remark;
	
	private String pid;

	@JSONField(name = "pId")
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	@JSONField(name = "isParent")
	public boolean getIsParent() {
		return isParent;
	}

	public void setParent(boolean isParent) {
		this.isParent = isParent;
	}

	public boolean isNocheck() {
		return nocheck;
	}

	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List<TreeData> getChildren() {
		return children;
	}

	public void setChildren(List<TreeData> children) {
		this.children = children;
	}
	
	@Override
    public TreeData clone() { 
		TreeData clone = null; 
        try{ 
            clone = (TreeData) super.clone(); 
        }catch(CloneNotSupportedException e){ 
            throw new RuntimeException(e); // won't happen 
        }
        return clone; 
    }
}
