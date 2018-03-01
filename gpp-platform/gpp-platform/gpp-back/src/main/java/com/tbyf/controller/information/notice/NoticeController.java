package com.tbyf.controller.information.notice;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsBroad;
import com.tbyf.entity.enums.EnumIsUrl;
import com.tbyf.entity.enums.EnumMessageType;
import com.tbyf.entity.enums.EnumNotice;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.entity.enums.EnumUserType;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.hm.devicepush.DevicePushManager;
import com.tbyf.service.information.notice.NoticeManager;
import com.tbyf.util.Const;
import com.tbyf.util.DateUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.jpush.entity.MemberMessage;
import com.tbyf.util.jpush.service.PushMessageService;

/**
 * 信息管理-通知公告
 * @author lh
 *
 */
@Controller
@RequestMapping(value="/notice")
public class NoticeController extends BaseController{
				
	@Resource(name="noticeService")
	private NoticeManager noticeService;
	@Resource(name="devicePushService")
	private DevicePushManager devicePushService;//推送关联Service
	@Resource(name="pushMessageService")
	private PushMessageService pushMessageService;//推送关联Service			
	/**
	 * 通知公告列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String STATE = pd.getString("STATE");
		if(null != STATE && !"".equals(STATE)){
			pd.put("STATE", STATE.trim());
		}else{
			pd.put("STATE", null);
		}
		String TYPE = pd.getString("TYPE");
		if(null != TYPE && !"".equals(TYPE)){
			pd.put("TYPE", TYPE.trim());
		}else{
			pd.put("TYPE", null);
		}
		String createdStart = pd.getString("start_time");	//开始时间
		String createdEnd = pd.getString("end_time");		//结束时间
		if(createdStart != null && !"".equals(createdStart)){
			pd.put("start_time", createdStart.trim());
		}
		if(createdEnd != null && !"".equals(createdEnd)){
			pd.put("end_time", createdEnd.trim());
		} 
		pd.put("EnumStatus", EnumStatus.toMap()); //状态（0：保存；1：启用；2：停用；9：删除）
		pd.put("EnumNotice", EnumNotice.toMap()); //类型（1：通知；2：公告）
		page.setPd(pd);
		List<PageData> varList = noticeService.list(page); // 列出通知公告列表
		mv.setViewName("information/notice/notice_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		pd.put("ID", this.get32UUID());					//主键
		pd.put("CREATETIME", df.format(new Date()));	//创建时间
		pd.put("UPDATETIME", df.format(new Date()));	//修改时间时间
		noticeService.save(pd);
		pd.put("TYPE", EnumUserType.DOCTOR.getCode());
		pd.put("ISBROAD", EnumIsBroad.YES.getCode());
		List<PageData> pdDevicePushList = devicePushService.findByUserType(pd);//获得用户设备的推送ID
		String[] res = new String[pdDevicePushList.size()];//推送的id数组 
		for(int i = 0; i <  pdDevicePushList.size(); i++) {
			res[i] = pdDevicePushList.get(i).get("DEVUSERID").toString();
		}
		if(null != res) {
			MemberMessage memberMessage = new MemberMessage();
			memberMessage.setIsUrl(EnumIsUrl.NO.getCode());//不带链接
			memberMessage.setType(EnumMessageType.NOTIFICTION.getCode());//推送类型通知
			memberMessage.setDeviceIdStr(res);//设备的推送ID列表
			memberMessage.setContent("来自" + Jurisdiction.getUser().getName() + "通知");//推送的内容
			memberMessage.setTitle("通知公告");
			memberMessage.setnID(pd.get("ID").toString());
			memberMessage.setTime(0);
			pushMessageService.sentBroadMessage(memberMessage);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 新增页面
	 */
	@RequestMapping(value="/add")
	public ModelAndView add() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				
		pd.put("CZR", user.getName());			//获取登录人姓名
		pd.put("CZRID", user.getUserId());			//获取登录人ID
		pd.put("CREATETIME", new Date());	//开始时间
		pd.put("UPDATETIME", df.format(new Date()));	//结束时间
		pd.put("EnumStatus", EnumStatus.toMap()); //状态（0：保存；1：启用；2：停用；9：删除）
		pd.put("EnumNotice", EnumNotice.toMap()); //类型（1：通知；2：公告）
		mv.addObject("pd", pd);
		mv.setViewName("information/notice/notice_edit");
		mv.addObject("msg", "save");
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"编辑");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATETIME", DateUtil.getTime());	//结束时间
		User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);				
		pd.put("CZR", user.getName());			//获取登录人姓名
		pd.put("CZRID", user.getUserId());			//获取登录人ID
		noticeService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 修改页面
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = noticeService.findById(pd);	//根据ID读取
		pd.put("EnumStatus", EnumStatus.toMap()); //状态（0：保存；1：启用；2：停用；9：删除）
		pd.put("EnumNotice", EnumNotice.toMap()); //类型（1：通知；2：公告）
		mv.addObject("pd", pd);
		mv.setViewName("information/notice/notice_edit");
		mv.addObject("msg", "edit");
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
		noticeService.delete(pd);
		out.write("success");
		out.close();
	}
	
}
