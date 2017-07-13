/**
 * 
 */
package com.ry.site.modules.sys.web;

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
import com.ry.site.common.utils.StringUtils;
import com.ry.site.common.web.BaseController;
import com.ry.site.modules.sys.entity.Dict;
import com.ry.site.modules.sys.entity.Office;
import com.ry.site.modules.sys.entity.User;
import com.ry.site.modules.sys.service.OfficeService;
import com.ry.site.modules.sys.utils.DictUtils;
import com.ry.site.modules.sys.utils.UserUtils;

/**
 * 机构Controller
 * @author rydge
 * @version 2013-5-15
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/office")
public class OfficeController extends BaseController {

	@Autowired
	private OfficeService officeService;
	
	@ModelAttribute("office")
	public Office get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return officeService.get(id);
		}else{
			return new Office();
		}
	}

	@RequiresPermissions("sys:office:view")
	@RequestMapping(value = {""})
	public String index() {
//        model.addAttribute("list", officeService.findAll());
		return "modules/sys/dptList";
	}

	
	@RequiresPermissions("sys:office:view")
	@RequestMapping(value = {"dptList"})
	@ResponseBody
	public String list(Office office, 
			@RequestParam(required=true,defaultValue="1") Integer offset ,
            @RequestParam(required=false,defaultValue="10") Integer limit) {
		PageHelper.offsetPage(offset , limit);
	    List<Office> list = officeService.findList(office);
        PageInfo<Office> p=new PageInfo<Office>(list);
        
        JSONObject result = new JSONObject();
        result.put("rows", p.getList());//JSONArray
        result.put("total",p.getTotal());//总记录数
        result.put("page",p.getPages());//总记录数
        System.out.println("------------------------------>"+p.getTotal());
		return result.toJSONString();
	}
	
	
	 
	@RequiresPermissions("sys:office:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(Office office, Model model) {
		JSONObject jsonObject=new JSONObject();
		if (!beanValidator(model, office)){
			jsonObject.put("success", false);
		}
		officeService.save(office);
		jsonObject.put("success",true);
		return jsonObject.toString();
	}
	
	@RequiresPermissions("sys:office:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(Office office) {
		JSONObject jsonObject=new JSONObject();
		try {
			officeService.delete(office);
			jsonObject.put("success", true);
		} catch (Exception e) {
			jsonObject.put("success", false);
			jsonObject.put("errorMsg", e);
		}
		return jsonObject.toString();
	}

	
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "selectDpt")
	public String selectDpt() {
		List<Office> list = officeService.findList(true);
		return JSONObject.toJSONString(list);
	}
}
