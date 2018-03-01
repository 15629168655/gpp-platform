package com.tbyf.controller.app.apporganization;

import com.tbyf.controller.base.*;
import com.tbyf.service.hm.organization.*;
import com.tbyf.util.*;

import org.aspectj.bridge.MessageUtil;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.*;
import java.util.*;

/**
 * 机构-接口类
 * 相关参数协议：
 * 00	请求失败
 * 01	请求成功
 * 02	返回空值
 * 03	请求协议参数不完整
 * 04   用户名或密码错误
 * 05   KEY验证失败
 */

@Controller
@RequestMapping(value="/apporganization")
public class IntOrganizationController extends BaseController
{
    @Resource(name="organizationService")
    private OrganizationManager organizationService;

    /**
     * app机构注册接口
     * @return
     */
    @RequestMapping(value="/save")
    @ResponseBody
    public Object save()
    {
        logBefore(logger, "app通过机构编码、机构名称、登记号、上级机构编码注册机构信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
            if(Tools.checkKey("ORG_CODE", pd.getString("FKEY"))){	//检验请求key值是否合法
                if(AppUtil.checkParam("saveOrganization", pd)){	//检查参数
                    if(organizationService.findByORG_CODE(pd) != null) //表中如果已经存在该机构,则返回创建失败
                    {
                        result = "00";
                        map.put("result", result);
                        return AppUtil.returnObject(new PageData(), map);
                    }
                    pd.put("ISLEAF","1");
                    pd.put("ORGANIZATION_ID", this.get32UUID());	//主键
                    organizationService.save(pd);

                    //当在叶子节点下新增节点时，将原来的叶子节点的ISLEAF变为0
                    if(organizationService.listSubOrgByP_ORG_CODE(pd.getString("P_ORG_CODE")) != null)
                    {
                        PageData pd1 = new PageData();
                        pd1.put("ORG_CODE",pd.getString("P_ORG_CODE"));
                        pd1.put("ISLEAF","0");
                        organizationService.changeToParent(pd1);
                    }
                    map.put("pd", pd);
                    result = (null == pd) ?  "02" :  "01";
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

    /**根据机构编码获取机构信息
     * @return
     */
    @RequestMapping(value="/getOrgByOrgCode")
    @ResponseBody
    public Object getOrgByOrgCode(){
        logBefore(logger, "根据机构编码获取机构信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
            if(Tools.checkKey("ORG_CODE", pd.getString("FKEY"))){	//检验请求key值是否合法
                if(AppUtil.checkParam("getOrgByOrgCode", pd)){	//检查参数
                    pd = organizationService.findByORG_CODE(pd);
                    map.put("pd", pd);
                    result = (null == pd) ?  "02" :  "01";
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
     * 根据区划查询组织机构数据
     * @return
     */
    @RequestMapping(value="/getOrgByRegionCode")
    @ResponseBody
    public Object getOrgByArea(){
    	logBefore(logger, "根据区划取机构信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        String message ="";
        try{
            if(Tools.checkKey("REGIONCODE", pd.getString("FKEY"))){	//检验请求key值是否合法
                if(pd.get("REGIONCODE")!=null && pd.get("REGIONCODE")!=null){	//检查参数
                	String regionCode = pd.getString("REGIONCODE");
                	if(regionCode.substring(3,12).equals("000000000")){
                		//判断省级
                        result = "02";
     		        	message ="请选择区域查询";
                	}else if(regionCode.substring(4,12).equals("00000000")){
                		//判断市级
                		result = "02";
     		        	message ="请选择区域查询";
                	}else if(regionCode.substring(6,12).equals("000000")){
                		//判断区
                		pd.put("REGION_CODE", regionCode.substring(0, 6));
	                    List<PageData> list = organizationService.listAllByRegionCode(pd);
	                    map.put("pd", list);
	                    result = "01";
	                    message = ResultMessageUtil.MESSAGE_1;
                	}else if(regionCode.subSequence(9, 12).equals("000")){
                		//判断呢街道
                		pd.put("REGION_CODE", regionCode.substring(8, 11));
	                    List<PageData> list = organizationService.listAllByRegionCode(pd);
	                    map.put("pd", list);
	                    result = "01";
	                    message = ResultMessageUtil.MESSAGE_1;
                	}else{
                		//查询社区
                		List<PageData> list = organizationService.listAllByRegionCode(pd);
 	                    map.put("pd", list);
 	                    result = "01";
 	                    message = ResultMessageUtil.MESSAGE_1;
                	}
 		        	message =ResultMessageUtil.MESSAGE_1;
                }else {
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
            map.put("message",message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
}
