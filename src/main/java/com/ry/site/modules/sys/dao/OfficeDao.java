/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.ry.site.modules.sys.dao;

import com.ry.site.common.persistence.TreeDao;
import com.ry.site.common.persistence.annotation.MyBatisDao;
import com.ry.site.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
}
