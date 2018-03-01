package com.tbyf.controller.app.appgmpatient;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.gmpatient.GmpatientManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
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
@RequestMapping(value="/appGmPatient")
public class IntGmPatientController extends BaseController{
		
	@Resource(name="gmpatientService")
	private GmpatientManager gmpatientService;		
	
		/**
	     * app过敏管理查询 
	     * @param pageSize 页码 ，pageCount 当前页数，PATIENT_ID 患者ID PATIENT_NAME 患者姓名
	     * @return
	     */
	    @RequestMapping(value="/getGmPatientById", method = RequestMethod.GET)
	    @ResponseBody
	    public Object getGmPatientById()
	    {
	        logBefore(logger, "app通过过滤条件（患者ID、患者姓名）对过敏管理（TB_GM_PATIENT_INFORMATION）分页查询接口");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	        		//如果不传分页参数，给默认值。
	        		int pageSize=1;//页码
	        		int pageCount=10;//页数
	               	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	               		pd.put("pageStart", pd.get("PAGESIZE"));
	               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	               	}else{
	               		pd.put("pageStart", pageSize);
	               		pd.put("pageEnd", pageSize * pageCount);
	               	}
	               if(AppUtil.checkParam("GmQueryPage", pd)){	//检查参数
	        		List<PageData> list=gmpatientService.queryPage(pd);
	        		if(list.size()==0){
	        			result = "02";
	        		}else{
	        			map.put("pd", list);
	        			result = "01";
	        		}
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
	     * app过敏管理新增
	     * @param PATIENT_ID 患者ID,
	     * @param PATIENT_NAME 患者姓名、
	     * @param ALLERGY 过敏源
	     * @param BZ 备注
	     * @param OPERATOR_ID 负责人ID
	     * @param OPERATOR_NAME 负责人姓名
	     * @param ORG_CODE 机构ID
	     * @return
	     */
//	    @RequestMapping(value="/saveGmPatientApp", method = RequestMethod.POST)
	    @RequestMapping(value="/saveGmPatientApp")
	    @ResponseBody
	    public Object saveGmPatientApp()
	    {
	        logBefore(logger, "app通过传入过敏管理新增信息（患者ID、患者姓名、过敏源、备注、负责人ID、负责人姓名、机构ID）生成过敏管理新增");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        String result = "00";
	        try{
	        	pd = this.getPageData();
	        if(Tools.checkKey("ALLERGY", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("saveGmPatientApp", pd)){	//检查参数
	        	   gmpatientService.saveGmPatientApp(pd);
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
	     * app过敏管理编辑
	     * @param ID 	主键ID,
	     * @param PATIENT_ID 患者ID,
	     * @param PATIENT_NAME 患者姓名、
	     * @param ALLERGY 过敏源
	     * @param BZ 备注
	     * @param OPERATOR_ID 负责人ID
	     * @param OPERATOR_NAME 负责人姓名
	     * @param ORG_CODE 机构ID
	     * @return
	     */
//		@RequestMapping(value="/editGmPatientApp", method = RequestMethod.POST)
		 @RequestMapping(value="/editGmPatientApp")
	    @ResponseBody
	    public Object editGmPatientApp()
	    {
	        logBefore(logger, "app过敏管理编辑信息");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        String result = "00";
	        try{
	        	pd = this.getPageData();
	        if(Tools.checkKey("ALLERGY", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("editGmPatientApp", pd)){	//检查参数
	        	   gmpatientService.editGmPatientApp(pd);
	        	   result = (null == pd) ?  "02" :  "01";
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
	 	 * app过敏管理删除
	 	 * @param ID 	主键ID
	 	 * 
	 	 */
	 	@RequestMapping(value="/delGmPatientApp", method = RequestMethod.POST)
	    @ResponseBody
	    public Object deleteObj()
	    {
	        logBefore(logger, "删除过敏管理信息");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{	
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		gmpatientService.delGmPatientApp(pd);
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
