package com.tbyf.controller.app.task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsUrl;
import com.tbyf.entity.enums.EnumIsWorkMsg;
import com.tbyf.entity.enums.EnumMessageType;
import com.tbyf.service.gp.provider.impl.ProviderService;
import com.tbyf.service.gp.task.TaskManager;
import com.tbyf.service.hm.devicepush.DevicePushManager;
import com.tbyf.service.system.appuser.AppuserManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;
import com.tbyf.util.jpush.entity.MemberMessage;
import com.tbyf.util.jpush.service.PushMessageService;

/** 
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  用户名或密码错误
 * 05  FKEY验证失败
 * 06  系统任务不允许修改
*/
@Controller
@RequestMapping(value="/apptask")
public class IntTaskConteoller extends BaseController{
	
	@Resource(name="taskService")
	private TaskManager taskService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;

	@Resource(name="providerService")
	private ProviderService providerService;
	@Resource(name="devicePushService")
	private DevicePushManager devicePushService;//推送关联Service
	@Resource(name="pushMessageService")
	private PushMessageService pushMessageService;//推送关联Service
	/**
     * app任务列表查询 
     * @param pageSize 页码 ，pageCount 当前页数，JOB_NAME 任务名称 ，GMT_JOB 任务时间，JOB_TYPE 任务类型，JOB_SOURCE  任务来源, STATUS  任务状态  ,DOCTOR_ID  执行医生ID ,ORG_CODE 机构编码
     * @return
     */
	
	@RequestMapping(value="/queryPage",method = RequestMethod.GET)
    @ResponseBody
    public Object queryPage()
    {
        logBefore(logger, "app通过过滤条件（任务名称、任务时间、任务类型、任务来源、任务状态、执行医生ID、机构编码）对全科医生任务表（GPP_CRON_JOB）分页查询接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "0";
        String message ="";
        try{  
        	//如果不传分页参数，给默认值。
    		int pageSize=1;//页码
    		int pageCount=10;//页数
    		if(Tools.checkKey("JOB_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	    		if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	           		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	           		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	           	}else{
	           		pd.put("pageStart", (pageSize-1)* pageCount+1);
	           		pd.put("pageEnd", pageSize * pageCount);
	            }
    		}else{
    			result = "05";
    			 message= ResultMessageUtil.MESSAGE_5;
    		}
    		List<PageData> list=taskService.queryPage(pd);
    		map.put("pd", list);
            result = "01";
            message= ResultMessageUtil.MESSAGE_1;
        }catch (Exception e){
            logger.error(e.toString(), e);
            message= ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
	
	 /**
     * app任务列表新增
     * @param JOB_NAME 任务名称、
     * @param JOB_CONTENT 任务内容、
     * @param JOB_TYPE 任务类型、
     * @param JOB_SOURCE 任务类型：0:签约；1：诊疗；2：随访、
     * @param GMT_JOB 任务时间、
     * @param GMT_REMIND 提醒时间、
     * @param MEMBER_ID 服务对象ID、
     * @param MEMBER_NAME 服务对象姓名、
     * @param DOCTOR_NAME  执行医生姓名、
     * @param DOCTOR_ID 执行医生ID、
     * @param DOCTOR_CODE  执行医生CODE、
     * @param ORG_CODE   机构编码、
     * @param REGION_CODE   区划编码、
     * @param OPERATOR_ID   操作人ID、
     * @param OPERATOR_NAME   操作人姓名、
     * @param STATUS 任务状态、
     * @return
     */
	
    @RequestMapping(value="/addTask",method = RequestMethod.POST)
    @ResponseBody
    public Object addTask(){
        logBefore(logger, "app通过任务信息（任务名称、任务内容、任务类型、任务时间、提醒时间、服务对象ID、服务对象姓名）生成任务");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "0";
        String message ="";
        try{
         if(Tools.checkKey("JOB_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
           if(AppUtil.checkParam("addTask", pd)){	//检查参数
        	   pd.put("ID", this.get32UUID());	//ID
        	   //查询医生信息
        	   PageData providerData = new PageData();
        	   providerData.put("id", pd.get("DOCTOR_ID"));
        	   providerData = providerService.getProvierTeamById(providerData);
        	   if(providerData!=null){
        		   pd.put("REGION_CODE", providerData.get("REGIONCODE"));
        	   }
        	   taskService.save(pd);
        	   String jobName = pd.get("JOB_NAME").toString();
        	   String id = pd.get("ID").toString();
        	   pd.put("PROVIDER_ID", pd.get("DOCTOR_ID"));
        	   pd = appuserService.findByProviderId(pd);
        	   pd.put("USERID", pd.get("USER_ID"));
        	   pd.put("ISWORKMSG", EnumIsWorkMsg.YES.getCode());
        	   PageData pdDevicePush = devicePushService.findByUserID(pd);//获得用户设备的推送ID
	       		if(null != pdDevicePush) {
	       			MemberMessage memberMessage = new MemberMessage();
	       			memberMessage.setIsUrl(EnumIsUrl.NO.getCode());//不带链接的
	       			memberMessage.setType(EnumMessageType.JOB.getCode());//是job类型的链接
	       			memberMessage.setDeviceId(pdDevicePush.get("DEVUSERID").toString());//设备的推送ID
	       			memberMessage.setContent(jobName);//推送的内容
	       			memberMessage.setjID(id);
	       			memberMessage.setTitle("任务提醒");
	       			pushMessageService.sentJobMessage(memberMessage);
	       		}
               result = "01";
               message= ResultMessageUtil.MESSAGE_1;

           }else {
              result = "03";
              message= ResultMessageUtil.MESSAGE_3;
           }
        }else{
			result = "05";
            message= ResultMessageUtil.MESSAGE_5;
		}
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app任务列表修改
     * @param ID 主键、
     * @param JOB_NAME 任务名称、
     * @param JOB_CONTENT 任务内容、
     * @param JOB_TYPE 任务类型、
     * @param JOB_SOURCE 任务来源、
     * @param GMT_JOB 任务时间、
     * @param GMT_REMIND 提醒时间、
     * @param MEMBER_ID 服务对象ID、
     * @param MEMBER_NAME 服务对象姓名、
     * @param OPERATOR_ID   操作人ID、
     * @param OPERATOR_NAME   操作人姓名
     * @return
     */
	
    @RequestMapping(value="/editTask",method = RequestMethod.POST)
    @ResponseBody
    public Object editTask(){
        logBefore(logger, "app查询出任务信息（主键、任务名称、任务内容、任务类型、任务来源、任务时间、提醒时间、生成时间、服务对象ID、服务对象姓名、任务状态）校验任务来源 修改任务");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "0";
        String message ="";
        try{
        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(Integer.parseInt(pd.get("JOB_SOURCE").toString())==1){
	        	   result = "06";
	          }else if(
	                AppUtil.checkParam("editTask", pd)){	//检查参数
	        	   taskService.edit(pd);
	               result = "01"; 
	               message= ResultMessageUtil.MESSAGE_1;
	           }else {
	              result = "03";
	              message= ResultMessageUtil.MESSAGE_3;
	           }
       		}else{
    			result = "05";
	            message= ResultMessageUtil.MESSAGE_5;
    		}
        }catch (Exception e){
            logger.error(e.toString(), e);
            message= ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app任务处理
     * @param ID 主键、
     * @param OPERATOR_ID   操作人ID、
     * @param OPERATOR_NAME   操作人姓名、
     * @param STATUS 任务状态
     * @return
     */
    
    @RequestMapping(value="/processTask",method = RequestMethod.POST)
    @ResponseBody
    public Object processTask(){
        logBefore(logger, "app查询出任务信息（主键、任务状态）改变任务状态   未处理和已处理的转换");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        String result = "0";
        String message ="";
        try{
        	pd = this.getPageData();
        	System.out.print(pd);
        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
        		 
        		 if(AppUtil.checkParam("dealTask", pd)){	//检查参数
	        	    //获取操作人名称
	         	   PageData  operatorData = new PageData();
	         	   operatorData.put("id", pd.get("OPERATOR_ID"));
	         	   operatorData = providerService.getProviderById(operatorData);
	         	   if(operatorData!=null){
	         		   pd.put("OPERATOR_NAME", operatorData.get("PROVIDER_NAME"));
	         	   }
	           	   pd.put("STATUS", 1);
	        	   taskService.process(pd);
	               result = "01";
	               message= ResultMessageUtil.MESSAGE_1;
	           }else {
	              result = "03";
	         	  message= ResultMessageUtil.MESSAGE_3;
	           }
        	}else{
    			result = "05";
    			message= ResultMessageUtil.MESSAGE_5;
    		}
        }catch (Exception e){
            logger.error(e.toString(), e);
            message= ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app任务删除
     * @param ID 主键、
     * @param OPERATOR_ID   操作人ID、
     * @param OPERATOR_NAME   操作人姓名、
     * @param STATUS 任务状态
     * @return
     */
    @RequestMapping(value="/delTask",method = RequestMethod.POST)
    @ResponseBody
    public Object delTask(){
        logBefore(logger, "app查询出任务信息（主键、任务状态）将任务状态字段改为9");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "0";
        String message ="";
        try{
         if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	          if(AppUtil.checkParam("dealTask", pd)){	//检查参数
	        		 //获取操作人名称
	           	   PageData  operatorData = new PageData();
	           	   operatorData.put("id", pd.get("OPERATOR_ID"));
	           	   operatorData = providerService.getProviderById(operatorData);
	           	   if(operatorData!=null){
	           		   pd.put("OPERATOR_NAME", operatorData.get("PROVIDER_NAME"));
	           	   }
	           	   pd.put("STATUS", 9);
	        	   taskService.delete(pd);
	              result = "01";
	              message= ResultMessageUtil.MESSAGE_1;
	           }else {
	              result = "03";
	              message= ResultMessageUtil.MESSAGE_3;
	           }
         	}else{
    			result = "05";
	            message= ResultMessageUtil.MESSAGE_5;
    		}
        }catch (Exception e){
            logger.error(e.toString(), e);
            message= ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }

	 

}
