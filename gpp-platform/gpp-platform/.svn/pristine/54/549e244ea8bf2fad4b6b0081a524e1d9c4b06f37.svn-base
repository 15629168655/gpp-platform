package com.tbyf.controller.app.tsxx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.tsxx.TsxxManager;
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
 * 06  系统任务不允许修改
*/
@Controller
@RequestMapping(value="/apptsxx")
public class IntTsxxController extends BaseController {

	@Resource(name="tsxxService")
	private TsxxManager tsxxService;
	
	/**
     * app推送消息列表查询 
     * @param pageSize 页码 ，pageCount 当前页数，
     * @return
     */
    @RequestMapping(value="/applist", method = RequestMethod.GET)
    @ResponseBody
    public Object getSfjl()
    {
        logBefore(logger, "app推送消息列表查询 ");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
        	if(Tools.checkKey("MC", pd.getString("FKEY"))){	//检验请求key值是否合法
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
        		List<PageData> list=tsxxService.queryPage(pd);
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
     * app推送消息
     * @return
     */
    @RequestMapping(value="/appSave", method = RequestMethod.POST)
    @ResponseBody
    public Object appSave(){
        logBefore(logger, "app推送消息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("MC", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appSaveTSXX", pd)){	//检查参数
	        	   pd.put("ID", this.get32UUID());	//ID
	        	   tsxxService.save(pd);
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
     * app点赞
     * @return
     */
    @RequestMapping(value="/appEditDZ", method = RequestMethod.GET)
    @ResponseBody
    public Object appEdit()
    {
        logBefore(logger, "app点赞");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("MC", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appEditDZ", pd)){	//检查参数
	        	  tsxxService.updateDZL(pd);
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
     * app通过ID查看记录（查看详情）
     * @param id ID 
     * @return
     */
 	@RequestMapping(value="/appFindByID", method = RequestMethod.GET)
    @ResponseBody
    public Object appFindByID()
    {
        logBefore(logger, "查看详情");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("MC", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		PageData tsxx = tsxxService.findById(pd);
	        		if(tsxx.size()==0){
	        			result = "02";
	        		}else{
	        			map.put("pd", tsxx);
	        			result = "01";
	        		}
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
