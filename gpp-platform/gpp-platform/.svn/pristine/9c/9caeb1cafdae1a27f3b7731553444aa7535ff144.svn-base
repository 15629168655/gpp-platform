<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
					<!-- 签约管理 新增修改页面 -->
					<form action="agreementService/${msg}.do" name="Form" id="Form" method="post" enctype="multipart/form-data" >
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<input type="hidden" name="APPLICANT_CODE" id="APPLICANT_CODE" value="${pd.APPLICANT_CODE}" style="width:98%;"/><!-- 协议编号 -->
						<input type="hidden" name="GEN_PRACTITIONER_ID" id="GEN_PRACTITIONER_ID" value="${pd.GEN_PRACTITIONER_ID}" style="width:98%;"/><!-- 签约医生ID -->
						<input type="hidden" name="TEAM_ID" id="TEAM_ID" value="${pd.TEAM_ID}" style="width:98%;"/><!-- 签约医生团队ID -->
						<input type="hidden" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" style="width:98%;"/><!-- 机构ID -->
						<input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="${pd.MEMBER_ID}" style="width:98%;"/><!-- 签约居民ID -->
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议名称:</td>
								<td><input type="text" name="AGREEMENT_NAME" id="AGREEMENT_NAME" value="${pd.AGREEMENT_NAME}" maxlength="255" placeholder="这里输入协议名称" title="协议名称" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">签约医生姓名:</td>
								<td><input type="text" name="GEN_PRACTITIONER_NAME" id="GEN_PRACTITIONER_NAME" value="${pd.GEN_PRACTITIONER_NAME}" maxlength="255" placeholder="这里输入签约医生姓名" title="id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">签约医生电话:</td>
								<td><input type="text" name="GEN_PRACTITIONER_PHONE" id="GEN_PRACTITIONER_PHONE" value="${pd.GEN_PRACTITIONER_PHONE}" maxlength="255" placeholder="这里输入签约医生电话" title="签约医生电话" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">区划代码:</td>
								<td><input type="text" name="REGION_CODE" id="REGION_CODE" value="${pd.REGION_CODE}" maxlength="255" placeholder="这里输入区划代码" title="id" style="width:98%;"/></td>	
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议开始时间:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker" style="width:98%;" name="GMT_START" id="GMT_START" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.GMT_START}" />'  type="text" data-date-format="yyyy-mm-dd" placeholder="协议开始时间" title="协议开始时间" />
								</td>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议结束时间:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker" style="width:98%;" name="GMT_END" id="GMT_END" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.GMT_END}" />'  type="text" data-date-format="yyyy-mm-dd" placeholder="协议结束时间" title="协议结束时间" />
								</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">签约居民姓名:</td>
								<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" value="${pd.MEMBER_NAME}" maxlength="255" readonly="readonly" placeholder="这里输入签约居民姓名" title="签约居民姓名" style="width:70%;"/>
								<a class="btn btn-mini btn-purple" onclick="jmxxDate();">居民列表</a>
								</td>
								<td style="width:130px;text-align: right;padding-top: 13px;">医保卡号:</td>
								<td><input type="text" name="MI_CARD" id="MI_CARD" value="${pd.MI_CARD}" maxlength="255" placeholder="这里输入医保卡号" title="医保卡号" style="width:98%;"onkeypress="if (event.keyCode == 13) micardSearch();" /></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">身份证号:</td>
								<td><input type="text" name="ID_CARD" id="ID_CARD" value="${pd.ID_CARD}" maxlength="255" placeholder="这里输入身份证号" title="身份证号" style="width:98%;" onkeypress="if (event.keyCode == 13) IdcardSearch();" /></td>
								<td style="width:140px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" value="${pd.MEMBER_PHONE}" maxlength="255" placeholder="这里输入联系电话" title="联系电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">家庭住址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="255" placeholder="这里输入家庭住址" title="家庭住址" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">协议文件地址:</td>
								<td>
									<input type="file" name="FILE" id="FILE" value="" maxlength="255"  style="width:98%;"/>
									<c:if test="${not empty pd.FILE_ID }">
										<a href="javascript:download('${pd.FILE_ID}');" > 下载文件查看</a>
									</c:if>
									<c:if test="${ empty pd.FILE_ID}">
										<font>(暂无附件...)</font>
									</c:if>
								</td>
							</tr>
							<tr>
							<%--
								<td style="width:130px;text-align: right;padding-top: 13px;">修改时间:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker" style="width:98%;" name="GMT_MODIFIED" id="GMT_MODIFIED" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.GMT_MODIFIED}" />'  type="text" data-date-format="yyyy-mm-dd" placeholder="修改时间" title="修改时间" />
								</td>
								 <td style="width:130px;text-align: right;padding-top: 13px;">状态:</td>
								<td>
									<select name=STATUS title="状态" style="width:98%;">
									<option value="0" <c:if test="${pd.STATUS == '0' }">selected</c:if> >保存</option>
									<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if> >签约</option>
									<option value="2" <c:if test="${pd.STATUS == '2' }">selected</c:if> >变更</option>
									<option value="3" <c:if test="${pd.STATUS == '3' }">selected</c:if> >解约</option>
									<option value="4" <c:if test="${pd.STATUS == '4' }">selected</c:if> >续约</option>
									<option value="5" <c:if test="${pd.STATUS == '5' }">selected</c:if> >转签</option>
									<option value="9" <c:if test="${pd.STATUS == '9' }">selected</c:if> >删除</option>
									</select>
								</td> --%>
								<td style="width:130px;text-align: right;padding-top: 13px;">签订时间:</td>
								<td>
									<input  style="width:98%;" name="GMT_SIGNED" id="GMT_SIGNED"  value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.GMT_SIGNED}" />'  type="text"  placeholder="签订时间" title="签订时间" />
								</td>
								<td style="width:130px;text-align: right;padding-top: 13px;">服务包:</td>
								<td>
									<select name="SERVICE_PACK" id="SERVICE_PACK" style="width:98%;">
							            
                                            <c:forEach items="${pd.PACKList}" var="item">
                                            <c:choose>
                                                 <c:when test="${item.ID == pd.SERVICE_PACK}">
                                                     <option value="${item.ID}" selected="selected">${item.MC}</option>
                                                 </c:when>
                                                 <c:otherwise>
                                                     <option value="${item.ID}">${item.MC}</option>
                                                 </c:otherwise>
                                            </c:choose>
                                            </c:forEach>
                                         
								     </select>
								 </td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save(1);">保存</a>
									<a class="btn btn-mini btn-primary" onclick="save(2);">提交</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(msg){
			if($("#AGREEMENT_NAME").val()==""){
				$("#AGREEMENT_NAME").tips({
					side:3,
		            msg:'请输入协议名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGREEMENT_NAME").focus();
			return false;
			}
			if($("#APPLICANT_CODE").val()==""){
				$("#APPLICANT_CODE").tips({
					side:3,
		            msg:'请输入协议编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#APPLICANT_CODE").focus();
			return false;
			}
			if($("#GMT_START").val()==""){
				$("#GMT_START").tips({
					side:3,
		            msg:'协议开始时间不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GMT_START").focus();
				return false;
			}
			if($("#GMT_END").val()==""){
				$("#GMT_END").tips({
					side:3,
		            msg:'协议结束时间不能为空',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GMT_END").focus();
				return false;
			}
			if($("#GMT_START").val()!="" && $("#GMT_END").val()!=""){
				var GMT_START = $("#GMT_START").val();
				var GMT_END =$("#GMT_END").val();
				if(GMT_START.length==10){
					GMT_START=GMT_START+" "+"00:00:00";
				}
				if(GMT_END.length==10){
					GMT_END=GMT_END+" "+"23:59:59";
				}
				var startTime = Date.parse(GMT_START);
				var endTime = Date.parse(GMT_END);
				if(startTime>=endTime){
					$("#GMT_START").tips({
						side:3,
			            msg:'协议开始时间不能大于结束时间',
			            bg:'#AE81FF',
			            time:2
			        });
				} 
			}  
			if(msg == "2"){
				bootbox.confirm("确定要提交签约吗？", function(result){
					if(result){
						top.jzts();
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					}
				});
			}else if(msg=="1"){
				top.jzts();
				$("#Form").attr("action","agreementService/edit.do?s=1");
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			//日期框时分秒
			$('#GMT_SIGNED').datetimepicker({
				format:'YYYY-MM-DD HH:mm:ss '
			}).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
		});
		
			<%-- 通过居民身份证查询居民基本信息 --%>
			function IdcardSearch(){
				var idcard = $("#ID_CARD").val();  	 //身份证
				var name = $("#MEMBER_NAME").val();  
				var micard = $("#MI_CARD").val();
				var phone = $("#MEMBER_PHONE").val();
				var address = $("#ADDRESS").val();
	            $.ajax({
	                type: "POST",
	                url: '<%=basePath%>agreementService/idcardSearch.do',
	                data: {
	                    ID_CARD:idcard,
	                    MEMBER_NAME:name,
	                    MI_CARD:micard,
	                    MEMBER_PHONE:phone,
	                    ADDRESS:address
	                },
	                success: function (data) {
	                       if("success" != data.result){
		                      $("#MEMBER_PHONE").val(data.MEMBER_PHONE);
				              $("#MEMBER_NAME").val(data.MEMBER_NAME);
				              $("#MI_CARD").val(data.MI_CARD);
				              $("#ADDRESS").val(data.ADDRESS);
			           }
	                }
	            })			
	        }
			<%-- 通过居民医保卡号查询居民基本信息 --%>
			function micardSearch(){
				var micard = $("#MI_CARD").val();	//医保卡
				var idcard = $("#ID_CARD").val();  	 
				var name = $("#MEMBER_NAME").val();  
				var phone = $("#MEMBER_PHONE").val();
				var address = $("#ADDRESS").val();
	            $.ajax({
	                type: "POST",
	                url: '<%=basePath%>agreementService/micardSearch.do',
	                data: {
	                    ID_CARD:idcard,
	                    MEMBER_NAME:name,
	                    MI_CARD:micard,
	                    MEMBER_PHONE:phone,
	                    ADDRESS:address
	                },
	                success: function (data) {
	                       if("success" != data.result){
		                      $("#MEMBER_PHONE").val(data.MEMBER_PHONE);
				              $("#MEMBER_NAME").val(data.MEMBER_NAME);
				              $("#ID_CARD").val(data.ID_CARD);
				              $("#ADDRESS").val(data.ADDRESS);
			           }
	                }
	            });			
			}
			
			//居民菜单
			function jmxxDate(){
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag = true;
				 diag.Title = "居民列表";
				 diag.URL = '<%=basePath%>agreementApply/getJMXX.do';
				 diag.Width = 1000;
				 diag.Height = 700;
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				  diag.OKEvent = function(){
			  
	            	var MEMBER_ID = diag.innerFrame.contentWindow.document.getElementById('USER_AGENT_ID').value;
	            	if(MEMBER_ID!=''){
	            		$("#MEMBER_ID").val(MEMBER_ID);
	            		$("#MEMBER_ID").val(diag.innerFrame.contentWindow.document.getElementById('USER_AGENT_ID').value);//居民id
	                	$("#MEMBER_NAME").val(diag.innerFrame.contentWindow.document.getElementById('USER_NAME').value);  //签约居民
	                	$("#MEMBER_PHONE").val(diag.innerFrame.contentWindow.document.getElementById('TELEPHONE').value); //联系电话
	                	$("#ID_CARD").val(diag.innerFrame.contentWindow.document.getElementById('ID_NUMBER').value);	  //身份证
	                	$("#MI_CARD").val(diag.innerFrame.contentWindow.document.getElementById('MI_CARD').value);        //医保卡号
	                	diag.close();
	            	}
	         };
				 diag.show();
			}
			
			//文件下载
			function download(ID){
				window.location.href= "<%=basePath%>attachment/download.do?ATTACHMENT_ID="+ID+"&tm="+new Date().getTime();
			}
			
		</script>
</body>
</html>