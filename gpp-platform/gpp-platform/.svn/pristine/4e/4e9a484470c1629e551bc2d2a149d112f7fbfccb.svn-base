package com.tbyf.controller.app.agreementsevice;

import com.tbyf.controller.base.*;
import com.tbyf.entity.enums.EnumAttachmentType;
import com.tbyf.service.gp.agreementchange.AgreementchangeManager;
import com.tbyf.service.gp.agreementsevice.impl.AgreementserviceService;
import com.tbyf.service.gp.jmxx.JmxxManager;
import com.tbyf.service.gp.provider.impl.ProviderService;
import com.tbyf.service.gp.servicePack.impl.ServicePackService;
import com.tbyf.service.gp.userperson.impl.UserpersonService;
import com.tbyf.service.system.attachment.AttachmentManager;
import com.tbyf.util.*;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.*;

import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 相关参数协议： 00 请求失败 01 请求成功 02 返回空值 03 请求协议参数不完整 04 用户名或密码错误 05 FKEY验证失败
 */
@Controller
@RequestMapping(value = "/appAgreementService")
public class IntAgreementseviceController extends BaseController {

	@Resource(name = "agreementserviceService")
	private AgreementserviceService agreementservicsService;
	
	@Resource(name = "agreementChangeService")
	private AgreementchangeManager agreementChangeService;

	@Resource(name = "providerService")
	private ProviderService providerService;
	
	@Resource(name = "jmxxService")
	private JmxxManager jmxxService;
	
	@Resource(name = "userPersonService")
	private UserpersonService userpersonService;

	@Value("${system.attachment.realDir}")
	String attachmentRealDir;
	@Value("${tomcat.attachmentDir.virtualDir}")
	String attachmentVirtualDir;

	@Resource(name = "attachmentService")
	private AttachmentManager attachmentService;
	@Resource(name = "servicePackService")
	private ServicePackService servicePackService;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	// 上传文件类型
	private Integer QYXY = EnumAttachmentType.QYXY.getCode();

	/**
	 * app签约管理查询
	 * 
	 * @param pageSize
	 *            页码 ，pageCount 当前页数
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/queryPage", method = RequestMethod.GET)
	@ResponseBody
	public Object queryPage() {
		logBefore(logger, "签约管理的分页查询");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("KEYWORDS", pd.getString("FKEY"))) { // 检验请求key值是否合法
				int pageSize = 1;// 页码
				int pageCount = 10;// 页数
				if (null != pd.get("PAGESIZE") && null != pd.get("PAGECOUNT")) {
					pd.put("pageStart",
							(Integer.parseInt(pd.get("PAGESIZE").toString()) - 1)
									* Integer.parseInt(pd.get("PAGECOUNT")
											.toString()) + 1);
					pd.put("pageEnd",
							Integer.parseInt(pd.get("PAGESIZE").toString())
									* Integer.parseInt(pd.get("PAGECOUNT")
											.toString()));
				} else {
					pd.put("pageStart", (pageSize - 1) * pageCount + 1);
					pd.put("pageEnd", pageSize * pageCount);
				}
				List<PageData> list = agreementservicsService.queryPage(pd);
				for (PageData pagedata : list) {
					PageData packPd = new PageData();
					packPd.put("ID", pagedata.get("SERVICE_PACK"));
					packPd = servicePackService.findById(packPd);
					if (packPd != null) {
						pagedata.put("SERVICE_PACK_NAME", packPd.get("MC"));
						pagedata.put("SERVICE_PACK_FEE", packPd.get("FY"));
						Object o = packPd.get("NR");
						if (null != o && !"".equals(o)) {
							Blob blob = (Blob) o;
							byte[] inbyte = blob.getBytes(1,
									(int) blob.length());
							String NR = new String(inbyte);
							pagedata.put("SERVICE_PACK_CONTENT", NR);
						}
					}
				}
				map.put("pd", list);
				result = "01";
				message = ResultMessageUtil.MESSAGE_1;
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/deleteObj", method = RequestMethod.GET)
	@ResponseBody
	public Object deleteObj() {
		logBefore(logger, "删除签约管理");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";

		try {
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (null != pd.getString("ID")
						&& !pd.getString("ID").equals("")) {// 检验参数
					pd.put("STATUS", "9");
					agreementservicsService.delObject(pd);
					result = "01";
					message = ResultMessageUtil.MESSAGE_1;

				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	@RequestMapping(value = "/saveObj", method = RequestMethod.POST)
	@ResponseBody
	public Object saveObj() {
		logBefore(logger, "app新增签约管理");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		String result = "00";
		String message = "";
		try {
			pd = this.getPageData();
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("saveAgreementService", pd)) { // 检查参数
					pd.put("ID", this.get32UUID()); // 主键
					if (pd.get("GEN_PRACTITIONER_ID") != null
							&& !"".equals(pd.get("GEN_PRACTITIONER_ID"))) {
						// 查询医生信息
						PageData providerData = new PageData();
						providerData.put("id", pd.get("GEN_PRACTITIONER_ID"));
						providerData = providerService
								.getProvierTeamById(providerData);
						if (providerData != null) {
							pd.put("GMT_START", pd.get("GMT_START") + " "
									+ DateUtil.DEFAULT_HMS_START);
							pd.put("GMT_END", pd.get("GMT_END") + " "
									+ DateUtil.DEFAULT_HMS_START);
							pd.put("GEN_PRACTITIONER_PHONE",
									providerData.get("TELECOM"));
							pd.put("ORG_CODE", providerData.get("ORG_CODE"));
							pd.put("REGION_CODE",
									providerData.get("REGIONCODE"));
							pd.put("GMT_MODIFIED", sdf.format(new Date()));
							pd.put("STATUS", "0");
							agreementservicsService.saveObj(pd);
							if (pd.containsKey("FILE_ID")
									&& !pd.get("FILE_ID").equals("")) {
								PageData attpd = new PageData();
								attpd.put("ATTACHMENT_ID", pd.get("FILE_ID"));
								PageData attahmentPd = attachmentService
										.findById(attpd);
								pd.put("FILE_URL", attahmentPd.get("PATH"));
							} else {
								pd.put("FILE_ID", "");
								pd.put("FILE_URL", "");
							}
							// 更改居民信息签约状态
							PageData jmxxpd = new PageData();
							jmxxpd.put("USER_AGENT_ID", pd.get("MEMBER_ID"));
							jmxxpd.put("IS_SIGN", "1");
							jmxxService.editJmxxSign(jmxxpd);
							PageData pd2 = new PageData();
							pd2.put("NAME", pd.getString("MEMBER_NAME"));
							pd2.put("TELEPHONE", pd.getString("MEMBER_PHONE"));
							pd2.put("IDCARD", pd.getString("ID_CARD"));
							pd2.put("ADDRESS", pd.getString("ADDRESS"));
							if(userpersonService.findByNameCardPhoneAdd(pd2)){   //验证联系人是否重复，若不重复，则添加
				      			pd2.put("GUID", this.get32UUID());
				      			pd2.put("USER_AGENT_ID", pd.getString("MEMBER_ID"));
				      			pd2.put("CREATE_TIME", new Date());
				      			pd2.put("STATUS", '1');
				      			userpersonService.addUserPerson(pd2);
				      		}
							result = "01";
							message = ResultMessageUtil.MESSAGE_1;
						} else {
							result = "02";
							message = "医生ID错误";
						}

					} else {
						result = "02";
						message = "医生ID错误";
					}
				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	@RequestMapping(value = "/auditObj", method = RequestMethod.POST)
	@ResponseBody
	public Object auditObj() {
		logBefore(logger, "app签约审核");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		String result = "00";
		String message = "";
		try {
			pd = this.getPageData();
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (pd.containsKey("ID")) {
					PageData servicepd = agreementservicsService.findById(pd);
					if (servicepd != null) {
						pd.put("STATUS", "1");
						// 操作人信息
						PageData operatorData = new PageData();
						operatorData.put("id", pd.get("OPERATOR_ID"));
						operatorData = providerService
								.getProviderById(operatorData);
						if (operatorData != null) {
							pd.put("OPERATOR_NAME",
									operatorData.getString("PROVIDER_NAME")); // 操作人姓名
						}
						agreementservicsService.updateObject(pd);
						// 更改居民信息签约状态
						PageData jmxxpd = new PageData();
						jmxxpd.put("USER_AGENT_ID", servicepd.get("MEMBER_ID"));
						jmxxpd.put("IS_SIGN", "2");
						jmxxService.editJmxxSign(jmxxpd);
						result = "01";
						message = ResultMessageUtil.MESSAGE_1;
					} else {
						result = "02";
						message = "签约协议id不存在";
					}
				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}

			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 编辑签约管理。 可编辑全部字段
	 * 
	 * @return
	 */
	@RequestMapping(value = "/editObj", method = RequestMethod.POST)
	@ResponseBody
	public Object editObj() {
		logBefore(logger, "app修改签约管理");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("editAgreementService", pd)) { // 检查参数
					if (pd.containsKey("GMT_START")) {
						pd.put("GMT_START", pd.get("GMT_START") + " "
								+ DateUtil.DEFAULT_HMS_START);
					}
					if (pd.containsKey("GMT_END")) {
						pd.put("GMT_END", pd.get("GMT_END") + " "
								+ DateUtil.DEFAULT_HMS_END);
					}
					if (pd.containsKey("FILE_ID")
							&& !pd.get("FILE_ID").equals("")) {
						PageData attpd = new PageData();
						attpd.put("ATTACHMENT_ID", pd.get("FILE_ID"));
						PageData attahmentPd = attachmentService
								.findById(attpd);
						pd.put("FILE_URL", attahmentPd.get("PATH"));
					} else {
						pd.put("FILE_ID", "");
						pd.put("FILE_URL", "");
					}
					agreementservicsService.updateObject(pd);
					PageData pd2 = new PageData();
					pd2.put("NAME", pd.getString("MEMBER_NAME"));
					pd2.put("TELEPHONE", pd.getString("MEMBER_PHONE"));
					pd2.put("IDCARD", pd.getString("ID_CARD"));
					pd2.put("ADDRESS", pd.getString("ADDRESS"));
					if(userpersonService.findByNameCardPhoneAdd(pd2)){   //验证联系人是否重复，若不重复，则添加
		      			pd2.put("GUID", this.get32UUID());
		      			pd2.put("USER_AGENT_ID", pd.getString("MEMBER_ID"));
		      			pd2.put("CREATE_TIME", new Date());
		      			pd2.put("STATUS", '1');
		      			userpersonService.addUserPerson(pd2);
		      		}
					result = "01";
					message = ResultMessageUtil.MESSAGE_1;
				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 转签 暂时没做状态的判断，任意状态可转签
	 */
	@RequestMapping(value = "/transfer", method = RequestMethod.POST)
	@ResponseBody
	public Object transfer() {
		logBefore(logger, "app签约管理--转签");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("transfer", pd)) { // 检查参数
					PageData servicepd = agreementservicsService.findById(pd);
					// 更新服务协议表记录
					pd.put("STATUS", 5);
					// 查询医生信息
					PageData providerData = new PageData();
					providerData.put("id", pd.get("GEN_PRACTITIONER_ID"));
					providerData = providerService
							.getProvierTeamById(providerData);
					if (providerData != null) {
						// pd.put("GEN_PRACTITIONER_PHONE",providerData.get("TELECOM"));
						pd.put("TEAM_ID", providerData.get("TEAM_ID"));
						pd.put("ORG_CODE", providerData.get("ORG_CODE"));
						pd.put("REGION_CODE", providerData.get("REGIONCODE"));
						agreementservicsService.updatetransfer(pd);
						// 新增一条转签历史表信息
						PageData transferPd = new PageData();
						transferPd.put("ID", this.get32UUID());
						transferPd.put("AGREEMENT_ID",
								servicepd.getString("APPLICANT_CODE"));
						transferPd.put("TEAM_ID",
								servicepd.getString("TEAM_ID")); // 旧签约医生团队
						transferPd.put("GEN_PRACTITIONER_ID",
								servicepd.getString("GEN_PRACTITIONER_ID")); // 旧签约医生ID
						transferPd.put("GEN_PRACTITIONER_NAME",
								servicepd.getString("GEN_PRACTITIONER_NAME")); // 旧签约医生姓名
						transferPd.put("GEN_PRACTITIONER_PHONE",
								servicepd.getString("GEN_PRACTITIONER_PHONE")); // 旧签约医生电话
						transferPd.put("OPERATOR_ID",
								pd.getString("OPERATOR_ID")); // 操作人姓名ID
						// 操作人信息
						PageData operatorData = new PageData();
						operatorData.put("id", pd.get("OPERATOR_ID"));
						operatorData = providerService
								.getProviderById(operatorData);
						if (operatorData != null) {
							transferPd.put("OPERATOR_NAME",
									operatorData.getString("PROVIDER_NAME")); // 操作人姓名
							transferPd.put("GMT_TRANSFER",
									sdf.format(new Date())); // 操作时间
							if (null != pd.getString("REMARK")) {
								transferPd
										.put("REMARK", pd.getString("REMARK")); // 转签原因
							}
							agreementservicsService.transfer(transferPd);
							result = "01";
							message = ResultMessageUtil.MESSAGE_1;
						} else {
							result = "04";
							message = "操作人查询为空";
						}
					} else {
						result = "02";
						message = "医生信息查询为空";
					}
				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 续约
	 * 
	 * @return
	 */
	@RequestMapping(value = "/renew", method = RequestMethod.POST)
	@ResponseBody
	public Object renew() {
		logBefore(logger, "app签约管理--续约");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			PageData sevicePd = agreementservicsService.findById(pd);
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("renew", pd)) { // 检查参数
					if (checkTime(pd, sevicePd)) {// 验证协议时间
						// 更新服务协议表记录
						pd.put("STATUS", "4");// 更改状态为续约

						// 修改属性后 重新查询
						sevicePd = agreementservicsService.findById(pd);
						// 生成续约历史表记录
						sevicePd.put("ID", this.get32UUID());
						Date start = (Date) sevicePd.getObject("GMT_START");
						Date end = (Date) sevicePd.getObject("GMT_END");
						Date signed = (Date) sevicePd.getObject("GMT_SIGNED");
						sevicePd.put("GMT_START", new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss").format(start));
						sevicePd.put("GMT_END", new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss").format(end));
						sevicePd.put("GMT_SIGNED", new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss").format(signed));
						sevicePd.put("GMT_MODIFIED", new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss").format(new Date()));
						// 先保存旧的签约协议到续约表
						agreementservicsService.renew(sevicePd);
						// 在更新新的协议
						if (pd.containsKey("FILE_ID")
								&& !pd.get("FILE_ID").equals("")) {
							PageData attpd = new PageData();
							attpd.put("ATTACHMENT_ID", pd.get("FILE_ID"));
							PageData attahmentPd = attachmentService
									.findById(attpd);
							pd.put("FILE_URL", attahmentPd.get("PATH"));
						} else {
							pd.put("FILE_ID", "");
							pd.put("FILE_URL", "");
						}
						agreementservicsService.edit(pd);
						result = "01";
						message = ResultMessageUtil.MESSAGE_1;

					} else {
						result = "02";
						message = "续约时间不符合规范";
					}
				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	private boolean checkTime(PageData newPD, PageData oldPD) {
		boolean flag = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date oldEnd = (Date) oldPD.getObject("GMT_END");
		String newStart = newPD.getString("GMT_START") + " "
				+ DateUtil.DEFAULT_HMS_START;
		String newEnd = newPD.getString("GMT_END") + " "
				+ DateUtil.DEFAULT_HMS_END;
		try {
			if (oldEnd.getTime() < sdf.parse(newStart).getTime() && // 旧协议结束时间小于新的开始时间
					sdf.parse(newStart).getTime() < sdf.parse(newEnd).getTime()) { // 新协议开始时间小于结束时间
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	/**
	 * 解约
	 * 
	 * @return
	 */
	@RequestMapping(value = "/rescission", method = RequestMethod.POST)
	@ResponseBody
	public Object rescission() {
		logBefore(logger, "app签约管理--解约");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("rescission", pd)) { // 检查参数
					PageData servicepd = agreementservicsService.findById(pd);
					if (servicepd != null) {
						agreementservicsService.jieyue(pd);
						// 更改居民信息签约状态
						PageData jmxxpd = new PageData();
						jmxxpd.put("USER_AGENT_ID", servicepd.get("MEMBER_ID"));
						jmxxpd.put("IS_SIGN", "0");
						jmxxService.editJmxxSign(jmxxpd);
						result = "01";
						message = ResultMessageUtil.MESSAGE_1;
					}
				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 新增签约变更申请
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addAgreementChange", method = RequestMethod.POST)
	@ResponseBody
	public Object addAgreementChange() {
		logBefore(logger, "app新增签约变更申请");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("APPLICANT_ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("addAgreementChange", pd)) { // 检查参数
					String APPLICANT_ID = pd.getString("APPLICANT_ID");
					PageData jmxxObj = new PageData();
					jmxxObj.put("USER_AGENT_ID", APPLICANT_ID);
					jmxxObj = jmxxService.findUserInfoById(jmxxObj);
					if (jmxxObj != null && jmxxObj.containsKey("USER_AGENT_ID")) {
						pd.put("ID", this.get32UUID());
						pd.put("APPLICANT_NAME", jmxxObj.getString("USER_NAME"));
						pd.put("APPLICANT_PHONE",
								jmxxObj.getString("TELEPHONE"));
						PageData servicesObj = new PageData();
						servicesObj.put("ID", pd.getString("AGREEMENT_ID"));
						servicesObj = agreementservicsService
								.findById(servicesObj);
						pd.put("GEN_PRACTITIONER_ID",
								servicesObj.get("GEN_PRACTITIONER_ID"));
						pd.put("GEN_PRACTITIONER_NAME",
								servicesObj.get("GEN_PRACTITIONER_NAME"));
						pd.put("GEN_PRACTITIONER_PHONE",
								servicesObj.get("GEN_PRACTITIONER_PHONE"));
						pd.put("ORG_CODE", servicesObj.get("ORG_CODE"));
						pd.put("REGION_CODE", servicesObj.get("REGION_CODE"));
						pd.put("GMT_MODIFIED", sdf.format(new Date()));
						pd.put("GMT_CREATED", sdf.format(new Date()));
						pd.put("STATUS", "0");
						agreementChangeService.save(pd);
						result = "01";
						message = ResultMessageUtil.MESSAGE_1;
					} else {
						result = "02";
						message = "居民用户不存在";
					}
				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}

		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 签约变更--列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/queryChangePage", method = RequestMethod.GET)
	@ResponseBody
	public Object queryChangePage() {
		logBefore(logger, "app签约管理--签约变更列表");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("KEYWORDS", pd.getString("FKEY"))) { // 检验请求key值是否合法
				int pageSize = 1;// 页码
				int pageCount = 10;// 页数
				if (null != pd.get("PAGESIZE") && null != pd.get("PAGECOUNT")) {
					pd.put("pageStart",
							(Integer.parseInt(pd.get("PAGESIZE").toString()) - 1)
									* Integer.parseInt(pd.get("PAGECOUNT")
											.toString()) + 1);
					pd.put("pageEnd",
							Integer.parseInt(pd.get("PAGESIZE").toString())
									* Integer.parseInt(pd.get("PAGECOUNT")
											.toString()));
				} else {
					pd.put("pageStart", (pageSize - 1) * pageCount + 1);
					pd.put("pageEnd", pageSize * pageCount);
				}
				List<PageData> list = agreementChangeService.queryPage(pd);
				map.put("pd", list);
				result = "01";
				message = ResultMessageUtil.MESSAGE_1;
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 签约变更--审核通过
	 * 
	 * @return
	 */
	@RequestMapping(value = "/agreeApply", method = RequestMethod.POST)
	@ResponseBody
	public Object agreeApply() {
		logBefore(logger, "app签约管理--签约变更审核通过");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("intAgreementService_agreeApply", pd)) {
					// 判断变更申请状态
					PageData changeObj = agreementChangeService.findById(pd
							.getString("ID"));
					if (changeObj == null) {
						result = "02";
						message = "签约变更申请id有误";
					} else if (!"0".equals(changeObj.get("STATUS"))) {
						result = "04";
						message = "签约变更申请状态不匹配";
					} else {
						// 通过协议ID 取旧服务包
						PageData par = new PageData();
						par.put("ID", pd.getString("AGREEMENT_ID"));
						PageData oldPD = agreementservicsService.findById(par);
						String service_pack_old = oldPD
								.getString("SERVICE_PACK");

						// 更新签约变更申请表(GPP_ AGREEMENT_CHANGE_APPLY)审核状态为通过
						pd.put("STATUS", "1");// 通过
						pd.put("GMT_AUDIT", sdf.format(new Date()));
						agreementservicsService.updateChangeApply(pd);
						// 新增签约变更表(GPP_ AGREEMENT_CHANGE)记录
						PageData createdPd = new PageData();
						createdPd.put("ID", this.get32UUID());
						createdPd.put("AGREEMENT_ID",
								pd.getString("AGREEMENT_ID")); // 协议ID
						createdPd.put("SERVICE_PACK_OLD", service_pack_old); // 旧服务包
						createdPd.put("SERVICE_PACK",
								pd.getString("SERVICE_PACK")); // 服务包
						createdPd
								.put("OPERATOR_ID", pd.getString("AUDITOR_ID")); // 申请人
						createdPd.put("OPERATOR_NAME",
								pd.getString("AUDITOR_NAME"));
						createdPd.put("GMT_CHANGE", new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss").format(new Date())); // 申请时间
						agreementChangeService.created(createdPd);
						result = "01";
						message = ResultMessageUtil.MESSAGE_1;
					}

				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 签约变更--审核拒绝
	 * 
	 * @return
	 */
	@RequestMapping(value = "/unagreeApply", method = RequestMethod.POST)
	@ResponseBody
	public Object unagreeApply() {
		logBefore(logger, "app签约管理--签约变更审核拒绝");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("intAgreementService_unagreeApply", pd)) {
					// 判断变更申请状态
					PageData changeObj = agreementChangeService.findById(pd
							.getString("ID"));
					if (changeObj == null) {
						result = "02";
						message = "签约变更申请id有误";
					} else if (!"0".equals(changeObj.get("STATUS"))) {
						result = "04";
						message = "签约变更申请状态不匹配";
					} else {
						// 更新签约变更申请表(GPP_ AGREEMENT_CHANGE_APPLY)审核状态退回
						// 修改审批内容等
						pd.put("STATUS", "2");
						pd.put("GMT_AUDIT", sdf.format(new Date()));
						agreementservicsService.updateChangeApply(pd);
						result = "01";
						message = ResultMessageUtil.MESSAGE_1;
					}
				} else {
					result = "03";
					message = ResultMessageUtil.MESSAGE_3;
				}
			} else {
				result = "05";
				message = ResultMessageUtil.MESSAGE_5;
			}
		} catch (Exception e) {
			message = ResultMessageUtil.MESSAGE_0;
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			map.put("message", message);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 签约变更--作废
	 * 
	 * @return
	 */
	@RequestMapping(value = "/expire", method = RequestMethod.POST)
	@ResponseBody
	public Object expire() {
		logBefore(logger, "app签约管理--签约变更--作废");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		String result = "00";
		try {
			if (Tools.checkKey("ID", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("intAgreementService_expire", pd)) {
					pd.put("STATUS", "3");
					agreementservicsService.delApply(pd);
					result = "01";
				} else {
					result = "03";
				}
			} else {
				result = "05";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	@RequestMapping(value = "/upFile")
	@ResponseBody
	public Object upFile(MultipartHttpServletRequest request,
			@RequestParam(value = "FILE", required = false) MultipartFile file)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String result = "00";
		String message = "";
		try {
			if (Tools.checkKey("FILE", request.getParameter("FKEY"))) { // 检验请求key值是否合法
				// 文件上传路径，保存到服务器项目下。
				if (file.getSize() != 0) {
					if (!file.isEmpty()) {
						String uuid = this.get32UUID();
						String realName = FileUpload.fileUp(file,
								attachmentRealDir, uuid);
						String attachmentVirtualPath = attachmentVirtualDir
								+ realName;

						PageData attachmentPd = new PageData();
						attachmentPd.put("ATTACHMENT_ID", uuid); // 主键
						attachmentPd.put("BUSINESS_ID", "");
						attachmentPd.put("TYPE", QYXY);
						attachmentPd.put("NAME", file.getOriginalFilename());
						attachmentPd.put("PATH", attachmentVirtualPath);
						attachmentPd.put("SIZE", FileSizeFormatUtil
								.formatFileSize(file.getSize()));
						attachmentPd.put("CONTENTTYPE", file.getContentType());
						attachmentPd.put("OPERATER", ""); // 上传人
						attachmentPd.put("OPERATEDATE",
								Tools.date2Str(new Date())); // 上传时间
						attachmentService.save(attachmentPd);
						PageData pd = new PageData();
						pd.put("FILE_ID", uuid);
						pd.put("FILE_URL", attachmentVirtualPath);
						map.put("pd", pd);
						result = "01";
						message = ResultMessageUtil.MESSAGE_1;
					} else {
						result = "00";
						message = ResultMessageUtil.MESSAGE_0;
					}
				} else {
					result = "00";
					message = ResultMessageUtil.MESSAGE_0;
				}
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
