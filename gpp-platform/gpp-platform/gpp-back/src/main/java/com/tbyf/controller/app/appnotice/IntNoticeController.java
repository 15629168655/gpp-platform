package com.tbyf.controller.app.appnotice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tbyf.controller.base.BaseController;
import com.tbyf.entity.enums.EnumStatus;
import com.tbyf.service.information.notice.NoticeManager;
import com.tbyf.util.AppUtil;
import com.tbyf.util.PageData;
import com.tbyf.util.ResultMessageUtil;
import com.tbyf.util.Tools;

@Controller
@RequestMapping(value="/appNotice")
public class IntNoticeController extends BaseController{
	
	
	@Resource(name="noticeService")
	private NoticeManager noticeService;
	
	/**
	 * APP分页查询通知公告信息接口
	 * 
	 * @return
	 */
	// @RequestMapping(value="/getNotice", method = RequestMethod.GET)
	@RequestMapping(value = "/getNotice")
	@ResponseBody
	public Object getNotice() {
		logBefore(logger, "APP分页查询通知公告信息接口");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message ="";
		try {
			if (Tools.checkKey("STATE", pd.getString("FKEY"))) { // 检验请求key值是否合法
				// 如果不传分页参数，给默认值。
				int pageSize = 1;// 页码
				int pageCount = 10;// 页数
				if (null != pd.get("PAGESIZE") && null != pd.get("PAGECOUNT")) {
					pd.put("pageStart", pd.get("PAGESIZE"));
					pd.put("pageEnd",
							Integer.parseInt(pd.get("PAGESIZE").toString())
									* Integer.parseInt(pd.get("PAGECOUNT")
											.toString()));
				} else {
					pd.put("pageStart", pageSize);
					pd.put("pageEnd", pageSize * pageCount);
				}
				pd.put("STATE", EnumStatus.ENABLE.getCode());
				List<PageData> list = noticeService.queryPage(pd);
				map.put("pd", list);
				result = "01";
				message = ResultMessageUtil.MESSAGE_1;
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
			message = ResultMessageUtil.MESSAGE_0;
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
	    return AppUtil.returnObject(new PageData(), map);
	}
}
