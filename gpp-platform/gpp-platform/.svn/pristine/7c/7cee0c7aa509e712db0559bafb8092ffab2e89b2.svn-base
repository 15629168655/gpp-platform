package com.tbyf.controller.app.appgggl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.information.gggl.GgglManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.DateUtil;
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
@RequestMapping(value="/appGggl")
public class IntGgglController extends BaseController{
		
	@Resource(name="ggglService")
	private GgglManager ggglService;
	
	/**
     * app广告管理查询 
     * @param pageSize 页码 ，pageCount 当前页数，PATIENT_ID 患者ID PATIENT_NAME 患者姓名
     * @return
     */
	 //	  @RequestMapping(value="/getGggl", method = RequestMethod.GET)
    @RequestMapping(value="/getGggl")
    @ResponseBody
    public Object getGggl()
    {
        logBefore(logger, "app通过过滤条件通过类型和数量获取广告信息分页查询接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message = "";
        try{	
        	if(Tools.checkKey("GG_TYPE", pd.getString("FKEY"))){	//检验请求key值是否合法
        	   pd.put("dateTime", DateUtil.getTime());
               if(AppUtil.checkParam("GgglQueryPage", pd)){	//检查参数
            	   	pd.put("QY", 1);
	        		List<PageData> list=ggglService.queryPage(pd);
        			map.put("pd", list);
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
            logger.error(e.toString(), e);
            message = ResultMessageUtil.MESSAGE_0;
        }finally{
            map.put("result", result);
            map.put("message",message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
}
