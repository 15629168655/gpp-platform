package com.tbyf.controller.app.bloodPressure;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.bloodPressure.impl.BloodPressureService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;


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
@RequestMapping(value="/appBloodPressure")
public class IntBloodPressureController extends BaseController{
	
	@Resource(name="bloodPressureService")
	private BloodPressureService bloodPressureService;
	
	 /**
     * app门诊测血压查询 
     * @param PATIENT_NAME 患者姓名 
     * @param MEASURING_TIME 测量时间
     * @param IS_NORMAL 是否正常
     * @return
     */
    @RequestMapping(value="/applist",method=RequestMethod.GET)
    @ResponseBody
    public Object applist(Page page)
    {
        logBefore(logger, "app通过过滤条件（患者姓名、测量时间、是否正常）查询门诊测血压表（GPP_BLOODPRESSURE）接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
    		int pageSize=1;//页码
    		int pageCount=10;//页数
    		if(Tools.checkKey("PATIENT_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	           		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	           		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	           	}else{
	           		pd.put("pageStart", (pageSize-1)* pageCount+1);
	           		pd.put("pageEnd", pageSize * pageCount);
	           	}
	    		List<PageData> list = bloodPressureService.appDatalist(pd);
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
    
    
    /**
     * app任务列表新增
     * @param ID id
     * @param PATIENT_ID 患者id
     * @param PATIENT_NAME 患者姓名
	 * @param HIGH_PRESSURE 高压
	 * @param LOW_PRESSURE 低压
	 * @param MEASURING_TIME 测量时间
	 * @param IS_NORMAL 是否正常 (0:正常，1:不正常)
	 * @param IS_MEDICATION 是否用药 (0:用药，2:不用药)
	 * @param INPUT_ID 录入人id
	 * @param INPUT_NAME 录入人
	 * @param ORG_CODE 机构id
	 * @param CREATE_TIME 生成时间
     * @return
     */
	
    @RequestMapping(value="/appSave", method = RequestMethod.POST)
    @ResponseBody
    public Object appSave(){
        logBefore(logger, "app通过任务信息（id、患者id、患者姓名、高压、低压、任务时间、测量时间、是否正常 、是否用药 、录入人id、录入人、机构id、生成时间）生成任务");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("PATIENT_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appSaveMZCXY", pd)){	//检查参数
	        	   pd.put("ID", this.get32UUID());	//ID
		       	   bloodPressureService.save(pd);
	              result = "01";
	           }else {
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
    
    /**
     * app门诊测血压修改
     * @param ID id
     * @param PATIENT_ID 患者id
     * @param PATIENT_NAME 患者姓名
	 * @param HIGH_PRESSURE 高压
	 * @param LOW_PRESSURE 低压
	 * @param MEASURING_TIME 测量时间
	 * @param IS_NORMAL 是否正常 (0:正常，1:不正常)
	 * @param IS_MEDICATION 是否用药 (0:用药，2:不用药)
	 * @param INPUT_ID 录入人id
	 * @param INPUT_NAME 录入人
	 * @param ORG_CODE 机构id
	 * @param MODIFY_TIME 修改时间
     * @return
     */
    @RequestMapping(value="/appEdit", method = RequestMethod.POST)
    @ResponseBody
    public Object appEdit()
    {
        logBefore(logger, "app通过传入门诊测血压信息（ID、协议名称、历史版本、修改时间、状态）更新到血压表(GPP_BLOODPRESSURE);");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("PATIENT_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appEditMZCXY", pd)){	//检查参数
	        	   bloodPressureService.edit(pd);			//修改
	              result = "01";
	           }else {
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
    
    /**
     * app门诊测血压删除
     * @param id ID 
     * @return
     */
 	@RequestMapping(value="/appDelete", method = RequestMethod.GET)
    @ResponseBody
    public Object appDelete()
    {
        logBefore(logger, "删除门诊测血压");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
        	if(Tools.checkKey("PATIENT_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		bloodPressureService.delete(pd);
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
