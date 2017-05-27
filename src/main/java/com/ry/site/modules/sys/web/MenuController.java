/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.ry.site.modules.sys.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ry.site.common.config.Global;
import com.ry.site.common.entity.TreeData;
import com.ry.site.common.utils.StringUtils;
import com.ry.site.common.web.BaseController;
import com.ry.site.modules.sys.entity.Dict;
import com.ry.site.modules.sys.entity.Menu;
import com.ry.site.modules.sys.entity.Menus;
import com.ry.site.modules.sys.service.SystemService;
import com.ry.site.modules.sys.utils.UserUtils;

/**
 * 菜单Controller
 * @author ThinkGem
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/menu")
public class MenuController extends BaseController {

	@Autowired
	private SystemService systemService;
	
	@ModelAttribute("menu")
	public Menu get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return systemService.getMenu(id);
		}else{
			return new Menu();
		}
	}

	@RequiresPermissions("sys:menu:view")
	@RequestMapping(value = {"list", ""})
	public String list(Model model) {
		List<Menu> list = Lists.newArrayList();
		List<Menu> sourcelist = systemService.findAllMenu();
		Menu.sortList(list, sourcelist, Menu.getRootId(), true);
        model.addAttribute("list", list);
		return "modules/sys/menuList";
	}

	
	@RequiresPermissions("sys:menu:edit")
	@RequestMapping(value = "save") 
	@ResponseBody
	public String save(Menu menu,Model model) {
		JSONObject jsonObject=new JSONObject();
		System.out.println("------------------------------------ parentId="+menu.getParentId());
		if (!beanValidator(model, menu)){
			
			jsonObject.put("success", false);
		}else{
			systemService.saveMenu(menu);
			jsonObject.put("success",true);
		}
		return jsonObject.toString();
	}
	
	@RequiresPermissions("sys:menu:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(Menu menu) {
		JSONObject jsonObject=new JSONObject();
		try {
			systemService.deleteMenu(menu);
			jsonObject.put("success", true);
		} catch (Exception e) {
			jsonObject.put("success", false);
			jsonObject.put("errorMsg", e);
		}
		return jsonObject.toString();
	}
	

	 
	
	 
	
	
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "getAllMenu")
	public String getAllMenu() {
		List<Menu> list = systemService.findAllMenu();
		List<TreeData> result = new ArrayList<TreeData>();
		for(Menu m:list){
			TreeData td = new TreeData();
			if(m.getParentId().equals("0")){
				continue;
			}
			td.setId(m.getId());
			td.setPid(m.getParentId());
			td.setName(m.getName());
			result.add(td);
		}
		//return JSONObject.toJSONString(formatMenus(list));
		 
		return JSONObject.toJSONString(result);
		
	}
	
	private List<TreeData> formatMenus(List<Menu> menuList){
		Map<String, List<Menu>> menuMap = new HashMap<String, List<Menu>>();
		for(Menu m:menuList){
				List<Menu> tempSub = null;
				if(menuMap.containsKey(m.getParentId())){
					tempSub = menuMap.get(m.getParentId());
				}else{
					tempSub = new ArrayList<Menu>();
				}
				tempSub.add(m);
				menuMap.put(m.getParentId(), tempSub);
		}
		//[0, ba8092291b40482db8fe7fc006ea3d76, 1, 2, 14, 4, 27, 17, 7, 20, 10]
		List<TreeData> result = new ArrayList<TreeData>();
		List<Menu> pMenus = menuMap.get("1");
		for(Menu m:pMenus){
			TreeData pMenu = new TreeData();
			pMenu.setId(m.getId());
			pMenu.setName(m.getName());
			pMenu.setNocheck(false);
			pMenu.setParent(true);
			if(menuMap.containsKey(m.getId())){
				getSubMenu(menuMap, pMenu);
			}
			result.add(pMenu);
		}
		return result;
	}
	
	private void getSubMenu(Map<String, List<Menu>> menuMap,TreeData pMenu){
		List<Menu> subMenus = menuMap.get(pMenu.getId());
		for(Menu m:subMenus){
			TreeData subMenu = new TreeData();
			subMenu.setId(m.getId());
			subMenu.setName(m.getName());
			subMenu.setNocheck(false);
			if(menuMap.containsKey(m.getId())){
				getSubMenu(menuMap, subMenu);
				subMenu.setParent(true);
			}
			if(pMenu.getChildren()==null){
				List<TreeData> children = new ArrayList<TreeData>();
				children.add(subMenu);
				pMenu.setChildren(children);
			}else{
				pMenu.getChildren().add(subMenu);
			}
			
		}
	}
	
}
