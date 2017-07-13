/**
 * 
 */
package com.ry.site.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ry.site.common.beanvalidator.BeanValidators;
import com.ry.site.common.config.Global;
import com.ry.site.common.persistence.Page;
import com.ry.site.common.utils.DateUtils;
import com.ry.site.common.utils.StringUtils;
import com.ry.site.common.utils.excel.ExportExcel;
import com.ry.site.common.utils.excel.ImportExcel;
import com.ry.site.common.web.BaseController;
import com.ry.site.modules.sys.entity.Dict;
import com.ry.site.modules.sys.entity.Office;
import com.ry.site.modules.sys.entity.Role;
import com.ry.site.modules.sys.entity.User;
import com.ry.site.modules.sys.service.SystemService;
import com.ry.site.modules.sys.utils.UserUtils;

/**
 * 用户Controller
 * @author rydge
 * @version 2013-8-29
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/user")
public class UserController extends BaseController {

	@Autowired
	private SystemService systemService;
	
	@ModelAttribute
	public User get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return systemService.getUser(id);
		}else{
			return new User();
		}
	}


	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"userinfo"})
	public String userinfo(Model model) {
		return "modules/sys/sysIndex";
	}
	
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"index"})
	public String index(User user, Model model) {
		return "modules/sys/userIndex";
	}

	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"list", ""})
	public String list(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		//Page<User> page = systemService.findUser(new Page<User>(request, response), user);
       // model.addAttribute("page", page);
		return "modules/sys/userList";
	}
	
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"userList"})
	@ResponseBody
	public String userList(User user, 
			@RequestParam(required=true,defaultValue="1") Integer offset ,
            @RequestParam(required=false,defaultValue="10") Integer limit) {
		PageHelper.offsetPage(offset , limit);
	    List<User> list = systemService.findUser(user);
        PageInfo<User> p=new PageInfo<User>(list);
        
        JSONObject result = new JSONObject();
        result.put("rows", p.getList());//JSONArray
        result.put("total",p.getTotal());//总记录数
        result.put("page",p.getPages());//总记录数
		return result.toJSONString();
	}
	
	@ResponseBody
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value = {"listData"})
	public Page<User> listData(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<User> page = systemService.findUser(new Page<User>(request, response), user);
		return page;
	}

	 

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "getUserRoleIds")
	public String getUserRoleIds(User user) {
		return JSONObject.toJSONString(user.getRoleIdList());
	}
	
	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(User user) {
		// 修正引用赋值问题，不知道为何，Company和Office引用的一个实例地址，修改了一个，另外一个跟着修改。
//		user.setCompany(new Office(request.getParameter("company.id")));
//		user.setOffice(new Office(request.getParameter("office.id")));
		System.out.println("-------------------------------------> getRoleIdList :"+user.getRoleIdList().toString());
		
		JSONObject jsonObject=new JSONObject();
		// 如果新密码为空，则不更换密码
		if (StringUtils.isNotBlank(user.getNewPassword())) {
			user.setPassword(SystemService.entryptPassword(user.getNewPassword()));
		}
		
		 
		// 角色数据有效性验证，过滤不在授权内的角色
		List<Role> roleList = Lists.newArrayList();
		List<String> roleIdList = user.getRoleIdList();
		for (Role r : systemService.findAllRole()){
			if (roleIdList.contains(r.getId())){
				roleList.add(r);
			}
		}
		user.setRoleList(roleList);
		// 保存用户信息
		systemService.saveUser(user);
		// 清除当前用户缓存
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())){
			UserUtils.clearCache();
			//UserUtils.getCacheMap().clear();
		}
		jsonObject.put("success", true);
		return jsonObject.toString();
	}
	
	/*@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "delete")
	public String delete(User user, RedirectAttributes redirectAttributes) {
		if (UserUtils.getUser().getId().equals(user.getId())){
			addMessage(redirectAttributes, "删除用户失败, 不允许删除当前用户");
		}else if (User.isAdmin(user.getId())){
			addMessage(redirectAttributes, "删除用户失败, 不允许删除超级管理员用户");
		}else{
			systemService.deleteUser(user);
			addMessage(redirectAttributes, "删除用户成功");
		}
		return "redirect:" + adminPath + "/sys/user/list?repage";
	}*/
	
	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(User user) {
		JSONObject jsonObject=new JSONObject();
		try {
			if (UserUtils.getUser().getId().equals(user.getId())){
				jsonObject.put("success", false);
				jsonObject.put("errorMsg", "删除用户失败, 不允许删除当前用户!");
			}else if (User.isAdmin(user.getId())){
				jsonObject.put("success", false);
				jsonObject.put("errorMsg", "删除用户失败, 不允许删除超级管理员用户!");
			}else{
				systemService.deleteUser(user);
				jsonObject.put("success", true);
			}
		} catch (Exception e) {
			jsonObject.put("success", false);
			jsonObject.put("errorMsg", e);
		}
		return jsonObject.toString();
	}
	
	 
	
	 
	/**
	 * 验证登录名是否有效
	 * @param oldLoginName
	 * @param loginName
	 * @return
	 */
	@ResponseBody
	@RequiresPermissions("sys:user:edit")
	@RequestMapping(value = "checkLoginName")
	public String checkLoginName(String oldLoginName, String loginName) {
		if (loginName !=null && loginName.equals(oldLoginName)) {
			return "true";
		} else if (loginName !=null && systemService.getUserByLoginName(loginName) == null) {
			return "true";
		}
		return "false";
	}

	/**
	 * 用户信息显示及保存
	 * @param user
	 * @param model
	 * @return
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "info")
	public String info(User user, HttpServletResponse response, Model model) {
		User currentUser = UserUtils.getUser();
		if (StringUtils.isNotBlank(user.getName())){
			if(Global.isDemoMode()){
				model.addAttribute("message", "演示模式，不允许操作！");
				return "modules/sys/userInfo";
			}
			currentUser.setEmail(user.getEmail());
			currentUser.setPhone(user.getPhone());
			currentUser.setMobile(user.getMobile());
			currentUser.setRemarks(user.getRemarks());
			currentUser.setPhoto(user.getPhoto());
			systemService.updateUserInfo(currentUser);
			model.addAttribute("message", "保存用户信息成功");
		}
		model.addAttribute("user", currentUser);
		model.addAttribute("Global", new Global());
		return "modules/sys/userInfo";
	}

	/**
	 * 返回用户信息
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "infoData")
	public User infoData() {
		return UserUtils.getUser();
	}
	
	/**
	 * 修改个人用户密码
	 * @param oldPassword
	 * @param newPassword
	 * @param model
	 * @return
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "modifyPwd")
	public String modifyPwd(String oldPassword, String newPassword, Model model) {
		User user = UserUtils.getUser();
		if (StringUtils.isNotBlank(oldPassword) && StringUtils.isNotBlank(newPassword)){
			if(Global.isDemoMode()){
				model.addAttribute("message", "演示模式，不允许操作！");
				return "modules/sys/userModifyPwd";
			}
			if (SystemService.validatePassword(oldPassword, user.getPassword())){
				systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
				model.addAttribute("message", "修改密码成功");
			}else{
				model.addAttribute("message", "修改密码失败，旧密码错误");
			}
		}
		model.addAttribute("user", user);
		return "modules/sys/userModifyPwd";
	}
	
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String officeId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<User> list = systemService.findUserByOfficeId(officeId);
		for (int i=0; i<list.size(); i++){
			User e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", "u_"+e.getId());
			map.put("pId", officeId);
			map.put("name", StringUtils.replace(e.getName(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}
    
 
}
