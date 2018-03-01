package com.tbyf.controller.app.hospitalization;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.hospitalization.HospitalizationManager;
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
@RequestMapping(value="/apphospitalization")
public class IntHospitalizationController extends BaseController{
	
	@Resource(name="hospitalizationService")
	private HospitalizationManager hospitalizationService;
	
	/**
     * app住院证查询 
     * @param pageSize 页码 ，pageCount 当前页数，XM 姓名 , zyrqStart 住院日期起 , zyrqEnd 住院日期止,ORG_CODE 机构编码
     * @return
     */
	
	@RequestMapping(value="/queryPage",method = RequestMethod.GET)
    @ResponseBody
    public Object queryPage()
    {
        logBefore(logger, "app通过过滤条件（姓名、住院日期）对住院证表（GPP_HOSPITALIZATION_DOC）分页查询接口");
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
    		List<PageData> list=hospitalizationService.queryPage(pd);
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
	    * app新增住院证
		* @param 	JZLSH	门诊就诊流水
		* @param 	ZJHM	医保ic卡号
		* @param 	ZYH	住院号
		* @param 	XM	姓名
		* @param 	XB	性别
		* @param 	NL	年龄
		* @param 	ZY	职业
		* @param 	KSBM	科室编码
		* @param 	KSMC	科室名称
		* @param 	ZYZYRQ	准予住院日期
		* @param 	YJZYF	预交住院费金额
		* @param 	JZZDBM	"门诊诊断编码（主要诊断)"
		* @param 	MZZDMC	门诊诊断名称
		* @param 	BQ	病情
		* @param 	TW	体位
		* @param 	YSFS	运送方法
		* @param 	GL	隔离
		* @param 	WSCL	卫生处理
		* @param 	ZYRQ	住院日期
		* @param 	TSCLSY	特殊处理事由
		* @param 	LDCLYJ	领导处理意见
		* @param 	ZZYSGH	医生编号
		* @param 	ZZYSXM	医生姓名
		* @param 	JBR	经办人
		* @param 	DZ	工作单位及地址
		* @param 	ORG_CODE	机构编码
		* @param 	ZT	状态
		* @param 	FYLB	费用类别
	    * @return
	    */
		
	    @RequestMapping(value="/addHospitalization",method = RequestMethod.POST)
	    @ResponseBody
	    public Object addHospitalization(){
	        logBefore(logger, "app通过住院证（所有字段）生成住院证表记录");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{
	        	if(Tools.checkKey("XB", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(AppUtil.checkParam("addHospitalization", pd)){	//检查参数
	        	   pd.put("ID", this.get32UUID());	//ID
	       		   hospitalizationService.save(pd);
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
	     * app修改
	    * @param 	ID	主键
		* @param 	JZLSH	门诊就诊流水
		* @param 	ZJHM	医保ic卡号
		* @param 	ZYH	住院号
		* @param 	XM	姓名
		* @param 	XB	性别
		* @param 	NL	年龄
		* @param 	ZY	职业
		* @param 	KSBM	科室编码
		* @param 	KSMC	科室名称
		* @param 	ZYZYRQ	准予住院日期
		* @param 	YJZYF	预交住院费金额
		* @param 	JZZDBM	"门诊诊断编码（主要诊断)"
		* @param 	MZZDMC	门诊诊断名称
		* @param 	BQ	病情
		* @param 	TW	体位
		* @param 	YSFS	运送方法
		* @param 	GL	隔离
		* @param 	WSCL	卫生处理
		* @param 	ZYRQ	住院日期
		* @param 	TSCLSY	特殊处理事由
		* @param 	LDCLYJ	领导处理意见
		* @param 	ZZYSGH	医生编号
		* @param 	ZZYSXM	医生姓名
		* @param 	JBR	经办人
		* @param 	DZ	工作单位及地址
		* @param 	ORG_CODE	机构编码
		* @param 	ZT	状态
		* @param 	FYLB	费用类别
	     * @return
	     */
	    
	    @RequestMapping(value="/editHospitalization",method = RequestMethod.POST)
	    @ResponseBody
	    public Object editHospitalization(){
	        logBefore(logger, "app查询出住院证信息（所有字段） 修改患者信息");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        try{
	        if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	           if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){	//检查参数
	        	   hospitalizationService.edit(pd);
	              result = "01";
	           }else {
	              result = "03";
	           }
	        }else{
	        		result = "05";
	        	}
	        }
	        catch (Exception e){
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	    }
	    
	    
	    /**
	     * app删除
	     * @param ID 主键、
	     * @param ZT  状态
	     * @return
	     */
	    
	    @RequestMapping(value="/delHospitalization",method = RequestMethod.POST)
	    @ResponseBody
	    public Object delHospitalization(){
	        logBefore(logger, "app查询出住院证（主键、状态）将状态改为9");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        String result = "00";
	        try{
	        	pd = this.getPageData();
	        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
	        	 if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){	//检查参数
	        	  hospitalizationService.delete(pd);
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
