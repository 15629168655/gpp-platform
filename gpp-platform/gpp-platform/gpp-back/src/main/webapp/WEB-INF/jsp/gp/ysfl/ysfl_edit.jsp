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

<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
				
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									编辑菜单
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="ysfl/${MSG }.do" name="menuForm" id="menuForm" method="post" class="form-horizontal">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							
							<input type="hidden" name="PID" id="PID" value="${null == pd.PID ? ID:pd.PID}"/>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上级 :</label>
								<div class="col-sm-9">
									<div style="padding-top:5px;">
										<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
											<b>${null == pds.MC ?'(无) 此项为顶级菜单':pds.MC}</b>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称<span class="red">*</span> :</label>
								<div class="col-sm-9">
									<input type="text" name="MC" id="MC" value="${pd.MC }" placeholder="这里输入菜单名称" maxlength="40" title="这里输入菜单名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 排序号 <span class="red">*</span>: </label>
								<div class="col-sm-9">
									<input type="number" name="PXH" id="PXH" value="${pd.PXH}" placeholder="这里输入序号（正整数）"maxlength="40"  title="请输入正整数" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 状态 : </label>
								<div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;">
										<input name="ZT" type="radio" value="1" <c:out value="${pd.ZT==1?'checked':''}"/>   checked="checked" />
										启用
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="ZT" type="radio" value="0" <c:out value="${pd.ZT==0?'checked':''}"/> />
										停用
									</label>
								</div>
							</div>
							
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="goback('${ID}');">取消</a>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
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


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
		
		//返回
		function goback(ID){
			top.jzts();
			window.location.href="<%=basePath%>ysfl/list.do?ID="+ID;
		}
		
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
			
			if($("#PXH").val()==""){
				$("#PXH").tips({
					side:1,
		            msg:'请输入序号(格式为正整数)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PXH").focus();
				return false;
			}
			if(isNaN(Number($("#PXH").val()))){
				$("#PXH").tips({
					side:1,
		            msg:'请输入序号(格式为正整数)',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PXH").val("");
				$("#PXH").focus();
				return false;
			}
			$("#menuForm").submit();
		}
		
		//设置菜单类型or状态
		function setType(type,value){
			if(type == '1'){
				$("#ZT").val(value);
			}else{
				$("#ZT").val(value);
			}
		}
	</script>


</body>
</html>