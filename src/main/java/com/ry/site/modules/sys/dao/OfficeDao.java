/**
 * 
 */
package com.ry.site.modules.sys.dao;

import com.ry.site.common.persistence.TreeDao;
import com.ry.site.common.persistence.annotation.MyBatisDao;
import com.ry.site.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author rydge
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
}
