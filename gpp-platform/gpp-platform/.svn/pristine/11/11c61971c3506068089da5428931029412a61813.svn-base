package com.tbyf.service.gp.userperson.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.service.gp.userperson.UserpersonManager;
import com.tbyf.util.PageData;

/** 
 * 说明： 联系人
 * 创建人：liwb
 * 创建时间：2017-07-12
 * @version
 */
@Service("userPersonService")
public class UserpersonService implements UserpersonManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void addUserPerson(PageData pd)throws Exception{
		dao.save("UserPersonMapper.addUserPerson", pd);
	}
	/**根据姓名身份证手机地址查询联系人是否存在
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public boolean findByNameCardPhoneAdd(PageData pd) throws Exception {
		List list=(List) dao.findForList("UserPersonMapper.findByNameCardPhoneAdd", pd);
		if(list.isEmpty()){
			return true;
		}else{
			return false;
		}
	}
}
