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
	<%--<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>--%>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body>
	<table style="width: 100%;" border="0">
		<tr>
			<td style="width: 15%;" valign="top" bgcolor="#F9F9F9">
				<div class="height-8 bg-white"></div>
				<div class="bg-white">
					<a class="btn btn-sm btn-success" onclick="add();">新增</a>&nbsp;
					<a class="btn btn-sm btn-danger" onclick="del();" title="删除"><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
				</div>
				<div class="height-8 bg-white"></div>
			 	<div style="width: 15%;">
			 		<ul id="leftTree" class="ztree"></ul>
			 	</div>
			</td>
			<td style="width: 85%;" valign="top" bgcolor="#ffffff">
				<iframe name="treeFrame" id="treeFrame"  scrolling="no"  frameborder="0" src="<%=basePath%>/organization/goEdit.do?ORG_CODE=AAA"  ></iframe>
			</td>
		</tr>
	</table>
	<%@ include file="../../system/index/foot.jsp"%>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<!-- 删除时确认窗口 -->
	<script type="text/javascript" src="static/ace/js/bootbox.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		var zTree;
		$(document).ready(function(){
			//iframe高度自适应子页面高度处理
			$("#treeFrame").load(function(){
				var mainheight = $(this).contents().find("body").height()+40;
				$(this).height(mainheight);
			});
			
			var setting = {
				data: {
					simpleData: {
						enable: true
					}
				}
				,async: {
					enable: true,
					url:"<%=basePath%>/organization/treeData.do?type=organization&action=goEdit",
					autoParam: ["id", "name"]
				},callback:{
					// beforeAsync: zTreeBeforeAsync, // 异步加载事件之前得到相应信息
					asyncSuccess: zTreeOnAsyncSuccess,//异步加载成功的fun
					asyncError: zTreeOnAsyncError//加载错误的fun
					//beforeClick:beforeClick, //捕获单击节点之前的事件回调函数
				},view:{
					selectedMulti: false
				}
			};
			var zTreeNodes = eval('${treeTopJson}');
			zTree = $.fn.zTree.init($("#leftTree"), setting, zTreeNodes);

			$('#leftTree_1_switch', window.document).trigger('click');
		});

		function zTreeOnAsyncError(event, treeId, treeNode){
			alert("异步加载失败");
		}
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
			alert("异步加载成功");
		}

		function treeFrameT(){
			var hmainT = document.getElementById("treeFrame");
			var bheightT = document.documentElement.clientHeight;
			hmainT .style.width = '100%';
			hmainT .style.height = (bheightT-26) + 'px';
		}
		treeFrameT();
		window.onresize=function(){
			treeFrameT();
		};

		//删除
		function del() {
			var treeObj = $.fn.zTree.getZTreeObj("leftTree");
			var nodes = treeObj.getSelectedNodes();
			if(jQuery.isEmptyObject(nodes))
			{
				bootbox.alert("请先选择树的某一节点,再点删除", function() {

				});
				return;
			}
			var ORGANIZATION_ID = nodes[0].ORGANIZATION_ID;
			var P_ORG_CODE = nodes[0].p_ORG_CODE;
			if(nodes[0].isParent)
			{
				bootbox.alert("删除失败！请先删除子级", function() {

				});
				return;
			}
			var childrens = nodes[0].getParentNode().children.length;
			if(childrens != 1)
			{
				P_ORG_CODE = null;
			}
			bootbox.confirm("确定要删除吗?", function(result) {
				if (result) {
					top.jzts();
					var url = "<%=basePath%>organization/delete.do?ORGANIZATION_ID=" + ORGANIZATION_ID + "&P_ORG_CODE=" + P_ORG_CODE;
					$.get(url, function(data) {

						if ("success" == data.result) {
							top.hangge();
							bootbox.alert("删除成功", function() {
								$('li #z64 a', window.parent.parent.document).trigger('click');
							});
							setTimeout("autoclick()",2000);
						} else if ("false" == data.result) {
							top.hangge();
							bootbox.alert("删除失败！请先删除子级或删除占用资源.", function() {

							});
							return;
						} else if ("false2" == data.result) {
							top.hangge();
							bootbox.alert("删除失败！排查表不存在或其表中没有BIANMA字段.", function() {

							});
							return;
						}
					});
				}
			});
		}

		//新增
		function add() {
			var treeObj = $.fn.zTree.getZTreeObj("leftTree");
			var nodes = treeObj.getSelectedNodes();
			if(jQuery.isEmptyObject(nodes))
			{
				bootbox.alert("请先选择树的某一节点,再点新增");
				return;
			}
			var ORG_CODE = nodes[0].id;
			var isParent = nodes[0].isParent; //将boolean转换为int
			window.open("<%=basePath%>organization/goAdd.do?P_ORG_CODE=" + ORG_CODE + "&isParent=" + isParent,"treeFrame","");
		}

		//弹出框自动点击菜单“机构管理”
		function autoclick() {
			$('li #z64 a', window.parent.parent.document).trigger('click');
		}

	</SCRIPT>
</body>
</html>