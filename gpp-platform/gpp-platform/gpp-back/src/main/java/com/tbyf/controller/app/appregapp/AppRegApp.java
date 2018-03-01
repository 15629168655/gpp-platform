package com.tbyf.controller.app.appregapp;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.service.hm.regapp.RegAppDocManager;
import com.tbyf.service.hm.regapp.RegAppSManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;

/**预约申请接口
  * 下午2:51:43 zanxc
  * @author zanxc
  * 00	请求失败
  * 01	请求成功
  * 02	返回空值
  * 03	请求协议参数不完整    
  * 04  用户名或密码错误
  * 05  FKEY验证失败
 */
@Controller
@RequestMapping(value="/appRegApp")
public class AppRegApp extends BaseController{

	@Resource(name="regAppDocService")
	private RegAppDocManager regAppDocService;
	@Resource(name="regAppSService")
	private RegAppSManager regAppSService;
	/**医生信息注册接口
	 * 
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save() {
		logBefore(logger, "app通过医院的编码等信息注册医生的预约信息");
		PageData pd = new PageData();//接收的数据
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		String result = "00";
		try {
			if(AppUtil.checkParam("saveRegapp", pd)) {//检查参数
				//String SCHEDULING = pd.get("SCHEDULING").toString();//可约排班
				pd.put("GUID",Integer.parseInt(regAppDocService.getMaxGUID(pd).get("GUID").toString()) + 1);//生成主键
				regAppDocService.save(pd);
				map.put("pd", pd);
				result = (null == pd) ?  "02" :  "01";
				
			}
			else {
				result = "03";
			}
		} catch (Exception e) {
			 logger.error(e.toString(), e);
		}finally{
            map.put("result", result);
            logAfter(logger);
        }
		return AppUtil.returnObject(new PageData(), map);
	}
	/**医生信息编辑接口
	 * 
	 * @return
	 */
	@RequestMapping(value="/deit")
	@ResponseBody
	public Object edit() {
		logBefore(logger, "app通过医院编码医生姓名更新医生预约信息");
		PageData pd = new PageData();//接收的数据
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		String result = "00";
		try {
			if(AppUtil.checkParam("editRegapp", pd)) {//检查参数
				PageData pdDoc = regAppDocService.findByHospitialCodeAndDoctorCode(pd);//检验是否存在该医生
				if(pdDoc == null || pdDoc.size() == 0) {
					
					result = "02";
				}
				else {
					map.put("pd", pd);
					regAppDocService.update(pd);
				}
			}
			else {
				result = "03";
			}
		} catch (Exception e) {
			 logger.error(e.toString(), e);
		}finally{
            map.put("result", result);
            logAfter(logger);
        }
		return AppUtil.returnObject(new PageData(), map);
	}
	/**显示医生详情接口
	 * 
	 */
	@RequestMapping(value="/showInfo")
	@ResponseBody
	public Object showInfo() {
		logBefore(logger, "app通过医院编码和医生编码查询医生的信息");
		PageData pd = new PageData();//接收的数据
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		String result = "00";
		try {
			if(AppUtil.checkParam("showInfoRegapp", pd)) {//检查参数
				pd = regAppDocService.findByHospitialCodeAndDoctorCode(pd);//通过医院编码和医生编码查询医生的信息
				map.put("pd", pd);
				result = (null == pd) ?  "02" :  "01";
				
			}
			else {
				result = "03";
			}
		} catch (Exception e) {
			 logger.error(e.toString(), e);
		}finally{
            map.put("result", result);
            logAfter(logger);
        }
		return AppUtil.returnObject(new PageData(), map);
	}
	/**医生排班表的注册
	 * 
	 * @return
	 */
	@SuppressWarnings("null")
	@RequestMapping(value="/arrangement")
	@ResponseBody
	public Object arrangement() {
		logBefore(logger, "app通过医院编码和医生编码注册医生预约的排班表");
		PageData pd = new PageData();//接收的数据
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		String result = "00";
		try {
			if(AppUtil.checkParam("arrangementRegapp", pd)) {//检查参数
				pd.put("GUID",Integer.parseInt(regAppSService.getMaxGUID(pd).get("GUID").toString()) + 1);//生成主键
				PageData pdDoc = regAppDocService.findByHospitialCodeAndDoctorCode(pd);		//判断是否有医生的信息
				PageData pdre =regAppSService.reSubmit(pd);		//判断是否重复提交了
				if(pdDoc == null || pdDoc.size() == 0 ) {
					result = "02";
				}
				else if( pdre == null || pdre.size() == 0) {
					//保存医生排班表
					regAppSService.save(pd);
					//得到新的可以约量
					int SCHEDULING = Integer.parseInt(pd.get("SCHEDULING").toString()) + Integer.parseInt(pdDoc.get("SCHEDULING").toString());
					//更新医生的可预约量
					pdDoc.remove("SCHEDULING");
					pdDoc.put("SCHEDULING", SCHEDULING);
					regAppDocService.update(pdDoc);
					map.put("pd", pd);
					result =  "01";
				}
				
				
			}
			else {
				result = "03";
			}
		} catch (Exception e) {
			 logger.error(e.toString(), e);
		}finally{
            map.put("result", result);
            logAfter(logger);
        }
		return AppUtil.returnObject(new PageData(), map);
	}
	@RequestMapping(value="/editArrangement")
	@ResponseBody
	public Object editArrangement() {
		logBefore(logger, "app通过医院编码和医生编码修改医生预约的排班表");
		PageData pd = new PageData();//接收的数据
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		String result = "00";
		try {
			if(AppUtil.checkParam("editArrangementRegapp", pd)) {//检查参数
				
				PageData pdDoc = regAppDocService.findByHospitialCodeAndDoctorCode(pd);		//判断是否有医生的信息
				PageData pds =regAppSService.reSubmit(pd);		//获得已提交的数据
				if(pds == null || pds.size() == 0) {
					result = "02";
				}
				else {
				
					//保存医生排班表
					regAppSService.update(pds);
					//得到新的可以约量
					int SCHEDULING = Integer.parseInt(pd.get("SCHEDULING").toString()) 
							+ Integer.parseInt(pdDoc.get("SCHEDULING").toString())
							- Integer.parseInt(pds.get("SCHEDULING").toString());
					//更新医生的可预约量
					pdDoc.remove("SCHEDULING");
					pdDoc.put("SCHEDULING", SCHEDULING);
					regAppDocService.update(pdDoc);
					
				}
				
				map.put("pd", pd);
				result = (null == pd) ?  "02" :  "01";
			}
			else {
				result = "03";
			}
		} catch (Exception e) {
			 logger.error(e.toString(), e);
		}finally{
            map.put("result", result);
            logAfter(logger);
        }
		return AppUtil.returnObject(new PageData(), map);
	}
}
