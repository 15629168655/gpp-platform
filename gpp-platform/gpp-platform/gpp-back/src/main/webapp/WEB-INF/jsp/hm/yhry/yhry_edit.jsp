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
					
					<form action="yhry/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">医护人员姓名:</td>
								<td><input type="text" name="PROVIDER_NAME" id="PROVIDER_NAME" value="${pd.PROVIDER_NAME}" maxlength="255" placeholder="这里输入名字" title="名字" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">专业技术职务代码:</td>
								<td><input type="text" name="PRO_POSITION_CODE" id="PRO_POSITION_CODE" value="${pd.PRO_POSITION_CODE}" maxlength="255" placeholder="这里输入职务代码" title="职务代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">医护人员工号:</td>
								<td><input type="text" name="PROVIDER_CODE" id="PROVIDER_CODE" value="${pd.PROVIDER_CODE}" maxlength="255" placeholder="这里输入工号" title="id" style="width:98%;" <c:if test="${null != pd.PROVIDER_CODE}">readonly="readonly"</c:if> <c:if test="${null == pd.PROVIDER_CODE}">onblur="hasProviderId();"</c:if> /></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">性别:</td>
								<td><select class="form-control" id="SEX" name="SEX" style="width:98%;">
                                        <c:forEach items="${pd.enumSex}" var="item">
                                             <c:choose>
                                                 <c:when test="${pd.SEX == item.key}">
                                                       <option value="${item.key}" selected="selected">${item.value}</option>
                                                 </c:when>
                                                       <c:otherwise>
                                                        <option value="${item.key}">${item.value}</option>
                                                       </c:otherwise>
                                                  </c:choose>
                                             </c:forEach>
                                    </select></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">专业技术职务名称:</td>
								<td><input type="text" name="PRO_POSITION_NAME" id="PRO_POSITION_NAME" value="${pd.PRO_POSITION_NAME}" maxlength="255" placeholder="这里输入职务名称" title="职务名称" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">出生日期:</td>
								<td>
								    <input class="col-sm-11 form-control date-picker" style="width:98%;" name="BIRTH_TIME" id="BIRTH_TIME" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pd.BIRTH_TIME}" />'  type="text" data-date-format="yyyy-mm-dd" placeholder="注册时间" title="注册时间" />
								</td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">工作地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="255" placeholder="这里输入工作地址" title="工作地址" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">申请者姓名:</td>
								<td><input type="text" name="AUTHOR_NAME" id="AUTHOR_NAME" value="${pd.AUTHOR_NAME}" maxlength="255" placeholder="这里输入申请者姓名" title="申请者姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">身份证:</td>
								<td><input type="text" name="IDCARD" id="IDCARD" value="${pd.IDCARD}" maxlength="255" placeholder="这里输入身份证" title="身份证" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">申请者科室号标识:</td>
								<td><input type="text" name="AUTHOR_DEP_ID" id="AUTHOR_DEP_ID" value="${pd.AUTHOR_DEP_ID}" maxlength="255" placeholder="这里输入申请者科室号标识" title="申请者科室号标识" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">手机号码:</td>
								<td><input type="text" name="TELECOM" id="TELECOM" value="${pd.TELECOM}" maxlength="255" placeholder="这里输入联系方式" title="联系方式" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">申请者员科室名称:</td>
								<td><input type="text" name="AUTHOR_DEP_NAME" id="AUTHOR_DEP_NAME" value="${pd.AUTHOR_DEP_NAME}" maxlength="255" placeholder="这里输入申请者员科室名称" title="申请者员科室名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">角色状态:</td>
								<td><input type="text" name="ROLE_STATUS" id="ROLE_STATUS" value="${pd.ROLE_STATUS}" maxlength="255" placeholder="这里输入角色状态" title="角色状态" style="width:98%;"/></td>
								<td style="width:140px;text-align: right;padding-top: 13px;">申请者员科室联系人:</td>
								<td><input type="text" name="AUTHOR_DEP_CONTACTS" id="AUTHOR_DEP_CONTACTS" value="${pd.AUTHOR_DEP_CONTACTS}" maxlength="255" placeholder="这里输入申请者员科室联系人" title="申请者员科室联系人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">申请者id:</td>
								<td><input type="text" name="AUTHOR_ID" id="AUTHOR_ID" value="${pd.AUTHOR_ID}" maxlength="255" placeholder="这里输入申请者id" title="申请者id" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">申请时间:</td>
								<td><input type="text" name="CREATION_TIME" id="CREATION_TIME" value="${pd.CREATION_TIME}" maxlength="255" placeholder="这里输入申请时间" title="申请时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">角色有效期:</td>
								<td><input type="text" name="EFFECTIVE_TIME_LOW" id="EFFECTIVE_TIME_LOW" value="${pd.EFFECTIVE_TIME_LOW}" maxlength="255" placeholder="这里输入角色有效期" title="角色有效期" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">角色有效期:</td>
								<td><input type="text" name="EFFECTIVE_TIME_HIGH" id="EFFECTIVE_TIME_HIGH" value="${pd.EFFECTIVE_TIME_HIGH}" maxlength="255" placeholder="这里输入角色有效期" title="角色有效期" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">科室号标识:</td>
								<td><input type="text" name="DEP_ID" id="CHOOSE_DEP_ID" value="${pd.DEP_ID}" maxlength="255" placeholder="这里输入科室号标识" title="科室号标识" style="width:98%;"/></td>
								<td style="width:130px;text-align: right;padding-top: 13px;">科室名称:</td>
								<td><input type="text" name="DEP_NAME" id="CHOOSE_DEP_NAME" value="${pd.DEP_NAME}" maxlength="255" placeholder="这里输入科室名称" title="科室名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">所属机构标识:</td>
                                <td><input type="text" name="ORG_CODE" id="ORG_CODE" value="${pd.ORG_CODE}" maxlength="255" readonly="readonly" placeholder="这里输入所属机构标识" title="所属机构标识" style="width:98%;"/></td>
                                <td style="width:130px;text-align: right;padding-top: 13px;">所属机构名称:</td>
                                <td><input type="text" name="ORG_NAME" id="ORG_NAME" value="${pd.ORG_NAME}" maxlength="255" readonly="readonly" placeholder="这里输入所属机构名称" title="所属机构名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#PROVIDER_NAME").val()==""){
				$("#PROVIDER_NAME").tips({
					side:3,
		            msg:'请输入医护人员姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVIDER_NAME").focus();
			return false;
			}
			if($("#PROVIDER_CODE").val()==""){
				$("#PROVIDER_CODE").tips({
					side:3,
		            msg:'请输入医护人员id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVIDER_CODE").focus();
			return false;
			}
			/* if($("#PRO_POSITION_CODE").val()==""){
				$("#PRO_POSITION_CODE").tips({
					side:3,
		            msg:'专业技术职务代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRO_POSITION_CODE").focus();
			return false;
			}
			if($("#PRO_POSITION_NAME").val()==""){
				$("#PRO_POSITION_NAME").tips({
					side:3,
		            msg:'专业技术职务名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRO_POSITION_NAME").focus();
			return false;
			} */
			/* if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入工作地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			} */
	    //	var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
			var myreg = /^((1[0-9]{10})|(\d{7,8})|(\d{3,4})-(\d{7,8}))$/;
		/* 	if($("#TELECOM").val()==""){
				$("#TELECOM").tips({
					side:3,
					msg:'输入手机号',
					bg:'#AE81FF',
					time:3
				});
				$("#TELECOM").focus();
				return false;
			}else  */
			if($("#TELECOM").val() != "" && !myreg.test($("#TELECOM").val())){
				$("#TELECOM").tips({
					side:3,
					msg:'手机号格式不正确',
					bg:'#AE81FF',
					time:3
				});
				$("#TELECOM").focus();
				return false;
			}
			/* if($("#ROLE_STATUS").val()==""){
				$("#ROLE_STATUS").tips({
					side:3,
		            msg:'请输入角色状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ROLE_STATUS").focus();
			return false;
			}
			if($("#EFFECTIVE_TIME_LOW").val()==""){
				$("#EFFECTIVE_TIME_LOW").tips({
					side:3,
		            msg:'请输入角色有效期间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EFFECTIVE_TIME_LOW").focus();
			return false;
			}
			if($("#EFFECTIVE_TIME_HIGH").val()==""){
				$("#EFFECTIVE_TIME_HIGH").tips({
					side:3,
		            msg:'请输入角色有效期间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EFFECTIVE_TIME_HIGH").focus();
			return false;
			}  */
			if($("#IDCARD").val()  !== "" && $("#IDCARD").val()  !== "00401" && !(/^(^[1-9]\d{7}((0[1-9])|(1[0-2]))(([0|1|2][1-9])|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/.test($("#IDCARD").val()))){
				$("#IDCARD").tips({
					side:3,
		            msg:'请输入正确的身份证号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IDCARD").focus();
			return false;
			}
			/*  if($("#SEX").val()==""){
				$("#SEX").tips({
					side:3,
		            msg:'请输入性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEX").focus();
			return false;
			} */
			/* if($("#BIRTH_TIME").val()==""){
				$("#BIRTH_TIME").tips({
					side:3,
		            msg:'请输入出生日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BIRTH_TIME").focus();
			return false;
			} */
			/* if($("#AUTHOR_NAME").val()==""){
				$("#AUTHOR_NAME").tips({
					side:3,
		            msg:'请输入申请者姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AUTHOR_NAME").focus();
			return false;
			}  */
		/* 	if($("#AUTHOR_DEP_ID").val()==""){
				$("#AUTHOR_DEP_ID").tips({
					side:3,
		            msg:'请输入申请者科室标识',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AUTHOR_DEP_ID").focus();
			return false;
			} */
			/* if($("#AUTHOR_DEP_NAME").val()==""){
				$("#AUTHOR_DEP_NAME").tips({
					side:3,
		            msg:'请输入申请者科室名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AUTHOR_DEP_NAME").focus();
			return false;
			}  */
			/* if($("#AUTHOR_DEP_CONTACTS").val()==""){
				$("#AUTHOR_DEP_CONTACTS").tips({
					side:3,
		            msg:'请输入申请者科室联系人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AUTHOR_DEP_CONTACTS").focus();
			return false;
			} */
		/* 	if($("#CREATION_TIME").val()==""){
				$("#CREATION_TIME").tips({
					side:3,
		            msg:'请输入申请时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATION_TIME").focus();
			return false;
			}  */
			/*  if($("#DEP_ID").val()==""){
				$("#DEP_ID").tips({
					side:3,
		            msg:'请输入科室标识',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEP_ID").focus();
			return false;
			} */
			/* if($("#DEP_NAME").val()==""){
				$("#DEP_NAME").tips({
					side:3,
		            msg:'请输入科室名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DEP_NAME").focus();
			return false;
			} */
			if($("#ORG_CODE").val()==""){
				$("#ORG_CODE").tips({
					side:3,
		            msg:'请输入所属机构标识',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORG_CODE").focus();
			return false;
			} 
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	    //判断同一机构下医护人员id不能重复
		function hasProviderId(){
			//var PROVIDER_CODE = $.trim($("#PROVIDER_CODE").val());
			//if("" == PROVIDER_CODE)return;
			var PROVIDER_CODE = $("#PROVIDER_CODE").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>yhry/hasProviderId.do',
		    	data: {PROVIDER_CODE:PROVIDER_CODE},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
					 }else{
						$("#PROVIDER_CODE").tips({
							side:1,
				            msg:'医护人员工号'+PROVIDER_CODE+'已存在,重新输入',
				            bg:'#AE81FF',
				            time:5
				        });
						$('#PROVIDER_CODE').val('');
					 }
				}
			});
		}
	    
	    //选择科室窗口
		function chooseKS(ORG_CODE){

			top.jzts();
			var Title = "请选择科室";
			var diag = new top.Dialog();
			diag.Drag = true;
			diag.Title = Title;
			diag.URL = '<%=basePath%>/departments/chooseKS.do?ORG_CODE='+ORG_CODE;
			diag.Width = 330;
			diag.Height = 450;
			diag.CancelEvent = function(){ //关闭事件
				diag.close();
			};
			diag.show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
			var org_code = $("#ORG_CODE").val();
			$("#CHOOSE_DEP_ID").click(function(){  
				chooseKS(org_code);
			});
			
			$("#CHOOSE_DEP_NAME").click(function(){  
				chooseKS(org_code);
			});
		});
		</script>
</body>
</html>