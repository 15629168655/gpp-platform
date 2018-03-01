package com.tbyf.service.gp.mzsfmx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tbyf.dao.DaoSupport;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.mzjzjl.MzjzjlManager;
import com.tbyf.service.gp.mzsfmx.MzsfmxManager;
import com.tbyf.util.PageData;


@Service("mzsfmxService")
public class MzsfmxService implements MzsfmxManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public void save(PageData pd)throws Exception{
		dao.save("MzsfmxMapper.save", pd);
	}
}
