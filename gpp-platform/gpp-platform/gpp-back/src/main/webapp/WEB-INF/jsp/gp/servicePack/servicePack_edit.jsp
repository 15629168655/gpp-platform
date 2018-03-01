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
<!-- 弹出服务包新增页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<style type="text/css">
		#dialog-add,#dialog-message,#dialog-comment{width:100%; height:100%; position:fixed; top:0px; z-index:99999999; display:none;}
		.commitopacity{position:absolute; width:100%; height:700px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
		.commitbox{width:100%; margin:0px auto; position:absolute; top:0px; z-index:99999;}
		.commitbox_inner{width:96%; height:255px;  margin:6px auto; background:#efefef; border-radius:5px;}
		.commitbox_top{width:100%; height:253px; margin-bottom:10px; padding-top:10px; background:#FFF; border-radius:5px; box-shadow:1px 1px 3px #e8e8e8;}
		.commitbox_top textarea{width:95%; height:195px; display:block; margin:0px auto; border:0px;}
		.commitbox_cen{width:95%; height:40px; padding-top:10px;}
		.commitbox_cen div.left{float:left;background-size:15px; background-position:0px 3px; padding-left:18px; color:#f77500; font-size:16px; line-height:27px;}
		.commitbox_cen div.left img{width:30px;}
		.commitbox_cen div.right{float:right; margin-top:7px;}
		.commitbox_cen div.right span{cursor:pointer;}
		.commitbox_cen div.right span.save{border:solid 1px #c7c7c7; background:#6FB3E0; border-radius:3px; color:#FFF; padding:5px 10px;}
		.commitbox_cen div.right span.quxiao{border:solid 1px #f77400; background:#f77400; border-radius:3px; color:#FFF; padding:4px 9px;}
	</style>
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
						<form action="servicePack/${msg }.do" name="userForm" id="userForm" method="post">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:85px;text-align: right;padding-top: 13px;">名称<span class="red">*</span>:</td>
									<td><input type="text" name="MC" id="MC" value="${pd.MC }" placeholder="这里输入名称" maxlength="40" title="这里输入名称" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">编码<span class="red">*</span>:</td>
									<td><input type="text" name="BM" id="BM" value="${pd.BM }" placeholder="这里输入编码" maxlength="40" title="这里输入名称" style="width:98%;" onblur="hasBM();"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">内容:</td>
									<td style="padding-top: 3px;" id="NR" >
										 <script id="editor" name="NR" type="text/plain" style="width:660px;height:159px;">${pd.NR }</script>
									</td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">类型:</td>
										<td>
												<select name="LX" id="LX" style="width:98%;">
										             <c:forEach items="${pd.EnumServicePackLX}" var="item">
		                                             <c:choose>
		                                                 <c:when test="${pd.LX == item.key}">
		                                                       <option value="${item.key}" selected="selected">${item.value}</option>
		                                                 </c:when>
		                                                 
		                                                       <c:otherwise>
		                                                        <option value="${item.key}">${item.value}</option>
		                                                       </c:otherwise>
		                                                  
		                                                  </c:choose>
		                                             </c:forEach>
											     </select>
											 </td>
								<tr>
								
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">费用:</td>
									<td><input type="number" name="FY" id="FY" value="${pd.FY }" placeholder="费用(单位：元)" maxlength="20" title="这里输入费用" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">时限:</td>
									<td><input type="number" name="SX" id="SX" value="${pd.SX }" placeholder="时限（单位：月）" maxlength="20" title="这里输入时限" style="width:98%;" /></td>
								</tr>
								<tr>
									<td class="center" colspan="6">
										<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
							</table>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	<!-- 编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 编辑框-->
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/fhsms.js"></script>
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
	
	$(function() {
		//日期框
		$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
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
	
	//保存
	function save(){
		if($("#MC").val()==""){
			$("#MC").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MC").focus();
			return false;
		} else {
			$("#MC").val($.trim($("#MC").val()));
		}
		
		if($("#BM").val()==""){
			$("#BM").tips({
				side:3,
	            msg:'请输入编码',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#BM").focus();
			return false;
		}else{
			$("#BM").val($.trim($("#BM").val()));
		}	
			
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		
	}	
	
	//判断编码是否存在
	function hasBM(){
		var BM = $("#BM").val();
		var ID = $("#ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>servicePack/hasBM.do',
	    	data: {BM:BM,ID:ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#BM").tips({
							side:3,
				            msg:'编码'+BM+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#BM').val('');
				 }
			}
		});
	}	
	

</script>
</html>