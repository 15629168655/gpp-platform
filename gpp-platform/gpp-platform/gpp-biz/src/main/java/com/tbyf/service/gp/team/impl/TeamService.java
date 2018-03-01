package com.tbyf.service.gp.team.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.team.TeamManager;
import com.tbyf.util.PageData;


@Service("teamService")
public class TeamService implements TeamManager{
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TeamMapper.datalistPage", page);
	}
	
	/**
	 * 新增团队信息
	 */
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("TeamMapper.save",pd);
	}
	
	/**
	 * 修改团队信息
	 */
	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("TeamMapper.edit",pd);
	}
	
	/**
	 * 删除
	 * 
	 */
	@Override
	public void delete(PageData pd) throws Exception {
		pd.put("STATUS", "2");
		dao.update("TeamMapper.delete", pd);
		dao.delete("TeamMemberMapper.deleteMember", pd);
	}
	
	/**
	 * 通过ID获取数据
	 */
	@Override
	public PageData fingById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("TeamMapper.findById", pd);
	}
	
	/**
	 * 团队成员列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> memberList(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TeamMemberMapper.datalistPage", page);
	}
	/**
	 * app团队成员列表
	 */
	@Override
	public List<PageData> getListForApp(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TeamMemberMapper.getListForApp", pd);
	}
	/**
	 * 根据ID查询成员（本团队）
	 */
	@Override
	public List<PageData> getlistByMemberId(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("TeamMemberMapper.getlistByMemberId", pd);
	}
	/**
	 * 根据ID查询成员（其他团队）
	 */
	@Override
	public List<PageData> getlistByMemberIdOther(PageData pd) throws Exception{
		return (List<PageData>)dao.findForList("TeamMemberMapper.getlistByMemberIdOther", pd);
	}
	/**
	 * 新增团队成员信息
	 */
	@Override
	public void saveMember(PageData pd) throws Exception {
		dao.save("TeamMemberMapper.save",pd);
	}
	/**
	 * 编辑团队成员信息
	 */
	@Override
	public void editMember(PageData pd) throws Exception {
		dao.update("TeamMemberMapper.edit",pd);
	}
	/**
	 * APP编辑团队成员信息
	 */
	@Override
	public void editMemberForAPP(PageData pd) throws Exception {
		dao.update("TeamMemberMapper.editForApp",pd);
	}
	/**
	 * 通过ID获取团队成员信息
	 */
	@Override
	public PageData fingByIdMember(PageData pd) throws Exception {
		return (PageData)dao.findForObject("TeamMemberMapper.findById", pd);
	}
	
	/**
	 * app接口
	 * appteam 签约团队查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPage(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TeamMapper.queryPage", pd);
	}
	/**
	 * app接口
	 * appteam 根据医生ID查询签约团队
	 * 如果是医院医生，查询下级机构的团队，如果是社区医生，默认查询返回当前医生所在的团队
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> queryPageByProvider(PageData pd) throws Exception {
		if(pd.getString("ORG_CODE").contains("A")){  //若是社区医生则查询当前医生所在团队
			return (List<PageData>)dao.findForList("TeamMapper.findByMemberId", pd);
		}else{                                       //若是医院医生则查询与其医院签约机构的团队 
			return (List<PageData>)dao.findForList("TeamMapper.findBySignCode", pd); 
		}
	}
	/** 
	 * 签约团队查找
	 */
	public List<PageData> getListByKEY(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TeamMapper.getListByKEY", pd);
	}
	/** 
	 * app接口
	 * appteam 签约团队新增
	 */
	@Override
	public void saveTeamApp(PageData pd)throws Exception{ 
		dao.save("TeamMapper.saveApp", pd);
	}

	@Override
	public void delTeamApp(PageData pd) throws Exception {
		dao.delete("TeamMapper.delApp", pd);
		
	}
	
	/**
	 * app接口
	 * appteam 签约团队更新状态
	 */
	@Override
	public void statusTeamApp(PageData pd)throws Exception{
		dao.update("TeamMapper.updateStatusApp", pd);
	}

	@Override
	public void editTeamApp(PageData pd) throws Exception {
		dao.update("TeamMapper.editApp", pd);
	}
	/**
	 *  通过医生ID 获取数据 
	 */
	@Override
	public List<PageData> findByTeamMemberId(PageData pd) throws Exception {
		return  ( List<PageData>)dao.findForList("TeamMemberMapper.findByTeamMemberId", pd);
	}
	/**
	 * 根据ID增加人数
	 */
	@Override
	public void addTeamNumberById(PageData pd) throws Exception {
		dao.update("TeamMapper.addNumberById", pd);
	}
	/**
	 * 根据ID减少人数
	 */
	@Override
	public void delTeamNumberById(PageData pd) throws Exception {
		dao.update("TeamMapper.delNumberById", pd);
	}
}
