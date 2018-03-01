package com.tbyf.controller.app.xywh;

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
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.xywh.XywhManager;
import com.tbyf.service.system.attachment.AttachmentManager;
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
@RequestMapping(value="/appXywh")
public class IntXywhController extends BaseController {
    
	@Resource(name="xywhService")
	private XywhManager xywhService;
	
	@Resource(name="attachmentService")
	private AttachmentManager attachmentService;
	
	
	Integer eaS = EnumStatus.SAVE.getCode();  //枚举，保存状态
	Integer eaE = EnumStatus.ENABLE.getCode();//枚举，启用状态
	Integer eaT = EnumStatus.DISABLE.getCode();//枚举，停用状态
	Integer eaD = EnumStatus.DELETE.getCode();//枚举，删除状态
	
	  /**
     * app协议维护查询 
     * @param AGREEMENT_NAME 协议名称   VERSIONS 历史版本  STATUS 状态(0：保存；1:启用；2：停用； 9：删除)
     * @return
     */
    @RequestMapping(value="/applistXywh", method = RequestMethod.GET)
    @ResponseBody
    public Object applistXywh(Page page)
    {
        logBefore(logger, "app通过过滤条件（协议名称、历史版本、）对协议维护（GPP_AGREEMENT_CONTENT）分页查询接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
    		int pageSize=1;//页码
    		int pageCount=10;//页数
    		if(Tools.checkKey("AGREEMENT_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	           		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	           		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	           	}else{
	           		pd.put("pageStart", (pageSize-1)* pageCount+1);
	           		pd.put("pageEnd", pageSize * pageCount);
	           	}
	    		List<PageData> list = xywhService.appXyxxlist(pd);
	    	 
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
     * app协议维护新增 
     * @param ID ID 
     * @param AGREEMENT_NAME 协议名称   
     * @param VERSIONS 历史版本 
     * @param  GMT_CREATED 生成时间 
     * @param STATUS 状态(0：保存；1:启用；2：停用； 9：删除)
     * @return
     */
    @RequestMapping(value="/appSaveXywh", method = RequestMethod.POST)
    @ResponseBody
    public Object appSaveXywh()
    {
        logBefore(logger, "app通过传入协议维护信息（ID、协议名称、历史版本、生成时间、状态）到协议内容表(GPP_ AGREEMENT_ CONTENT);");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("AGREEMENT_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appSaveXywh", pd)){	//检查参数
	        	   String id = this.get32UUID();
		       		pd.put("ID", id);
		       		pd.put("STATUS", eaS);
		       		xywhService.saveXywh(pd);					//新增协议表
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
     * app协议维护修改
     * @param ID ID 
     * @param AGREEMENT_NAME 协议名称   
     * @param VERSIONS 历史版本 
     * @param GMT_MODIFIED 生成时间 
     * @param STATUS 状态(0：保存；1:启用；2：停用； 9：删除)
     * @return
     */
    @RequestMapping(value="/appEditXywh", method = RequestMethod.POST)
    @ResponseBody
    public Object appEditXywh()
    {
        logBefore(logger, "app通过传入协议维护信息（ID、协议名称、历史版本、修改时间、状态）更新到协议内容表(GPP_ AGREEMENT_ CONTENT);");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("AGREEMENT_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appEditXywh", pd)){	//检查参数
		       		xywhService.editXywh(pd);				//修改协议表
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
     * app协议维护删除
     * @param ID ID 
     * @return
     */
 	@RequestMapping(value="/appDeleteXywh", method = RequestMethod.GET)
    @ResponseBody
    public Object appDeleteXywh()
    {
        logBefore(logger, "删除协议维护");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
        	if(Tools.checkKey("AGREEMENT_NAME", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		pd.put("STATUS", eaD);
	        		xywhService.deleteXywh(pd);
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
	
 