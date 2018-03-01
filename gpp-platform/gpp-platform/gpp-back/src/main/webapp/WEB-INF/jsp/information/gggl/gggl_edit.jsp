<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 
String serverName = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort();

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
					<form action="gggl/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data" >
						<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="MC" id="MC" value="${pd.MC}" maxlength="255" placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">图片:</td>
								<td>
									<!--<c:if test="${pd== null || pd.IMG_URL == '' ||pd.IMG_URL==null}">
										<input type="file" id="IMG" name="FILE" onchange="fileType(this)"/>
									</c:if>
									<c:if test="${pd != null && pd.IMG_URL != '' && pd.IMG_URL != null }">
									
											<a href="<%=serverName%>/${pd.IMG_URL}" target="_blank"><img src="<%=serverName%>/${pd.IMG_URL}" width="210"/></a>
											<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.IMG_URL}','${pd.ID }');" />
											<input type="hidden" name="tpz" id="tpz" value="${pd.URL }"/>
											<input type="file" id="IMG" name="FILE" onchange="fileType(this)"/>
									</c:if> -->
									<input type="file" name="FILE" id="IMG" value="" maxlength="255"  style="width:98%;"/>
									<c:if test="${not empty pd.IMG }">
										<!-- <a href="javascript:download('${pd.IMG}');" > 下载文件查看</a>-->
										<a id="tpck" name="tpck" href="<%=serverName%>/${pd.IMG_URL}" target="_blank">图片查看</a>
									</c:if>
									<c:if test="${ empty pd.IMG}">
										<font>(暂无附件...)</font>
									</c:if>
								</td>
							</tr>
							<tr>
								 <td style="width:150px;text-align: right;padding-top: 13px;">广告类型:</td>
									<td style="vertical-align:top;padding-left:2px;"> 
									 	<select class="chosen-select form-control" name="GG_TYPE" id="GG_TYPE" data-placeholder="广告类型" style="vertical-align:top;width: 98%;">
										<option value="1" <c:if test="${pd.GG_TYPE == '1' }">selected</c:if> >首页</option>
									</select>
								 </td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">是否启用:</td>
									<td style="vertical-align:top;padding-left:2px;"> 
									 	<select class="chosen-select form-control" name="QY" id="QY" data-placeholder="是否启用" style="vertical-align:top;width: 98%;">
											<option value="1" <c:if test="${pd.QY == '1' }">selected</c:if> >是</option>
											<option value="2" <c:if test="${pd.QY == '2' }">selected</c:if> >否</option>
										</select>
									</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">开始时间：</td>
								<td><input class="span10 date-picker" type="text" name="START_TIME" id="START_TIME" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.START_TIME}" />'  style="width: 98%" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">结束时间：</td>
								<td><input class="span10 date-picker" type="text" name="END_TIME" id="END_TIME" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.END_TIME}" />'  style="width: 98%" readonly="readonly"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">链接:</td>
								<td><input type="text" name="URL" id="URL" value="${pd.URL}" maxlength="255" placeholder="这里输入链接" title="链接" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">排序号:</td>
								<td><input type="text" name="PX" id="PX" value="${pd.PX}" maxlength="255" placeholder="这里输入排序号" title="排序号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="2">
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
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//日期框
			$('.date-picker').datetimepicker({
				        format:'YYYY-MM-DD HH:mm:ss '
			    }).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
			
			//上传
			$('#IMG').ace_file_input({
				no_file:'请选择图片 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'gif|png|jpg|jpeg',
				//blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
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
		}
		if(typeof($("#tpck").val()) == "undefined"){
			if($("#IMG").val()=="" || document.getElementById("IMG").files[0] =='请选择图片'){
				
				$("#IMG").tips({
					side:3,
		            msg:'请选图片',
		            bg:'#AE81FF',
		            time:3
		        });
				return false;
			}
		}
		var filename = $("#IMG").val();
		if(filename!=''){
			var extname =  filename.substring(filename.indexOf(".")+1,filename.length);
			var sss = "BMP|bmp|JPG|jpg|JPEG|jpeg|PNG|png|GIF|gif";
			if(sss.indexOf(extname)<0){
				$("#IMG").tips({
					side:3,
		            msg:'请上传图片格式',
		            bg:'#AE81FF',
		            time:2
		        }); 
				return false;
			}
		}
		if($("#START_TIME").val()==""){
			$("#START_TIME").tips({
				side:3,
	            msg:'请输入开始时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#START_TIME").focus();
			return false;
		}
		if($("#END_TIME").val()==""){
			$("#END_TIME").tips({
				side:3,
	            msg:'请输入结束时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#END_TIME").focus();
			return false;
		}
		if($("#PX").val()==""){
			$("#PX").tips({
				side:3,
	            msg:'请输入排序号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PX").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	//过滤类型
	function fileType(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
	    	$("#tp").tips({
				side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#tp").val('');
	    	document.getElementById("tp").files[0] = '请选择图片';
	    }
	}
	
	//删除图片
	function delP(URL,ID){
		 if(confirm("确定要删除图片？")){
			var url = "gggl/deltp.do?URL="+URL+"&ID="+ID+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					document.location.reload();
				}
			});
		} 
	}
	//文件下载
	function download(ID){
		window.location.href= "<%=basePath%>attachment/download.do?ATTACHMENT_ID="+ID+"&tm="+new Date().getTime();
	}
</script>
</body>
</html>