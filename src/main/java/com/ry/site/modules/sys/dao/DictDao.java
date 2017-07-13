/**
 * 
 */
package com.ry.site.modules.sys.dao;

import java.util.List;

import com.ry.site.common.persistence.CrudDao;
import com.ry.site.common.persistence.annotation.MyBatisDao;
import com.ry.site.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author rydge
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
