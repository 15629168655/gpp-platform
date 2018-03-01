package com.tbyf.controller.gp.jkzx;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumIsUrl;
import com.tbyf.entity.enums.EnumIsZxMsg;
import com.tbyf.entity.enums.EnumMessageType;
import com.tbyf.entity.system.User;
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.jkzx.JkzxManager;
import com.tbyf.service.hm.devicepush.DevicePushManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Const;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;
import com.tbyf.util.jpush.entity.MemberMessage;
import com.tbyf.util.jpush.service.PushMessageService;

/**
 * 健康咨询
 * @author zhangy
 *
 */
@Controller
@RequestMapping(value="/jkzx")
public class JkzxController extends BaseController {
    
	@Resource(name="jkzxService")
	private JkzxManager jkzxService;
	@Resource(name="devicePushService")
	private DevicePushManager devicePushService;//推送关联Service
	@Resource(name="pushMessageService")
	private PushMessageService pushMessageService;//推送关联Service
	
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
//		if(null!=pd.getString("end")&&!"".equals(pd.getString("end"))){
//			pd.put("end1", pd.getString("end")+" 23:59:59");
//		}
		page.setPd(pd);
		try {
			List<PageData>	list = jkzxService.list(page);
			mv.setViewName("gp/jkzx/jkzx_list");
			mv.addObject("list", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
    }
	@RequestMapping(value="/toAddPage")
	public ModelAndView toAddPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("gp/jkzx/jkzx_add");
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增健康咨询信息");
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd.put("CONSULTATION_ID", this.get32UUID());
		pd.put("INFOTYPE", "0");
		pd.put("ISFINISH", "0");
		pd.put("USERID", user.getUserId());
		pd.put("ISZXMSG", EnumIsZxMsg.YES.getCode());
		PageData pdDevicePush = devicePushService.findByUserID(pd);//获得用户设备的推送ID
		if(null != pdDevicePush) {
			MemberMessage memberMessage = new MemberMessage();
			memberMessage.setIsUrl(EnumIsUrl.NO.getCode());//不带链接的
			memberMessage.setType(EnumMessageType.CONSULT.getCode());
			memberMessage.setDeviceId(pdDevicePush.get("DEVUSERID").toString());//设备的推送ID
			memberMessage.setContent("来自" + pd.get("PERSON_NAME").toString() + "咨询");//推送的内容
			memberMessage.setTitle("咨询消息");
			memberMessage.setCONSULTATION_ID(pd.get("CONSULTATION_ID").toString());
			pushMessageService.sentStopMessage(memberMessage);
		}
		jkzxService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delObject")
	@ResponseBody
	public Object delObject(){
		logBefore(logger, Jurisdiction.getUsername()+"删除健康咨询信息");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		try {
			jkzxService.delete(pd);
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	/**批量删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		logBefore(logger, Jurisdiction.getUsername()+"批量删除健康咨询");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
			for(String id:ids){
				pd.put("CONSULTATION_ID", id);
				jkzxService.delete(pd);
			}
			map.put("msg", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "FAIL");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		jkzxService.editObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="/toScore")
	public ModelAndView toScore() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.addObject("pd", pd);
		mv.setViewName("gp/jkzx/jkzx_score");
		return mv;
	}
	@RequestMapping(value="/score")
	public ModelAndView score() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"健康咨询评分");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		jkzxService.editObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="/toAnswer")
	public ModelAndView toAnswer() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		List<PageData> list = jkzxService.findContent(pd);
		mv.addObject("list", list);
		mv.addObject("pd", pd);
		mv.setViewName("gp/jkzx/jkzx_answer");
		return mv;
	}
	/**
	 * 应答
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveAnswer")
	public void saveAnswer(PrintWriter out) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		String consultation = pd.getString("CONSULTATION_ID");
		String send_content = pd.getString("SEND_CONTENT");
		pd.put("CONSULTATION_ID",consultation);
		List<PageData> list = jkzxService.findById(pd);
		if(list!=null&&list.size()>0){
		pd.put("INFOTYPE", "1"); //已回答
		jkzxService.editObj(pd);
//		List<PageData> list = jkzxService.findContent(pd);
//		mv.addObject("list", list);
		PageData askPd = new PageData();
		askPd.put("ID", this.get32UUID());
		askPd.put("CONSULTATION_ID", consultation);
		askPd.put("SEND_ROLE", "1");  //角色 0：患者，1：医生
		askPd.put("SEND_CONTENT", send_content);	
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);		
		askPd.put("SEND_ID", user.getProviderId());
		askPd.put("SEND_NAME", user.getProviderName());
		jkzxService.saveContent(askPd);
		pd.put("USERID", askPd.get("SEND_ID"));
		PageData pdDevicePush = devicePushService.findByUserID(pd);//获得用户设备的推送ID
		if(null != pdDevicePush) {
			MemberMessage memberMessage = new MemberMessage();
			memberMessage.setIsUrl(EnumIsUrl.NO.getCode());//带连接的
			memberMessage.setType(EnumMessageType.CONSULT.getCode());
			memberMessage.setDeviceId(pdDevicePush.get("DEVUSERID").toString());//设备的推送ID
			memberMessage.setContent("来自" + pd.get("SEND_NAME").toString() + "医生回复");//推送的内容
			memberMessage.setTitle("回复消息");
			memberMessage.setCONSULTATION_ID(consultation);
			pushMessageService.sentConsultMessage(memberMessage);
		}
		out.write("success");
		}else {
			out.close();
		}
		out.close();
}
	/**
	 * 资讯完结
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/endAnswer")
	public ModelAndView endAnswer() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"资讯完结");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String consultation = pd.getString("CONSULTATION_ID");
		pd.put("CONSULTATION_ID",consultation);
		List<PageData> list = jkzxService.findById(pd);
		pd.put("ISFINISH", "1"); //已完结
		jkzxService.editObj(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
}
	
 