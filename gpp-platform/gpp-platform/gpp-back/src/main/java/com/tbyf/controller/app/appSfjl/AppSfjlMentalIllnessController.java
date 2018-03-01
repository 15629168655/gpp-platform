package com.tbyf.controller.app.appSfjl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumSfjlZT;
import com.tbyf.service.gp.sfjl.SfjlMentalillnessManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;



/**
 * 
 * 精神病随访
 * 
 * 
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  	用户名或密码错误
 * 05  	FKEY验证失败
 */


@Controller
@RequestMapping(value="/appsfjlmentalillness")
public class AppSfjlMentalIllnessController  extends BaseController{

	@Resource(name="sfjlMentalillnessService")
	private SfjlMentalillnessManager sfjlMentalillnessService;
	/**
     * app随访登记查询 
     * @param pageSize 页码 ，pageCount 当前页数，
     * @return
     */
    @RequestMapping(value="/applist", method = RequestMethod.GET)
    @ResponseBody
    public Object getSfjl()
    {
        long id=System.currentTimeMillis();
        logBefore(logger,  id+"app精神病随访查询列表接口");
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
               if(AppUtil.checkParam("sfjlQueryPage", pd)){	//检查参数
        		List<PageData> list=sfjlMentalillnessService.queryPage(pd);
	        		 
	        			map.put("pd", list);
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
            logAfter(logger,  id+"app精神病随访查询列表接口");
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    
    /**
     * app任务列表新增
     * @return
     */
	
    @RequestMapping(value="/appSave", method = RequestMethod.POST)
    @ResponseBody
    public Object appSave(){
        long id=System.currentTimeMillis();
        logBefore(logger,  id+"app添加精神病随访记录接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String ID  ="";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appSaveSfjlMentalillness", pd)){	//检查参数
	        	   ID=this.get32UUID();
	        	   pd.put("ID", ID);	//ID
	        	   sfjlMentalillnessService.save(pd);
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
            map.put("id", ID);
            
            logBefore(logger,  id+"app添加精神病随访记录接口");
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app随访记录修改
     * @return
     */
    @RequestMapping(value="/appEdit", method = RequestMethod.POST)
    @ResponseBody
    public Object appEdit()
    {
        long id=System.currentTimeMillis();
        logBefore(logger,  id+"app修改精神病随访记录接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appEditSfjlMentalillness", pd)){	//检查参数
	        	   sfjlMentalillnessService.edit(pd);			//修改
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
            logBefore(logger,  id+"app修改精神病随访记录接口");
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app随访记录删除
     * @param id ID 
     * @return
     */
 	@RequestMapping(value="/appDelete", method = RequestMethod.GET)
    @ResponseBody
    public Object appDelete()
    {
 		long id=System.currentTimeMillis();
        logBefore(logger,  id+"app精神病随访记录删除");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("IDS") && !pd.getString("IDS").equals("")){//检验参数
	        		pd.put("ZT", EnumSfjlZT.DELETE.getCode());
	        		sfjlMentalillnessService.appdelete(pd);
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
            logAfter(logger,  id+"app精神病随访记录删除");
        }
        return AppUtil.returnObject(new PageData(), map);
    }
 	
 	
 	/**
     * app通过ID查看随访记录（查看详情）
     * @param id ID 
     * @return
     */
 	@RequestMapping(value="/appFindByID", method = RequestMethod.GET)
    @ResponseBody
    public Object appFindByID()
    {
 		long id=System.currentTimeMillis();
        logBefore(logger,  id+"app修改精神病随访查看详情接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		PageData sfjl=sfjlMentalillnessService.findById(pd);
	        		if(sfjl.size()==0){
	        			result = "02";
	        		}else{
	        			map.put("pd", sfjl);
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
            logAfter(logger,  id+"app修改精神病随访查看详情接口");
        }
        return AppUtil.returnObject(new PageData(), map);
    }

}
