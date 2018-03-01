package com.tbyf.controller.app.appagreementapply;

import com.tbyf.controller.base.*;
import com.tbyf.entity.enums.EnumJobSource;
import com.tbyf.entity.enums.EnumJobType;
import com.tbyf.entity.enums.EnumTaskStatus;
import com.tbyf.service.gp.provider.impl.ProviderService;
import com.tbyf.service.gp.task.TaskManager;
import com.tbyf.service.gp.userperson.impl.UserpersonService;
import com.tbyf.service.hm.agreementApply.AgreementApplyManager;
import com.tbyf.service.hm.agreementApply.impl.AgreementApplyService;
import com.tbyf.service.hm.departments.*;
import com.tbyf.util.*;

import oracle.sql.DATE;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.*;

import java.text.SimpleDateFormat;
import java.util.*;


/** 
  * 相关参数协议：
  * 00	请求失败
  * 01	请求成功
  * 02	返回空值
  * 03	请求协议参数不完整    
  * 04  用户名或密码错误
  * 05  FKEY验证失败
 */
@Controller
@RequestMapping(value="/appagreementapply")
public class IntAgreementApplyController extends BaseController {
    
	@Resource(name="agreementApplyService")
	private AgreementApplyService agreementApplyService;

	@Resource(name="taskService")
	private TaskManager taskService;
	
	@Resource(name="userPersonService")
	private UserpersonService userpersonService;
	
	
	Integer UNTREATED = EnumTaskStatus.UNTREATED.getCode();//任务状态枚举，未处理
	Integer SYSTEM = EnumJobSource.SYSTEM.getCode();       //任务来源枚举，系统
	Integer AGREEMENT = EnumJobType.AGREEMENT.getCode();   //任务类型枚举，签约

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	  /**
     * app预签约申请
     * @param APPLICANT_ID 申请人ID,
     * @param APPLICANT_NAME 申请人姓名、
     * @param APPLICANT_PHONE 申请人电话、
     * @param APPLICANT_IDCARD 申请人身份证号、
     * @param APPLICANT_ADDR 申请人住址、
     * @param GEN_PRACTITIONER_ID 签约医生ID、
     * @param GEN_PRACTITIONER_NAME签约医生姓名、
     * @param GEN_PRACTITIONER_PHONE签约医生电话、
     * @param ORG_CODE 机构ID、
     * @param REGION_CODE 区划编码
     * @return
     */
    @RequestMapping(value="/addOrder", method = RequestMethod.POST)
    @ResponseBody
    public Object addOrder()
    {
        logBefore(logger, "app通过传入预签约信息（申请人ID、申请人姓名、申请人电话、申请人身份证号码、申请人住址、签约医生ID、签约医生姓名、签约医生电话、机构ID、区划编码）生成预签约申请");
        Map<String,Object> map = new HashMap<String,Object>();
        PageData pd = new PageData();
        String result = "00";
        String message="";
        try{
        	pd = this.getPageData();
	        if(Tools.checkKey("APPLICANT_ID", pd.getString("FKEY"))){	//检验请求key值是否合法
		           if(AppUtil.checkParam("addOrder", pd)){	//检查参数
		        	    pd.put("STATUS",EnumTaskStatus.UNTREATED.getCode());//任务状态枚举，未处理
			      	    pd.put("ID", this.get32UUID());
			      	    pd.put("GMT_CREATED", new Date());
			      	    String sqrname=pd.getString("APPLICANT_NAME");
			      	    pd.put("APPLICANT_NAME", sqrname);
			      	    String ysname = pd.getString("GEN_PRACTITIONER_NAME");
			      	    pd.put("GEN_PRACTITIONER_NAME", ysname);
			      	    String ADDRESS = pd.getString("APPLICANT_ADDR");
			      	    pd.put("APPLICANT_ADDR", ADDRESS);
			      	    String GMT_APPOINTMENT = pd.getString("GMT_APPOINTMENT");
			      	    pd.put("GMT_APPOINTMENT", sdf.parse((GMT_APPOINTMENT))); 
		                agreementApplyService.addOrder(pd);
			            //发出签约申请同时生成任务
			            String sqrid = pd.getString("APPLICANT_ID");
			      		String sqrphone = pd.getString("APPLICANT_PHONE");	
			      		String ysid = pd.getString("GEN_PRACTITIONER_ID");
			      		String yscode = pd.getString("GEN_PRACTITIONER_CODE");
			      		String jgid = pd.getString("ORG_CODE");
			      		String regioncode = pd.getString("REGION_CODE");
			      		String SIGNED_TYPE = pd.getString("SIGNED_TYPE");
			      		String sqsj = sdf.format(new Date());
			      		PageData pd1 = new PageData(); 
			      		pd1 = this.getPageData();
			      		pd1.put("ID", this.get32UUID());
			      		pd1.put("JOB_NAME", "预约申请—"+sqrname);                                 	//任务名称
			      		pd1.put("JOB_CONTENT", sqrname+"在"+sqsj+"发起预签约申请，联系电话："+sqrphone);	//任务内容
			      		pd1.put("JOB_TYPE", AGREEMENT);	                                            //任务类型
			      		pd1.put("JOB_SOURCE", SYSTEM);	                                            //任务来源
			      		pd1.put("MEMBER_ID", sqrid);	                                            //申服务对象ID
			      		pd1.put("MEMBER_NAME", sqrname);	                                        //服务对象姓名
			      		pd1.put("STATUS",UNTREATED);                                                 //任务状态
			      		pd1.put("DOCTOR_ID", ysid);	                                                //执行医生ID
			      		pd1.put("DOCTOR_NAME", ysname);	                                            //执行医生姓名
			      		pd1.put("DOCTOR_CODE", yscode);                                             //执行医生CODE
			      		pd1.put("ORG_CODE", jgid);	                                                //执行医生姓名
			      		pd1.put("REGION_CODE", regioncode);                                             //区划编码
			      		pd1.put("OPERATOR_ID", Constants.ADMIN_USER_ID);	                         //操作人ID
			      		pd1.put("OPERATOR_NAME", Constants.ADMIN_NAME);	                                    //操作人姓名
			      		pd1.put("GMT_APPOINTMENT", GMT_APPOINTMENT);	   
			      		pd1.put("SIGNED_TYPE", SIGNED_TYPE);	   
			      		taskService.saveQy(pd1);
			      		String IDCARD = pd.getString("APPLICANT_IDCARD");
			      		
			      		PageData pd2 = new PageData();
			      		pd2.put("NAME", sqrname);             
			      		pd2.put("TELEPHONE", sqrphone);       
			      		pd2.put("IDCARD", IDCARD);
			      		pd2.put("ADDRESS", ADDRESS);
			      		if(userpersonService.findByNameCardPhoneAdd(pd2)){   //验证联系人是否重复，若不重复，则添加
			      			pd2.put("GUID", this.get32UUID());
			      			pd2.put("USER_AGENT_ID", sqrid);
			      			pd2.put("CREATE_TIME", new Date());
			      			pd2.put("STATUS", '1');
			      			System.out.println("-------------pd2-------------"+pd2);
			      			userpersonService.addUserPerson(pd2);
			      		}
			            result = "01";
			        	message =ResultMessageUtil.MESSAGE_1;
		           }else {
			          message =ResultMessageUtil.MESSAGE_3;
		              result = "03";
		           }
	        }else{
	        	message =ResultMessageUtil.MESSAGE_5;
	    		result = "05";
	    	}  
        }catch (Exception e){
        	message =ResultMessageUtil.MESSAGE_0;
            logger.error(e.toString(), e);
        }finally{
            map.put("result", result);
            map.put("message", message);
            logAfter(logger);
        }
        return AppUtil.returnObject(new PageData(), map);
    }
    
    /**
     * app预签约申请查询 
     * @param pageSize 页码 ，pageCount 当前页数
     * @param
     * @return
     */
	 	@RequestMapping(value = "/queryPage", method = RequestMethod.GET)
	    @ResponseBody
	    public Object queryPage()
	    {
	        logBefore(logger, "app预签约申请查询 ");
	        Map<String,Object> map = new HashMap<String,Object>();
	        PageData pd = new PageData();
	        pd = this.getPageData();
	        String result = "00";
	        String message="";
	        try{	
		        if(Tools.checkKey("KEYWORDS", pd.getString("FKEY"))){	//检验请求key值是否合法
		    		int pageSize=1;//页码
	        		int pageCount=10;//页数
	               	if(null !=pd.get("PAGESIZE") && null !=pd.get("PAGECOUNT") ){
	               		pd.put("pageStart", (Integer.parseInt(pd.get("PAGESIZE").toString())-1)*Integer.parseInt(pd.get("PAGECOUNT").toString())+1);
	               		pd.put("pageEnd", Integer.parseInt(pd.get("PAGESIZE").toString()) * Integer.parseInt(pd.get("PAGECOUNT").toString()));
	               	}else{
	               		pd.put("pageStart", (pageSize-1)* pageCount+1);
	               		pd.put("pageEnd", pageSize * pageCount);
	               	}
	              
	            	if(AppUtil.checkParam("queryPage", pd)){	//检查参数
	            		List<PageData> list = agreementApplyService.queryPage(pd);
            			map.put("pd", list);
        	        	result = "01";
        	        	message =ResultMessageUtil.MESSAGE_1; 
		            }else {
		               result = "03";
		               message =ResultMessageUtil.MESSAGE_3;
		            }
             	}else{
    				result = "05";
    				message =ResultMessageUtil.MESSAGE_5;
             	}
	        }catch (Exception e){
	        	message =ResultMessageUtil.MESSAGE_0;
	            logger.error(e.toString(), e);
	        }finally{
	            map.put("result", result);
	            map.put("message", message);
	            logAfter(logger);
	        }
	        return AppUtil.returnObject(new PageData(), map);
	    }
	 	
	 	 /**
	 	  * 预签约申请审核
	 	  * @return
	 	  */
	 	 @RequestMapping(value="/editObj", method = {RequestMethod.GET,RequestMethod.POST})
	     @ResponseBody
	     public Object editObj()
	     {
	         logBefore(logger, "app修改签约管理");
	         Map<String,Object> map = new HashMap<String,Object>();
	         PageData pd = new PageData();
	         String result = "00";
	         String message ="";
	         try{
	         	pd = this.getPageData();
	         	if(Tools.checkKey("AUDITOR_COMMENT", pd.getString("FKEY"))){	
	         		if(AppUtil.checkParam("editSh", pd)){	//检查参数
	         			//pd.put("AUDITOR_COMMENT", new String(pd.getString("AUDITOR_COMMENT").getBytes("8859_1"),"UTF-8"));
		            	agreementApplyService.updateObject(pd);
		            	result="01";
		    		    message =ResultMessageUtil.MESSAGE_1;
		            }else {
		               result = "03";
		               message =ResultMessageUtil.MESSAGE_3;
		            }
				}else{
					result = "05";
					message =ResultMessageUtil.MESSAGE_5;
				}
	         }catch (Exception e){
		         message =ResultMessageUtil.MESSAGE_0;
	             logger.error(e.toString(), e);
	         }finally{
	             map.put("result", result);
	             map.put("message",message);
	             logAfter(logger);
	         }
	         return AppUtil.returnObject(new PageData(), map);
	     }
	 	 
	 	 /**
	 	  * 预签约申请查看详情
	 	  * @return
	 	  */
	 	 @RequestMapping(value="/view" , method = RequestMethod.GET)
	 	@ResponseBody
		public Object getAppuserByUsernmae(){
			logBefore(logger, "预签约申请查看详情");
			Map<String,Object> map = new HashMap<String,Object>();
			PageData pd = new PageData();
			pd = this.getPageData();
			String result = "00";
			String message ="";
			try{
				if(Tools.checkKey("ID", pd.getString("FKEY"))){	//检验请求key值是否合法
					if(AppUtil.checkParam("view", pd)){	//检查参数
						pd = agreementApplyService.findById(pd);
						map.put("pd", pd);
						if(null==pd){
							result="02";
							message =ResultMessageUtil.MESSAGE_2;
						}else{
							result="01";
	        	        	message =ResultMessageUtil.MESSAGE_1;
						} 
					}else {
						result = "03";
			            message =ResultMessageUtil.MESSAGE_3;
					}
				}else{
					result = "05";
		            message =ResultMessageUtil.MESSAGE_5;
				}
			}catch (Exception e){
	            message =ResultMessageUtil.MESSAGE_0;
				logger.error(e.toString(), e);
			}finally{
				map.put("result", result);
				map.put("message", message);
				logAfter(logger);
			}
			return AppUtil.returnObject(new PageData(), map);
		}
}
	
 