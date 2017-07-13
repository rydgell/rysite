/**
 * 
 */
package com.ry.site.modules.sys.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ry.site.common.config.Global;
import com.ry.site.common.entity.SelectEntity;
import com.ry.site.common.persistence.Page;
import com.ry.site.common.utils.StringUtils;
import com.ry.site.common.web.BaseController;
import com.ry.site.modules.sys.entity.Dict;
import com.ry.site.modules.sys.service.DictService;

/**
 * 字典Controller
 * @author rydge
 * @version 2014-05-16
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/dict")
public class DictController extends BaseController {

	@Autowired
	private DictService dictService;
	
	@ModelAttribute
	public Dict get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return dictService.get(id);
		}else{
			return new Dict();
		}
	}
	
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = {"list",""})
	public String list() {
		return "modules/sys/dictList";
	}
	
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = {"dictList"})
	@ResponseBody
	public String dictList(Dict dict, 
			@RequestParam(required=true,defaultValue="1") Integer offset ,
            @RequestParam(required=false,defaultValue="10") Integer limit) {
		PageHelper.offsetPage(offset , limit);
	    List<Dict> list = dictService.findList(dict);
        PageInfo<Dict> p=new PageInfo<Dict>(list);
        
        JSONObject result = new JSONObject();
        result.put("rows", p.getList());//JSONArray
        result.put("total",p.getTotal());//总记录数
        result.put("page",p.getPages());//总记录数
        System.out.println("------------------------------"+p.getTotal());
		return result.toJSONString();
	}
	
	 
	
	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "saveDict") 
	@ResponseBody
	public String saveDict(Dict dict,Model model) {
		JSONObject jsonObject=new JSONObject();
		if (!beanValidator(model, dict)){
			System.out.println("------------------------------------ beanValidator");
			jsonObject.put("success", false);
		}else{
			dictService.save(dict);
			jsonObject.put("success",true);
		}
		System.out.println(jsonObject.toString());
		return jsonObject.toString();
	}
	
	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(Dict dict) {
		JSONObject jsonObject=new JSONObject();
		try {
			dictService.delete(dict);
			jsonObject.put("success", true);
		} catch (Exception e) {
			jsonObject.put("success", false);
			jsonObject.put("errorMsg", e);
		}
		return jsonObject.toString();
	}
	
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String type, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		Dict dict = new Dict();
		dict.setType(type);
		List<Dict> list = dictService.findList(dict);
		for (int i=0; i<list.size(); i++){
			Dict e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", e.getParentId());
			map.put("name", StringUtils.replace(e.getLabel(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}
	
	@ResponseBody
	@RequestMapping(value = "listData")
	public List<Dict> listData(@RequestParam(required=false) String type) {
		Dict dict = new Dict();
		dict.setType(type);
		return dictService.findList(dict);
	}
	
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = {"dictTypeList"})
	@ResponseBody
	public String dictTypeList() {
		List<String> typeList = dictService.findTypeList();
		List<SelectEntity> result = new ArrayList<SelectEntity>();
		for(String type:typeList){
			SelectEntity s = new SelectEntity();
			s.setValue(type);
			s.setText(type);
			result.add(s);
		}
		return JSON.toJSONString(result);
	}

}
