package com.tbyf.controller.app.appBloodSugar;

import com.tbyf.controller.base.*;
import com.tbyf.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.tbyf.service.gp.bloodsugar.impl.BloodSugarService;

import javax.annotation.*;

import java.util.*;

/**
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  用户名或密码错误
 * 05  FKEY验证失败
*/
@Controller
@RequestMapping(value="/intBloodSugar")
public class AppIntBloodSugarController extends BaseController {
    
	@Resource(name="bloodSugarService")
	private BloodSugarService bloodSugarService;
	
	
	 @RequestMapping(value="/queryPage",method=RequestMethod.GET)
	    @ResponseBody
	    public Object queryPage()
	    {
	        logBefore(logger, "app通过过滤条件对门诊测血糖的分页查询接口");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("PERSONNAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	        		
		        		//如果不传分页参数，给默认值。
		        		int pageSize=1;//页码
		        		int pageCount=10;//页数
		        	 	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
		               		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
		               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
		               	}else{
		               		pd.put("pageStart", (pageSize-1)* pageCount+1);
		               		pd.put("pageEnd", pageSize * pageCount);
		               	}
		        		List<PageData> list=bloodSugarService.queryPage(pd);
		        		map.put("pd", list);
		                result = "01";
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

	 	@RequestMapping(value="/saveObj",method=RequestMethod.POST)
	    @ResponseBody
	    public Object saveObj()
	    {
	        logBefore(logger, "app新增门诊测血糖的记录接口");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
		        	if(AppUtil.checkParam("saveBloodSugar", pd)){	//检查参数
			        	pd.put("ID", this.get32UUID());
			        	bloodSugarService.saveObj(pd);
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
	 	@RequestMapping(value="/deleteObj" ,method=RequestMethod.GET)
	    @ResponseBody
	    public Object deleteObj()
	    {
	        logBefore(logger, "app删除门诊测血糖的记录接口");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
		        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
			        	bloodSugarService.delete(pd);
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
	 	@RequestMapping(value="/editObj",method=RequestMethod.POST)
	    @ResponseBody
	    public Object editObj()
	    {
	        logBefore(logger, "app修改门诊测血糖的记录接口");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
		        	if(AppUtil.checkParam("editBloodSugar", pd)){//检验参数
			        	bloodSugarService.editObj(pd);
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
	
 