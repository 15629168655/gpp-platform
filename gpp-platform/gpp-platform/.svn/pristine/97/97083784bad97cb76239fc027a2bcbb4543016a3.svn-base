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
                   
                    <li id="jmxxTab">
                        <a href="#jmxx" data-toggle="tab" style="cursor:pointer;">
                          居民基本信息
                        </a>
                    </li>
                    
                    <li id="treateCaseTab">
                        <a href="#treateCase"  data-toggle="tab" style="cursor:pointer;">
                           治疗方案明细
                        </a>
                    </li>
                    <li id="cfInfoTab">
                        <a href="#cfInfo"  data-toggle="tab" style="cursor:pointer;">
                           处方明细
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    
                    <div id="jmxx" class="tab-pane">
                        <iframe name="jmxxFrame" id="jmxxFrame"  src="<%=basePath%>jmxx/showInfo.do?USER_AGENT_ID=${pd.RESIDENT_ID}" frameborder="0" scrolling="yes" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="treateCase" class="tab-pane">
                        <iframe name="treateCaseFrame" id="treateCaseFrame"  src="<%=basePath%>treateCase/caseInfo.do?TREATE_ID=${pd.TREATE_ID}" frameborder="0" scrolling="yes" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
                    </div>
                    
                    <div id="cfInfo" class="tab-pane">
                        <iframe name="cfInfoFrame" id="cfInfoFrame"  src="<%=basePath%>kcf/kcf_list.do?id=0"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
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