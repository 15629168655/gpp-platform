package com.tbyf.controller.app.appsydj;

import com.tbyf.controller.base.*;
import com.tbyf.service.gp.provider.impl.ProviderService;
import com.tbyf.service.gp.sydj.impl.SydjService;
import com.tbyf.service.hm.agreementApply.AgreementApplyManager;
import com.tbyf.service.hm.agreementApply.impl.AgreementApplyService;
import com.tbyf.service.hm.departments.*;
import com.tbyf.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.*;

import java.util.*;


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
@RequestMapping(value="/intSydj")
public class IntSYDJController extends BaseController {
    
	@Resource(name="sydjService")
	private SydjService sydjService;
	  /**
     * app输液登记查询 
     * @return
     */
    @RequestMapping(value="/queryPage",method=RequestMethod.GET)
    @ResponseBody
    public Object queryPage()
    {
        logBefore(logger, "app通过过滤条件输液登记分页查询接口");
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
               		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
               	}else{
               		pd.put("pageStart", (pageSize-1)* pageCount+1);
               		pd.put("pageEnd", pageSize * pageCount);
               	}
        		List<PageData> list=sydjService.queryPage(pd);
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
    
    
    @RequestMapping(value="/saveObj",method=RequestMethod.POST)
    @ResponseBody
    public Object saveObj()
    {
        logBefore(logger, "app新增输液登记记录的接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(AppUtil.checkParam("saveSydj", pd)){	//检查参数
		        	pd.put("ID", this.get32UUID());
		        	pd.put("CREATE_TIME", new Date());
		        	pd.put("STATE", "0");
		        	sydjService.save(pd);
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
    
    @RequestMapping(value="/editObj",method=RequestMethod.POST)
    @ResponseBody
    public Object editObj()
    {
        logBefore(logger, "app修改输液登记记录的接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{	
        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	if(AppUtil.checkParam("editSydj", pd)){//检验参数
	        		pd.put("MODIFY_TIME",new Date());
	        		sydjService.edit(pd);
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
	
 