package com.tbyf.controller.gp.ServicePack;


import java.io.PrintWriter;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumServicePackLX;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.servicePack.impl.ServicePackService;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 服务包
 * @author lizk
 * 2016-11-17
 *
 */
@Controller
@RequestMapping(value="/servicePack")
public class ServicePackController extends BaseController{
		
	String menuUrl = "servicePack/list.do"; //菜单地址(权限用)
	@Resource(name="servicePackService")
	private ServicePackService servicePackService;
	
	/**
	 * 服务包列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"服务包列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String MC = pd.getString("MC");				//名称检索条件
		if(null != MC && !"".equals(MC)){
			pd.put("MC", MC.trim());
		}
		String BM = pd.getString("BM");				//编码检索条件
		if(null != BM && !"".equals(BM)){
			pd.put("BM", BM.trim());
		}
		String LX = pd.getString("LX");					//类型检索条件
		if(null != LX && !"".equals(LX)){
			pd.put("LX", LX.trim());
		}else{
			pd.put("LX", null);
		}
		String ZT = pd.getString("ZT");					//状态检索条件
		if(null != ZT && !"".equals(ZT)){
			pd.put("ZT", ZT.trim());
		}else{
			pd.put("ZT", null);
		}
		pd.put("EnumStatus", EnumStatus.toMap());               	//状态(与协议内容表状态一个枚举)
		pd.put("EnumServicePackLX", EnumServicePackLX.toMap()); 	//类型
		pd.put("EnumStatus", EnumStatus.toMapNoDELETE());			//状态（不显示删除）
		pd.put("ZT_SC", EnumStatus.DELETE.getCode());				//枚举 ，状态--删除
		page.setPd(pd);
		List<PageData> varList = servicePackService.list(page);
		mv.setViewName("gp/servicePack/servicePack_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAddU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EnumServicePackLX", EnumServicePackLX.toMap()); 	//类型
		mv.setViewName("gp/servicePack/servicePack_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存新增服务包
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增服务包信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String ID = this.get32UUID();
		pd.put("ID", ID);									//ID
		pd.put("ZT_BC", EnumStatus.SAVE.getCode());			//枚举，保存状态
		if(null != pd.getString("NR") && !"".equals(pd.getString("NR"))){			
			byte[] NR = pd.getString("NR").getBytes();//将blob类型转换
			pd.put("NR", NR);//内容
		}
		servicePackService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断编码是否存在，确保唯一
	 * @return
	 */
	@RequestMapping(value="/hasBM")
	@ResponseBody
	public Object hasBM(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String ID = pd.getString("ID");				//新增或编辑页面传过来的ID
			String BMNew = pd.getString("BM"); 			//新增或编辑时，页面编码框传过来的编码
			if(servicePackService.findByBM(pd) != null){
				errInfo = "error";
			}
			if(null != ID && !"".equals(ID)){					//若ID为空，则说明是新增，不需要通过ID查找
				PageData pd1 = servicePackService.findById(pd);	//根据ID读取
				String BMold = pd1.getString("BM");				//通过ID从数据库获取到的编码
				if(BMold.equals(BMNew)){						//修改服务包时，判断编码框中的值跟原来的是否一样
					errInfo = "success";
				}
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**去修改信息页面
	 * @return
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = servicePackService.findById(pd);						//根据ID读取
			Object NR = pd.get("NR");
			String str = null;  
	        byte[] inbyte=null;  
	        if(NR instanceof Blob){  
	            Blob blob = (Blob) NR;  
	            if (blob != null) {  
	                inbyte = blob.getBytes(1, (int) blob.length());  
	            }  
	            str =new String (inbyte);  
	        }
	        pd.put("NR", str);
			pd.put("EnumServicePackLX", EnumServicePackLX.toMap()); 	//类型
			mv.setViewName("gp/servicePack/servicePack_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改服务包");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(null != pd.getString("NR") && !"".equals(pd.getString("NR"))){			
			byte[] NR = pd.getString("NR").getBytes();//将blob类型转换
			pd.put("NR", NR);//内容
		}
		servicePackService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**启用
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/goqy")
	public void goqy(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"启用服务包");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT", EnumStatus.ENABLE.getCode());		//启用状态
		servicePackService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**停用
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/goty")
	public void goty(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"停用服务包");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT", EnumStatus.DISABLE.getCode());		//停用用状态
		servicePackService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改状态为删除
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改状态为删除");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ZT", EnumStatus.DELETE.getCode());				//枚举 ，状态--删除
		servicePackService.delete(pd);
		out.write("success");
		out.close();
	}
	
}
