package com.tbyf.controller.app.appinjection;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.injection.InjectionManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
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
@RequestMapping(value="/appInjection")
public class IntInjectionController extends BaseController{
		
	
	@Resource(name="injectionService")
	private InjectionManager injectionService;
			
	/**
     * app注射登记管理查询 
     * @param pageSize 页码 ，pageCount 当前页数，HZXM 患者姓名 ZXRXM 执行人姓名
     * @return
     */
    @RequestMapping(value="/getInjectionById" , method = RequestMethod.GET)
    @ResponseBody
    public Object getInjectionById()
    {
        logBefore(logger, "app通过过滤条件（患者姓名、执行人姓名）对过敏管理（GPP_INJECTION_REGISTER）分页查询接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
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
               	if(AppUtil.checkParam("InjectionQueryPage", pd)){	//检查参数
            		List<PageData> list = injectionService.queryPage(pd);
            			map.put("pd", list);
            			result = "01";
               	}else{
            			result = "03";
            		}
	            }else {
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
     * app过敏管理新增
     * @param mzjzlsh 门诊就诊流水号,
     * @param hzxm 患者姓名、
     * @param ypmc 药品名称
     * @param jl 剂量
     * @param yf 用法
     * @param zxsj 执行时间
     * @param zxrxm 执行人姓名
     * @param bzsm 备注说明
     * @param scsj  生成时间
     * @return
     */
    @RequestMapping(value="/saveInjectionApp" , method = RequestMethod.POST)
    @ResponseBody
    public Object saveInjectionApp()
    {
        logBefore(logger, "app通过传入注射登记信息管理新增信息（门诊就诊流水号、患者姓名、药品名称、剂量、用法、执行时间、执行人姓名、备注说明、生成时间）生成注射登记信息管理新增");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        String result = "00";
        try{
        	pd = this.getPageData();
        if(Tools.checkKey("MZJZLSH", pd.getString("FKEY"))){	//检验请求key值是否合法
           if(AppUtil.checkParam("saveInjectionApp", pd)){	//检查参数
        	   injectionService.saveInjectionApp(pd);
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
     * app过敏管理编辑
     * @param ID 	主键ID,
     * @param mzjzlsh 门诊就诊流水号,
     * @param hzxm 患者姓名、
     * @param ypmc 药品名称
     * @param jl 剂量
     * @param yf 用法
     * @param zxsj 执行时间
     * @param zxrxm 执行人姓名
     * @param bzsm 备注说明
     * @return
     */
	@RequestMapping(value="/editInjectionApp", method = RequestMethod.POST)
    @ResponseBody
    public Object editInjectionApp()
    {
        logBefore(logger, "app注射登记管理编辑信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        String result = "00";
        try{
        	pd = this.getPageData();
        if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
           if(AppUtil.checkParam("editInjectionApp", pd)){	//检查参数
        	   injectionService.editInjectionApp(pd);
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
