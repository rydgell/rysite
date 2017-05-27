/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.ry.site.modules.sys.web;

import java.util.ArrayList;
import java.util.Arrays;
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
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ry.site.common.config.Global;
import com.ry.site.common.entity.SelectEntity;
import com.ry.site.common.utils.Collections3;
import com.ry.site.common.utils.StringUtils;
import com.ry.site.common.web.BaseController;
import com.ry.site.modules.sys.entity.Dict;
import com.ry.site.modules.sys.entity.Office;
import com.ry.site.modules.sys.entity.Role;
import com.ry.site.modules.sys.entity.User;
import com.ry.site.modules.sys.service.OfficeService;
import com.ry.site.modules.sys.service.SystemService;
import com.ry.site.modules.sys.utils.UserUtils;

/**
 * 角色Controller
 * @author ThinkGem
 * @version 2013-12-05
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/role")
public class RoleController extends BaseController {

	@Autowired
	private SystemService systemService;
	
	@Autowired
	private OfficeService officeService;
	
	@ModelAttribute("role")
	public Role get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			Role r = systemService.getRole(id);
			return r;
		}else{
			return new Role();
		}
	}
	
	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = {"list", ""})
	public String list(Role role, Model model) {
		//List<Role> list = systemService.findAllRole();
		//model.addAttribute("list", list);
		return "modules/sys/roleList";
	}
	
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = {"roleList"})
	@ResponseBody
	public String roleList(Role role, 
			@RequestParam(required=true,defaultValue="1") Integer offset ,
            @RequestParam(required=false,defaultValue="10") Integer limit) {
		PageHelper.offsetPage(offset , limit);
		List<Role> list = systemService.findAllRole();
        PageInfo<Role> p=new PageInfo<Role>(list);
        JSONObject result = new JSONObject();
        result.put("rows", p.getList());//JSONArray
        result.put("total",p.getTotal());//总记录数
        result.put("page",p.getPages());//总记录数
       
		return result.toJSONString();
	}

	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = "userRole")
	@ResponseBody
	public String getUserRole(Role role) {
		 return role.getMenuIds();
	}
	
	 
	
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(Role role, Model model) {
		JSONObject jsonObject=new JSONObject();
		if (!beanValidator(model, role)){
			jsonObject.put("errorMsg", "数据格式不正确!");
			jsonObject.put("success", false);
			return jsonObject.toString();
		}
		 
		systemService.saveRole(role);
		jsonObject.put("success", true);
		return jsonObject.toString();
	}
	
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "saveUserRole")
	@ResponseBody
	public String saveUserRole(Role role,String userIds) {
		System.out.println("xxxxxxxxxxxxxxxxxxxx:"+userIds);
		JSONObject jsonObject=new JSONObject();
		List<String> idsArr = Arrays.asList(userIds.split(","));
		systemService.assignUserToRole(role, idsArr);
		jsonObject.put("success", true);
		return jsonObject.toString();
	}
	
	
	
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(Role role) {
		JSONObject jsonObject=new JSONObject();
		try {
			System.out.println("del role :"+role.getId());
			if(!UserUtils.getUser().isAdmin() && role.getSysData().equals(Global.YES)){
				jsonObject.put("errorMsg", "越权操作，只有超级管理员才能修改此数据！");
				jsonObject.put("success", false);
				return jsonObject.toString();
			}
			systemService.deleteRole(role);
			jsonObject.put("success", true);
		} catch (Exception e) {
			jsonObject.put("success", false);
			jsonObject.put("errorMsg", e);
		}
		return jsonObject.toString();
	}
	
	
	/**
	 * 角色分配页面
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "assign")
	public String assign(Role role, Model model) {
		model.addAttribute("role", role);
		return "modules/sys/roleAssign";
	}
	
	
	/**
	 * 角色分配页面
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "userAssign")
	@ResponseBody
	public String userAssign(Role role,
			@RequestParam(required=true,defaultValue="1") Integer offset ,
            @RequestParam(required=false,defaultValue="10") Integer limit) {
		PageHelper.offsetPage(offset , limit);
		List<User> userList = systemService.findUser(new User(new Role(role.getId())));
        PageInfo<User> p=new PageInfo<User>(userList);
        JSONObject result = new JSONObject();
        result.put("rows", p.getList());//JSONArray
        result.put("total",p.getTotal());//总记录数
        result.put("page",p.getPages());//总记录数
       
		return result.toJSONString();
		 
	}
	
	/**
	 * 角色分配 -- 打开角色分配对话框
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "selectUserToRole")
	@ResponseBody
	public String selectUserToRole(Role role) {
		List<User> userList = systemService.findUser(new User(new Role(role.getId())));
		List<User> userAllList = systemService.findUser(new User());
		String selectedUsers =  Collections3.extractToString(userList, "id", ",");
		selectedUsers = ","+selectedUsers+",";
		List<SelectEntity> result = new ArrayList<SelectEntity>();
		for(User u:userAllList){
			SelectEntity entity = new SelectEntity();
			entity.setValue(u.getId());
			entity.setText(u.getName());
			if(selectedUsers.indexOf(","+u.getId()+",")!=-1){
				entity.setSelected(true);
			}
			result.add(entity);
		}
		return JSONObject.toJSONString(result);
	}
	
	 
	 
	
	
	/**
	 * 角色分配 -- 从角色中移除用户
	 * @param userId
	 * @param roleId
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "delUserRole")
	@ResponseBody
	public String delUserRole(String userId, String roleId, RedirectAttributes redirectAttributes) {
		JSONObject jsonObject=new JSONObject();
		Role role = systemService.getRole(roleId);
		User user = systemService.getUser(userId);
		if (UserUtils.getUser().getId().equals(userId)) {
			jsonObject.put("errorMsg", "无法从角色【" + role.getName() + "】中移除用户【" + user.getName() + "】自己！");
			jsonObject.put("success", false);
		}else {
			Boolean flag = systemService.outUserInRole(role, user);
			if (!flag) {
				jsonObject.put("errorMsg", "用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！");
				jsonObject.put("success", false);
			}else {
				jsonObject.put("success", true);
			}
		}
		return jsonObject.toString();
	}
	

	/**
	 * 验证角色名是否有效
	 * @param oldName
	 * @param name
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "checkName")
	public String checkName(String oldName, String name) {
		if (name!=null && name.equals(oldName)) {
			return "true";
		} else if (name!=null && systemService.getRoleByName(name) == null) {
			return "true";
		}
		return "false";
	}

	/**
	 * 验证角色英文名是否有效
	 * @param oldName
	 * @param name
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "checkEnname")
	public String checkEnname(String oldEnname, String enname) {
		if (enname!=null && enname.equals(oldEnname)) {
			return "true";
		} else if (enname!=null && systemService.getRoleByEnname(enname) == null) {
			return "true";
		}
		return "false";
	}

	
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "selectRole")
	public String selectRole() {
		List<Role> list = systemService.findAllRole();
		return JSONObject.toJSONString(list);
	}
}
