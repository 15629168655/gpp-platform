package com.tbyf.service.hm.zyjzjl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.entity.enums.EnumAppResult;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.zyjzjl.ZyjzjlManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.PageData;
import com.tbyf.util.UuidUtil;

/**
 * 住院就诊记录
 * @author lizk
 * 2016-10-24
 *
 */
@Service("zyjzjlService")
public class ZyjzjlService implements ZyjzjlManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("zyjzjlMapper.datalistPage", page);
	}
	
	/**
	 * 通过ID获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findByID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("zyjzjlMapper.findByID", pd);
	}
	
	/**
	 * 通过PERSONID获取数据
	 * @param pd
	 * @return
	 */
	@Override
	public PageData findByPERSONID(PageData pd) throws Exception {
		return (PageData) dao.findForObject("zyjzjlMapper.findByPERSONID", pd);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("zyjzjlMapper.save", pd);
	}
	
	
	/**通过医疗机构代码获取数据
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> findByYLJGDM(PageData pd) throws Exception
	{
		return (List<PageData>)dao.findForList("zyjzjlMapper.findByYLJGDM",pd);
	}
	
	@Override
	public String saveListBatch(List<PageData> list)throws Exception{
		String result = EnumAppResult.REQUEST_FAILED.getCode();
		if(list!=null){
			for(PageData pd:list){//循环检查参数
				if(!AppUtil.checkParam("saveZYJZJL", pd)){	//检查参数 
					result = EnumAppResult.PARAM_ABSENT.getCode();
					break;
				}else{
					pd.put("ID", UuidUtil.get32UUID());
				}
			}
			if(!result.equals(EnumAppResult.PARAM_ABSENT.getCode())){//参数检查通过
				dao.batchCommit("zyjzjlMapper.batchSave", Const.COMMIT_COUNT_EVERYTIME, list);//批量提交插入处理
				result = EnumAppResult.REQUEST_SUCCEED.getCode();
			}
		}
		return result;
	}
}