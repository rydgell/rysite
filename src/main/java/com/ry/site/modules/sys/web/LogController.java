/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.ry.site.modules.sys.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ry.site.common.persistence.Page;
import com.ry.site.common.web.BaseController;
import com.ry.site.modules.sys.entity.Dict;
import com.ry.site.modules.sys.entity.Log;
import com.ry.site.modules.sys.service.LogService;

/**
 * 日志Controller
 * @author ThinkGem
 * @version 2013-6-2
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;
	
	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/sys/logList";
	}

	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = {"logList"})
	@ResponseBody
	public String logList(Log log, 
			@RequestParam(required=true,defaultValue="1") Integer offset ,
            @RequestParam(required=false,defaultValue="10") Integer limit) {
		PageHelper.offsetPage(offset , limit);
	    List<Log> list = logService.findList(log);
        PageInfo<Log> p=new PageInfo<Log>(list);
        
        JSONObject result = new JSONObject();
        result.put("rows", p.getList());//JSONArray
        result.put("total",p.getTotal());//总记录数
        result.put("page",p.getPages());//总记录数
        System.out.println("------------------------------"+p.getTotal());
		return result.toJSONString();
	}
}
