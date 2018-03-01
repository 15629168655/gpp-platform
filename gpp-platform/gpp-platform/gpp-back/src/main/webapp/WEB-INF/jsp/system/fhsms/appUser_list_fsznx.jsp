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
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
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
						<!-- 检索  -->
						<form action="fhsms/listUsers.do" method="post" name="userForm" id="userForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">用户名</th>
									<th class="center">姓名</th>
									<th class="center">等级</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty userList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${userList}" var="user" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label class="pos-rel"><input type='checkbox' name='ids' id="${user.USER_ID}" value="${user.NAME}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${user.USERNAME }</td>
											<td class="center">${user.NAME }</td>
											<td class="center">${user.ROLE_NAME }</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
								    <input type="hidden" name="nemes" value=""/>
								    <input type="hidden" name="ids" value=""/>
									<a class="btn btn-sm btn-success" onclick="choose();">确定</a>
									<a class="btn btn-sm btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
								<td style="vertical-align:top;"><div onclick="XR();" class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
 	<script type="text/javascript">
		$(top.hangge());
		
		var selectNames ="";
		var selectIds="";
		$(function() {			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
			//点击确定时取到父页面隐藏框（隐藏框是存值用的）框的内容//点击确定时取到父页面隐藏框（隐藏框是存值用的）框的内容
			var iframe = $("#_DialogFrame_0",parent.document);
			selectIds = iframe.contents().find("#CUNZHI").val();
			selectNames=iframe.contents().find("#USERNAME").val();
		});
		
		//检索
		function searchs(){
			top.jzts();
			$("#userForm").submit();
		}
		
		
		function XR(){//点击分页插件框时保存当前页选中的值到父页面的文本框
			var usernameAll = "";			//所有选中的用户
			var usernameNow = "";  			//当页选中的用户
			var usernameBefore = "";		//翻页之前选中的用户
			var userIdAll="";
			var userIdNow="";
			var userIdBefore="";
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				if(document.getElementsByName('ids')[i].checked){
					userIdNow += document.getElementsByName('ids')[i].id+";";
					usernameNow+=document.getElementsByName('ids')[i].value+";";
				}
			}
			selectNames +=usernameNow;
			serlectIds+=userIdNow;
			//var iframe = $("#_DialogFrame_0",parent.document);
			//usernameBefore = iframe.contents().find("#CUNZHI").val();//点击确定时取到父页面隐藏框（隐藏框是存值用的）框的内容
			//usernameAll = usernameBefore + usernameNow;
			//iframe.contents().find("#CUNZHI").val(usernameAll);//取到父页面隐藏框的内容，然后加上当前页面选中的值，一起赋给父页面的隐藏框
		}
		
		function choose(){//点击确定
			var usernameAll = "";			//所有选中的用户
			var useridAll="";
			var usernameNow = "";  			//当页选中的用户
			var userIdNow="";
			var usernameBefore =$("#names").val();		//翻页之前选中的用户
			var userIdBefore=$("#ids").val();
			for(var i=0;i < document.getElementsByName('ids').length;i++){
				if(document.getElementsByName('ids')[i].checked){
					userIdNow += document.getElementsByName('ids')[i].id+";";
					usernameNow+=document.getElementsByName('ids')[i].value+";";
				}
			}
			 
			usernameAll = selectNames + usernameNow;
			useridAll = selectIds+userIdNow;
			var users = usernameAll.split(";");
			for(var i=0;i<users.length-1;i++){	//冒泡比对所有的用户，重复的去掉
				for(var j=i+1;j<users.length;j++){
					if(users[i] == users[j]){
						//alert(users);
						users.splice(j,1);
					}
				}
			}
			var aaa = users.join();
			//var bbb = aaa.replace(",",";");
			//var reg=new RegExp(",","g"); //创建正则RegExp对象  
			//var stringObj=aaa;  
			var newstr=aaa.replace(/,/g,";");
			var ids = useridAll.split(";");
			for(var i=0;i<ids.length-1;i++){	//冒泡比对所有的用户，重复的去掉
				for(var j=i+1;j<ids.length;j++){
					if(ids[i] == ids[j]){
						//alert(users);
						ids.splice(j,1);
					}
				}
			}
			var bbb = ids.join(); 
			var idsStr=bbb.replace(/,/g,";");  
			var iframe = $("#_DialogFrame_0",parent.document);
			iframe.contents().find("#USERNAME").val(newstr);//取到父页面文本框的内容，然后加上当前页面选中的值，一起赋给父页面
			iframe.contents().find("#CUNZHI").val(idsStr);//取到父页面文本框的内容，然后加上当前页面选中的值，一起赋给父页面
			top.Dialog.close();
		}
		
		</script>
</html>
