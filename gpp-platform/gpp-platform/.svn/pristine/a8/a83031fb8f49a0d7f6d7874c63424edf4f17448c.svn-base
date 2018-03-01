package com.tbyf.service.gp.index.quesresultstatistics.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumIndexState;
import com.tbyf.entity.enums.EnumQuesState;
import com.tbyf.entity.enums.EnumSexGB;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.index.quesresultstatistics.QuesResultStatisticsManager;
import com.tbyf.util.PageData;
/**
 * 
 * @author zanxc
 *
 */
@Service("quesResultStatisticsService")
public class QuesResultStatisticsService implements QuesResultStatisticsManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * 统计各种的人数
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> SList(PageData pd) throws Exception {
		List<PageData> list = new ArrayList<PageData>();
		//问卷男性人数统计
		pd.put("ID", EnumSexGB.MAN.getCode());
		pd.put("IS_POSITIVE", EnumQuesState.SUBMIT.getCode());
		List<PageData> MountManList = (List<PageData>) dao.findForList("IndexQuesResultStatisticsMapper.PeopleMount", pd);
		//问卷女生统计
		pd.put("ID", EnumSexGB.WOMAN.getCode());
		pd.put("IS_POSITIVE", EnumQuesState.SUBMIT.getCode());
		List<PageData> MountWoManList = (List<PageData>) dao.findForList("IndexQuesResultStatisticsMapper.PeopleMount", pd);
		//统计人的总数
		if(MountManList != null && MountManList.size() != 0) {
			for(PageData MountMan : MountManList) {
				PageData pdM = new PageData();
				int amount = 0;
				for(PageData MountWoMan : MountWoManList) {
					if(MountMan.getString("NND").equals(MountWoMan.getString("NND"))) {
					    amount = Integer.parseInt(MountWoMan.get("MOUNT").toString());
					    pdM.put("WMOUNT", MountWoMan.get("MOUNT"));
					    break;
					}
					
				}
			amount += Integer.parseInt(MountMan.get("MOUNT").toString());
			pdM.put("NND", MountMan.get("NND"));
			pdM.put("MMOUNT", MountMan.get("MOUNT"));
			if(!pdM.containsKey("WMOUNT")) {
				pdM.put("WMOUNT", 0);
			}
			pdM.put("MOUNT", amount);
			list.add(pdM);
				
			}
			return list;
		}
		else {
			for(PageData MountWoMan : MountWoManList) {
				PageData pdM = new PageData();
				int amount = 0;
				for(PageData MountMan : MountManList) {
					if(MountMan.getString("NND").equals(MountMan.getString("NND"))) {
						pdM.put("MMOUNT", MountMan.getString("MOUNT"));
					    amount = Integer.parseInt(MountMan.getString("MOUNT"));
						break;
					}
					amount += Integer.parseInt(MountWoMan.getString("MOUNT"));
					pdM.put("NND", MountWoMan.getString("NND"));
					if(!pdM.containsKey("MMOUNT")) {
						pdM.put("MMOUNT", 0);
					}
					pdM.put("WMOUNT", MountWoMan.getString("MOUNT"));
					pdM.put("MOUNT", amount);
					list.add(pdM);
				}
				
			}
			return list;
		}
	}
	/**
	 * 医生的工作量统计
	 */
	@Override
	public List<PageData> viewDoctorWorkLoad(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("IndexQuesResultStatisticsMapper.viewDoctorWorkLoad", pd);//获得科室人员的工作量
	}
	/**
	 * 医生的工作量详情
	 */
	@Override
	public List<PageData> findByDoctor(Page page) throws Exception {
		return (List<PageData>) dao.findForList("IndexQuesResultStatisticsMapper.findByDoctor", page);//获得科室人员的工作量
	}
	/**
	 * 疾病诊断统计
	 */
	@Override
	public List<PageData> diseaseMount(Page page) throws Exception {
		return (List<PageData>) dao.findForList("IndexQuesResultStatisticsMapper.diseaseMount", page);//获得科室人员的工作量
	}
	/**
	 * 疾病确诊
	 */
	@Override
	public List<PageData> findByDisease(Page page) throws Exception {
		return (List<PageData>) dao.findForList("IndexQuesResultStatisticsMapper.findByDisease", page);//获得科室人员的工作量
	}

}
