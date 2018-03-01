package com.tbyf.controller.app.appfeedback;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumTreated;
import com.tbyf.service.information.feedback.FeedbackManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.DateUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;

/**
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  	用户名或密码错误
 * 05  	FKEY验证失败
 */

@Controller
@RequestMapping(value="/appFeedbcak")
public class IntFeedbackController extends BaseController{
	
	@Resource(name="feedbackService")
	private FeedbackManager feedbackService;
			
	 /**
     * app信息管理意见反馈
     * @param ID 主键,
     * @param TJR 提交人、
     * @param TJSJ 提交时间
     * @param remark 内容
     * @param lxfs 联系方式
     * @return
     */
//    @RequestMapping(value="/saveFeedbackApp", method = RequestMethod.POST)
    @RequestMapping(value="/saveFeedbackApp")
    @ResponseBody
    public Object saveFeedbackApp()
    {
        logBefore(logger, "app通过传入意见反馈信息（ID、提交人、提交时间、内容、联系方式）生成意见反馈信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        String result = "00";
        String message = "";
        try{
        	pd = this.getPageData();
	        if(Tools.checkKey("STATE", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("saveFeedbackApp", pd)){	//检查参数
	        	   pd.put("ID", this.get32UUID());
	        	   pd.put("TJSJ", DateUtil.getTime());
	        	   pd.put("STATE", EnumTreated.UNTREATED.getCode().toString());//状态为未处理
	        	   feedbackService.Appsave(pd);
	               result = "01";
	               message=ResultMessageUtil.MESSAGE_1;
	           }else {
	               result = "03";
	               message=ResultMessageUtil.MESSAGE_3;
	           }
	        }else{
				result = "05";
				message=ResultMessageUtil.MESSAGE_5;
	        }
        }catch (Exception e){
            logger.error(e.toString(), e);
            message=ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            map.put("message",message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
	  * APP居民查询意见反馈接口
	  * @return
	  */
	 @RequestMapping(value="/viewFeedback" , method = RequestMethod.GET)
	@ResponseBody
	public Object viewFeedback(){
		logBefore(logger, "居民查询意见反馈接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message ="";
		try{
			if(Tools.checkKey("TJRID", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("myFeedback", pd)){	//检查参数
					List<PageData> list = feedbackService.findByTjrId(pd);
					map.put("pd", list);
					result= "01";
					message = ResultMessageUtil.MESSAGE_1;
				}else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			}else{
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		}catch (Exception e){
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
}
