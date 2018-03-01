package com.tbyf.util.jpush.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsUrl;
import com.tbyf.entity.enums.EnumMessageType;
import com.tbyf.util.Const;
import com.tbyf.util.PageData;
import com.tbyf.util.jpush.entity.MemberMessage;

import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.Notification;
import cn.jpush.api.schedule.ScheduleResult;
import net.sf.json.JSONObject;

/**
 * 极光推送
 * @author zanxc
 * @创建日期2017年8月11日下午3:24:19
 */
public class JPushService extends BaseController{


	
    public static final int MAX = Integer.MAX_VALUE;
	public static final int MIN = (int) MAX / 2;
	@Value("${appKey}")
	String appKey;
	@Value("${masterSecret}")
	String masterSecret;
	@Value("${maxRetryTime}")
	Integer maxRetryTime;

	private static JPushClient jpush = null;
	//初始化
	private  void init(long timeLive){
		if(timeLive != 0) {//定时推送
			jpush = new JPushClient(Const.masterSecret, Const.appKey, false, timeLive);//测试环境
		}
		else{//及时推送
			jpush = new JPushClient(Const.masterSecret, Const.appKey,Const.maxRetryTime);
		}
	}
    /**
     * 向所有设备推送消息
     * 
     * @param memberMessage
     * @return
     */
    public static boolean jPushAllMessage(MemberMessage memberMessage) throws Exception{
        String title = "";
        if (memberMessage.getTitle() != "") {
            title = memberMessage.getTitle();
        }
        String content = memberMessage.getContent();
        String[] registrationIDStr = memberMessage.getDeviceIdStr();
        Map<String, String> extras  = new HashMap<String, String>();
        JSONObject jsonObj = new JSONObject();
        extras.put("IS_URL", Integer.toString(memberMessage.getIsUrl()));//是否有链接
        Integer messageType = memberMessage.getType();//消息的类型（链接的类型）
        extras.put("URL_TYPE", Integer.toString(messageType));//链接的类型
        if(memberMessage.getIsUrl() == EnumIsUrl.NO.getCode()) {//有链接
        	if(messageType == EnumMessageType.NOTIFICTION.getCode()) {//如果是通知公告
        		extras.put("ID", memberMessage.getnID());//参数通知公告ID
        	}
        	else if(messageType == EnumMessageType.STOP.getCode()) {//如果是站内信
        		PageData Pdf = memberMessage.getFHSMS_IDStr();
        		jsonObj.putAll(Pdf);
        		extras.put("fsid", jsonObj.toString());
        	}
        	else if(messageType == EnumMessageType.CONSULT.getCode()) {//咨询消息ID
        		extras.put("CONSULTATION_ID", memberMessage.getCONSULTATION_ID());
        	}
        	else if(messageType == EnumMessageType.JOB.getCode()) {//任务ID
        		extras.put("ID", memberMessage.getjID());//任务ID
        	}
        }
        long timeout = memberMessage.getTime();
        new JPushService().init(timeout);
        //给多个用户发推送
        PushResult pushResult = jpush.sendAndroidNotificationWithRegistrationID(title, content, extras, registrationIDStr);
        if(pushResult.isResultOK()) {
        	System.out.println("消息号:" + pushResult.msg_id+"推送成功");
        	return true;
        }
        else {
        	System.out.println("消息号:" + pushResult.msg_id+"推送失败");
        	return false;
        }
    }
    /**
     * 向单个用户推发消息
     */
    public static boolean jPushOneMessage(MemberMessage memberMessage) throws Exception{
        String content = memberMessage.getContent();
        // 设置环境：true生产环境，false开发环境
        String title = "";
       
        String registrationID = memberMessage.getDeviceId();
        if (memberMessage.getTitle() != null) {
            title = memberMessage.getTitle();
        }
        Map<String, String> extras  = new HashMap<String, String>();
        extras.put("IS_URL", Integer.toString(memberMessage.getIsUrl()));//是否有链接
        Integer messageType = memberMessage.getType();//消息的类型（链接的类型）
        extras.put("URL_TYPE", Integer.toString(messageType));//链接的类型
        if(memberMessage.getIsUrl() == EnumIsUrl.NO.getCode()) {//有链接
        	if(messageType == EnumMessageType.NOTIFICTION.getCode()) {//如果是通知公告
        		extras.put("ID", memberMessage.getnID());//参数通知公告ID
        	}
        	else if(messageType == EnumMessageType.STOP.getCode()) {//如果是站内信
        		extras.put("FHSMS_ID", memberMessage.getFHSMS_ID());
        	}
        	else if(messageType == EnumMessageType.CONSULT.getCode()) {//咨询消息ID
        		extras.put("CONSULTATION_ID", memberMessage.getCONSULTATION_ID());
        	}
        	else if(messageType == EnumMessageType.JOB.getCode()) {//任务ID
        		extras.put("ID", memberMessage.getjID());//任务ID
        	}
        }
        long timeout = memberMessage.getTime();
        new JPushService().init(timeout);
        PushResult pushResult = jpush.sendAndroidNotificationWithRegistrationID(title, content, extras, registrationID);
        if(pushResult.isResultOK()) {
        	System.out.println("消息号:" + pushResult.msg_id+"推送成功");
        	return true;
        }
        else {
        	System.out.println("消息号:" + pushResult.msg_id+"推送失败");
        	return false;
        }
        
        
    }
    /**
     * 给用户生成推送计划
     * @param time
     * @param memberMessage
     */
    public static void createOnePushPlan(MemberMessage memberMessage) {
    	String content = memberMessage.getContent();
        // 设置环境：true生产环境，false开发环境
        String title = "";
        String registrationID = null;
        if (memberMessage.getTitle() != null) {
            title = memberMessage.getTitle();
        }
        Map<String, String> extras  = new HashMap<String, String>();
        extras.put("IS_URL", Integer.toString(memberMessage.getIsUrl()));//是否有链接
        Integer messageType = memberMessage.getType();//消息的类型（链接的类型）
        extras.put("URL_TYPE", Integer.toString(messageType));//链接的类型
        if(memberMessage.getIsUrl() == EnumIsUrl.NO.getCode()) {//有链接
        	if(messageType == EnumMessageType.NOTIFICTION.getCode()) {//如果是通知公告
        		extras.put("ID", memberMessage.getnID());//参数通知公告ID
        	}
        	else if(messageType == EnumMessageType.STOP.getCode()) {//如果是站内信
        		extras.put("FHSMS_ID", memberMessage.getFHSMS_ID());
        	}
        	else if(messageType == EnumMessageType.CONSULT.getCode()) {//咨询消息ID
        		extras.put("CONSULTATION_ID", memberMessage.getCONSULTATION_ID());
        	}
        	else if(messageType == EnumMessageType.JOB.getCode()) {//任务ID
        		extras.put("ID", memberMessage.getjID());//任务ID
        	}
        }
        new JPushService().init(0);
        if(memberMessage.deviceId != null) {
        	 registrationID = memberMessage.getDeviceId();//推送ID唯一的用户
        	 String name = "任务提醒";
         	 String time = memberMessage.getPushTime();
         	 PushPayload push = PushPayload.newBuilder()
                     .setPlatform(Platform.android())
                     .setAudience(Audience.registrationId(registrationID))
                     .setNotification(Notification.android(content, title, extras))
                     .build();
         	try {
         		ScheduleResult result = jpush.createSingleSchedule(name, time, push);//定时推送
               System.out.println("schedule result is " + result);
            } catch (APIConnectionException e) {
            	System.out.println("Connection error. Should retry later. " + e);
            } catch (APIRequestException e) {
            	System.out.println("Error response from JPush server. Should review and fix it. " + e);
            	System.out.println("HTTP Status: " + e.getStatus());
            	System.out.println("Error Code: " + e.getErrorCode());
            	System.out.println("Error Message: " + e.getErrorMessage());
            }
        }
        else {//多个用户
        	String[] registrations = memberMessage.getDeviceIdStr();
        	String name = "任务提醒";
        	String time = memberMessage.getPushTime();
        	PushPayload push = PushPayload.newBuilder()
                    .setPlatform(Platform.android())
                    .setAudience(Audience.registrationId(registrations))
                    .setNotification(Notification.android(content, title, extras))
                    .build();
        	try {
         		ScheduleResult result = jpush.createSingleSchedule(name, time, push);//定时推送
               System.out.println("schedule result is " + result);
            } catch (APIConnectionException e) {
            	System.out.println("Connection error. Should retry later. " + e);
            } catch (APIRequestException e) {
            	System.out.println("Error response from JPush server. Should review and fix it. " + e);
            	System.out.println("HTTP Status: " + e.getStatus());
            	System.out.println("Error Code: " + e.getErrorCode());
            	System.out.println("Error Message: " + e.getErrorMessage());
            }
        }
    	
    }
   public static void main(String[] args) throws Exception {
	   String[] res = {"13065ffa4e3df8a6bf6"};
	   MemberMessage memberMessage = new MemberMessage();
	   memberMessage.setTitle("推送测试");
	   memberMessage.setContent("qhfjanhfjds");
	   memberMessage.setDeviceIdStr(res);
	   memberMessage.setIsUrl(1);
	   memberMessage.setType(1);
	   memberMessage.setTime(20000);
	   memberMessage.setPushTime("2017-08-29 08:");
	   createOnePushPlan(memberMessage);
	   
}        
}
