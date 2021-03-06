package com.tbyf.service.system.appuser.impl;

import java.util.List;

import javax.annotation.Resource;

import com.tbyf.entity.system.User;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.system.appuser.AppuserManager;
import com.tbyf.util.PageData;


/**类名称：AppuserService
 * 修改时间：2015年11月6日
 */
@Service("appuserService")
public class AppuserService implements AppuserManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列出某角色下的所有会员
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllAppuserByRorlid(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.listAllAppuserByRorlid", pd);
	}
	
	/**会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.userlistPage", page);
	}
	/**会员列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> userListForApp(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.userListForApp", pd);
	}
	
	
	/**通过用户名获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUsername(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUsername", pd);
	}
	/**通过用户名id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUserId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUserId", pd);
	}
	/**通过邮箱获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByEmail(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByEmail", pd);
	}
	/**通过手机号码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByPhone(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByPhone", pd);
	}
	/**通过编号获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByNumber(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByNumber", pd);
	}
	
	/**保存用户
	 * @param pd
	 * @throws Exception
	 */
	public void saveU(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveU", pd);
	}
	
	/**删除用户
	 * @param pd
	 * @throws Exception
	 */
	public void deleteU(PageData pd)throws Exception{
		dao.delete("AppuserMapper.deleteU", pd);
	}
	
	/**修改用户部分信息
	 * @param pd
	 * @throws Exception
	 */
	public void editUserInfo(PageData pd)throws Exception{
		dao.update("AppuserMapper.editUserInfo", pd);
		dao.update("AppuserMapper.editProviderInfo", pd);
	}
	
	/**修改用户手机号
	 * @param pd
	 * @throws Exception
	 */
	public void editUserPhone(PageData pd)throws Exception{
		dao.update("AppuserMapper.editAPPUserPhone", pd);
		dao.update("AppuserMapper.editProviderPhone", pd);
	}
	
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception{
		dao.update("AppuserMapper.editU", pd);
	}
	
	/**修改用户头像
	 * @param pd
	 * @throws Exception
	 */
	public void editUserImage(PageData pd)throws Exception{
		dao.update("AppuserMapper.editUserImage", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByUiId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUiId", pd);
	}
	
	/**全部会员
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.listAllUser", pd);
	}
	
	/**批量删除用户
	 * @param USER_IDS
	 * @throws Exception
	 */
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("AppuserMapper.deleteAllU", USER_IDS);
	}
	
	/**获取总数
	 * @param value
	 * @throws Exception
	 */
	public PageData getAppUserCount(String value)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.getAppUserCount", value);
	}

	/**
	 * 根据用户名和密码查询appuser
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByNameAndPwd(PageData pd) throws Exception {
		return (PageData)dao.findForObject("AppuserMapper.getUserInfo", pd);
	}

	/**
	 * 更新最后登录时间
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void updateLastLogin(PageData pd) throws Exception {
		dao.update("AppuserMapper.updateLastLogin", pd);
	}

	/**通过用户ID获取用户信息和角色信息
	 * @param user_id
	 * @return
	 */
	@Override
	public User getUserAndRoleById(String user_id) throws Exception {
		return (User) dao.findForObject("AppuserMapper.getUserAndRoleById", user_id);
	}

	/**
	 * 通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("AppuserMapper.findById", pd);
	}

	public PageData findByUiLoginInfo(PageData pd)
		    throws Exception
	  {
	    PageData result = new PageData();
	    PageData pageData = (PageData)this.dao.findForObject("AppuserMapper.getUserInfo", pd);
	    if ((pageData != null) && (pageData.containsKey("USER_ID"))) {
	      result.put("USER_ID", pageData.get("USER_ID"));
	      result.put("ORG_CODE", pageData.get("ORG_CODE"));
	      result.put("PROVIDER_ID", pageData.get("PROVIDER_ID"));
	      result.put("PROVIDER_CODE", pageData.get("PROVIDER_CODE"));
	      result.put("PROVIDER_NAME", pageData.get("PROVIDER_NAME"));
	      result.put("PHONE", pageData.get("PHONE"));
	      result.put("SEX", pageData.get("SEX"));
	      result.put("IDCARD", pageData.get("SFID"));
	      result.put("IMAGE_URL", pageData.get("IMAGE_URL"));
	    }
	    return result;
	  }
	
	@Override
	public void editPW(PageData pd) throws Exception {
		dao.update("AppuserMapper.editPW", pd);
	}

	/**
	 *  根据用户名 、工号、姓名、查询用户信息 
	 */
	@Override
	public List<PageData> findByNameAndJobNumber(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.findByNameAndJobNumber", pd);
	}

	@Override
	public PageData findByProviderId(PageData pd) throws Exception {
		return (PageData)dao.findForObject("AppuserMapper.findByProviderId", pd);
	}
}

