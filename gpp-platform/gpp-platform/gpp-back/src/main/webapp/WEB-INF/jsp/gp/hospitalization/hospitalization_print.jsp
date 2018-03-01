<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

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
<style>
  .s1 {
	font-weight: bold;
	font-style: normal;
	font-family: 宋体;
	font-size: 18px;
	color: #000000;
	background-color: transparent;
	vertical-align: Middle;
	word-wrap: break-word;
	overflow: hidden;
	border-collapse: separate;
	border: none;
	padding-left: 2px;
	padding-right: 2px;
	padding-top: 0px;
	padding-bottom: 0px;
}
 table tr{
        height:40px;       /*把table标签的行高设定为固定值*/
    }
  </style>
<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		
		<script language="javascript" src="static/js/jquery.jqprint-0.3.js"></script>
		
<title>住院证</title>
</head>
        
             
             <table width="650" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
               <tr>
                  <td align="right"><button onClick="window.print()">打印</button>&nbsp;</td>
               </tr>
             </table>



<body style="overflow: scroll;" class="no-skin">
		<h2 align="center" class="title">
			住院证
		</h2>
		<table width="800px;" border="1" cellspacing="0" cellpadding="0" align="center"
	style="border-collapse:separate;border:none;padding:0;table-layout:fixed;">
	
		 <tr >
			     <td  align="right" class="s1">住院号：</td>
				 <td   align="center" class="s1" >1233</td>
				 <td   align="right" class="s1" colspan="3">门诊就诊流水：</td>
				 <td  align="left" class="s1">&nbsp;&nbsp;&nbsp; 44222</td>
			 </tr>
			 
		</table>
		
	   <table width="800px;" border="1" cellspacing="0" cellpadding="0" align="center"
	style="border-collapse:separate;padding:0;table-layout:fixed;vertical-align:middle; text-align:center;">
	
			
			<tr >
				<td>姓名</td>
				<td>${pd.XM}</td>
				<td>性别</td>
				<td>
					<c:if test='${pd.XB == 0}'>未知性别</c:if> 
				    <c:if test='${pd.XB == 1}'>男</c:if>
				    <c:if test='${pd.XB == 2}'>女</c:if>
				    <c:if test='${pd.XB == 9}'>未说明性别</c:if>
				</td>
				<td>年龄</td>
				<td >${pd.NL}</td>	
			</tr>
			<tr >
			    <td>职业</td>
				<td>${pd.ZY}</td>
				<td>工作单位及地址	</td>
				<td colspan="3">${pd.DZ}</td>	
			</tr>
			<tr >
			    <td>科室名称 </td>
				<td>${pd.KSMC}</td>
			    <td>准予住院日期 </td>
				<td>${pd.ZYZYRQ}</td>
				<td>住院日期 </td>
				<td>${pd.ZYRQ}</td>
			</tr>
			<tr >
			    <td>机构编码 </td>
				<td>${pd.JGBM}</td>
			    <td>医保IC卡号</td>
				<td>${pd.ZJHM}</td>
				<td>医生姓名 </td>
				<td>${pd.ZZYSXM}</td>
			</tr>
			<tr >
			    <td>预交住院费金额 </td>
				<td>${pd.YJZYF}</td>
				<td>费用类别</td>
				<td>
					<c:if test='${pd.FYLB == 0}'>自费</c:if> 
				    <c:if test='${pd.FYLB == 1}'>基本医疗</c:if>
				    <c:if test='${pd.FYLB == 2}'>特约户</c:if>
				    <c:if test='${pd.FYLB == 3}'>其他</c:if>
				</td>
				<td>特殊处理事由</td>
				<td>
					<c:if test='${pd.TSCLSY == 0}'>110</c:if> 
				    <c:if test='${pd.TSCLSY == 1}'>危重抢救</c:if>
				    <c:if test='${pd.TSCLSY == 2}'>其他情况</c:if>
				</td>
			</tr>
			
			<tr >
				<td>门诊诊断名称</td>
				<td>${pd.MZZDMC}</td>
				<td>病情</td>
				<td>
					<c:if test='${pd.BQ == 0}'>危</c:if> 
				    <c:if test='${pd.BQ == 1}'>急</c:if>
				    <c:if test='${pd.BQ == 2}'>一般</c:if>
				</td>
				<td>隔离</td>
				<td>
					<c:if test='${pd.GL == 0}'>毋需隔离</c:if> 
				    <c:if test='${pd.GL == 1}'>呼吸道隔离</c:if>
				    <c:if test='${pd.GL == 2}'>床边融离</c:if>
				</td>
		</tr>
		<tr >
		        <td>体位</td>
				<td>
					<c:if test='${pd.TW == 0}'>自动</c:if> 
				    <c:if test='${pd.TW == 1}'>平卧</c:if>
				    <c:if test='${pd.TW == 2}'>半卧</c:if>
				</td>
				<td>运送方法</td>
				<td>
					<c:if test='${pd.YSFS == 0}'>领送</c:if> 
				    <c:if test='${pd.YSFS == 1}'>扶行</c:if>
				    <c:if test='${pd.YSFS == 2}'>车送</c:if>
				    <c:if test='${pd.YSFS == 3}'>抬送</c:if>
				</td>
				<td>卫生处理</td>
				<td>
					<c:if test='${pd.WSCL == 0}'>沐浴</c:if> 
				    <c:if test='${pd.WSCL == 1}'>盆浴</c:if>
				    <c:if test='${pd.WSCL == 2}'>擦浴</c:if>
				    <c:if test='${pd.WSCL == 3}'>免浴</c:if>
				</td>
		</tr>
		
		<tr >
				<td>经办人</td>
				<td>${pd.JBR}</td>
				<td>领导处理意见</td>
				<td>${pd.LDCLYJ}</td>
				<td>生成时间</td>
				<td>${pd.SCSJ}</td>
		</tr>
		</table>


<!-- 引入 -->
		<script type="text/javascript">
		window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
		</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript">
		$(top.hangge());
		</script>
		
	</body>
</html>