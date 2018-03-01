package com.tbyf.controller.app.patient;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.gp.patient.PatientManager;
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
@RequestMapping(value="/apppatient")
public class IntPatientConteoller extends BaseController{
	
	@Resource(name="patientService")
	private PatientManager patientService;
	
	/**
     * app查询 
     * @param pageSize 页码 ，pageCount 当前页数，XM 姓名 ，CSRQ 出生日期，XB 性别，JKKH  健康卡号, ZJHM  证件号码,YLJGDM 医疗机构代码
     * @return
     */
	
	@RequestMapping(value="/queryPage",method = RequestMethod.GET)
    @ResponseBody
    public Object queryPage()
    {
        logBefore(logger, "app通过过滤条件（姓名、出生日期、性别、健康卡号、证件号码）对患者信息表（TB_YL_PATIENT_INFORMATION）分页查询接口");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{  
        	//如果不传分页参数，给默认值。
    		int pageSize=1;//页码
    		int pageCount=10;//页数
    		if(Tools.checkKey("YLJGDM", pd.getString("FKEY"))){	//检验请求key值是否合法
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
		List<PageData> list = patientService.queryPage(pd);
    	map.put("pd", list);
        result = "01";
        } catch (Exception e){
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
	
	/**
    * app患者信息新增
	* @param 	KH	卡号
	* @param 	KLX	卡类型
	* @param 	YLJGDM	医疗机构代码
	* @param 	JKKH	健康卡号
	* @param 	FKDQ	发卡地区：社保卡发卡地区的编号
	* @param 	ZJHM	证件号码
	* @param 	ZJLX	身份证件类别
	* @param 	XB	性别
	* @param 	XM	姓名
	* @param 	HZGSD	患者归属地编码
	* @param 	HYZK	婚姻状况
	* @param 	CSRQ	出生日期
	* @param 	CSD	出生地编码
	* @param 	MZ	民族
	* @param 	GJ	国籍
	* @param 	DHHM	电话号码
	* @param 	SJHM	手机号码
	* @param 	GZDWYB	工作单位邮编
	* @param 	GZDWMC	工作单位名称
	* @param 	GZDWDZ	工作单位地址
	* @param 	JZDZ	居住地址
	* @param 	HKDZ	户口地址
	* @param 	HKDZYB	户口地址邮编
	* @param 	LXRXM	联系人姓名
	* @param 	LXRGX	联系人与患者的关系
	* @param 	LXRDZ	联系人地址
	* @param 	LXRYB	联系人邮编
	* @param 	LXRDH	联系人电话
	* @param 	MJ	密级
	* @param 	PERSONID	院内患者唯一id号
	* @param 	YLYL1	预留一
	* @param 	YLYL2	预留一
    * @return
    */
	
    @RequestMapping(value="/addPatient",method = RequestMethod.POST)
    @ResponseBody
    public Object addPatient(){
        logBefore(logger, "app通过患者信息（所有字段）生成患者信息表记录");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        if(Tools.checkKey("XM", pd.getString("FKEY"))){	//检验请求key值是否合法
           if(AppUtil.checkParam("addPatient", pd)){	//检查参数
        	   pd.put("ID", this.get32UUID());	//ID
       		   pd.put("XGBZ", "0");
       		patientService.save(pd);
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
     * app修改信息
     * @param 	ID	主键
 	* @param 	KH	卡号
 	* @param 	KLX	卡类型
 	* @param 	YLJGDM	医疗机构代码
 	* @param 	JKKH	健康卡号
 	* @param 	FKDQ	发卡地区：社保卡发卡地区的编号
 	* @param 	ZJHM	证件号码
 	* @param 	ZJLX	身份证件类别
 	* @param 	XB	性别
 	* @param 	XM	姓名
 	* @param 	HZGSD	患者归属地编码
 	* @param 	HYZK	婚姻状况
 	* @param 	CSRQ	出生日期
 	* @param 	CSD	出生地编码
 	* @param 	MZ	民族
 	* @param 	GJ	国籍
 	* @param 	DHHM	电话号码
 	* @param 	SJHM	手机号码
 	* @param 	GZDWYB	工作单位邮编
 	* @param 	GZDWMC	工作单位名称
 	* @param 	GZDWDZ	工作单位地址
 	* @param 	JZDZ	居住地址
 	* @param 	HKDZ	户口地址
 	* @param 	HKDZYB	户口地址邮编
 	* @param 	LXRXM	联系人姓名
 	* @param 	LXRGX	联系人与患者的关系
 	* @param 	LXRDZ	联系人地址
 	* @param 	LXRYB	联系人邮编
 	* @param 	LXRDH	联系人电话
 	* @param 	MJ	密级
 	* @param 	PERSONID	院内患者唯一id号
 	* @param 	YLYL1	预留一
 	* @param 	YLYL2	预留一
     * @return
     */
    
    @RequestMapping(value="/editPatient",method = RequestMethod.POST)
    @ResponseBody
    public Object editPatient(){
        logBefore(logger, "app查询出患者信息（所有字段） 修改患者信息");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
           if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){	//检查参数
        	   patientService.edit(pd);
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
     * app患者信息删除
     * @param ID 主键、
     * @param XGBZ 修改标识
     * @return
     */
    
    @RequestMapping(value="/delPatient",method = RequestMethod.POST)
    @ResponseBody
    public Object delPatient(){
        logBefore(logger, "app查询出患者信息（主键、修改标识）将修改标识改为1");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String result = "00";
        try{
        	if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
          if(null!=pd.getString("ID") && !pd.getString("ID").equals("")){	//检查参数
        	  patientService.delete(pd);
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
