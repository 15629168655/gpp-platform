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
	
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
<body>
	<table style="width: 100%;" border="0">
		<tr>
			<td style="width: 15%;" valign="top" bgcolor="#F9F9F9">
				<div class="height-8 bg-white"></div>
				<div class="bg-white">
					<a class="btn btn-mini btn-success" onclick="add();">新增</a>&nbsp;
					<a class="btn btn-mini btn-success" onclick="edit();">修改</a>&nbsp;
					<a class="btn btn-mini btn-danger" onclick="del();">删除</a>
				</div>
				<div class="height-8 bg-white"></div>
			 	<div style="width: 15%;">
			 		<ul id="leftTree" class="ztree"></ul>
			 	</div>
			</td>
			<td style="width: 85%" valign="top">
				 <iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/lcxm/list.do?BM=${null == pd.LCXM || '' == pd.LCXM?'AAA':pd.LCXM }"  style="margin:0 auto;width:100%;height:100%;"></iframe> 
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
			 
			var setting = {
					data: {
					simpleData: {
						enable: true
						}
					}
					,async: {
						enable: true,
						url:"<%=basePath%>/lcxm/treeData.do",
						autoParam: ["ID", "name"]
					},callback:{
						asyncSuccess: zTreeOnAsyncSuccess,//异步加载成功的fun
						asyncError: zTreeOnAsyncError//加载错误的fun
					}
				};
			var zn = '[{"ID":"0","name":"全部","url":"lcxm/list.do?BM=AAA","target":"treeFrame","isParent":true}]';//'${zTreeNodes}';
			var zTreeNodes = eval(zn);
			 
			zTree = $.fn.zTree.init($("#leftTree"), setting, zTreeNodes);
		});
		
		function zTreeOnAsyncError(event, treeId, treeNode){
			alert("异步加载失败");
		}
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
			alert("异步加载成功");
		} 
		
		
		//新增
		function add(){
			 var treeObj = $.fn.zTree.getZTreeObj("leftTree");
				var nodes = treeObj.getSelectedNodes();
				if(jQuery.isEmptyObject(nodes))
				{
					bootbox.alert("请先选择树的某一节点,再点新增");
					return;
				}
				var ID = nodes[0].ID;
				var isParent = nodes[0].isParent; //将boolean转换为int
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增临床项目";
			 diag.URL = '<%=basePath%>lcxm/goAdd.do?PID=' + ID + "&isParent=" + isParent,"treeFrame","";
			 diag.Width = 750;
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
		function edit(){
			 var treeObj = $.fn.zTree.getZTreeObj("leftTree");
				var nodes = treeObj.getSelectedNodes();
				if(jQuery.isEmptyObject(nodes))
				{
					bootbox.alert("请先选择树的某一节点,再点修改");
					return;
				}
				var ID = nodes[0].ID;
				if(ID == '0')
				{
					bootbox.alert("顶级菜单不能被修改");
					return;
				}
				var isParent = nodes[0].isParent; //将boolean转换为int
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑临床项目";
			 diag.URL = '<%=basePath%>lcxm/goEdit.do?ID=' + ID + "&isParent=" + isParent,"treeFrame","";
			 diag.Width = 750;
			 diag.Height = 600;
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
			var ID = nodes[0].ID;
			bootbox.confirm("确定要删除吗?", function(result) {
				if (result) {
					top.jzts();
					var url = "<%=basePath%>lcxm/delete.do?ID=" + ID;
					$.get(url, function(data) {

						if("success" == data.result){
							top.hangge();
							bootbox.alert("删除成功", function() {
								 top.jzts();
		                         setTimeout("self.location=self.location",100);
							});
						}else if("false" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败,请先删除子菜单!</span>",
								buttons: 			
								{
									"button" :
									{
										"label" : "确定",
										"className" : "btn-sm btn-success"
									}
								}
							});
						}
					});
				}
			});
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
</SCRIPT>
</body>
</html>
