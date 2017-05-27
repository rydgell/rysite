package com.ry.site.modules.sys.entity;

import java.io.Serializable;
import java.util.List;

public class Menus implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Menu parent;	// 父级菜单
	
	private List<Menu> submenus;	// 子级菜单

	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	public List<Menu> getSubmenus() {
		return submenus;
	}

	public void setSubmenus(List<Menu> submenus) {
		this.submenus = submenus;
	}
	
	
}
