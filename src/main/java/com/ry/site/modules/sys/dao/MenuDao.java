/**
 * 
 */
package com.ry.site.modules.sys.dao;

import java.util.List;

import com.ry.site.common.persistence.CrudDao;
import com.ry.site.common.persistence.annotation.MyBatisDao;
import com.ry.site.modules.sys.entity.Menu;

/**
 * 菜单DAO接口
 * @author rydge
 * @version 2014-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu> {

	public List<Menu> findByParentIdsLike(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	
	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);
	
}
