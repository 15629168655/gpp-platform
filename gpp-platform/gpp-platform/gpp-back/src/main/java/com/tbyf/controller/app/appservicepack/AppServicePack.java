package com.tbyf.controller.app.appservicepack;

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
import com.tbyf.service.gp.servicePack.impl.ServicePackService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;

@Controller
@RequestMapping(value="/appServicePack")
public class AppServicePack extends BaseController {
	@Resource(name="servicePackService")
	private ServicePackService servicePackService;
	  /**
     * app预签约申请查询 
     * @param pageSize 页码 ，pageCount 当前页数
     * @param
     * @return
     */
	 	@RequestMapping(value = "/queryPage", method = RequestMethod.GET)
	    @ResponseBody
	    public Object queryPage()
	    {
	        logBefore(logger, "app服务包查询 ");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
		        if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
		    		int pageSize=1;//页码
	        		int pageCount=10;//页数
	               	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	               		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	               	}else{
	               		pd.put("pageStart", (pageSize-1)* pageCount+1);
	               		pd.put("pageEnd", pageSize * pageCount);
	               	}
            		pd.put("ZT_SC", EnumStatus.DELETE.getCode());
            		pd.put("ZT", EnumStatus.ENABLE.getCode());
            		List<PageData> list = servicePackService.querylistforApp(pd);
            		
            			map.put("pd", list);
        	        	result = "01";
        	        	message =ResultMessageUtil.MESSAGE_1;
		          
             	}else{
    				result = "05";
    				message =ResultMessageUtil.MESSAGE_5;
             	}
	        }catch (Exception e){
	        	message =ResultMessageUtil.MESSAGE_0;
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            map.put("message", message);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	    }
	 	  /**
	     * app预签约申请查询 
	     * @param pageSize 页码 ，pageCount 当前页数
	     * @param
	     * @return
	     */
		 	@RequestMapping(value = "/getServerPakeById", method = RequestMethod.GET)
		    @ResponseBody
		    public Object getServerPakeById()
		    {
		        logBefore(logger, "app服务包查询 ");
		        Map<String,Object> map = new HashMap<String,Object>();
		        PageData pd = new PageData();
		        pd = this.getPageData();
		        String result = "00";
		        String message="";
		        try{	
			        if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
			        	pd = servicePackService.findById(pd);						//根据ID读取
						Object NR = pd.get("NR");
						String str = null;  
				        byte[] inbyte=null;  
				        if(NR instanceof Blob){  
				            Blob blob = (Blob) NR;  
				            if (blob != null) {  
				                inbyte = blob.getBytes(1, (int) blob.length());  
				            }  
				            str =new String (inbyte);  
				        }
				        pd.put("NR", str);
            			map.put("pd", pd);
        	        	result = "01";
        	        	message =ResultMessageUtil.MESSAGE_1;
	             	}else{
	    				result = "05";
	    				message =ResultMessageUtil.MESSAGE_5;
	             	}
		        }catch (Exception e){
		        	message =ResultMessageUtil.MESSAGE_0;
		            logger.error(e.toString(), e);
		        }finally{
		            map.put("result", result);
		            map.put("message", message);
		            logAfter(logger);
		        }
		        return AppUtil.returnObject(new PageData(), map);
		    }
		 	
}
