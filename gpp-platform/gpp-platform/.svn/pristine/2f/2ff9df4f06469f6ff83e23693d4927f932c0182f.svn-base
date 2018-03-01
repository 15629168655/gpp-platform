package com.tbyf.controller.app.appdistrict;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.system.District;
import com.tbyf.service.system.district.DistrictManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.MD5;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;

/**
 * 查询区域行政规化
 * @author xu.jianguo
 *
 */
@Controller
@RequestMapping(value="/appdistrict")
public class AppDistrictController extends BaseController {
	@Resource(name="districtService")
	private DistrictManager districtService;
	
	/**
	 * 区划管理Tree 含有点击编辑或查询的url
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getDistrict", method = RequestMethod.GET)
	@ResponseBody
	public Object depTreeData(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		 logBefore(logger, "app获取行政区划");
		 Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
	        	if(Tools.checkKey("REGICODE", pd.getString("FKEY"))){	//检验请求key值是否合法
		        	if(pd.get("REGICODE")!=null &&!pd.get("REGICODE").equals("")){	//检查参数
		        		List<PageData> list = districtService.getAppDisTree(pd);
		        		 map.put("pd", list);
		        	}else{
		        		List<PageData> list = districtService.queryAppDistrictByLevel("1");
		        		map.put("pd", list);
		        	} 

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
