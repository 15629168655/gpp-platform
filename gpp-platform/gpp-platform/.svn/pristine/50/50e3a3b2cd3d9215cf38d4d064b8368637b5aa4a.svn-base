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
<link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
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
							
						<form action="agreementApply/list.do" method="post" name="Form" id="Form">
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center">医护人员ID</th>
									<th class="center">医护人员姓名</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class='center' style="width: 30px;">${vs.index+1}</td>
									<td class='center'>
									<input type="text" id="PROVIDER_ID" name="PROVIDER_ID" value="${pd.PROVIDER_ID}" readonly="readonly"/>
									</td>
									<td class='center'>
									<input type="text" id="PROVIDER_NAME" name="PROVIDER_NAME" value="${pd.PROVIDER_NAME}" readonly="readonly"/>
									</td>
                                    <td class='center'>
                                    	<a class="btn btn-sm btn-success" onclick="add();">签约申请</a>
                                    </td>
								</tr>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
									<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
	<script type="text/javascript">
		//$(top.hangge());//关闭加载状态
		
		//页面加载 触发事件
		$(document).ready(function(){
		 chooseP();  
		 });
		
		//选择医生
		function chooseP(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "请选择签约医生";
		 diag.URL = '<%=basePath%>/agreementApply/getPersonData.do';
		 diag.Width = 1000;
		 diag.Height = 800;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
		}
			
		
		//新增
		function add(){
                 var diag = new top.Dialog();
                 var ysname = $("#PROVIDER_NAME").val();  	
                 var ysid = $("#PROVIDER_ID").val();  	
                 diag.Drag=true;
                 diag.Title ="签约申请表";
                 diag.URL = '<%=basePath%>agreementApply/toAdd.do?ysname='+ysname;
                 diag.Width = 950;
                 diag.Height = 700;
                 diag.CancelEvent = function(){ //关闭事件
                     if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                         if('${page.currentPage}' == '0'){
                             top.jzts();
                             setTimeout("self.location=self.location",100);
                         }else{
                             //nextPage(${page.currentPage});
                             window.location.reload();
                         }
                    }
                    diag.close();
                 };
                 diag.show();
            }
		
		//修改
		function edit(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看申请表";
			 diag.URL = '<%=basePath%>agreementApply/toCheck.do?ID='+id;
			 diag.Width = 950;
			 diag.Height = 700;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
						 //nextPage(${page.currentPage});
					 window.location.reload();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		</script>
</body>
</html>