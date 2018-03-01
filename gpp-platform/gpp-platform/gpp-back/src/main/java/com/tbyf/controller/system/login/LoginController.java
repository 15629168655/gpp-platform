package com.tbyf.controller.system.login;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.system.Menu;
import com.tbyf.entity.system.Role;
import com.tbyf.entity.system.User;
import com.tbyf.service.hm.organization.OrganizationManager;
import com.tbyf.service.system.appuser.AppuserManager;
import com.tbyf.service.system.buttonrights.ButtonrightsManager;
import com.tbyf.service.system.fhbutton.FhbuttonManager;
import com.tbyf.service.system.menu.MenuManager;
import com.tbyf.service.system.role.RoleManager;
import com.tbyf.service.system.user.UserManager;
import com.tbyf.util.*;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 总入口
 * 修改日期：2015/11/2
 */
@Controller
public class LoginController extends BaseController {

	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="buttonrightsService")
	private ButtonrightsManager buttonrightsService;
	@Resource(name="fhbuttonService")
	private FhbuttonManager fhbuttonService;
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	@Resource(name="organizationService")
	private OrganizationManager organizationService;

	/**访问登录页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tologin/{loginPath}")
	public ModelAndView toLogin(@PathVariable String loginPath)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		if(loginPath.equals("adminLogin")){
			mv.setViewName("system/index/login");
		}else {
			mv.setViewName("hm/index/login");
		}
		mv.addObject("pd",pd);
		return mv;
	}

	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login/{loginPath}" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login(@PathVariable String loginPath)throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String USERNAME = pd.getString("loginname");	//登录过来的用户名
		String PASSWORD  = pd.getString("password");	//登录过来的密码
		String code = "dddd";//pd.getString("code");
		if(Tools.notEmpty(USERNAME)&&Tools.notEmpty(PASSWORD)&&Tools.notEmpty(code)){
			Session session = Jurisdiction.getSession();
			String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);		//获取session中的验证码

			if(null == code || "".equals(code)){//判断效验码
				errInfo = "nullcode"; 			//效验码为空
			}else{

				pd.put("USERNAME", USERNAME);
				//if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)){		//判断登录验证码
				if(Tools.notEmpty(sessionCode)){		//判断登录验证码
					if(loginPath.equals("adminLogin")) {
						pd.put("PASSWORD", new SimpleHash("SHA-1", USERNAME, PASSWORD).toString());
						pd = userService.getUserByNameAndPwd(pd);    //根据用户名和密码去读取用户信息
					}else if(loginPath.equals("login")){
						pd.put("PASSWORD", MD5.md5(PASSWORD));
						pd = appuserService.getUserByNameAndPwd(pd);    //根据用户名和密码去读取用户信息
					}
					if(pd != null){
						User user = new User();
						user.setUserId(pd.getString("USER_ID"));
						user.setUserName(pd.getString("USERNAME"));
						user.setPassword(pd.getString("PASSWORD"));
						user.setName(pd.getString("NAME"));
						user.setRights(pd.getString("RIGHTS"));
						user.setRoleId(pd.getString("ROLE_ID"));
						user.setLastLogin(pd.getString("LAST_LOGIN"));
						user.setIp(pd.getString("IP"));
						user.setStatus(pd.getString("STATUS"));

						pd.put("LAST_LOGIN",DateUtil.getTime().toString());
						if(loginPath.equals("adminLogin")) {
							userService.updateLastLogin(pd);
						}else if(loginPath.equals("login")){
							appuserService.updateLastLogin(pd);
							user.setDeptId(pd.getString("DEP_ID"));
							user.setDeptName(pd.getString("DEP_NAME"));
							
							String orgCode = pd.getString("ORG_CODE");
							//设置区划编码：通过机构编码获取机构区划编码
							user.setRegionCode(this.organizationService.getOrgRegionCodeByOrgCode(orgCode));
							
							user.setOrgCode(orgCode);
							
							user.setOrgName(pd.getString("ORG_NAME"));
							user.setPhone(pd.getString("PHONE"));
							user.setProviderId(pd.getString("PROVIDER_ID"));
							user.setProviderCode(pd.getString("PROVIDER_CODE"));
							user.setProviderName(pd.getString("PROVIDER_NAME"));
							user.setTelecom(pd.getString("TELECOM"));
						}

						session.setAttribute(Const.SESSION_USER, user);			//把用户信息放session中
						session.removeAttribute(Const.SESSION_SECURITY_CODE);	//清除登录验证码的session
						//shiro加入身份验证
						Subject subject = SecurityUtils.getSubject();
						UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD);
						try {
							subject.login(token);
						} catch (AuthenticationException e) {
							errInfo = "身份验证失败！";
						}
					}else{
						errInfo = "usererror"; 				//用户名或密码有误
						logBefore(logger, USERNAME+"登录系统密码或用户名错误");
					}
				}else{
					errInfo = "codeerror";				 	//验证码输入有误
				}
				if(Tools.isEmpty(errInfo)){
					errInfo = "success";					//验证成功
					logBefore(logger, USERNAME+"登录系统");
				}
			}
		}else{
			errInfo = "error";	//缺少参数
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**访问系统首页
	 * @param changeMenu：切换菜单参数
	 * @return
	 */
	@RequestMapping(value="/main/{changeMenu}")
	@SuppressWarnings("unchecked")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
			if (user != null) {
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);		//读取session中的用户信息(含角色信息)
				if(null == userr) {
					if (pd.getString("loginpath").equals("login")){
						user = appuserService.getUserAndRoleById(user.getUserId());     //通过用户ID读取用户信息和角色信息
					}else if(pd.getString("loginpath").equals("adminLogin")){
						user = userService.getUserAndRoleById(user.getUserId());        //通过用户ID读取用户信息和角色信息
					}
					session.setAttribute(Const.SESSION_USERROL, user);				//存入session
				}else{
					user = userr;
				}
				String USERNAME = user.getUserName();
				Role role = user.getRole();											//获取用户角色
				String roleRights = role!=null ? role.getRIGHTS() : "";				//角色权限(菜单权限)
				session.setAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS, roleRights); //将角色权限存入session
				session.setAttribute(Const.SESSION_USERNAME, USERNAME);				//放入用户名到session
				List<Menu> allmenuList = new ArrayList<Menu>();
				if(null == session.getAttribute(USERNAME + Const.SESSION_allmenuList)){
					allmenuList = menuService.listAllMenuQx("0");					//获取所有菜单
					if(Tools.notEmpty(roleRights)){
						allmenuList = this.readMenu(allmenuList, roleRights);		//根据角色权限获取本权限的菜单列表
					}
					session.setAttribute(USERNAME + Const.SESSION_allmenuList, allmenuList);//菜单权限放入session中
				}else{
					allmenuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_allmenuList);
				}
				//切换菜单处理=====start
				List<Menu> menuList = new ArrayList<Menu>();
				if(null == session.getAttribute(USERNAME + Const.SESSION_menuList) || ("yes".equals(changeMenu))){
					List<Menu> menuList1 = new ArrayList<Menu>();
					List<Menu> menuList2 = new ArrayList<Menu>();
					//拆分菜单
					for(int i=0;i<allmenuList.size();i++){
						Menu menu = allmenuList.get(i);
						if("1".equals(menu.getMENU_TYPE())){
							menuList1.add(menu);
						}else{
							menuList2.add(menu);
						}
					}
					session.removeAttribute(USERNAME + Const.SESSION_menuList);
					if("2".equals(session.getAttribute("changeMenu"))){
						session.setAttribute(USERNAME + Const.SESSION_menuList, menuList1);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "1");
						menuList = menuList1;
					}else{
						session.setAttribute(USERNAME + Const.SESSION_menuList, menuList2);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "2");
						menuList = menuList2;
					}
				}else{
					menuList = (List<Menu>)session.getAttribute(USERNAME + Const.SESSION_menuList);
				}
				//切换菜单处理=====end
				if(null == session.getAttribute(USERNAME + Const.SESSION_QX)){
					session.setAttribute(USERNAME + Const.SESSION_QX, this.getUQX(USERNAME,pd.getString("loginpath")));    //按钮权限放到session中
				}
				this.getRemortIP(USERNAME);	//更新登录IP
				mv.setViewName("system/index/main");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				mv.setViewName("hm/index/login");//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName("hm/index/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.addObject("pd",pd);
		return mv;
	}

	/**根据角色权限获取本权限的菜单列表(递归处理)
	 * @param menuList：传入的总菜单
	 * @param roleRights：加密的权限字符串
	 * @return
	 */
	public List<Menu> readMenu(List<Menu> menuList,String roleRights){
		for(int i=0;i<menuList.size();i++){
			menuList.get(i).setHasMenu(RightsHelper.testRights(roleRights, menuList.get(i).getMENU_ID()));
			if(menuList.get(i).isHasMenu()){		//判断是否有此菜单权限
				this.readMenu(menuList.get(i).getSubMenu(), roleRights);//是：继续排查其子菜单
			}else{
				menuList.remove(i);
				i--;
			}
		}
		return menuList;
	}

	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/index/tab";
	}

	/**
	 * 进入首页后的默认页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_default")
	public ModelAndView defaultPage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd.put("userCount", Integer.parseInt(userService.getUserCount("").get("USERCOUNT").toString())-1);				//系统用户数
		pd.put("appUserCount", Integer.parseInt(appuserService.getAppUserCount("").get("APPUSERCOUNT").toString()));	//会员数
		mv.addObject("pd",pd);
		mv.setViewName("system/index/default");
		return mv;
	}

	/**
	 * 用户注销
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		String USERNAME = Jurisdiction.getUsername();	//当前登录的用户名
		logBefore(logger, USERNAME+"退出系统");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		Session session = Jurisdiction.getSession();	//以下清除session缓存
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(USERNAME + Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(USERNAME + Const.SESSION_allmenuList);
		session.removeAttribute(USERNAME + Const.SESSION_menuList);
		session.removeAttribute(USERNAME + Const.SESSION_QX);
		session.removeAttribute(Const.SESSION_userpds);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute(Const.SESSION_USERROL);
		session.removeAttribute("changeMenu");
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		pd = this.getPageData();
		pd.put("msg", pd.getString("msg"));
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		if(pd.getString("loginpath") != null && pd.getString("loginpath").equals("adminLogin")) {
			mv.setViewName("system/index/login");
		}else{
			mv.setViewName("hm/index/login");
		}
		mv.addObject("pd",pd);
		return mv;
	}

	/**
	 * 获取用户权限
	 * @param USERNAME 用户名
	 * @param loginpath 登录方式
	 * @return
	 */
	public Map<String, String> getUQX(String USERNAME,String loginpath){
		PageData pd = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		try {
			pd.put(Const.SESSION_USERNAME, USERNAME);
			if (loginpath.equals("login")){
				pd.put("ROLE_ID", appuserService.findByUsername(pd).get("ROLE_ID").toString());//获取角色ID
			}else if(loginpath.equals("adminLogin")){
				pd.put("ROLE_ID", userService.findByUsername(pd).get("ROLE_ID").toString());//获取角色ID
			}
			pd = roleService.findObjectById(pd);										//获取角色信息
			map.put("adds", pd.getString("ADD_QX"));	//增
			map.put("dels", pd.getString("DEL_QX"));	//删
			map.put("edits", pd.getString("EDIT_QX"));	//改
			map.put("chas", pd.getString("CHA_QX"));	//查
			List<PageData> buttonQXnamelist = new ArrayList<PageData>();
			if("admin".equals(USERNAME)){
				buttonQXnamelist = fhbuttonService.listAll(pd);					//admin用户拥有所有按钮权限
			}else{
				buttonQXnamelist = buttonrightsService.listAllBrAndQxname(pd);	//此角色拥有的按钮权限标识列表
			}
			for(int i=0;i<buttonQXnamelist.size();i++){
				map.put(buttonQXnamelist.get(i).getString("QX_NAME"),"1");		//按钮权限
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return map;
	}

	/** 更新登录用户的IP
	 * @param USERNAME
	 * @throws Exception
	 */
	public void getRemortIP(String USERNAME) throws Exception {
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		}else{
			ip = request.getHeader("x-forwarded-for");
		}
		pd.put("USERNAME", USERNAME);
		pd.put("IP", ip);
		userService.saveIP(pd);
	}
	/**
	 * 账号信息自动补全
	 */
	@RequestMapping(value="/login/Completion")
	@ResponseBody
	public Object loginCompletion() throws Exception {
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();//获得传输过来的数据
		pd.put("NUM", Const.COUNT_NUMBER);
		List<PageData> list = appuserService.findByNameAndJobNumber(pd);
		String errInfo = "success";
		map.put("result", errInfo);
		map.put("varList", list);
		map.put("pd", pd);
		return AppUtil.returnObject(new PageData(), map);
	}

}
