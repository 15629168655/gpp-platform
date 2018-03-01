package com.tbyf.controller.app.jcwstx;

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
import com.tbyf.service.gp.jcwstx.JcwstxManager;
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
@RequestMapping(value="/appJcws")
public class IntJcwstxController extends BaseController {

	@Resource(name="jcwstxService")
	private JcwstxManager jcwstxService;
	
	/**
     * app基层卫生服务提醒查询 
     * @param BT 标题
     * @param SCSJ  生成时间
	 * @param TXLX	提醒类型
	 * @param ZT	状态
     * @return
     */
    @RequestMapping(value="/applist", method = RequestMethod.GET)
    @ResponseBody
    public Object applist(Page page)
    {
        logBefore(logger, "app通过过滤条件（标题、生成时间、提醒类型、状态）查询基层卫生提醒服务表（TB_HYGIENE_REMIND）接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
    		int pageSize=1;//页码
    		int pageCount=10;//页数
    		if(Tools.checkKey("BT", pd.getString("FKEY"))){	//检验请求key值是否合法
	           	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	           		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	           		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	           	}else{
	           		pd.put("pageStart", (pageSize-1)* pageCount+1);
	           		pd.put("pageEnd", pageSize * pageCount);
	           	}
	    		List<PageData> list = jcwstxService.appjcwstxlist(pd);
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
     * app基层卫生服务提醒新增
     * @param ID ID
     * @param TXLX 提醒类型
     * @param BT 标题
	 * @param NR 内容
	 * @param ZT 状态
	 * @param SCSJ 生成时间
	 * @param QKYSID 全科医生ID
	 * @param JGID 机构ID
     * @return
     */
	
    @RequestMapping(value="/appSave", method = RequestMethod.POST)
    @ResponseBody
    public Object appSave(){
        logBefore(logger, "app通过任务信息（id、提醒类型、标题、内容、状态、生成时间、全科医生ID、机构ID）生成任务");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("BT", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appSaveJCWSTX", pd)){	//检查参数
	        	   pd.put("ID", this.get32UUID());	//ID
	        	   jcwstxService.save(pd);
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
     * app基层卫生服务提醒修改
     * @param ID ID
     * @param TXLX 提醒类型
     * @param BT 标题
	 * @param NR 内容
	 * @param ZT 状态
	 * @param GXSJ 更新时间
	 * @param QKYSID 全科医生ID
	 * @param JGID 机构ID
     * @return
     */
    @RequestMapping(value="/appEdit", method = RequestMethod.POST)
    @ResponseBody
    public Object appEdit()
    {
        logBefore(logger, "app通过传入门诊测血压信息（id、提醒类型、标题、内容、状态、更新时间、全科医生ID、机构ID）基层卫生提醒表(TB_HYGIENE_REMIND);");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("BT", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appEditJCWSTX", pd)){	//检查参数
	        	   jcwstxService.edit(pd);			//修改
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
     * app基层卫生服务提醒标记已读
     * @param id ID 
     * @return
     */
 	@RequestMapping(value="/appUpdateYD", method = RequestMethod.GET)
    @ResponseBody
    public Object appUpdateYD()
    {
        logBefore(logger, "基层卫生提醒标记已读");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
        	if(Tools.checkKey("BT", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		jcwstxService.editZT(pd);
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
 	
 	 /**
     * app基层卫生服务提醒标记未读
     * @param id ID 
     * @return
     */
 	@RequestMapping(value="/appUpdateWD", method = RequestMethod.GET)
    @ResponseBody
    public Object appUpdateWD()
    {
        logBefore(logger, "基层卫生提醒标记已读");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
        	if(Tools.checkKey("BT", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		jcwstxService.editZT(pd);
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
