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
                    <li class="active" id="patientTab">
                        <a href="#mzbl" data-toggle="tab" style="cursor:pointer;">
                            开门诊病历
                        </a>
                    </li>
					<li id="dzblTab">
                        <a href="#dzbl" data-toggle="tab" style="cursor:pointer;">
                            门诊病历列表
                        </a>
                    </li>
   
	                </ul>
	
	                <div class="tab-content">
	                    <div id="mzbl" class="tab-pane active"><!-- 参数中，BLMBID是用来查询病历模板用于套用                     小写的id用于查询挂号表 -->
	                        <iframe name="mzblFrame" id="mzblFrame" src="<%=basePath%>mzbl/mzbl.do?id=${pd.id}&personid=${pd.personid }&BLMBID=${pd.BLMBID }&msg=${pd.msg}"  frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="500"></iframe>
	                    </div>
	                    						
						<div id="dzbl" class="tab-pane">
	                        <iframe name="dzblFrame" id="dzblFrame"  src="<%=basePath%>mzbl/list.do?id=${pd.id}&personid=${pd.personid }&BLMBID=${pd.BLMBID }&msg=${pd.msg}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="100%" height="700"></iframe>
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