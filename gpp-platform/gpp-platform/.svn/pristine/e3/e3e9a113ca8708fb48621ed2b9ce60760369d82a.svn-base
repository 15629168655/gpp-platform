package com.tbyf.util.jpush.service;

import com.tbyf.util.jpush.entity.MemberMessage;

/**
 * 消息推送接口
 * @author zanxc
 * @创建日期2017年8月11日下午3:14:46
 */
public interface PushMessageService {

	/**
	 * 发送广播消息
	 * @param memberMessage
	 * @throws Exception
	 */
	public boolean sentBroadMessage(MemberMessage memberMessage)throws Exception;
	/**
	 * 发送站内信
	 * @param memberMessage
	 * @return
	 * @throws Exception
	 */
	public boolean sentStopMessage(MemberMessage memberMessage)throws Exception;
	/**
	 * 咨询类的消息提醒
	 * @param memberMessage
	 * @return
	 * @throws Exception
	 */
	public boolean sentConsultMessage(MemberMessage memberMessage)throws Exception;;
	/**
	 * 任务消息提醒
	 * @param memberMessage
	 * @return
	 * @throws Exception
	 */
	public boolean sentJobMessage(MemberMessage memberMessage)throws Exception;
}
