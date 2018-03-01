package com.tbyf.controller.app.appSfTemp;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsCommonSfTemp;
import com.tbyf.entity.enums.EnumSfjlSTZZ;
import com.tbyf.entity.enums.EnumSfjlZT;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.service.gp.sfjl.impl.SfjlService;
import com.tbyf.service.gp.sftemp.SfTempManager;
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

@Controller
@RequestMapping(value="/appsftemp")
public class IntSfTempController extends BaseController {
	
	@Resource(name="sfTempService")
	private SfTempManager sfTempService;
	
	/**
     * app随访模版列表查询 
     * @param pageSize 页码 ，pageCount 当前页数，
     * @return
     */
    @RequestMapping(value="/applist", method = RequestMethod.GET)
    @ResponseBody
    public Object getSfTemp()
    {
        logBefore(logger, "app随访模版列表查询 ");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        try{	
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
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
               if(AppUtil.checkParam("sfTempQueryPage", pd)){	//检查参数
            	   List<PageData> list=sfTempService.queryPage(pd);
	        	   map.put("pd", list);
	        	   result = "01";
	        	   message=ResultMessageUtil.MESSAGE_1;
                }else {
	               result = "03";
	               message=ResultMessageUtil.MESSAGE_3;
	            }
         	}else{
				result = "05";
				 message=ResultMessageUtil.MESSAGE_5;
			}
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
	/**
     * app通过GUID查看随访模版详情
     * @param pageSize 页码 ，pageCount 当前页数，
     * @return
     */
    @RequestMapping(value="/appView", method = RequestMethod.GET)
    @ResponseBody
    public Object getSfView()
    {
        logBefore(logger, "app通过GUID查看随访模版详情");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        try{	
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
               if(null!=pd.getString("GUID")&&!"".equals(pd.getString("GUID"))){	//检查参数
            	   pd = sfTempService.findByGUID(pd);
            	   map.put("pd", pd);
	        	   result = "01";
	        	   message=ResultMessageUtil.MESSAGE_1;
                }else {
	               result = "03";
	               message=ResultMessageUtil.MESSAGE_3;
	            }
         	}else{
				result = "05";
				 message=ResultMessageUtil.MESSAGE_5;
			}
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app随访模版新增
     * @return
     */
	
    @RequestMapping(value="/appSave", method = RequestMethod.POST)
    @ResponseBody
    public Object appSave(){
        logBefore(logger, "app新增随访模版");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        try{ 
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appSaveSfTemp", pd)){	//检查参数
	        	   String GUID = this.get32UUID();
	        	   pd.put("GUID", GUID);	//
	        	   pd.put("ISTEMP", EnumIsCommonSfTemp.NO.getCode());
	        	   pd.put("STATUS", EnumStatus.ENABLE.getCode());
	        	   sfTempService.save(pd);
	        	   pd.remove("FKEY");
	        	   pd.remove("GUID");
	        	   pd.remove("NAME");
	        	   pd.remove("PROVIDER_ID");
	        	   pd.remove("PROVIDER_NAME");
	        	   pd.remove("SFLX");
	        	   pd.remove("ISTEMP");
	        	   pd.remove("CREATE_TIME");
	        	   pd.remove("STATUS");
	        	   Iterator ite=pd.entrySet().iterator();
	        	   while(ite.hasNext()){
	        	       PageData pd1 = new PageData();
	        		   Map.Entry m=(Map.Entry)ite.next();
	        		   pd1.put("GUID", this.get32UUID());
	        		   pd1.put("TEMP_ID", GUID);
	        		   pd1.put("COLUMN_ID", m.getKey().toString());
	        		   pd1.put("COLUMN_NAME", m.getValue().toString());
	        		   sfTempService.saveTempDetail(pd1);
	        	   }
	              result = "01";
	              message=ResultMessageUtil.MESSAGE_1;
	           }else {
	              result = "03";
	              message=ResultMessageUtil.MESSAGE_3;
	           }
        	}else{
				result = "05";
				message=ResultMessageUtil.MESSAGE_5;
			}
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app随访模版修改
     * @return
     */
	
    @RequestMapping(value="/appEdit", method = RequestMethod.POST)
    @ResponseBody
    public Object appEdit(){
        logBefore(logger, "app修改随访模版");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        try{ 
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appEditSfTemp", pd)){	//检查参数
	        	   sfTempService.edit(pd);
	        	   sfTempService.deteteDetailByTEMP_ID(pd);
	        	   String GUID = pd.getString("GUID");
	        	   pd.remove("FKEY");
	        	   pd.remove("GUID");
	        	   pd.remove("NAME");
	        	   pd.remove("SFLX");
	        	   Iterator ite=pd.entrySet().iterator();
	        	   while(ite.hasNext()){
	        	       PageData pd1 = new PageData();
	        		   Map.Entry m=(Map.Entry)ite.next();
	        		   pd1.put("GUID", this.get32UUID());
	        		   pd1.put("TEMP_ID", GUID);
	        		   pd1.put("COLUMN_ID", m.getKey().toString());
	        		   pd1.put("COLUMN_NAME", m.getValue().toString());
	        		   sfTempService.saveTempDetail(pd1);
	        	   }
	              result = "01";
	              message=ResultMessageUtil.MESSAGE_1;
	           }else {
	              result = "03";
	              message=ResultMessageUtil.MESSAGE_3;
	           }
        	}else{
				result = "05";
				message=ResultMessageUtil.MESSAGE_5;
			}
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app随访模版删除
     * @return
     */
    @RequestMapping(value="/appDelete", method = RequestMethod.GET)
    @ResponseBody
    public Object appDelete()
    {
        logBefore(logger, "app删除随访模版");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        try{	
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
               if(null!=pd.getString("GUID")&&!"".equals(pd.getString("GUID"))){	//检查参数
            	   pd.put("STATUS", EnumStatus.DELETE.getCode());
            	   sfTempService.delete(pd);
	        	   result = "01";
	        	   message=ResultMessageUtil.MESSAGE_1;
                }else {
	               result = "03";
	               message=ResultMessageUtil.MESSAGE_3;
	            }
         	}else{
				result = "05";
				message=ResultMessageUtil.MESSAGE_5;
			}
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    
}
