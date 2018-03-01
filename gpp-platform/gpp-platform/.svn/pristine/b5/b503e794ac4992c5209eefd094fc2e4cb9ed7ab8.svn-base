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
                            住院就诊记录
                        </a>
                    </li>
                    
                    <li id="cisMainTab">
                        <a href="#cisMain"  data-toggle="tab" style="cursor:pointer;">
                            住院病案首页
                        </a>
                    </li>
                    
                    <li id="zyyzjlTab">
                        <a href="#zyyzjl"  data-toggle="tab" style="cursor:pointer;">
                            住院医嘱记录
                        </a>
                    </li>
                    
                    <li id="summaryTab">
                        <a href="#summary" data-toggle="tab" style="cursor:pointer;">
                            出院小结
                        </a>
                    </li>
                    
                    <li id="risReportTab">
                        <a href="#risReport" data-toggle="tab" style="cursor:pointer;">
                            医学影像检查报告
                        </a>
                    </li>
                    
                    <li id="lisReportTab">
                        <a href="#lisReport" data-toggle="tab" style="cursor:pointer;">
                            实验室检验报告
                        </a>
                    </li>
                    
                    <li id="healthRecordTab">
                        <a href="#healthRecord" data-toggle="tab" style="cursor:pointer;">
                            居民健康档案
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    
                    <div id="zyjzjl" class="tab-pane">
                        <iframe name="zyjzjlFrame" id="zyjzjlFrame"  src="<%=basePath%>zyjzjl/list.do?id=${pd.CARDID}&USER_AGENT_ID=${pd.USER_AGENT_ID}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="cisMain" class="tab-pane">
                        <iframe name="cisMainFrame" id="cisMainFrame"  src="<%=basePath%>cisMain/list.do?id=${pd.CARDID}&USER_AGENT_ID=${pd.USER_AGENT_ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="zyyzjl" class="tab-pane">
                        <iframe name="zyyzjlFrame" id="zyyzjlFrame"  src="<%=basePath%>zyyzjl/list.do?id=${pd.CARDID}&USER_AGENT_ID=${pd.USER_AGENT_ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="summary" class="tab-pane">
                        <iframe name="summaryFrame" id="summaryFrame"  src="<%=basePath%>summary/list.do?id=${pd.CARDID}&USER_AGENT_ID=${pd.USER_AGENT_ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="risReport" class="tab-pane">
                        <iframe name="risReportFrame" id="risReportFrame"  src="<%=basePath%>risReport/list.do?id=${pd.CARDID}&USER_AGENT_ID=${pd.USER_AGENT_ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="lisReport" class="tab-pane">
                        <iframe name="lisReportFrame" id="lisReportFrame"  src="<%=basePath%>lisReport/list.do?id=${pd.CARDID}&USER_AGENT_ID=${pd.USER_AGENT_ID}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="healthRecord" class="tab-pane">
                    	<c:if test="${!empty healthRecordUrl}">
                        	<iframe name="healthRecordFrame" id="healthRecordFrame"  src="${healthRecordUrl}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="700"></iframe>
                        </c:if>
                       <c:if test="${empty healthRecordUrl}">
                       	 	没有查询到个人健康档案
                       </c:if>
                    </div>
                </div>
            </div>
     

<%@ include file="../../system/index/foot.jsp"%>
<!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
	<!--引入弹窗组件end-->
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