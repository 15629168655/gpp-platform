package com.tbyf.controller.gp.job;
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
import com.tbyf.plugin.Page;
import com.tbyf.service.gp.job.TaskInfoManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.Jurisdiction;
import com.tbyf.util.PageData;


@Controller
@RequestMapping(value="/taskinfo")
public class TaskInfoController extends BaseController {
	String menuUrl = "taskinfo/list.do"; //菜单地址(权限用)
	@Resource(name="taskInfoService")
	private TaskInfoManager taskInfoService;
	
	/**显示随访登记列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	list = taskInfoService.list(page);  //列表
			mv.setViewName("gp/job/taskinfo_list");
			mv.addObject("varList", list);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		} catch(Exception e){
			e.printStackTrace();
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	/**去修改页面
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = taskInfoService.findById(pd);		 //根据ID读取
			Map map =taskInfoService.querytime(pd);
			mv.setViewName("gp/job/taskinfo_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.addObject("timemap", map);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
 
	


	/**修改随访记录
	 * @param 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"修改定时任务信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		taskInfoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	

	
	/**去新增页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map map =taskInfoService.querytime(pd);
		mv.setViewName("gp/job/taskinfo_edit");   
		mv.addObject("msg", "save");
		mv.addObject("timemap", map);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存新增随访记录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增随访登记信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		taskInfoService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		
		
		return mv;
	}
	
	
	/**删除随访登记
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除随访登记");
		PageData pd = new PageData();
		pd = this.getPageData();
		taskInfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**批量删除随访登记
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll(){
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"批量删除随访记录信息");
		Map<String,Object> map = new HashMap<String,Object>();
		 PageData pd = new PageData();
		pd = this.getPageData();
		String str=String.valueOf(pd.get("ids"));
		String[] ids = str.split(",");
		try {
	 	for(String id:ids){
				pd.put("ID", id);
				taskInfoService.delete(pd);
			}
			pd.put("msg", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			pd.put("msg", "no");
		}
		return AppUtil.returnObject(new PageData(), map);
		
	}
	
	
}
