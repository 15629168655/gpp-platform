package com.tbyf.controller.app.uric;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
/**
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  用户名或密码错误
 * 05  FKEY验证失败
*/
import com.tbyf.service.hm.uric.UricManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;
@Controller
@RequestMapping(value="/appUric")
public class UricAppController extends BaseController{
	@Resource(name="uricService")
	private UricManager uricService;
	
	
	/**app尿酸记录分页查询
	 * 
	 * @return
	 */
	@RequestMapping(value="/queryPage",method=RequestMethod.GET)
    @ResponseBody
    public Object queryPage() {
		 logBefore(logger, "尿酸记录的分页查询");
		 Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("USER_AGENT_ID", pd.getString("FKEY"))) {	//检验请求key值是否合法
	        		if(AppUtil.checkParam("queryPageUric", pd)) {//检验参数
	        			int pageSize=1;//页码
		        		int pageCount=10;//页数
		               	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
		               		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
		               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
		               	}else{
		               		pd.put("pageStart", (pageSize-1)* pageCount+1);
		               		pd.put("pageEnd", pageSize * pageCount);
		               	}
			    		List<PageData> list = uricService.queryPage(pd);
			        	map.put("pd", list);
			            result = (null == list)? "02" : "01";
			            message = (null == list)? ResultMessageUtil.MESSAGE_2 : ResultMessageUtil.MESSAGE_1;
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
	        return AppUtil.returnObject(new PageData(), map);
	}
	/**
 	 * 删除一条尿酸记录
 	 */
 	@RequestMapping(value="/del",method=RequestMethod.GET)
    @ResponseBody
    public Object del()
    {
        logBefore(logger, "删除尿酸记录");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message="";
        
        try{
        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(AppUtil.checkParam("delUric", pd)){//检验参数
	        		PageData pdUric = uricService.findById(pd);//检查该条记录是否存在
		        	 if(pdUric == null || pdUric.size() == 0) {//判断该条记录是否存在
		        		 result = "02";
			             message = ResultMessageUtil.MESSAGE_2;
		        	 }
		        	 else {
		        		 uricService.delete(pd);
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
 	/**app增加尿酸记录
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
            if(AppUtil.checkParam("addUric", pd)){	//检查参数
         	   pd.put("ID", this.get32UUID());	//ID
         	   uricService.save(pd);
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
 	 
 	 /**app通过ID修改尿酸记录
 	  * 
 	  * @return
 	  */
 	@RequestMapping(value="/edit",method = RequestMethod.GET)
    @ResponseBody
    public Object edit(){
        logBefore(logger, "appID等信息修改尿酸记录");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message = "";
        try{
       if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	         if( AppUtil.checkParam("editUric", pd)){	//检查参数
	        	 PageData pdUric = uricService.findById(pd);//检查该条记录是否存在
	        	 if(pdUric == null || pdUric.size() == 0) {//判断该条记录是否存在
	        		 result = "02";
		             message = ResultMessageUtil.MESSAGE_2;
	        	 }
	        	 else{
	        		 uricService.update(pd);
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
		 logBefore(logger, "app通过ID查询尿酸尿酸记录");
		 Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))) {	//检验请求key值是否合法
	        		if(AppUtil.checkParam("findByIdUric", pd)) {//检验参数
			    		pd = uricService.findById(pd);
			        	map.put("pd", pd);
			            result = (null == pd)? "02" : "01";
			            message = (null == pd)? ResultMessageUtil.MESSAGE_2 : ResultMessageUtil.MESSAGE_1;
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
}
