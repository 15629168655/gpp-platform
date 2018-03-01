<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
								<form action="element/${msg }.do" name="elementForm" id="elementForm" method="post">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">名称:<span style="color:red; font-size:14px">*</span></td></td>
											<td><input type="text" name="ZDM" id="ZDM" value="${pd.ZDM }" maxlength="32" placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">显示名称: <span style="color:red; font-size:14px">*</span></td></td>
											<td><input type="text" name="XSMC" id="XSMC" value="${pd.XSMC }" maxlength="32" placeholder="这里输入显示名称" title="显示名称" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">类型:</td>
											<td>
											 <select class="form-control" name="LX" id="LX" style="width:98%;">
											         <option value="" selected >请选择类型</option>
										              <c:forEach items="${pd.enumElementType}" var="type">
		                                               <option value="${type.key}" <c:if test="${pd.LX == type.key}"> selected="selected" </c:if> >${type.value}</option>
		                                             </c:forEach>
										     </select>
											</td>
										</tr>
										
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">默认值:</td>
											<td><input type="text" name="MRZ" id="MRZ" value="${pd.MRZ }" maxlength="32" placeholder="这里输入默认值" title="默认值" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">字典表名:</td>
											<td><input type="text" name="ZDBM" id="ZDBM" value="${pd.ZDBM }" maxlength="32" placeholder="这里输入字典表名" title="字典表名" style="width:98%;"/></td>
										</tr>
										<tr id="zd">
											<td style="width:100px;text-align: right;padding-top: 13px;">字典ID:</td>
											<td><input type="text" name="ZDID" id="ZDID" value="${pd.ZDID }" maxlength="50" placeholder="这里输入字典ID" title="字典ID" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">选择项:</td>
											<td><input type="text" name="XZX" id="XZX" value="${pd.XZX }" maxlength="50" placeholder="这里输入选择项" title="选择项" style="width:98%;" onclick="proccess"/></td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;" >是否显示:</td>
											<td>
											<select name="SFXS" id="SFXS" style="width:98%;">
											<option value="0" <c:if test="${pd.SFXS == '0' }">selected</c:if> >显示</option>
											<option value="1" <c:if test="${pd.SFXS == '1' }">selected</c:if> >隐藏</option>
											</select>
											</td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">状态:</td>
											<td>
										   <select name="ZT" id="ZT" title="状态" style="width:98%;" >
										   <option value="1" <c:if test="${pd.ZT == '1' }">selected</c:if> >启用</option>
										   <option value="0" <c:if test="${pd.ZT == '0' }">selected</c:if> >停用</option>
										   </select>
									      </td>
									    </tr>
									    <tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">操作人:</td>
											<td><input type="text" name="CZR" id="CZR" value="${pd.CZR }" maxlength="32" placeholder="这里输入操作人" title="操作人" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">元素分类:</td>
											<td>
									         <select class="chosen-select form-control" name="YSFLID" id="YSFLID" data-placeholder="请选择元素分类" style="vertical-align:top;"  title="元素分类" style="width:98%;"  >
									          <option value="" selected="true"></option>
									          <c:forEach items="${ysflList}" var="ysfl">
										      <option value="${ysfl.ID }" <c:if test="${ysfl.MC == pd.YSFLID }">selected</c:if>>${ysfl.MC }</option>
									          </c:forEach>
									         </select>
											</td>
										</tr>
										<tr>
										<td style="width:100px;text-align: right;padding-top: 13px;">生成时间:</td>
										 <td><input name="SCSJ" id="SCSJ"  value="${pd.SCSJ}" type="text"   title="生成时间" style="width:98%;" readonly/></td>
									    </tr>
										<tr>
										<td style="width:100px;text-align: right;padding-top: 13px;">修改时间:</td>
										 <td><input name="XGSJ" id="XGSJ"  value="${pd.XGSJ}" type="text"   title="修改时间" style="width:98%;" readonly/></td>
									    </tr>
										
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
</body>
<script type="text/javascript">
    $(top.hangge());
    $(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
    }
	
	/* $(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		} 
	}*/
	);
	//保存
	function save(){
		if($("#ZDM").val()==""){
			$("#ZDM").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ZDM").focus();
			return false;
		}
		if($("#XSMC").val()==""){
			$("#XSMC").tips({
				side:3,
	            msg:'请输入显示名称',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#XSMC").focus();
			return false;
		}
		//校验json格式数据
		var checkJson =  function(v){
			var result=false;
			var names = undefined;
		 try{  	 
			 var namesstring = 'var names ='+v;
			 eval(namesstring);
			}catch(Error){}
			 if(names!=undefined) result=true;
			 return result;
		}
		//类型为单选框或复选框时，选择项必填
		if($("#LX").val()==3 || $("#LX").val()==4){
           if(!checkJson($("#XZX").val())){
 			$("#XZX").tips({
 				side:3,
 	            msg:"请输入类似{0:'男',1:'女'}的json格式数据",
 	            bg:'#AE81FF',
 	            time:3
 	        });
 			$("#XZX").focus();
 			return false;
 		   } 
		}
		//类型为下拉菜单时，字典表名及字典ID必填
        if($("#LX").val()==2){
           if($("#ZDBM").val()==""){
        	$("#ZDBM").tips({
				side:3,
	            msg:'请输入字典表名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ZDBM").focus();
			return false;
            }
           
           if($("#ZDID").val()==""){
           	$("#ZDID").tips({
   				side:3,
   	            msg:'请输入字典ID',
   	            bg:'#AE81FF',
   	            time:3
   	        });
   			$("#ZDID").focus();
   			return false;
               }
        }
	  
			$("#elementForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	
	}

	
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
	
</script>
</html>