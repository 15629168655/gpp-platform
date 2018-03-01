<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<body>
	<table style="width: 100%;" border="0">
		<tr>
			<td style="width: 15%;" valign="top" bgcolor="#F9F9F9">
				<div class="bg-white">
					<a class="btn btn-mini btn-success" onclick="add();">新增</a>
				</div>
			 	<div style="width: 100%;">
			 		<ul id="leftTree" class="ztree">
							<table id="simple-table" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center">名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th class="center">类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
										<td class='center'><a  href="javascript:goSonmenu('${var.ID }')">${var.BLMC}</a></td>
										<td class='center'>
	                                     	<c:forEach items="${pd.EnumMzblmbLX}" var="s">
                                                <c:if test="${s.key == var.LX}">${s.value}</c:if>
                                            </c:forEach>
                                        </td>
                                        <td class='center'><a  href="javascript:goDel('${var.ID }','${var.BLMC}')">删除</td>
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
					</ul>
			 	</div>
			</td>
			<td style="width: 85%" valign="top">
				 <iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/mzblmb/mzbl.do?ID=${pd.ID }&msg=${pd.msg }"  style="margin:0 auto;width:100%;height:100%;"></iframe> 
			</td>
		</tr>
	</table>
	<%@ include file="../../system/index/foot.jsp"%>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<!-- 删除时确认窗口 -->
	<script type="text/javascript" src="static/ace/js/bootbox.js"></script>
	<script type="text/javascript">
	$(top.hangge());
//	var zTree;
//	$(document).ready(function(){
		
//	});

	function treeFrameT(){
		var hmainT = document.getElementById("treeFrame");
		var bheightT = document.documentElement.clientHeight;
		hmainT .style.width = '100%';
		hmainT .style.height = (bheightT) + 'px';
	}
	treeFrameT();
	window.onresize=function(){  
		treeFrameT();
	};
	
	function goSonmenu(ID){
		top.jzts();
		window.location.href="<%=basePath%>mzblmb/list.do?ID="+ID;
	};
	
	//新增门诊病历模板
	function add(){
		top.jzts();
		window.location.href="<%=basePath%>mzblmb/list.do?msg=add";
	};
	
	//删除
	function goDel(ID,MSG){
		top.jzts();
		window.location.href="<%=basePath%>mzblmb/del.do?ID="+ID;
	};
	
	//删除
	function goDssel(ID,MSG){
		bootbox.confirm("确定要将["+MSG+"]删除吗?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>mzblmb/del.do?ID="+ID;
				$.get(url,function(data){
					parent.location.href="<%=basePath%>mzblmb/list.do";
				});
			}
		});
	}
</SCRIPT>
</body>
</html>
