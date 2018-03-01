package com.tbyf.controller.app.appfat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.hm.fat.FatManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;

/**血脂四项记录
 * 
 * @author zanxc
 *
 */
@Controller
@RequestMapping(value="/appFat")
public class FatAppController extends BaseController{

	@Resource(name="fatService")
	private FatManager fatService;
	
	
	/**app血脂四项记录分页查询
	 * 
	 * @return
	 */
	@RequestMapping(value="/queryPage",method=RequestMethod.GET)
    @ResponseBody
    public Object queryPage() {
		 logBefore(logger, "血脂四项记录的分页查询");
		 Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("USER_AGENT_ID", pd.getString("FKEY"))) {	//检验请求key值是否合法
	        		if(AppUtil.checkParam("queryPageFat", pd)) {//检验参数
	        			int pageSize=1;//页码
		        		int pageCount=10;//页数
		               	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
		               		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
		               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
		               	}else{
		               		pd.put("pageStart", (pageSize-1)* pageCount+1);
		               		pd.put("pageEnd", pageSize * pageCount);
		               	}
			    		List<PageData> list = fatService.queryPage(pd);
			        	map.put("pd", list);
			            result = (null == list)? "02" : "01";
			            message = (null == list)? ResultMessageUtil.MESSAGE_2 : ResultMessageUtil.MESSAGE_1;
	        		}
	        		else {
	        			result = "03";
	        			 message = ResultMessageUtil.MESSAGE_3;
	        		}
	        	}else{
	        		result = "05";
			        message = ResultMessageUtil.MESSAGE_5;
	        	}
	        }catch (Exception e){
			    message = ResultMessageUtil.MESSAGE_0;
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            map.put("message", message);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	}
	/**
 	 * 删除一条血脂四项记录
 	 */
 	@RequestMapping(value="/del",method=RequestMethod.GET)
    @ResponseBody
    public Object del()
    {
        logBefore(logger, "删除血脂四项记录");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        
        try{
        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(AppUtil.checkParam("delFat", pd)){//检验参数
	        		PageData pdFat = fatService.findById(pd);//获得该条要修改的记录
	        		if(pdFat == null || pdFat.size() == 0) {//判断该条记录是否存在
	        			result = "02";
		    		    message = ResultMessageUtil.MESSAGE_2;
	        		}
	        		else {
	        			fatService.delete(pd);
		        		result = "01";
		    		    message = ResultMessageUtil.MESSAGE_1;
	        		}
	        	}else{
	        		result = "03";
	    		    message = ResultMessageUtil.MESSAGE_3;
	        	}
        	}else{
        		result = "05";
    		    message = ResultMessageUtil.MESSAGE_5;
        	}
        }catch (Exception e){
		    message = ResultMessageUtil.MESSAGE_0;
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
 	/**app增加血脂四项记录
 	 * 
 	 * @return
 	 */
 	 @RequestMapping(value="/add",method = RequestMethod.GET)
     @ResponseBody
     public Object add(){
         logBefore(logger, "app增加一条尿酸记录");
         Map<String,Object> map = new HashMap<String,Object>();
         PageData pd = new PageData();
         pd = this.getPageData();
         String result = "00";
         String message = "";
         try{
          if(Tools.checkKey("USER_AGENT_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
            if(AppUtil.checkParam("addFat", pd)){	//检查参数
         	   pd.put("ID", this.get32UUID());	//ID
         	   fatService.save(pd);
               result = "01";
               message = ResultMessageUtil.MESSAGE_1;
            }else {
               result = "03";
               message = ResultMessageUtil.MESSAGE_3;
            }
         }else{
 			result = "05";
 			message = ResultMessageUtil.MESSAGE_5;
 		}
         }catch (Exception e){
        	 message = ResultMessageUtil.MESSAGE_0;
             logger.error(e.toString(), e);
         }finally{
             map.put("result", result);
             map.put("message", message);
             logAfter(logger);
         }
         return AppUtil.returnObject(new PageData(), map);
     }
 	 
 	 /**app通过ID修改血脂四项记录
 	  * 
 	  * @return
 	  */
 	@RequestMapping(value="/edit",method = RequestMethod.GET)
    @ResponseBody
    public Object edit(){
        logBefore(logger, "appID等信息修改血脂四项记录");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message = "";
        try{
       if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	         if( AppUtil.checkParam("editFat", pd)){	//检查参数
	        	 PageData pdFat = fatService.findById(pd);//获得该条要修改的记录
	        	 if(pdFat == null || pdFat.size() == 0) {//判断该条记录是否存在
	        			result = "02";
		    		    message = ResultMessageUtil.MESSAGE_2;
	        		}
	        	 else{
	        		 fatService.update(pd);
	        		 result = "01";
		             message = ResultMessageUtil.MESSAGE_1;
	        	 }
	           }else {
	              result = "03";
	              message = ResultMessageUtil.MESSAGE_3;
	           }
	         }else{
	    			result = "05";
	    			message = ResultMessageUtil.MESSAGE_5;
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
 	/**app通过ID获得数据
 	 * 
 	 */
 	@RequestMapping(value="/findById",method=RequestMethod.GET)
    @ResponseBody
    public Object findById() {
		 logBefore(logger, "app通过ID查询血脂尿酸记录");
		 Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))) {	//检验请求key值是否合法
	        		if(AppUtil.checkParam("findByIdFat", pd)) {//检验参数
			    		pd = fatService.findById(pd);
			        	map.put("pd", pd);
			            result = (null == pd)? "02" : "01";
			            message = (null == pd)? ResultMessageUtil.MESSAGE_2 : ResultMessageUtil.MESSAGE_1;
	        		}
	        		else {
	        			result = "03";
	        			 message =ResultMessageUtil.MESSAGE_3;
	        		}
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
	        return AppUtil.returnObject(new PageData(), pd);
 	}
}
