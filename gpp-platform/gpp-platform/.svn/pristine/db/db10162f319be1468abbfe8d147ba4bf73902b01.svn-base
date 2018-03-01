package com.tbyf.service.gp.mobilecode;

import com.tbyf.util.PageData;

/**
 * 短信验证码
 * @author wml
 *
 */
public interface MobileCodeManager {
	
	
	
	 /**根据300秒内有效的验证码条件查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findMobileCodeBy300Time(PageData pd) throws Exception;
	 /**根据60秒内发送的验证码条件查找
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findMobileCodeBy60Time(PageData pd) throws Exception;
	
	/**
	 * 保存
	 * @param pd
	 * @throws Exception
	 */
	public void  save(PageData pd) throws Exception;

}
