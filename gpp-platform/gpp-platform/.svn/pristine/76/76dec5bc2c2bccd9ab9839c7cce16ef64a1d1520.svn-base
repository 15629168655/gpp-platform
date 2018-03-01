<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 检查知识库新增和修改页面 -->
<!DOCTYPE html>
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
						<form action="jcKnowledgeBase/${msg }.do" name="userForm" id="userForm" method="post">
							<input type="hidden" name="ID" id="ID" value="${data.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">检查类型<span class="red">*</span>：</td>
									<td>
										<input type="hidden" id="JCLXBM" name="JCLXBM" value="${data.JCLXBM }" />
										<input type="text" id="JCLXMC" name="JCLXMC" value="${data.JCLXMC }" readonly="readonly" style="width: 80%"/>
										<a class="btn btn-mini btn-purple" onclick="treeDialog();">检查类型菜单</a>
									</td>
								</tr>	
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">是否推荐：</td>
									<td>
										<label><input name="IS_RECOMMEND" type="radio" value="1"   checked="checked" <c:out value="${data.IS_RECOMMEND=='1'?'checked':''}"/> />推荐</label>
										<label><input name="IS_RECOMMEND" type="radio" value="0" <c:out value="${data.IS_RECOMMEND=='0'?'checked':''}"/> />不推荐</label>
									</td>
								</tr>
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">首字母：</td>
									<td>
										<input type="text" id="FIRST" name="FIRST" value="${data.FIRST }" maxlength="1" onblur="YZSZM();" style="width: 98%" />
									</td>
								</tr>	
								<tr>
									<td style="width:150px;text-align: right;padding-top: 13px;">症状内容：</td>
									<td style="padding-top: 3px;" id="REMARK" >
										 <script id="editor" name="REMARK" type="text/plain" style="width:600px;height:159px;">${data.REMARK }</script>
									</td>
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
	<script type="text/javascript" src="static/js/myjs/fhsms.js"></script>
	<!-- 编辑框-->
	<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	
	<script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	
	
	//验证首字母
	//验证邮箱正则表达式
	function isSZM(FIRST){
		return(new RegExp(/^[a-zA-Z]{1}$/).test(FIRST));
	}
	
	//验证首字母
	function YZSZM(){
		if(!isSZM($("#FIRST").val()) && $("#FIRST").val() != ""){
			$("#FIRST").tips({
				side:3,
	            msg:'请输入一个字母',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FIRST").val("");
			return false;
		}
	}
	
	//保存
	function save(){
		if($("#JCLXMC").val()==""){
			$("#JCLXMC").tips({
				side:3,
	            msg:'请选择检查类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#JCLXMC").focus();
			return false;
		} else {
			$("#JCLXMC").val($.trim($("#JCLXMC").val()));
		}
		
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}	
	//检查类型菜单
	function treeDialog(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "检查类型菜单";
		 diag.URL = '<%=basePath%>jcKnowledgeBase/getTreeData.do';
		 diag.Width = 320;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
	}
</script>
</html>