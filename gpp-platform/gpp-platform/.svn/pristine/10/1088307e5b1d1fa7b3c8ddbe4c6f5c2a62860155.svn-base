package com.tbyf.controller.app.apphealthinformation;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.entity.enums.EnumTaskStatus;
import com.tbyf.service.information.healthinformation.HealthInformationTypeManager;
import com.tbyf.util.AppUtil;
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
/**
 * APP健康资讯类型接口
 * @author ad
 *
 */
@Controller
@RequestMapping(value="/appHealthInformationType")
public class IntHealthInformationTypeController extends BaseController {
	
	@Resource(name="healthTypeService")
	private HealthInformationTypeManager healthTypeService;
	
	@RequestMapping(value="/getHealthType", method = RequestMethod.GET)
	@ResponseBody
	public Object getHealthType(){
		logBefore(logger, "APP查询健康资讯类型接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message ="";
        try{	
        	if(Tools.checkKey("STATE", pd.getString("FKEY"))){	//检验请求key值是否合法
        	    int pageSize=1;//页码
       			int pageCount=10;//页数
              	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
              		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
              		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
              	}else{
              		pd.put("pageStart", (pageSize-1)* pageCount+1);
              		pd.put("pageEnd", pageSize * pageCount);
              	}
              	pd.put("STATUS", EnumStatus.ENABLE.getCode());//查询时STATUS=1正常状态
    		    List<PageData> list=healthTypeService.queryPage(pd);
    			map.put("pd", list);
    			result = "01";
    			message=ResultMessageUtil.MESSAGE_1;
               
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
	
	
	@RequestMapping(value="/delHealthType", method = RequestMethod.POST)
	@ResponseBody
	public Object delateHealthType(){
		logBefore(logger, "APP删除健康资讯类型接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message ="";
		try{	
			if(Tools.checkKey("STATE", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("delHealthType", pd)){	//检查参数
					healthTypeService.deleteByGUID(pd);
					result = "01";
					message=ResultMessageUtil.MESSAGE_1;
				}else{
					message =ResultMessageUtil.MESSAGE_3;
		              result = "03";
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
	
	
	@RequestMapping(value="/updateHealthType", method = RequestMethod.POST)
	@ResponseBody
	public Object updateHealthType(){
		logBefore(logger, "APP修改健康资讯类型接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message ="";
		try{	
			if(Tools.checkKey("STATE", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("editHealthType", pd)){	//检查参数
					healthTypeService.edit(pd);
					result = "01";
					message=ResultMessageUtil.MESSAGE_1;
				}else{
					message =ResultMessageUtil.MESSAGE_3;
					result = "03";
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
	
	
	@RequestMapping(value="/addHealthType", method = RequestMethod.POST)
	@ResponseBody
	public Object addHealthType(){
		logBefore(logger, "APP添加健康资讯类型接口");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message ="";
		try{	
			if(Tools.checkKey("STATE", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("addHealthType", pd)){	//检查参数
					pd.put("GUID", this.get32UUID());
					pd.put("STATUS", EnumStatus.ENABLE.getCode());//添加时STATUS=1默认正常
					healthTypeService.save(pd);
					result = "01";
					message=ResultMessageUtil.MESSAGE_1;
				}else{
					message =ResultMessageUtil.MESSAGE_3;
					result = "03";
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
}
