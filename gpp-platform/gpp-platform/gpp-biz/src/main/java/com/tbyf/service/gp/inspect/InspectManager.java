package com.tbyf.service.gp.inspect;

import com.tbyf.plugin.*;
import com.tbyf.util.*;

import java.util.*;

/** 
 * 说明： 检验
 * 创建人：zhangy
 * 创建时间：2016-10-09
 * @version
 */
public interface InspectManager{

	public List<PageData> queryPage(Page page)throws Exception;
	public void delete(PageData pg) throws Exception;
	public void saveObj(PageData pd)throws Exception;
	public PageData queryDataById(PageData pd) throws Exception;
	public void editObj(PageData pd) throws Exception;
	void editSta(PageData pd) throws Exception;
	List<PageData> queryMZJZlistPage(Page page) throws Exception;
	PageData queryMZJZByID(PageData pd) throws Exception;
}

