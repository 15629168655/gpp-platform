<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%@ include file="../index/top.jsp"%>
		<%@ include file="foot.jsp"%>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="plugins/tab/js/framework.js"></script>
	<link href="plugins/tab/css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link  rel="stylesheet" type="text/css" id="skin" prePath="plugins/tab/" /><!--默认相对于根目录路径为../，可添加prePath属性自定义相对路径，如prePath="<%=request.getContextPath()%>"-->
	<script type="text/javascript" charset="utf-8" src="plugins/tab/js/tab.js"></script>
	</head>
<body>
<div id="tab_menu" style="height:30px;">
</div>
<div id="tab_close" class="btn-group roll-right" >
	<button data-toggle="dropdown" class="btn btn-info btn-sm dropdown-toggle tab_btn_close" aria-expanded="false">
		关闭操作<span class="ace-icon fa fa-caret-down icon-on-right"></span>
	</button>
	<ul class="dropdown-menu dropdown-info dropdown-menu-right">
		<li><a onclick="closeOtherTabs()" style="cursor: pointer">关闭其他选项卡</a></li>
		<li><a onclick="closeAllTabs()" style="cursor: pointer">关闭所有选项卡</a></li>
		<li class="divider"></li>
		<li><a onclick="closePrevTabs()" style="cursor: pointer">关闭左侧选项卡</a></li>
		<li><a onclick="closeNextTabs()" style="cursor: pointer">关闭右侧选项卡</a></li>
	</ul>
</div>
<div style="width:100%;">
	<div id="page" style="width:100%;height:100%;"></div>
</div>


</body>

<script type="text/javascript">
function closeOtherTabs(){
	var otherTabs = $('table.tab_item .tab_title.tab_item2_selected').closest('table.tab_item').siblings().filter('table.tab_item');
	otherTabs.each(function(){
		var id = this.id;
		if(id != "tab1_index1"){
			tab.close(this.id);
		}
	});
}
function closeAllTabs(){
	var otherTabs = $('table#tab1_index1').siblings().filter('table.tab_item');
	otherTabs.each(function(){
		tab.close(this.id);
	});
}
function closePrevTabs(){
	var otherTabs = $('table.tab_item .tab_title.tab_item2_selected').closest('table.tab_item').prevAll().filter('table.tab_item');
	otherTabs.each(function(){
		var id = this.id;
		if(id != "tab1_index1"){
			tab.close(this.id);
		}
	});
}
function closeNextTabs(){
	var otherTabs = $('table.tab_item .tab_title.tab_item2_selected').closest('table.tab_item').nextAll().filter('table.tab_item');
	otherTabs.each(function(){
		var id = this.id;
		if(id != "tab1_index1"){
			tab.close(this.id);
		}
	});
}
function closePanelTabs(){
	var otherTabs = $('table.tab_item .tab_title.tab_item2_selected').closest('table.tab_item');
	otherTabs.each(function(){
		var id = this.id;
		if(id != "tab1_index1"){
			tab.close(this.id);
		}
	});
}
function tabAddHandler(mid,mtitle,murl){
	tab.update({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.add({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.activate(mid);
}
 var tab;	
$( function() {
	 tab = new TabView( {
		containerId :'tab_menu',
		pageid :'page',
		cid :'tab1',
		position :"top"
	});
	tab.add( {
		id :'tab1_index1',
		title :"主页",
		url :"<%=basePath%>login_default.do",
		isClosed :false
	});
	/**tab.add( {
		id :'tab1_index1',
		title :"主页",
		url :"/per/undoTask!gettwo",
		isClosed :false
	});
	**/
});

	function cmainFrameT(){
		var hmainT = document.getElementById("page");
		var bheightT = document.documentElement.clientHeight;
		hmainT .style.width = '100%';
		hmainT .style.height = (bheightT  - 41) + 'px';
	}
	cmainFrameT();
	window.onresize=function(){  
		cmainFrameT();
	};

</script>

</html>

