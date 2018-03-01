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
import com.tbyf.service.gp.sfjl.SfjlDiabetesManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.Tools;



/**
 * 
 * 糖尿病随访
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整    
 * 04  	用户名或密码错误
 * 05  	FKEY验证失败
 */


@Controller
@RequestMapping(value="/appsfjldiabetes")
public class AppSfjlDiabetesController  extends BaseController{

	@Resource(name="sfjlDiabetesService")
	private SfjlDiabetesManager sfjlDiabetesService;
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
        logBefore(logger, id+"app糖尿病查询接口");
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
        		List<PageData> list=sfjlDiabetesService.queryPage(pd);
	        		 
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
            logAfter(logger, id+"app糖尿病查询接口");
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
        logBefore(logger, id+"app糖尿病新增接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String ID="";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appSaveSfjlDiabetes", pd)){	//检查参数
	        	   ID=this.get32UUID();
	        	   pd.put("ID", ID);	//ID
	        	   sfjlDiabetesService.save(pd);
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
            map.put("id", ID) ;
            logAfter(logger, id+"app糖尿病新增接口");
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
        logBefore(logger, id+"app糖尿病修改接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("appEditSfjlDiabetes", pd)){	//检查参数
	        	   sfjlDiabetesService.edit(pd);			//修改
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
            logAfter(logger, id+"app糖尿病修改接口");
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
        logBefore(logger, id+"app糖尿病删除接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("IDS") && !pd.getString("IDS").equals("")){//检验参数
	        		pd.put("ZT", EnumSfjlZT.DELETE.getCode());
	        		sfjlDiabetesService.appdelete(pd);
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
            logAfter(logger, id+"app糖尿病删除接口");
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
        logBefore(logger, id+"app糖尿病查看详情接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){//检验参数
	        		PageData sfjl=sfjlDiabetesService.findById(pd);
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
            logAfter(logger, id+"app糖尿病查看详情接口");
        }
        return AppUtil.returnObject(new PageData(), map);
    }

}
