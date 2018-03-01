package com.tbyf.controller.app.appjkgl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.hm.pressure.PressureManager;
import com.tbyf.service.hm.shape.ShapeManager;
import com.tbyf.service.hm.sugar.SugarManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;
/**
 * APP健康管理
 * 
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04   用户名或密码错误
 * 05   FKEY验证失败
*/
@Controller
@RequestMapping(value="/appjkgl")
public class AppjkglController extends BaseController {

	@Resource(name="shapeService")
	private ShapeManager shapeService;
	
	@Resource(name="pressureService")
	private PressureManager pressureService;
	
	@Resource(name="sugarService")
	private SugarManager sugarService;
	
	@Resource(name="jmxxService")
	private JmxxManager jmxxService;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	/**
	 * 健康管理初始化接口
	 * @return
	 */
	@RequestMapping(value="/initJkgl",method=RequestMethod.POST)
	@ResponseBody
	public Object initJkgl()
	{
		logBefore(logger, "app健康管理初始化接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message ="";
		try{	
			if(Tools.checkKey("JKGL", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("initJkgl", pd)){	//检查参数
					jmxxService.editForApp(pd);
					pd.put("ID", this.get32UUID());
					double HEIGHT = Double.parseDouble(pd.getString("HEIGHT"))/100 ;
					double WEIGHT = Double.parseDouble(pd.getString("WEIGHT")) ;
					int BMI = (int)(WEIGHT/(HEIGHT*HEIGHT));
					pd.put("BMI", BMI);
					pd.put("TEST_TIME", sdf.format(new Date()));
					pd.put("CREAT_TIME", sdf.format(new Date()));
					shapeService.save(pd);
					result = "01";
					message = ResultMessageUtil.MESSAGE_1;
				}else{
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}    
			}else{
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}	
		}catch (Exception e){
			logger.error(e.toString(), e);
			message = ResultMessageUtil.MESSAGE_0;
		}finally{
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
 	/**
 	 * 根据用户ID查询最近一次记录（体型、血压、血糖）
 	 * @return
 	 */
 	@RequestMapping(value="/queryLastInfo",method=RequestMethod.GET)
    @ResponseBody
    public Object queryLastInfo()
    {
        logBefore(logger, "app健康管理查询最新记录（体型、血压、血糖）接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message ="";
        try{	
        	if(Tools.checkKey("JKGL", pd.getString("FKEY"))){	//检验请求key值是否合法
        		if(Tools.notEmpty(pd.getString("USER_AGENT_ID"))){	//检查参数
	        		PageData shapePd = shapeService.findLastByUserID(pd);  //体型记录
	        		PageData pressurePd = pressureService.findLastByUserID(pd);  //血压记录
	        		PageData sugarPd = sugarService.findLastByUserID(pd);  //血糖记录
	        		pd.remove("FKEY");
		            pd.put("shapePd",shapePd);
		            pd.put("pressurePd",pressurePd);
		            pd.put("sugarPd",sugarPd);
		            map.put("pd", pd);
		            result = "01";
		            message = ResultMessageUtil.MESSAGE_1;
	        	}else{
	        		result = "03";
	        		message = ResultMessageUtil.MESSAGE_3;
	        	}    
        	}else{
				result = "05";
        		message = ResultMessageUtil.MESSAGE_5;
			}	
        }catch (Exception e){
            logger.error(e.toString(), e);
    		message = ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }

}
	
 