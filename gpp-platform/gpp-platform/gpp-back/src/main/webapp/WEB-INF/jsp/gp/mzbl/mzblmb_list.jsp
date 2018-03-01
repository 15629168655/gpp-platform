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
			 	<div style="width: 100%;">
			 		<ul id="leftTree" class="ztree">
							<table id="simple-table" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center">名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
									<th class="center">类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
										<td class='center'><a  href="javascript:goSonmenu('${var.ID }','${pd.id }','${pd.personid }')">${var.BLMC}</a></td>
										<td class='center'>
	                                     	<c:forEach items="${pd.EnumMzblmbLX}" var="s">
                                                <c:if test="${s.key == var.LX}">${s.value}</c:if>
                                            </c:forEach>
                                        </td>
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
			<td style="width: 85%" valign="top">												<!-- 大写的ID是用来显示右侧的病历模板内容，小写的id是传值给填写病历页面用来查询挂号表    personid是用来查询就诊表    -->
				 <iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/mzbl/mzblmb.do?ID=${pd.ID }&id=${pd.id}&personid=${pd.personid}"  style="margin:0 auto;width:100%;height:100%;"></iframe> 
			</td>
		</tr>
	</table>
	
	<%@ include file="../../system/index/foot.jsp"%>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<!-- 删除时确认窗口 -->
	<script type="text/javascript" src="static/ace/js/bootbox.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
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
	
	function goSonmenu(ID,id,personid){
		top.jzts();
		window.location.href="<%=basePath%>mzbl/goTymb.do?ID="+ID+"&id="+id+"&personid="+personid;
	};
	
</SCRIPT>
</body>
</html>
