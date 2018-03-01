package com.tbyf.controller.app.appcheckapplication;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.checkApplication.CheckApplicationManager;
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
@RequestMapping(value="/appCheckApplication")
public class IntCheckApplicationController extends BaseController{
		
		
	@Resource(name="checkApplicationService")
	private CheckApplicationManager checkApplicationService;
	
	/**
     * app检查申请管理查询 
     * @param pageSize 页码 ，pageCount 当前页数，MZLSH 门诊流水号  CFMXH 处方明细号 JCXMMC 检查项目名称
     * @return
     */
    @RequestMapping(value="/getCheckApplicationById", method = RequestMethod.GET)
    @ResponseBody
    public Object getCheckApplicationById()
    {
        logBefore(logger, "app通过过滤条件（门诊流水号、处方明细号、检查项目名称）对检查申请管理（TB_CHECK_APPLICATION）分页查询接口");
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
               if(AppUtil.checkParam("CheckQueryPage", pd)){	//检查参数
        		List<PageData> list=checkApplicationService.queryPage(pd);
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
     * app检查申请管理新增
     * @param ORG_CODE 机构ID、
     * @param JZLSH 就诊流水号、
     * @param CFMXH 处方明细号
     * @param JCXMMC 检查项目名称
     * @param JCMXID 检查项目ID
     * @param JC_TIME 检查时间
     * @param INSPECTION_DOCTOR 检验医生
     * @param INSPECTION_DOCTOR_ID 检验医生ID
     * @param APPLY_DOCTOR 申请医生
     * @param APPLY_DOCTOR_ID 申请医生ID
     * @param PATIENT_ID 患者ID
     * @param PATIENT_NAME 患者姓名
     * @param BZ 备注
     * @param LRR_ID 录入人ID
     * @param LRR_NAME 录入人姓名
     * @return
     */
    @RequestMapping(value="/saveCheckApp" , method = RequestMethod.POST)
    @ResponseBody
    public Object saveCheckApp()	
    {
        logBefore(logger, "app通过传入检查申请管理新增信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        String result = "00";
        pd = this.getPageData();
        try{
        if(Tools.checkKey("JZLSH", pd.getString("FKEY"))){	//检验请求key值是否合法
           if(AppUtil.checkParam("saveCheckApp", pd)){	//检查参数
        	   checkApplicationService.saveCheckApp(pd);
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
     * app检查申请管理编辑
     * @param ID 	主键ID,
     * @param JCJG  检查结果,	
     * @param BZ 	备注、
     * @param MODIFY_TIME 修改时间
     * @return
     */
	@RequestMapping(value="/editCheckApp" , method = RequestMethod.POST)
    @ResponseBody
    public Object editCheckApp()
    {
        logBefore(logger, "app检查申请管理编辑信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        String result = "00";
        pd = this.getPageData();
        try{
        if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
           if(AppUtil.checkParam("editCheckApp", pd)){	//检查参数f
        	   checkApplicationService.editCheckApp(pd);
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
 	 * app检查申请管理删除
 	 * @param ID 	主键ID
 	 * 
 	 */
 	@RequestMapping(value="/delCheckApp" , method = RequestMethod.POST)
    @ResponseBody
    public Object delCheckApp()
    {
        logBefore(logger, "删除检查申请信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
        if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
        		pd.put("STATUS", "9");
        		checkApplicationService.delCheckApp(pd);
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
