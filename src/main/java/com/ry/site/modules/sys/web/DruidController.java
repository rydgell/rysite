package com.ry.site.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ry.site.common.web.BaseController;
import com.ry.site.modules.sys.entity.Log;

@Controller
@RequestMapping(value = "${adminPath}/sys/druid")
public class DruidController extends BaseController{

	 
	@RequestMapping(value = {"druidIndex"})
	public String list(Log log, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/sys/druid";
	}
}
