package com.tbyf.controller.app.blfyypgl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumBlfyypglState;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.blfyypgl.impl.BlfyypglService;
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
@RequestMapping(value="/appBlfyypgl")
public class IntBlfyypglController extends BaseController {

	@Resource(name="blfyypglService")
	private BlfyypglService blfyypglService;
	
	/**
     * app不良反应药品管理查询 
     * @param 		ID              id
	 * @param 		DRUG_NAME		药品名称
	 * @param 		DRUG_ID			药品id
	 * @param 		ORG_CODE			机构id
	 * @param 		MZJZLSH			门诊就诊流水号
	 * @param 		PATIENT_ID		患者id
	 * @param 		PATIENT_NAME	患者姓名
	 * @param 		CATEGORY		类别（0：输液；1：皮试；2：注射：3：其它）
	 * @param 		REMARK			备注说明
	 * @param 		CREATE_TIME		生成时间
	 * @param 		MODIFY_TIME		修改时间
	 * @param 		INPUT_ID		录入人id
	 * @param 		INPUT_NAME		录入人
	 * @param 		STATE			状态（0：正常；9：删除）
     * @return
     */
    @RequestMapping(value="/applist",method=RequestMethod.GET)
    @ResponseBody
    public Object applist(Page page)
    {
        logBefore(logger, "app查询不良反应药品管理接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
    		int pageSize=1;//页码
    		int pageCount=10;//页数
    		if(Tools.checkKey("DRUG_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	           		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	           		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	           	}else{
	           		pd.put("pageStart", (pageSize-1)* pageCount+1);
	           		pd.put("pageEnd", pageSize * pageCount);
	           	}
	    		List<PageData> list = blfyypglService.appDatalist(pd);
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
     * app不良反应药品管理新增
     * @param 		ID              id
	 * @param 		DRUG_NAME		药品名称
	 * @param 		DRUG_ID			药品id
	 * @param 		ORG_CODE			机构id
	 * @param 		MZJZLSH			门诊就诊流水号
	 * @param 		PATIENT_ID		患者id
	 * @param 		PATIENT_NAME	患者姓名
	 * @param 		CATEGORY		类别（0：输液；1：皮试；2：注射：3：其它）
	 * @param 		REMARK			备注说明
	 * @param 		CREATE_TIME		生成时间
	 * @param 		INPUT_ID		录入人id
	 * @param 		INPUT_NAME		录入人
	 * @param 		STATE			状态（0：正常；9：删除）
     * @return
     */
    @RequestMapping(value="/appSave", method = RequestMethod.POST)
    @ResponseBody
    public Object appSave(){
        logBefore(logger, "app通过任务信息（id、药品名称、药品id、机构id、门诊就诊流水号、患者id、患者姓名、类别 、备注说明 、生成时间、录入人id、录入人、状态）生成任务");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("DRUG_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appSaveBLFYYPGL", pd)){	//检查参数
	        	   pd.put("ID", this.get32UUID());	//ID
	        	   pd.put("STATE", EnumBlfyypglState.NORMAL.getCode());						//状态(正常状态)
	        	   blfyypglService.save(pd);
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
     * app不良反应药品管理修改
     * @param 		ID              id
	 * @param 		DRUG_NAME		药品名称
	 * @param 		DRUG_ID			药品id
	 * @param 		ORG_CODE			机构id
	 * @param 		MZJZLSH			门诊就诊流水号
	 * @param 		PATIENT_ID		患者id
	 * @param 		PATIENT_NAME	患者姓名
	 * @param 		CATEGORY		类别（0：输液；1：皮试；2：注射：3：其它）
	 * @param 		REMARK			备注说明
	 * @param 		MODIFY_TIME		修改时间
	 * @param 		INPUT_ID		录入人id
	 * @param 		INPUT_NAME		录入人
	 * @param 		STATE			状态（0：正常；9：删除）
     * @return
     */
    @RequestMapping(value="/appEdit", method = RequestMethod.POST)
    @ResponseBody
    public Object appEdit()
    {
        logBefore(logger, "app通过传入不良反应药品管理信息（id、药品名称、药品id、机构id、门诊就诊流水号、患者id、患者姓名、类别 、备注说明 、修改时间、录入人id、录入人、状态）更新到不良反应药品表(GPP_ADVERSE_DRUG_REACTION);");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("DRUG_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appEditBLFYYPGL", pd)){	//检查参数
	        	   blfyypglService.edit(pd);			//修改
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
     * app不良反应药品管理删除
     * @param id ID 
     * @return
     */
 	@RequestMapping(value="/appDelete", method = RequestMethod.GET)
    @ResponseBody
    public Object appDelete()
    {
        logBefore(logger, "删除不良反应药品管理");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("DRUG_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		pd.put("STATE", EnumBlfyypglState.DELETE.getCode());
	        		blfyypglService.delete(pd);
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
