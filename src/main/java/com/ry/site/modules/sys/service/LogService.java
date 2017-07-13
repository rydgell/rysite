/**
 */
package com.ry.site.modules.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ry.site.common.persistence.Page;
import com.ry.site.common.service.CrudService;
import com.ry.site.common.utils.DateUtils;
import com.ry.site.modules.sys.dao.LogDao;
import com.ry.site.modules.sys.entity.Log;

/**
 * 日志Service
 * @author rydge
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class LogService extends CrudService<LogDao, Log> {

	
}
