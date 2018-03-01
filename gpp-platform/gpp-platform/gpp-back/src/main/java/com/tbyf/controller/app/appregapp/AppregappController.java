package com.tbyf.controller.app.appregapp;

import com.tbyf.controller.base.*;
import com.tbyf.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.tbyf.service.gp.mzregapp.MzregappManager;

import javax.annotation.*;

import java.util.*;

/**
 * APP 预约挂号
 * 
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  用户名或密码错误
 * 05  FKEY验证失败
*/
@Controller
@RequestMapping(value="/appregapp")
public class AppregappController extends BaseController {
    
	@Resource(name="mzregappService")
	private MzregappManager mzregappService;
	
	

	 	@RequestMapping(value="/saveObj")
	    @ResponseBody
	    public Object saveObj()
	    {
	        logBefore(logger, "app预约挂号的记录接口");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("PERSON_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
		        	if(AppUtil.checkParam("saveregapp", pd)){	//检查参数
			        	pd.put("ID", this.get32UUID());
			        	pd.put("APPLYTYPE", "0");
			        	pd.put("STATUS", "0");
			        	mzregappService.save(pd);
			            result = "01";
		        	}else{
		        		result = "03";
		        	}  
	        	}else{
					result = "05";
				} 	
	        }catch (Exception e){
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	    }
	 	@RequestMapping(value="/cancel" ,method=RequestMethod.GET)
	    @ResponseBody
	    public Object cancel()
	    {
	        logBefore(logger, "app取消预约挂号接口");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
		        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
		        		pd.put("APPLYTYPE", "1");
		        		mzregappService.cancel(pd);
			            result = "01";
		        	}else{
		        		result = "03";
		        	}    
	        	}else{
					result = "05";
				}	
	        }catch (Exception e){
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	    }
	 	@RequestMapping(value="/queryData")
	    @ResponseBody
	    public Object queryData()
	    {
	        logBefore(logger, "app预约信息查询接口");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        		if(AppUtil.checkParam("queryregapp", pd)){	//检查参数
	               		pd.put("PAGESTART", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	               		pd.put("PAGEEND", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));

		        		List<PageData> list = mzregappService.queryData(pd);
		        		if(null != list){
		        			map.put("pd",list);
		        		}else{
		        			result = "02";
		        		}
			            result = "01";
		        	}else{
		        		result = "03";
		        	}
	        	}else{
					result = "05";
				}	
	        }catch (Exception e){
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	    }
}
	
 