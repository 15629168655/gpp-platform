package com.tbyf.controller.app.appmobilecode;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.gp.mobilecode.impl.MobileCodeService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.MobileAuthCodeUtils;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.SmsUtil;
import com.tbyf.util.Tools;

/**
 * 手机验证码
 *  
 *
 */
@Controller
@RequestMapping(value="/appmobilecode")
public class AppmobilecodeController extends BaseController {
	
	@Resource(name="mobileCodeService")
	private MobileCodeService mobileCodeService;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping(value = "/getMobileCode", method = RequestMethod.GET)
	@ResponseBody
	public Object getMobileCode()
	{
        logBefore(logger, "app发送验证码");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        String mobileCode="";
        try{	
        	if(Tools.checkKey("TELEPHONE", pd.getString("FKEY"))){	//检验请求key值是否合法
        		if(AppUtil.checkParam("getMobileCode", pd)){	//检查参数
        			pd.put("SYSTIME", sdf.format(new Date()));
        			//查询60秒内是否有发送该号码的验证码，判断是否频繁发送
        			PageData obj =mobileCodeService.findMobileCodeBy60Time(pd);
        			if(obj!=null){
        				result = "04";
        				message="发送验证码过于频繁";
        			}else{
        				pd.put("ID", UUID.randomUUID().toString());
        				pd.put("SEND_TIME", sdf.format(new Date()));
        			    mobileCode = MobileAuthCodeUtils.getInstance().generateFourCode();
        				pd.put("CODE", mobileCode);
        				SmsUtil.sendSms2(pd.getString("TELEPHONE"), "您的验证码是："+mobileCode.trim()+"。请不要把验证码泄露给其他人。");
        				mobileCodeService.save(pd);
        				result = "01";
            			message=ResultMessageUtil.MESSAGE_1;
        			}
        		}else{
        			result = "03";
        			message=ResultMessageUtil.MESSAGE_3;
        		}
        		
        	}else{
        		result = "05";
        		message=ResultMessageUtil.MESSAGE_5;
        	}
        }catch (Exception e){
			message=ResultMessageUtil.MESSAGE_0;
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", message);
            map.put("mobileCode", mobileCode);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
	}
}
