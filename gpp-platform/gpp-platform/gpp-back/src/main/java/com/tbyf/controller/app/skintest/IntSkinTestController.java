package com.tbyf.controller.app.skintest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.skintest.SkintestManager;
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
@RequestMapping(value="/appskintest")
public class IntSkinTestController extends BaseController{
	
	@Resource(name="skintestService")
	private SkintestManager skintestService;
	
	/**
     * app皮试管理查询 
     * @param pageSize 页码 ，pageCount 当前页数，XM 姓名 ，PSYP 皮试药品 , PSYMC 皮试液 , skintestTimeStart 生成时间起 , skintestTimeEnd 生成时间止 , PSLX 皮试类型 , GMFY 过敏反应
     * @return
     */
	
	@RequestMapping(value="/queryPage",method = RequestMethod.GET)
    @ResponseBody
    public Object queryPage()
    {
        logBefore(logger, "app通过过滤条件（姓名、皮试药品、皮试液 、生成时间起止、皮试类型、过敏反应）对皮试不良反应表（GPP_SKINTEST_ADVERSENESS）分页查询接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{  
        	//如果不传分页参数，给默认值。
    		int pageSize=1;//页码
    		int pageCount=10;//页数
    		if(Tools.checkKey("ORG_CODE", pd.getString("FKEY"))){	//检验请求key值是否合法
    		if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
           		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
           		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
           	}else{
           		pd.put("pageStart", (pageSize-1)* pageCount+1);
           		pd.put("pageEnd", pageSize * pageCount);
           	}
    		}else{
    			result = "05";
    		}
    		List<PageData> list=skintestService.queryPage(pd);
    		map.put("pd", list);
            result = "01";
        }catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
	
    /**
	 * app新增皮试管理
	 * @param 	PSYP		皮试药品名称
	 * @param 	PSYPID		皮试药品id
	 * @param 	PSYBM		皮试液编码
	 * @param 	PSYMC		皮试液名称
	 * @param 	PSLX		皮试类型
	 * @param 	GMFY		过敏反应
	 * @param 	KSSJ		试验开始时间
	 * @param 	JSSJ		试验结束时间
	 * @param 	BZ		备注说明
	 * @param 	HZXM		患者姓名
	 * @param 	HZID		患者id
	 * @return
	 */
		
	 @RequestMapping(value="/addSkintest",method = RequestMethod.POST)
	 @ResponseBody
	 public Object addSkintest(){
	     logBefore(logger, "app通过皮试不良反应（所有字段）生成皮试不良反应表记录");
	     Map<String,Object> map = new HashMap<String,Object>();
	     PageData pd = new PageData();
	     pd = this.getPageData();
	     String result = "00";
	     try{
	        if(Tools.checkKey("HZXM", pd.getString("FKEY"))){	//检验请求key值是否合法
	        if(AppUtil.checkParam("addSkintest", pd)){	//检查参数
	        	pd.put("ID", this.get32UUID());	//ID
	       		pd.put("ZT", 0);
	       		  skintestService.save(pd);
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
	  * app修改皮试管理
	  * @param 	ID		主键
	  * @param 	PSYP		皮试药品名称
	  * @param 	PSYPID		皮试药品id
	  * @param 	PSYBM		皮试液编码
      * @param 	PSYMC		皮试液名称
	  * @param 	PSLX		皮试类型
	  * @param 	GMFY		过敏反应
	  * @param 	KSSJ		试验开始时间
	  * @param 	JSSJ		试验结束时间
	  * @param 	BZ		备注说明
	  * @param 	HZXM		患者姓名
	  * @param 	HZID		患者id
	  * @return
	*/
			
	@RequestMapping(value="/editSkintest",method = RequestMethod.POST)
	@ResponseBody
	public Object editSkintest(){
	logBefore(logger, "app修改皮试不良反应表记录");
	Map<String,Object> map = new HashMap<String,Object>();
	PageData pd = new PageData();
	pd = this.getPageData();
	String result = "00";
	try{
		if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
		if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){	//检查参数
		     skintestService.edit(pd);
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
	  * app删除皮试管理
	  * @param 	ID		主键
	  * @return
    */
				
	@RequestMapping(value="/delSkintest",method = RequestMethod.POST)
	@ResponseBody
	public Object delSkintest(){
		logBefore(logger, "app删除皮试不良反应表记录");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			  if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
			   if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){	//检查参数
			       	skintestService.delete(pd);
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

}
