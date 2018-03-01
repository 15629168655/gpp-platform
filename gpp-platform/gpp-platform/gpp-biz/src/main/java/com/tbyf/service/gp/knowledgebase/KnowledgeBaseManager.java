package com.tbyf.service.gp.knowledgebase;

import com.tbyf.plugin.*;
import com.tbyf.util.*;

import java.util.*;

/** 
 * 说明： 医学知识库
 * 创建人：zhangy
 * 创建时间：2016-09-18
 * @version
 */
public interface KnowledgeBaseManager{

	/**列表
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> queryPage(Page page)throws Exception;
	public void delete(PageData pg) throws Exception;
	public void saveObj(PageData pd)throws Exception;
	public PageData queryDataById(PageData pd) throws Exception;
	public void editObj(PageData pd) throws Exception;
}

