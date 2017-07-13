/**
 * 
 */
package com.ry.site.modules.sys.dao;

import com.ry.site.common.persistence.CrudDao;
import com.ry.site.common.persistence.annotation.MyBatisDao;
import com.ry.site.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * @author rydge
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
