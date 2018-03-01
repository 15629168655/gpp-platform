package com.tbyf.controller.information.versionManage;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumVersion;
import com.tbyf.entity.enums.EnumVersionStatus;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.information.versionManage.VersionService;
import com.tbyf.service.system.user.UserManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;

/**
 * 信息管理-版本管理
 * @author pengkai
 *
 */
@Controller
@RequestMapping(value="/version")
public class VersionController extends BaseController{
				
	@Resource(name="versionService")
	private VersionService versionService;
	@Resource(name="userService")
	private UserManager userService;
	/**
	 * 版本管理列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String TYPE = pd.getString("TYPE");//类型
		if(null != TYPE && !"".equals(TYPE)){
			pd.put("TYPE", TYPE.trim());
		}
		String DOWNLOAD_URL =  pd.getString("DOWNLOAD_URL");//下载地址
		if(null !=DOWNLOAD_URL && !"".equals(DOWNLOAD_URL)){
			pd.put("DOWNLOAD_URL", DOWNLOAD_URL.trim());
		}
		String VERSIONCODE = pd.getString("VERSIONCODE");//版本号
		if(null !=VERSIONCODE && !"".equals(VERSIONCODE)){
			pd.put("VERSIONCODE", VERSIONCODE.trim());
		}
		String GROUND_TIME =  pd.getString("GROUND_TIME");//上架时间
		if(null !=GROUND_TIME && !"".equals(GROUND_TIME)){
			pd.put("GROUND_TIME", GROUND_TIME.trim());
		}
		String CREATEMAN = Jurisdiction.getUser().getUserId();//创建人
		String CREATE_TIME = pd.getString("CREATE_TIME");//创建时间
		if(CREATEMAN != null && !"".equals(CREATEMAN)){
			pd.put("CREATEMAN", CREATEMAN.trim());
		}
		
		if(CREATE_TIME != null && !"".equals(CREATE_TIME)){
			pd.put("CREATE_TIME", CREATE_TIME.trim());
		}
		String createdStart = pd.getString("start_time");	//开始时间
		String createdEnd = pd.getString("end_time");		//结束时间
		if(createdStart != null && !"".equals(createdStart)){
			pd.put("start_time", createdStart.trim());
		}
		if(createdEnd != null && !"".equals(createdEnd)){
			pd.put("end_time", createdEnd.trim());
		} 
		pd.put("EnumVersion", EnumVersion.toMap()); //类型（1：android；2：ios）
		pd.put("EnumVersionStatus", EnumVersionStatus.toMap());//是否强制更新
		page.setPd(pd);
		List<PageData> varList = versionService.list(page); //版本管理列表
		String DATA_ID = "";
		String IDS[] = null;
		if(!CollectionUtils.isEmpty(varList)){
			for(int i = 0;i<varList.size();i++){
					DATA_ID += ","+varList.get(i).getString("CREATEMAN");
					if(DATA_ID != null && "" != DATA_ID){
						IDS = DATA_ID.split(",");
					}
			}
		}
		List<PageData> userList = versionService.queryUserById(IDS);
		pd.put("userList", userList);
		mv.setViewName("information/versionManage/version_list");
		mv.addObject("varList", varList);
		//mv.addObject("userList", userList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	/**
	 * 跳入新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String id = user.getUserId();
		pd.put("NAME", user.getName());			//获取登录人姓名
		pd.put("TYPE", 1);//类型默认为1
		pd.put("EnumVersion", EnumVersion.toMap()); //类型（1：ios；2：android）
		pd.put("DOWNLOAD_URL", pd.getString("DOWNLOAD_URL"));//下载地址
		pd.put("VERSIONCODE", pd.getString("VERSIONCODE"));//版本号
		pd.put("GROUND_TIME", new Date());	//上架时间
		pd.put("OFFICIALCONTENT", pd.getString("OFFICIALCONTENT"));	//文案说明
		pd.put("MEMO", pd.getString("MEMO"));	//备份说明
		pd.put("ISFORCE", 1);
		pd.put("EnumVersionStatus", EnumVersionStatus.toMap());//是否强制更新
		pd.put("CREATE_TIME",  new Date());	//创建时间
		mv.addObject("pd", pd);
		mv.setViewName("information/versionManage/version_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**
	 * 增加版本管理
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		pd.put("ID", this.get32UUID());	//主键
		pd.put("TYPE", pd.getString("TYPE"));//类型
		pd.put("DOWNLOAD_URL", pd.getString("DOWNLOAD_URL"));//下载地址
		pd.put("VERSIONCODE", pd.getString("VERSIONCODE"));//版本号
		pd.put("GROUND_TIME",pd.getString("GROUND_TIME"));//上架时间
		pd.put("OFFICIALCONTENT", pd.getString("OFFICIALCONTENT"));//文案说明
		pd.put("MEMO", pd.getString("MEMO"));//备份说明
		pd.put("ISFORCE", pd.getString("ISFORCE"));//是否强制更新
		pd.put("CREATEMAN", user.getUserId());//创建人
		pd.put("CREATE_TIME",pd.getString("CREATE_TIME"));//创建时间
		versionService.save(pd);//保存功能
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 跳入修改页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = versionService.findById(pd);	//根据ID读取
		pd.put("EnumVersion", EnumVersion.toMap()); //类型（1：android；2：ios）
		pd.put("EnumVersionStatus", EnumVersionStatus.toMap());//是否强制更新
		mv.addObject("pd", pd);
		mv.setViewName("information/versionManage/version_edit");
		mv.addObject("msg", "edit");
		return mv;
	}
	
	/**
	 * 修改版本管理
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"编辑");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		pd.put("ID",pd.getString("ID"));//主键
		pd.put("TYPE", pd.getString("TYPE"));//类型
		pd.put("DOWNLOAD_URL", pd.getString("DOWNLOAD_URL"));//下载地址
		pd.put("VERSIONCODE", pd.getString("VERSIONCODE"));//版本号
		pd.put("GROUND_TIME",pd.getString("GROUND_TIME"));//上架时间
		pd.put("OFFICIALCONTENT", pd.getString("OFFICIALCONTENT"));//文案说明
		pd.put("MEMO", pd.getString("MEMO"));//备份说明
		pd.put("ISFORCE", pd.getString("ISFORCE"));//是否强制更新
		pd.put("CREATEMAN", pd.getString("CREATEMAN"));//创建人
		pd.put("CREATE_TIME",pd.getString("CREATE_TIME"));//创建时间
		versionService.edit(pd);//修改功能
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除");
		PageData pd = new PageData();
		pd = this.getPageData();
		versionService.delete(pd);//删除功能
		out.write("success");
		out.close();
	}
	
	/**
	 * 批量删除版本管理信息
	 * @return
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除版本信息");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			versionService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
}
