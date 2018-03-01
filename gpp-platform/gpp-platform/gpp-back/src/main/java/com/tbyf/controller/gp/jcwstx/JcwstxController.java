package com.tbyf.controller.gp.jcwstx;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumJcwstxLX;
import com.tbyf.entity.enums.EnumJcwstxZT;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jcwstx.JcwstxManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 基层卫生提醒
 * @author lizk
 * 2016-09-23
 *
 */
@Controller
@RequestMapping(value="/jcws")
public class JcwstxController extends BaseController{
		
	String menuUrl = "jcws/jcwstxList.do"; //菜单地址(权限用)
	@Resource(name="jcwstxService")
	private JcwstxManager jcwstxService;
	
	
	/**
	 * 基层卫生提醒列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/jcwstxList")
	public ModelAndView list(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"基层卫生提醒列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//标题检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String TXLX = pd.getString("TXLX");					//类型检索条件
		if(null != TXLX && !"".equals(TXLX)){
			pd.put("TXLX", TXLX.trim());
		}else{
			pd.put("TXLX", null);
		}
		String ZT = pd.getString("ZT");					//状态检索条件
		if(null != ZT && !"".equals(ZT)){
			pd.put("ZT", ZT.trim());
		}else{
			pd.put("ZT", null);
		}
		pd.put("ZT_DELETE", EnumJcwstxZT.DELETE.getCode());		//删除状态
		pd.put("ORG_CODE", getCurUser().getOrgCode());			//机构编码
		pd.put("enumJcwstxZT", EnumJcwstxZT.toMapNoDELETE());	//状态（没有删除）
		pd.put("EnumJcwstxLX", EnumJcwstxLX.toMap());			//提醒类型
		page.setPd(pd);

		List<PageData> varList = jcwstxService.list(page);
		mv.setViewName("gp/jcwstx/jcwstx_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;	
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAddJcwstx")
	public ModelAndView goAddU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("EnumJcwstxLX", EnumJcwstxLX.toMap());	//提醒类型
		pd.put("enumJcwstxZT", EnumJcwstxZT.toMapNoDELETE());	//状态（没有删除）
		mv.addObject("pd", pd);
		mv.setViewName("gp/jcwstx/jcwstx_add");
		mv.addObject("msg", "saveJcwstx");
		return mv;
	}
	
	/**保存新增基层卫生提醒
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveJcwstx")
	public ModelAndView saveU() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增基层卫生提醒信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());				//ID
		pd.put("ZT", EnumJcwstxZT.UNREAD.getCode());	//保存时，默认为未读状态
		pd.put("QKYSID", getCurUser().getProviderId());//全科医生ID
		pd.put("ORG_CODE", getCurUser().getOrgCode());	//机构编码
		pd.put("REGION_CODE", getCurUser().getRegionCode());//区划编码
		jcwstxService.save(pd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		return mv;
	}
	
	/**去修改页面
	 * @return
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEditXywh() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = jcwstxService.findById(pd);					//根据ID读取
//			List<PageData> listPd = attachmentService.findByBusinessID(pd);
//			mv.addObject("listPd", listPd);
			pd.put("EnumJcwstxLX", EnumJcwstxLX.toMap());			//提醒类型
			pd.put("enumJcwstxZT", EnumJcwstxZT.toMapNoDELETE());	//状态(没有删除状态)
			mv.setViewName("gp/jcwstx/jcwstx_add");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**修改保存基层卫生提醒
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView editJmxx() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改保存基层卫生提醒信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QKYSID", getCurUser().getProviderId());//全科医生ID
		pd.put("ORG_CODE", getCurUser().getOrgCode());	//机构编码
		pd.put("REGION_CODE", getCurUser().getRegionCode());//区划编码
		jcwstxService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**查看基层卫生提醒服务信息
	 * @return
	 */
	@RequestMapping(value="/goSeeJcwstx")
	public ModelAndView goSeeXywh() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData pd1 = jcwstxService.findById(pd);					//根据ID读取
			pd1.put("enumJcwstxZT", EnumJcwstxZT.toMap());				//状态
			pd1.put("enumJcwstxLX", EnumJcwstxLX.toMap());
			mv.setViewName("gp/jcwstx/jcwstx_view");
			mv.addObject("pd", pd1);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**单条基层卫生提醒修改状态（0：未读，1：已读，9：删除）
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/editZT")
	public void read(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"单条修改基层卫生提醒状态");
		PageData pd = new PageData();
		pd = this.getPageData();
		String msg = pd.getString("MSG");
		if(null != msg && "0".equals(msg)){//msg为0
			pd.put("ZT", EnumJcwstxZT.UNREAD.getCode());// 则将状态改为未读状态
		}else if(null != msg && "1".equals(msg)){//msg为1
			pd.put("ZT", EnumJcwstxZT.READ.getCode());// 则将状态改为已读状态
		}else if(null != msg && "9".equals(msg)){//msg为9
			pd.put("ZT", EnumJcwstxZT.DELETE.getCode());// 则将状态改为删除状态
		}
		jcwstxService.editZT(pd);
		out.write("success");
		out.close();
	}
	
	/**单条标记未读
	 * @param out
	 * @throws Exception 
	 
	@RequestMapping(value="/unRead")
	public void unRead(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"标记未读");
		PageData pd = new PageData();
		pd = this.getPageData();
		jcwstxService.unRead(pd);
		out.write("success");
		out.close();
	}
	*/
	
	/**批量删除基层卫生提醒
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, Jurisdiction.getUsername()+"批量删除基层卫生提醒信息");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String str = pd.getString("ids");
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("ID", id);
				pd.put("ZT", EnumJcwstxZT.DELETE.getCode());//删除状态
				jcwstxService.editZT(pd);
			}
			pd.put("msg", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**批量标记为未读
	 * @return
	 
	@RequestMapping(value="/unReadAll")
	@ResponseBody
	public Object unReadAll() {
		logBefore(logger, Jurisdiction.getUsername()+"批量标记已读");
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String ids = pd.getString("ids");
			if(null != ids && !"".equals(ids)){
				String ArrReadAll[] = ids.split(",");
				jcwstxService.unReadAll(ArrReadAll);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	*/
}
