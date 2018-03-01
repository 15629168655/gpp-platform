package com.tbyf.service.information.healthinformation.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.healthinformation.HealthInformationManager;
import com.tbyf.util.PageData;

@Service("healthService")
public class HealthInformationService implements HealthInformationManager{
		
		@Resource(name = "daoSupport")
		private DaoSupport dao;
		
		/**
		 * 健康资讯列表
		 */
		@Override
		public List<PageData> list(Page page) throws Exception {
			return (List<PageData>) dao.findForList("HealthInfomationMapper.datalistPage", page);
		}
		/**
		 * 发布健康资讯
		 */
		@Override
		public void save(PageData pd) throws Exception {
			dao.save("HealthInfomationMapper.save", pd);
		}
		
		/**
		 * 编辑
		 */
		@Override
		public void edit(PageData pd) throws Exception {
			dao.update("HealthInfomationMapper.edit", pd);
			
		}
		/**
		 * 增加浏览量
		 * @param num
		 * @throws Exception
		 */
		@Override
		public void addLLL(PageData pd) throws Exception{
			dao.update("HealthInfomationMapper.addLLL", pd);
		}
		
		/**
		 * 通过ID获取数据
		 */
		@Override
		public PageData findById(PageData pd) throws Exception {
			 return (PageData) dao.findForObject("HealthInfomationMapper.findById", pd);
		}
		/**
		 * APP健康资讯查询
		 */
		@Override
		public List<PageData> queryPage(PageData pd) throws Exception {
			return (List<PageData>) dao.findForList("HealthInfomationMapper.queryPage", pd);
		}
}
