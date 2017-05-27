package com.ry.site.common.entity;

import java.io.Serializable;

public class SelectEntity implements Serializable{
 
	private static final long serialVersionUID = 7016461688087713016L;
	
	private String value;
	
	private String text;
	
	private boolean selected;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	
}
