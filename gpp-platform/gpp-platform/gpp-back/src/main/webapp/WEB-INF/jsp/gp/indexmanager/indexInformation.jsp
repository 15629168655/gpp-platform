<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <%--tab相关--%>
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <link href="static/ace/css/bootstrap.css" rel="stylesheet" />
    <link href="static/ace/css/ace.css" rel="stylesheet" />

    <%@ include file="../../system/index/top.jsp"%>
    <%--覆盖ace.css中的背景颜色--%>
    <style>
        body{
            background-color: #fff;
        }
    </style>
</head>
<body>
 
            <div class="tabable">
                <ul class="nav nav-tabs" id="myTab">
                   
                    <li id="zyjzjlTab">
                        <a href="#zyjzjl" data-toggle="tab" style="cursor:pointer;">
                           指标信息
                        </a>
                    </li>
                    
                    <li id="cisMainTab">
                        <a href="#cisMain"  data-toggle="tab" style="cursor:pointer;">
                            指标结果范围
                        </a>
                    </li>
                    
                    <li id="zyyzjlTab">
                        <a href="#zyyzjl"  data-toggle="tab" style="cursor:pointer;">
                           结果指标模板
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="zyjzjl" class="tab-pane">
                   		<iframe name="zyjzjlFrame" id="zyjzjlFrame"  src="<%=basePath%>indexmanager/${msg}.do?ID=${pd.ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="cisMain" class="tab-pane">
                        <iframe name="cisMainFrame" id="cisMainFrame"  src="<%=basePath%>indexResultRange/list.do?INDEX_ID=${pd.ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="zyyzjl" class="tab-pane">
                        <iframe name="zyyzjlFrame" id="zyyzjlFrame"  src="<%=basePath%>indexResultModel/list.do?INDEX_ID=${pd.ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                </div>
            </div>
     

<%@ include file="../../system/index/foot.jsp"%>
<!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
	<!--引入弹窗组件end-->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
    <script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
    <!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDialog.js"></script>
<script type="text/javascript">


    $(document).ready(function(){
    	$('#myTab a:first').tab('show');
    });
    
    $('#myTab a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    })

</script>
</body>
</html>