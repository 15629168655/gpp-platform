<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- 弹出居民信息新增页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
 <link rel="stylesheet" href="static/ace/css/bootstrap-editable.css">
 <link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<form action="referral/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="USER_AGENT_ID" id="USER_AGENT_ID" value="${pd.USER_AGENT_ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">居民基本信息</h5>
                                        <span class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                            <a href="#" data-action="fullscreen" class="orange2">
                                                <i class="ace-icon fa fa-expand"></i>
                                            </a>
                                        </span>
                                </div>
                                <div class="widget-body col-xs-12">
                                	 <div class="widget-main col-xs-12">
                                	 	<div class="col-xs-12 col-sm-4 center">
                                	 		<span class="profile-picture">
													<img id="avatar0" class="editable img-responsive" alt="${pd.USER_NAME}"  src="${pd.IMAGE_URL}" onerror="onerror=null;src='static/ace/avatars/profile-pic.jpg'" width="182" height="207"/>
												</span>
                                                <div class="space-4"></div>
                                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                                    <div class="inline position-relative">
                                                        <span class="white">${pd.USER_NAME}</span>
                                                    </div>
                                                </div>
                                	 	</div>
                                	 	<div class="col-xs-12 col-sm-8">
                                	 		<div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >姓名:</label>
                                                    <div class="col-sm-8">
                                                        <span name="USER_NAME" id="USER_NAME" class="col-sm-12 from-control-span">${pd.USER_NAME}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SEX">性别:</label>
                                                    <div class="col-sm-8">
                                                        <span name="SEX" id="SEX" class="col-sm-12 from-control-span">
															<c:if test="${pd.SEX == '2' }">女</c:if>
															<c:if test="${pd.SEX == '1' }">男</c:if>
														</span>
                                                    </div>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDTYPE">证件类型:</label>
                                                    <div class="col-sm-8">
                                                       <span name="CARDTYPE" id="CARDTYPE" class="col-sm-12 from-control-span">居民身份证</span> 
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDNO">证件号码:</label>
                                                    <div class="col-sm-8">
                                                        <span name="CARDNO" id="ID_NUMBER" class="col-sm-12 from-control-span">${pd.ID_NUMBER}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="BIRTHDAY_TIME">出生日期:</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group col-xs-12">
                                                            <span name="BIRTHDAY_TIME" id="BIRTHDAY_TIME" class="col-sm-12 from-control-span"><fmt:formatDate pattern='yyyy-MM-dd'  value='${pd.BIRTHDAY_TIME}'/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="PHONE">联系电话:</label>
                                                    <div class="col-sm-8">
                                                        <span name="PHONE" id="PHONE" class="col-sm-12 from-control-span">${pd.TELEPHONE}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="POSTCODE "  >邮政编码:</label>
                                                    <div class="col-sm-8"  >
                                                        <span name="POSTCODE  " id="POSTCODE " class="col-sm-12 from-control-span">${pd.POSTCODE }</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="ADDRESS">详细地址:</label>
                                                    <div class="col-sm-8" id="STREETDiv">
                                                        <span name="ADDRESS" id="ADDRESS" class="col-sm-12 from-control-span">${pd.ADDRESS}</span>
                                                    </div>
                                                </div>
                                             </div>
                                	 	</div>
                                	 </div>
                                </div>
                            </div>
                            </div>
                            <div class="form-group">
                            <div class="widget-box col-xs-12">
			                     <div class="widget-header">
			                           <h5 class="widget-title">居民的账号信息</h5>
			                               <span class="widget-toolbar">
	                                            <a href="#" data-action="collapse">
	                                                <i class="ace-icon fa fa-chevron-up"></i>
	                                            </a>
	                                            <a href="#" data-action="fullscreen" class="orange2">
	                                                <i class="ace-icon fa fa-expand"></i>
	                                            </a>
	                                      </span>
	                             </div>
	                              <div class="widget-body col-xs-12">
	                              	<div class="form-group">
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="HEALTHSN">健康账号:</label>
                                               <div class="col-sm-8">
                                                   <span name="HEALTHSN" id="HEALTH_ACCOUNT" class="col-sm-12 from-control-span">${pd.HEALTH_ACCOUNT}</span>
                                               </div>
                                           </div>
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="HEADTHCARDNO">参保卡号:</label>
                                               <div class="col-sm-8">
                                                   <span name="MI_CARD" id="MI_CARD" class="col-sm-12 from-control-span">${pd.MI_CARD}</span>
                                               </div>
                                           </div>
                                  	</div>
                                  	<div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="COMMUNITY">微信账号:</label>
                                                    <div class="col-sm-8" id="COMMUNITYDiv">
                                                        <span name="WXACCOUNT" id="WXACCOUNT" class="col-sm-12 from-control-span">${pd.WXACCOUNT }</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="QQACCOUNT ">QQ账号:</label>
                                                    <div class="col-sm-8" id="AREADiv">
                                                        <span name="QQACCOUNT " id="QQACCOUNT " class="col-sm-12 from-control-span">${pd.QQACCOUNT }</span>
                                                    </div>
                                                </div>
							  		 </div>
							  		 <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SINAACCOUNT "  >新浪账号:</label>
                                                    <div class="col-sm-8"  >
                                                        <span name="SINAACCOUNT " id="SINAACCOUNT " class="col-sm-12 from-control-span">${pd.SINAACCOUNT }</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="REFERRAL_CODE "  >推荐码:</label>
                                                    <div class="col-sm-8"  >
                                                        <span name="REFERRAL_CODE " id="REFERRAL_CODE  " class="col-sm-12 from-control-span">${pd.REFERRAL_CODE }</span>
                                                    </div>
                                                </div>
                                     </div>
                                     <div class="form-group">
                                               <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="REFERRAL_CODE "  >邮箱:</label>
                                                    <div class="col-sm-8"  >
                                                        <span name="REFERRAL_CODE " id="REFERRAL_CODE  " class="col-sm-12 from-control-span">${pd.EMAIL }</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="WEIGHT" >云信编号:</label>
                                                    <div class="col-sm-8"  >
                                                        <span name="YXID " id="YXID   " class="col-sm-12 from-control-span">${pd.YXID }</span>
                                                    </div>
                                                </div>
                                      </div>
                                     <div class="form-group">
                                          <div class="col-xs-12 col-sm-6">
                                              <label class="col-sm-4 control-label no-padding-right" for="IS_INDEPENDENCE">是否独立:</label>
                                              <div class="col-sm-8">
                                                  <span name="IS_INDEPENDENCE" id="IS_INDEPENDENCE" class="col-sm-12 from-control-span">
													<c:if test="${pd.IS_INDEPENDENCE == '1' }">是</c:if>
													<c:if test="${pd.IS_INDEPENDENCE == '0' }">否</c:if>
												  </span>
                                              </div>
                                          </div>
                                          <div class="col-xs-12 col-sm-6">
                                              <label class="col-sm-4 control-label no-padding-right" for="SHARE_AMOUNT ">软件分享次数:</label>
                                              <div class="col-sm-8">
                                                  <span name="SHARE_AMOUNT " id="SHARE_AMOUNT " class="col-sm-12 from-control-span">${pd.SHARE_AMOUNT }</span>
                                              </div>
                                          </div>
                                     </div>
                                     <div class="form-group">
                                             <div class="col-xs-12  col-sm-6">
                                                 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >是否锁定:</label>
                                                 <div class="col-sm-8"  >
                                                     <span name="IS_LOCK" id="IS_LOCK " class="col-sm-12 from-control-span">
														<c:if test="${pd.IS_LOCK == '0' }">否</c:if> 
														<c:if test="${pd.IS_LOCK == '1' }">是</c:if> 
													</span>
                                                 </div>
                                             </div>
											<div class="col-xs-12  col-sm-6">
                                                 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >锁定人ID:</label>
                                                 <div class="col-sm-8" >
                                                     <span name="OPERATOR_ID " id="OPERATOR_ID  " class="col-sm-12 from-control-span">${pd.OPERATOR_ID }</span>
                                                 </div>
                                            </div>
                                     </div>
	                              </div>
                            </div>
                            </div>
                            <div class="form-group">
                            <div class="widget-box col-xs-12">
	                                <div class="widget-header">
	                                    <h5 class="widget-title">居民健康信息</h5>
	                                        <span class="widget-toolbar">
	                                            <a href="#" data-action="collapse">
	                                                <i class="ace-icon fa fa-chevron-up"></i>
	                                            </a>
	                                            <a href="#" data-action="fullscreen" class="orange2">
	                                                <i class="ace-icon fa fa-expand"></i>
	                                            </a>
	                                        </span>
	                               </div>
	                              <div class="widget-body col-xs-12">
	                              	<div class="form-group">
                                        <div class="col-xs-12  col-sm-6">
                                            <label class="col-sm-4 control-label no-padding-right" for="HEIGHT " >身高(CM):</label>
                                            <div class="col-sm-8" >
                                                <span name="HEIGHT " id="HEIGHT " class="col-sm-12 from-control-span">${pd.HEIGHT }</span>
                                            </div>
                                        </div>
										<div class="col-xs-12  col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="WEIGHT" >体重(单位:kg):</label>
                                                <div class="col-sm-8"  ">
                                                    <span name="WEIGHT " id="WEIGHT  " class="col-sm-12 from-control-span">${pd.WEIGHT }</span>
                                                </div>
                                     	</div>
                                     </div>
                                     <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HISTORY_ALLERGIC " >过敏史:</label>
                                                    <div class="col-sm-8" >
                                                        <span name="HISTORY_ALLERGIC " id="HISTORY_ALLERGIC " class="col-sm-12 from-control-span">${pd.HISTORY_ALLERGIC }</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HISTORY_OPERATION " >手术史:</label>
                                                    <div class="col-sm-8"  >
                                                        <span name="HISTORY_OPERATION " id="HISTORY_OPERATION " class="col-sm-12 from-control-span">${pd.HISTORY_OPERATION }</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HISTORY_ALLERGIC ">备注:</label>
                                                    <div class="col-sm-8"  >
                                                        <span name="REMARK " id="REMARK " class="col-sm-12 from-control-span">${pd.REMARK }</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HISTORY_OPERATION " >所属分组:</label>
                                                    <div class="col-sm-8" >
                                                        <span name="GROUP_ID " id="GROUP_ID  " class="col-sm-12 from-control-span">${pd.GROUP_ID }</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTOR_OPERATOR_ID ">医生与患者关联ID:</label>
                                                    <div class="col-sm-8">
                                                        <span name="DOCTOR_OPERATOR_ID " id="DOCTOR_OPERATOR_ID " class="col-sm-12 from-control-span">${pd.DOCTOR_OPERATOR_ID }</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTOR_OPERATOR_TIME " >医生与患者关联操作时间:</label>
                                                    <div class="col-sm-8"  >
                                                        <span name="DOCTOR_OPERATOR_TIME" id="DOCTOR_OPERATOR_TIME " class="col-sm-12 from-control-span"><fmt:formatDate pattern="yyyy-MM-dd" value="${pd.DOCTOR_OPERATOR_TIME}" /></span>
                                                    </div>
                                                </div>
                                            </div>
                                           <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTOR_OPERATOR_ID " >签约状态:</label>
                                                    <div class="col-sm-8" >
                                                        <span name="DOCTOR_OPERATOR_ID " id="DOCTOR_OPERATOR_ID " class="col-sm-12 from-control-span">
															<c:if test="${pd.IS_SIGN == '0' }">未签约</c:if> 
															<c:if test="${pd.IS_SIGN == '1' }">待签约</c:if> 
															<c:if test="${pd.IS_SIGN == '2' }">已签约</c:if>
														</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTOR_OPERATOR_TIME " >是否重点人群</label>
                                                    <div class="col-sm-8" >
                                                        <span  id="DOCTOR_OPERATOR_TIME " class="col-sm-12 from-control-span">
															 <c:if test="${pd.ZDRQ == '1' }">是</c:if> 
															 <c:if test="${pd.ZDRQ == '2' }">否</c:if>
														</span>
                                                    </div>
                                                </div>
                                            </div>
	                              </div> 
                             </div>
                            </div>
                              <div align="center">
									
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
								</div>
                       		</div>
                        </form>
                      </div>
                                       
                   </div>
		    </div>
		</div>
							
	
	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>					
</div>	
</div>		
						<!-- /.col -->
					
					<!-- /.row -->
				
				<!-- /.page-content -->
			
		
		<!-- /.main-content -->

	<!-- /.main-container -->
	<!-- basic scripts -->
	
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp" %>
	<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
    <script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
    <!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDialog.js"></script>
	<!-- 页面底部js¨ -->
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	//验证身份证正则表达式
	function isSfzh(sfzh){
		return(new RegExp(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/).test(sfzh));
	}
	
	//验证邮箱正则表达式
	function isEmail(email){
		return(new RegExp(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/).test(email));
	}
	
	//验证手机号正则表达式
	function isTel(telephone){
		return(new RegExp(/^(13[0-9]{9})|(14[0-9]{9})|(15[0-9]{9})|(18[0-9]{9})$/).test(telephone));
	}
	
	//验证QQ号正则表达式
	function isQQ(qqaccount){
		return(new RegExp(/^\d{5,10}$/).test(qqaccount));
	}
	
	//验证邮编正则表达式
	function isPostcode(postcode){
		return(new RegExp(/^\d{6}$/).test(postcode));
	}
	
	//验证身高,体重
	function isHEIGHT(height){
		return(new RegExp(/^[0-9]{2,3}$/).test(height));
	}
	
	//验证邮箱格式
	function yanE(){
		if(!isEmail($("#EMAIL").val()) && $("#EMAIL").val() != ""){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").val("");
			return false;
		}
	}
	
	//验证电话号码号格式
	function yanT(){
		if(!isTel($("#TELEPHONE").val()) && $("#TELEPHONE").val() != ""){
			$("#TELEPHONE").tips({
				side:3,
	            msg:'手机号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TELEPHONE").val("");
			return false;
		}
	}
	
	//验证QQ格式
	function yanQ(){
		if(!isQQ($("#QQACCOUNT").val()) && $("#QQACCOUNT").val() !=""){
			$("#QQACCOUNT").tips({
				side:3,
	            msg:'QQ号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QQACCOUNT").val("");
			return false;
		}
	}
	
	//验证邮编格式
	function yanP(){
		if(!isPostcode($("#POSTCODE").val()) && $("#POSTCODE").val() !=""){
			$("#POSTCODE").tips({
				side:3,
	            msg:'邮政编码格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#POSTCODE").val("");
			return false;
		}
	}
	
	//验证身高
	function yanHEIGHT(){
		if(!isHEIGHT($("#HEIGHT").val()) && $("#HEIGHT").val() !=""){
			$("#HEIGHT").tips({
				side:3,
	            msg:'身高值不在范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HEIGHT").val("");
			return false;
		}
	}
	
	//验证体重
	function yanWEIGHT(){
		if(!isHEIGHT($("#WEIGHT").val()) && $("#WEIGHT").val() !=""){
			$("#WEIGHT").tips({
				side:3,
	            msg:'体重值不在范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#WEIGHT").val("");
			return false;
		}
	}
	
	//保存
	function save(){
		if($("#USER_NAME").val()==""){
			$("#USER_NAME").tips({
				side:3,
	            msg:'请输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_NAME").focus();
			return false;
		} else {
			$("#USER_NAME").val($.trim($("#USER_NAME").val()));
		}
		
		if($("#HEALTH_ACCOUNT").val()==""){
			$("#HEALTH_ACCOUNT").tips({
				side:3,
	            msg:'请输入健康账号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HEALTH_ACCOUNT").focus();
			return false;
		}else{
			$("#HEALTH_ACCOUNT").val($.trim($("#HEALTH_ACCOUNT").val()));
		}	
		if($("#ID_NUMBER").val()==""){
			
			$("#ID_NUMBER").tips({
				side:3,
	            msg:'请输入身份证号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ID_NUMBER").focus();
			return false;
		}else if(!isSfzh($("#ID_NUMBER").val())){
			$("#ID_NUMBER").tips({
				side:3,
	            msg:'身份证号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ID_NUMBER").val("");
			return false;
		} else {
			$("#ID_NUMBER").val($.trim($("#ID_NUMBER").val()));
		}
		
		
		if($("#MI_CARD").val()==""){
			$("#MI_CARD").tips({
				side:3,
	            msg:'输入医保卡号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MI_CARD").focus();
			return false;
		} else {
			$("#MI_CARD").val($.trim($("#MI_CARD").val()));
		}
		
		
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	//判断医保卡号是否存在
	function hasM(){
		var MI_CARD = $("#MI_CARD").val();
		var USER_AGENT_ID = $("#USER_AGENT_ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>jmxx/hasM.do',
	    	data: {MI_CARD:MI_CARD,USER_AGENT_ID:USER_AGENT_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#MI_CARD").tips({
							side:3,
				            msg:'医保卡号'+MI_CARD+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#MI_CARD').val('');
				 }
			}
		});
	}
	
	//判断身份证号是否存在
	function hasI(){
		var ID_NUMBER = $("#ID_NUMBER").val();
		var USER_AGENT_ID = $("#USER_AGENT_ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>jmxx/hasI.do',
	    	data: {ID_NUMBER:ID_NUMBER,USER_AGENT_ID:USER_AGENT_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#ID_NUMBER").tips({
							side:3,
				            msg:'身份证'+ID_NUMBER+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#ID_NUMBER').val('');
				 }
			}
		});
	}	
	
	
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
</script>
</html>