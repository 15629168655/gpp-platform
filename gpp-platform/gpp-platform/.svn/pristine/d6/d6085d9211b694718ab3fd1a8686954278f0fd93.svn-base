<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
    <link rel="stylesheet" href="static/ace/css/bootstrap-editable.css">
    <link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
    
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					<form action="referral/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off" enctype="multipart/form-data">
						<input type="hidden" name="REFERRAL_ID" id="REFERRAL_ID" value="${pd.REFERRAL_ID}"/>
						<input type="hidden" name="add_success" id="add_success" value="${pd.success}"/>
                        <input type="hidden" name="AREA_ID" id="AREA_ID" value="${pd.AREA}"/>
                        <input type="hidden" name="STREET_ID" id="STREET_ID" value="${pd.STREET}"/>
                        <input type="hidden" name="COMMUNITY_ID" id="COMMUNITY_ID" value="${pd.COMMUNITY}"/>
                        <input type="hidden" name="ZZBZBM" id="ZZBZBM" value="${pd.ZZBZ}"/><!-- 编辑时，用来储存转诊标准的编码（仅存值用，不做修改操作） -->
                        <input type="hidden" name="PHOTO" id="PHOTO" value=""/>
                        <div class="form-group">
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">患者基本信息</h5>
                                        <span class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                            <a href="#" data-action="fullscreen" class="orange2">
                                                <i class="ace-icon fa fa-expand"></i>
                                            </a>
                                        </span>
                                </div>
                                <div class="widget-body col-xs-12">
                                    <div class="widget-main col-xs-12">
                                        <div class="col-xs-12 col-sm-4 center">
												<span class="profile-picture">
													<img id="avatar" class="editable img-responsive" alt="${pd.NAME}"  src="${pd.PHOTO}" onerror="onerror=null;src='static/ace/avatars/profile-pic.jpg'"  width="182" height="207"/>
												</span>
                                                <div class="space-4"></div>
                                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                                    <div class="inline position-relative">
                                                        <span class="white">${pd.NAME}</span>
                                                    </div>
                                                </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8">
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="NAME">患者姓名<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="col-sm-12" name="NAME" id="NAME" value="${pd.NAME}" maxlength="20" placeholder="患者姓名" title="患者姓名">
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SEX">患者性别:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" id="SEX" name="SEX">
                                                            <c:forEach items="${pd.enumSex}" var="item">
                                                                <c:choose>
                                                                    <c:when test="${pd.SEX == item.key}">
                                                                        <option value="${item.key}" selected="selected">${item.value}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${item.key}">${item.value}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HEALTHSN">健康档案编号<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="col-sm-12" name="HEALTHSN" id="HEALTHSN" value="${pd.HEALTHSN}" maxlength="50" placeholder="健康档案编号" title="健康档案编号">
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HEADTHCARDNO">健康卡卡号<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="col-sm-12" name="HEADTHCARDNO" id="HEADTHCARDNO" value="${pd.HEADTHCARDNO}" maxlength="50" placeholder="健康卡卡号" title="健康卡卡号">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDTYPE">患者证件类型<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" id="CARDTYPE" name="CARDTYPE">
                                                            <option value="" <c:if test="${pd.CARDTYPE == '' }">selected</c:if> ></option>
                                                                 <c:forEach items="${pd.dictCardType}" var="zjlx">
                                                                     <option value="${zjlx.value.ADDITIONAL}" <c:if test="${pd.CARDTYPE == zjlx.value.ADDITIONAL}"> selected="selected" </c:if> >${zjlx.value.NAME}</option>
                                                                 </c:forEach> 
                                                        </select>
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDNO">患者证件号码<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="col-sm-12" name="CARDNO" id="CARDNO" value="${pd.CARDNO}" maxlength="50" placeholder="患者证件号码" title="患者证件号码">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="INSURETYPE">参保类型<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" id="INSURETYPE" name="INSURETYPE" style="width: 98%">
                                                            <option value="" <c:if test="${pd.INSURETYPE == '' }">selected</c:if> ></option>
                                                                 <c:forEach items="${pd.dictInsureType}" var="cblx">
                                                                     <option value="${cblx.value.ADDITIONAL}" <c:if test="${pd.INSURETYPE == cblx.value.ADDITIONAL}"> selected="selected" </c:if> >${cblx.value.NAME}</option>
                                                                 </c:forEach> 
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="INSURENO">参保卡号<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="col-sm-12" name="INSURENO" id="INSURENO" value="${pd.INSURENO}" maxlength="50" placeholder="参保卡号" title="参保卡号">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="BIRTHDAY">患者出生日期<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group col-xs-12">
                                                            <input  type="text" class="col-sm-11 form-control date-picker" name="BIRTHDAY" id="BIRTHDAY" value="<fmt:formatDate pattern='yyyy-MM-dd'  value='${pd.BIRTHDAY}'/>" data-date-format="yyyy-mm-dd" placeholder="患者出生日期" title="患者出生日期">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="PHONE">患者联系电话<span class="red">*</span>:</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="col-sm-12" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="20" placeholder="患者联系电话" title="患者联系电话">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CITY">市:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" id="CITY" name="CITY">
                                                            <c:forEach items="${pd.cityList}" var="item">
                                                                <c:choose>
                                                                    <c:when test="${item.REGICODE == pd.CITY}">
                                                                        <option value="${item.REGICODE}" selected="selected">${item.REGINAME}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${item.REGICODE}">${item.REGINAME}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="AREA">区<span class="red">*</span>:</label>
                                                    <div class="col-sm-8" id="AREADiv">
                                                        <select class="chosen-select form-control" id="AREA" name="AREA" style="display: none;" onchange="AREAChanged()">
                                                            <option value='0'>请选择...</option>
                                                            <c:forEach items="${pd.areaList}" var="item">
                                                                <c:choose>
                                                                    <c:when test="${item.REGICODE == pd.AREA}">
                                                                        <option value="${item.REGICODE}" selected="selected">${item.REGINAME}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${item.REGICODE}">${item.REGINAME}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="STREET">街道/办事处<span class="red">*</span>:</label>
                                                    <div class="col-sm-8" id="STREETDiv">
                                                        <select class="chosen-select form-control" id="STREET" name="STREET" data-placeholder="请先选择区" onchange="STREETChanged()">
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="COMMUNITY">社区<span class="red">*</span>:</label>
                                                    <div class="col-sm-8" id="COMMUNITYDiv">
                                                        <select class="chosen-select form-control" id="COMMUNITY" name="COMMUNITY" data-placeholder="请先选择街道/办事处">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <label class="col-sm-4 control-label no-padding-right" for="ADDRESS"  style="width: 16.1%;">患者家庭住址<span class="red">*</span>:</label>
                                                    <div class="col-sm-8"  style="width: 83.9%;">
                                                        <input type="text" class="col-sm-12" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="80" placeholder="患者家庭住址" title="患者家庭住址">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">患者转诊信息</h5>
                                        <span class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                            <a href="#" data-action="fullscreen" class="orange2">
                                                <i class="ace-icon fa fa-expand"></i>
                                            </a>
                                        </span>
                                </div>
                                <div class="widget-body col-xs-12">
                                    <div class="widget-main col-xs-12">
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="VISITCARDNO">就诊卡卡号<span class="red">*</span>:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="col-sm-12" name="VISITCARDNO" id="VISITCARDNO" value="${pd.VISITCARDNO}" maxlength="50" placeholder="就诊卡卡号" title="就诊卡卡号">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="EMERGENCYLEVEL">紧急级别:</label>
                                                <div class="col-sm-8">
                                                    <select class="form-control" id="EMERGENCYLEVEL" name="EMERGENCYLEVEL">
                                                        <c:forEach items="${pd.enumEmergencyLevel}" var="item">
                                                            <c:choose>
                                                                <c:when test="${pd.EMERGENCYLEVEL == item.key}">
                                                                    <option value="${item.key}" selected="selected">${item.value}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${item.key}">${item.value}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                             
                                        </div>
                                        
                                        <div class="form-group">
                                             
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="APPLYTYPE">申请类型:</label>
                                                <div class="col-sm-8">
                                                    <select class="form-control" id="APPLYTYPE" name="APPLYTYPE" onchange="APPLYTYPEChanged()">
                                                        <c:forEach items="${pd.enumApplyType}" var="item">
                                                            <c:choose>
                                                                <c:when test="${pd.APPLYTYPE == item.key}">
                                                                    <option value="${item.key}" selected="selected">${item.value}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${item.key}">${item.value}</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="REFERRALTYPE">转诊类型:</label>
                                                <div class="col-sm-8">
                                                    <select class="form-control"   id="REFERRALTYPE" name="REFERRALTYPE" onchange="ZZLXChanged()">
                                                             <c:forEach items="${pd.enumReferralType}" var="item">
																<c:choose>
																	<c:when test="${pd.REFERRALTYPE != '' && pd.REFERRALTYPE == item.key}">
																		<option value="${item.key}" selected="selected">${item.value}</option>
																	</c:when>
																	<c:otherwise>
																		<option value="${item.key}">${item.value}</option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        
                                         <div class="form-group">
                                            <div class="col-xs-12">
	                                              <label class="col-sm-4 control-label no-padding-right" for="ILLDESC" style="width: 16.1%;">转诊标准:</label>
	                                              <div class="col-sm-8" style="width: 83.9%;">
	                                                  <select class="form-control"   id="ZZBZ" name="ZZBZ">
	                                                         
	                                                  </select>
	                                              </div>
                                             </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTORGNAME">转出机构名称:</label>
                                                <div class="col-sm-8">
                                                    <input type="hidden" class="col-sm-12" name="OUTORGID" id="OUTORGID" value="${pd.OUTORGID}" maxlength="30" placeholder="转出医疗机构代码" title="转出医疗机构代码">
                                                    <input type="text" class="col-sm-12" name="OUTORGNAME" id="OUTORGNAME" value="${pd.OUTORGNAME}" maxlength="60" placeholder="转出医疗机构名称" title="转出医疗机构名称" readonly="readonly">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTDEPTNAME">转出科室名称:</label>
                                                <div class="col-sm-8">
                                                    <input type="hidden" class="col-sm-12" name="OUTDEPTID" id="OUTDEPTID" value="${pd.OUTDEPTID}" maxlength="30" placeholder="转出科室代码" title="转出科室代码">
                                                    <input type="text" class="col-sm-12" name="OUTDEPTNAME" id="OUTDEPTNAME" value="${pd.OUTDEPTNAME}" maxlength="60" placeholder="转出科室名称" title="转出科室名称" readonly="readonly">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTDOCTORID">转出医生工号:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="col-sm-12" name="OUTDOCTORID" id="OUTDOCTORID" value="${pd.OUTDOCTORID}" maxlength="30" placeholder="就诊医生工号" title="就诊医生工号" readonly="readonly">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTDOCTORNAME">转出医生姓名:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="col-sm-12" name="OUTDOCTORNAME" id="OUTDOCTORNAME" value="${pd.OUTDOCTORNAME}" maxlength="30" placeholder="就诊医生姓名" title="就诊医生姓名" readonly="readonly">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTDOCTORPHONE">转出医生电话:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="col-sm-12" name="OUTDOCTORPHONE" id="OUTDOCTORPHONE" value="${pd.OUTDOCTORPHONE}" maxlength="20" placeholder="转出医生电话" title="转出医生电话">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="FIRSTDIAGNOSISNAME">初步诊断<span class="red">*</span>:</label>
                                                <div class="col-sm-8">
                                                    <div class="input-group col-xs-12">
                                                        <input type="hidden" class="col-sm-11 form-control" name="FIRSTDIAGNOSIS" id="FIRSTDIAGNOSIS" value="${pd.FIRSTDIAGNOSIS}" maxlength="20">
                                                        <input type="text" class="col-sm-11 form-control" name="FIRSTDIAGNOSISNAME" id="FIRSTDIAGNOSISNAME" value="${pd.FIRSTDIAGNOSISNAME}" maxlength="20" placeholder="初步诊断" title="初步诊断" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;" onclick="diseaseCodeGrid()">
                                                        <span class="input-group-addon" id="firstdiagnosis_icon" style="cursor: pointer" onclick="diseaseCodeGrid()">
                                                            <i class="fa fa-list-alt"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="REFERRALREASON">转诊原因<span class="red">*</span>:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="col-sm-12" name="REFERRALREASON" id="REFERRALREASON" value="${pd.REFERRALREASON}" maxlength="20" placeholder="转诊原因" title="转诊原因">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INDATE">拟定转入日期<span class="red">*</span>:</label>
                                                <div class="col-sm-8">
                                                    <div class="input-group col-xs-12">
                                                        <input  type="text" class="col-sm-11 form-control date-picker" name="INDATE" id="INDATE" value="<fmt:formatDate pattern='yyyy-MM-dd'  value='${pd.INDATE}'/>" data-date-format="yyyy-mm-dd" placeholder="拟定转入日期" title="拟定转入日期">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INORGNAME">转入机构名称<span class="red">*</span>:</label>
                                                <div class="col-sm-8">
                                                    <div class="input-group col-xs-12">
                                                        <input type="hidden" class="col-sm-11 form-control" name="INORGID" id="INORGID" value="${pd.INORGID}" maxlength="30" placeholder="转入医疗机构代码" title="转入医疗机构代码" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;">
                                                        <input type="text" class="col-sm-11 form-control" name="INORGNAME" id="INORGNAME" value="${pd.INORGNAME}" maxlength="60" placeholder="转入医疗机构名称" title="转入医疗机构名称" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;" onclick="OrgGrid();">
                                                         <span class="input-group-addon" id="inorgid_icon" style="cursor: pointer" onclick="OrgGrid()">
                                                            <i class="fa fa-list-alt"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INDEPTNAME">转入科室名称<span class="red">*</span>:</label>
                                                <div class="col-sm-8">
                                                    <div class="input-group col-xs-12">
                                                        <input type="hidden" class="col-sm-11 form-control" name="INDEPTID" id="INDEPTID" value="${pd.INDEPTID}" maxlength="30" placeholder="转入科室代码" title="转入科室代码" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;" >
                                                        <input type="text" class="col-sm-11 form-control" name="INDEPTNAME" id="INDEPTNAME" value="${pd.INDEPTNAME}" maxlength="60" placeholder="转入科室名称" title="转入科室名称" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;" onclick="deptGrid();">
                                                        <span class="input-group-addon" id="indeptid_icon" style="cursor: pointer" onclick="deptGrid()">
                                                            <i class="fa fa-list-alt"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label class="col-sm-4 control-label no-padding-right" for="ILLDESC" style="width: 16.1%;">病情描述<span class="red">*</span>:</label>
                                                <div class="col-sm-8" style="width: 83.9%;">
                                                    <textarea class="form-control limited" style="resize: none;" name="ILLDESC" id="ILLDESC" rows="3" maxlength="200" placeholder="病情描述" title="病情描述">${pd.ILLDESC}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label class="col-sm-4 control-label no-padding-right" for="RECOVERSUGGESTION" style="width: 16.1%;">康复建议:</label>
                                                <div class="col-sm-8" style="width: 83.9%;">
                                                    <textarea class="form-control limited" style="resize: none;" name="RECOVERSUGGESTION" id="RECOVERSUGGESTION" rows="3" maxlength="200" placeholder="康复建议" title="康复建议">${pd.RECOVERSUGGESTION}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">附件信息</h5>
                                        <span class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                            <a href="#" data-action="fullscreen" class="orange2">
                                                <i class="ace-icon fa fa-expand"></i>
                                            </a>
                                        </span>
                                </div>
                                <div class="widget-body col-xs-12">
                                    <div class="widget-main col-xs-12">
                                        <div class="form-group" id="attachmentListDiv" style="display: none">
                                            <div class="col-xs-12">
                                                <label class="col-sm-4 control-label no-padding-right" style="width: 16.1%;">附件:</label>
                                                <div class="col-sm-8" style="width: 83.9%;">
                                                    <ul class="attachment-list pull-left list-unstyled" id="attachmentListUl">
                                                        <c:forEach items="${pd.attachmentItems}" var="item">
                                                            <li id = "${item.ATTACHMENT_ID}">
                                                                <a onclick="downloadAttachment('${item.ATTACHMENT_ID}');" class="attached-file" style="cursor: pointer">
                                                                    <i class="ace-icon fa fa-file-o bigger-110"></i>
                                                                    <span class="attached-name">${item.NAME}</span>(${item.SIZE})
                                                                </a>
                                                                <span class="action-buttons">
                                                                    <a onclick="downloadAttachment('${item.ATTACHMENT_ID}');" style="cursor: pointer">
                                                                        <i class="ace-icon fa fa-download bigger-125 blue"></i>
                                                                    </a>
                                                                    <a onclick="deleteAttachment('${item.ATTACHMENT_ID}');" style="cursor: pointer">
                                                                        <i class="ace-icon fa fa-trash-o bigger-125 red"></i>
                                                                    </a>
                                                                </span>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label class="col-sm-4 control-label no-padding-right" style="width: 16.1%;">上传:</label>
                                                <div class="col-sm-8" style="width: 83.9%;">
                                                    <div id="form-attachments">
                                                        <div class="form-group file-input-container">
                                                            <div class="col-sm-7">
                                                                <label class="ace-file-input width-90 inline">
                                                                    <input id="attachment" type="file" name="attachments">
                                                                </label>
                                                                <c:if test="${pd.attachmentItems==null}">
                                                                <span class="help-block">(请上传患者转诊签字确认表。)</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="align-right">
                                            <button id="id-add-attachment" type="button" class="btn btn-sm btn-danger">
                                                <i class="ace-icon fa fa-paperclip bigger-140"></i>
                                                添加附件
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="button" onclick="save('save');" title="保存">
                                    <i class="ace-icon fa fa-save bigger-110"></i>
                                    保存
                                </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-primary" type="button" onclick="save('saveAndApproval');" title="保存并提交审核">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    提交
                                </button>
                            </div>
                        </div>
						<div id="zhongxin" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
                    </div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
    <!-- 返回顶部 -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp" %>
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
	<!--引入弹窗组件end-->
		
	<script type="text/javascript">
		//保存
		function save(type) {
			var _side = 3, _msg = '', _bg = '#AE81FF', _time = 2;
			var selector = null;
			if ($("#NAME").val() == "") {
				_msg = '请输入患者姓名';
				selector = $("#NAME");
			}else if ($("#SEX").val() == "") {
				selector = $("#SEX");
				_msg = '请输入患者性别';
			}else if ($("#HEALTHSN").val() == "") {
				selector = $("#HEALTHSN");
				_msg = '请输入患者健康档案编号';
            }else if (!(/^\d+$/.test($("#HEALTHSN").val()))) {
                selector = $("#HEALTHSN");
                _msg = '请输入正确格式的健康档案编号';
			}else if ($("#HEADTHCARDNO").val() == "") {
				selector = $("#HEADTHCARDNO");
				_msg = '请输入患者健康卡卡号';
            }else if (!(/^\d+$/.test($("#HEADTHCARDNO").val()))) {
                selector = $("#HEADTHCARDNO");
                _msg = '请输入正确格式的健康卡卡号';
			}else if ($("#CARDTYPE").val() == "") {
				selector = $("#CARDTYPE");
				_msg = '请输入患者证件类型';
			}else if ($("#CARDNO").val() == "") {
				selector = $("#CARDNO");
				_msg = '请输入患者证件号码';
            }else if ($("#CARDTYPE").val() == "00401" && !(/^(^[1-9]\d{7}((0[1-9])|(1[0-2]))(([0|1|2][1-9])|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/.test($("#CARDNO").val()))) {
                selector = $("#CARDNO");
                _msg = '请输入正确的身份证号码';
			}else if ($("#INSURETYPE").val() == "") {
				selector = $("#INSURETYPE");
				_msg = '请输入参保类型';
			}else if ($("#INSURENO").val() == "") {
				selector = $("#INSURENO");
				_msg = '请输入参保卡号';
			}else if ($("#BIRTHDAY").val() == "") {
				selector = $("#BIRTHDAY");
				_msg = '请输入患者出生日期';
            }else if (new Date(Date.parse($("#BIRTHDAY").val() .replace(/-/g,"/"))) > new Date()) {
                selector = $("#BIRTHDAY");
                _msg = '患者出生日期不能大于今天';
			}else if ($("#PHONE").val() == "") {
				selector = $("#PHONE");
				_msg = '请输入患者联系电话';
            }else if (!(/^((1[0-9]{10})|(\d{7,8})|(\d{3,4})-(\d{7,8}))$/.test($("#PHONE").val()))) {
                selector = $("#PHONE");
                _msg = '请输入正确格式的联系电话';
			}else if ($("#AREA").children().length > 1 && $("#AREA").val() == '0') {
				selector = $("#AREADiv div.chosen-container.chosen-container-single a");
				_msg = '请选择区';
			}else if ($("#ADDRESS").val() == "") {
				selector = $("#ADDRESS");
				_msg = '请输入患者家庭住址';
			}else if ($("#STREET").children().length > 1 && $("#STREET").val() == '0') {
				selector = $("#STREETDiv div.chosen-container.chosen-container-single a");
				_msg = '请选择街道/办事处';
			}else if ($("#COMMUNITY").children().length > 1 && $("#COMMUNITY").val() == '0') {
				selector = $("#COMMUNITYDiv div.chosen-container.chosen-container-single a");
				_msg = '请选择区';
			}else if ($("#VISITCARDNO").val() == "") {
				selector = $("#VISITCARDNO");
				_msg = '请输入患者就诊卡卡号';
			}/* else if ($("#OUTORGID").val() == "") {
				selector = $("#OUTORGID");
				_msg = '请输入转出医疗机构代码';
			} */else if ($("#OUTORGNAME").val() == "") {
				selector = $("#OUTORGNAME");
				_msg = '请输入转出医疗机构名称';
			}/* else if ($("#OUTDEPTID").val() == "") {
				selector = $("#OUTDEPTID");
				_msg = '请输入转出科室代码';
			} */else if ($("#OUTDEPTNAME").val() == "") {
				selector = $("#OUTDEPTNAME");
				_msg = '请输入转出科室名称';
			}else if ($("#OUTDOCTORID").val() == "") {
				selector = $("#OUTDOCTORID");
				_msg = '请输入转出医生工号';
			}else if ($("#OUTDOCTORNAME").val() == "") {
				selector = $("#OUTDOCTORNAME");
				_msg = '请输入转出医生姓名';
			}else if ($("#OUTDOCTORPHONE").val() == "") {
				selector = $("#OUTDOCTORPHONE");
				_msg = '请输入转出医生电话';
            }else if (!(/^((1[0-9]{10})|(\d{7,8})|(\d{3,4})-(\d{7,8}))$/.test($("#OUTDOCTORPHONE").val()))) {
                selector = $("#OUTDOCTORPHONE");
                _msg = '请输入正确格式的转出医生电话';
            }else if ($("#FIRSTDIAGNOSISNAME").val() == "") {
                selector = $("#FIRSTDIAGNOSISNAME");
                _msg = '请输入初步诊断';
            }else if ($("#REFERRALREASON").val() == "") {
                selector = $("#REFERRALREASON");
                _msg = '请输入转诊原因';
            }else if ($("#INDATE").val() == "") {
                selector = $("#INDATE");
                _msg = '请输入拟定转入日期';
            }else if (new Date(Date.parse($("#INDATE").val() .replace(/-/g,"/"))) <= new Date()) {
                selector = $("#INDATE");
                _msg = '拟定转入日期不能必须大于今天';
			}else if (!$("#RECOVERSUGGESTION").is(":hidden") && $("#RECOVERSUGGESTION").val() == "") {
				selector = $("#RECOVERSUGGESTION");
				_msg = '请输入康复建议';
			}/* else if ($("#INORGID").val() == "") {
				selector = $("#INORGID");
				_msg = '请输入转入医疗机构代码';
			} */else if ($("#INORGNAME").val() == "") {
				selector = $("#INORGNAME");
				_msg = '请输入转入医疗机构名称';
			}/* else if ($("#INDEPTID").val() == "") {
				selector = $("#INDEPTID");
				_msg = '请输入转入科室代码';
			} */else if ($("#INDEPTNAME").val() == "") {
				selector = $("#INDEPTNAME");
				_msg = '请输入转入科室名称';
			}else if ($("#ILLDESC").val() == "") {
				selector = $("#ILLDESC");
				_msg = '请输入病情描述';
			}else if ($("#attachmentListDiv").is(":hidden")&& $("#attachment").val() == "") {
                selector = $("#attachment");
                _msg = '请上传患者转诊签字确认表';
            }else if (!$("#attachmentListDiv").is(":hidden")&& $("#attachmentListUl").children().length == 0 && $("#attachment").val() == "") {
                selector = $("#attachment");
                _msg = '请上传患者转诊签字确认表';
            }

			if(_msg == ''){
                $("#Form").attr('action',$("#Form").attr('action')+'?saveType='+type);
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}else{
				selector.focus();
				selector.tips({
					side: _side,
					msg: _msg,
					bg: _bg,
					time: _time
				});
			}
		}
        //下载附件
        function downloadAttachment(id){
            window.location.href = "<%=basePath%>attachment/download.do?ATTACHMENT_ID="+id+"&tm="+new Date().getTime()
        }

        //删除附件
        function deleteAttachment(id){
            bootbox.confirm("确定要删除附件吗?", function(result) {
                if(result) {
                    $.ajax({
                        type : "get",
                        url : "<%=basePath%>attachment/delete.do?ATTACHMENT_ID="+id+"&tm="+new Date().getTime(),
                        success : function(data) {
                            $("#attachmentListUl").find("li#"+id).remove();
                        }
                    })
                }
            });
        }

        //转诊类型改变事件
        function ZZLXChanged(){
            var ZZLX = $('#REFERRALTYPE').children('option:selected').val();
            if (ZZLX != '' && ZZLX != undefined){
                $.ajax({
                    type : "get",
                    dataType : "json",
                    async : false,
                    url : "<%=basePath%>referralStandard/goChanged.do?ZZLX="+ZZLX,
                    success : function(data) {
                        $("#ZZBZ").empty();
                        $.each ( data,function(i, item){
                            $("#ZZBZ").append("<option value="+item.VERSION+">"+item.REFERRAL_STANDARD+"</option>");
                        });
                        $('#ZZBZ').trigger('chosen:updated');

                    }
                });
            }
        }
        
        //申请类型改变事件
        function APPLYTYPEChanged(){
            if($('#APPLYTYPE').children('option:selected').val() == 4){
                $('#RECOVERSUGGESTION').closest('div.form-group').show();
                $("#REFERRALTYPE").val(1);
            }else{
                $('#RECOVERSUGGESTION').closest('div.form-group').hide();
                $("#REFERRALTYPE").val(0);
            }
            ZZLXChanged();
        }
       
        //区改变事件
        function AREAChanged(){
            var areaid = $('#AREA').children('option:selected').val() ;
            if (areaid != '' && areaid != undefined){
                $.ajax({
                    type : "get",
                    dataType : "json",
                    async : false,
                    url : "<%=basePath%>district/treeData.do?id="+areaid+"&tm="+new Date().getTime(),
                    success : function(data) {
                     
                        $("#STREET").empty();
                        $('#STREET').append("<option value='0'>请选择...</option>");
                        $.each ( data,function(i, item){
                            $("#STREET").append("<option value="+item.REGICODE+">"+item.REGINAME+"</option>");
                        });
                        $('#STREET').trigger('chosen:updated');
                        $("#COMMUNITY").empty();
                        $('#COMMUNITY').append("<option value='0'>请选择...</option>");
                        $('#COMMUNITY').trigger('chosen:updated');

                    }
                })
            }
        }

        //街道改变事件
        function STREETChanged(){
            var streetid = $('#STREET').children('option:selected').val() ;
            if (streetid != '' && streetid != undefined){
                $.ajax({
                    type : "get",
                    dataType : "json",
                    async : false,
                    url : "<%=basePath%>district/treeData.do?id="+streetid+"&tm="+new Date().getTime(),
                    success : function(data) {
                        $("#COMMUNITY").empty();
                        $('#COMMUNITY').append("<option value='0'>请选择...</option>");
                        $.each (data,function(i, item){
                            $("#COMMUNITY").append("<option value="+item.REGICODE+">"+item.REGINAME+"</option>");
                        });
                        $('#COMMUNITY').trigger('chosen:updated');
                    }
                })
            }
        }

        //疾病编码grid
        function diseaseCodeGrid(){
            var Title = "请点击诊断名称来确定初步诊断";
            var diag = new Dialog();
            diag.Drag = true;
            diag.Title = Title;
            diag.URL = '<%=basePath%>/diseasecode/list.do?showType=diag';
            diag.Width = 900;
            diag.Height = 575;
            diag.CancelEvent = function(){ //关闭事件
                diag.close();
            };
            diag.OKEvent = function(){
            	var FIRSTDIAGNOSIS = diag.innerFrame.contentWindow.document.getElementById('FIRSTDIAGNOSIS').value;
            	if(FIRSTDIAGNOSIS!=''){
            		$("#FIRSTDIAGNOSIS").val(FIRSTDIAGNOSIS);
            		$("#FIRSTDIAGNOSISNAME").val(diag.innerFrame.contentWindow.document.getElementById('FIRSTDIAGNOSISNAME').value);
            		diag.close();
            	}
            };
            	
            diag.show();
        }

        // 根据转出机构和初步诊断筛选转入机构
        function OrgGrid(){
            var firstdiagnosis = $("#FIRSTDIAGNOSIS").val();
            var outorgid = $("#OUTORGID").val();
            if(firstdiagnosis == null || firstdiagnosis == ""){
                bootbox.alert("请先选择初步诊断");
                return;
            }
            if(outorgid == null || outorgid == ""){
                bootbox.alert("转出机构不能为空,非法数据");
                return;
            }
            var referraltype = $('#REFERRALTYPE').val();
             if(referraltype == null || referraltype == ""){
                bootbox.alert("转诊类型不能为空,非法数据");
                return;
            }

            var Title = "请选择转入机构";
            var diag = new Dialog();
            diag.Drag = true;
            diag.Title = Title;
            diag.URL = '<%=basePath%>/referral/chooseOrglistPage.do?ORG_CODE='+outorgid+'&DISEASE_CODE='+firstdiagnosis+'&REFERRAL_TYPE='+referraltype;
            diag.Width = 900;
            diag.Height = 575;
            diag.CancelEvent = function(){ //关闭事件
                diag.close();
            };
            diag.OKEvent = function(){
            	var INORGID = diag.innerFrame.contentWindow.document.getElementById('INORGID').value;
            	if(INORGID!=''){
            		$("#INORGID").val(INORGID);
                	$("#INORGNAME").val(diag.innerFrame.contentWindow.document.getElementById('INORGNAME').value);
                	diag.close();
            	}
            };
            diag.show();
        }

        //根据转入机构选择科室
        function deptGrid(){
            var inorgid = $("#INORGID").val();
            if(inorgid == null || inorgid == ""){
                bootbox.alert("请先选择转入机构");
                return;
            }

            var Title = "请选择转入科室";
            var diag = new Dialog();
            diag.Drag = true;
            diag.Title = Title;
            diag.URL = '<%=basePath%>/referral/chooseDeptlistPage.do?ORG_CODE='+inorgid;
            diag.Width = 900;
            diag.Height = 575;
            diag.CancelEvent = function(){ //关闭事件
                diag.close();
            };
            diag.OKEvent = function(){
            	var INDEPTID = diag.innerFrame.contentWindow.document.getElementById('INDEPTID').value;
            	if(INDEPTID!=''){
            		$("#INDEPTID").val(INDEPTID);
                	$("#INDEPTNAME").val(diag.innerFrame.contentWindow.document.getElementById('INDEPTNAME').value);
                	diag.close();
            	}
            };
            diag.show();
        }

		$(function () {
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			}).next().on(ace.click_event, function () {
				$(this).prev().focus();
			});
            if($('#add_success').val() == 'success'){
                $('li #z72 a', window.parent.parent.document).trigger('click');
                $("table#z71 ",parent.document.body).contents().find('div.tab_close').trigger('click');
            }

            if($('#Form').attr('action').indexOf('edit') != -1){
                $("#attachmentListDiv").show();
            }

            if(!ace.vars['touch']) {
                $('.chosen-select').chosen({
                    allow_single_deselect:true,
                    no_results_text:"未找到匹配项"
                });
                //resize the chosen on window resize
                $(window)
                        .off('resize.chosen')
                        .on('resize.chosen', function() {
                            $('.chosen-select').each(function() {
                                var $this = $(this);
                                $this.next().css({'width': $this.parent().width()});
                            })
                        }).trigger('resize.chosen');
                //resize chosen on sidebar collapse/expand
                $(document).on('settings.ace.chosen', function(e, event_name, event_val) {
                    if(event_name != 'sidebar_collapsed') return;
                    $('.chosen-select').each(function() {
                        var $this = $(this);
                        $this.next().css({'width': $this.parent().width()});
                    })
                });
            }
            APPLYTYPEChanged();
			if($('#ZZBZBM').val() != ''){
				$('#ZZBZ').val($('#ZZBZBM').val());
                $('#ZZBZ').trigger('chosen:updated');
			}
            AREAChanged();
            if($('#STREET_ID').val() != ''){
                $('#STREET').val($('#STREET_ID').val());
                $('#STREET').trigger('chosen:updated');
            }
            STREETChanged();
            if($('#COMMUNITY_ID').val() != ''){
                $('#COMMUNITY').val($('#COMMUNITY_ID').val());
                $('#COMMUNITY').trigger('chosen:updated');
            }


            $.fn.editable.defaults.mode = 'inline';
            $.fn.editableform.loading = "<div class='editableform-loading'><i class='ace-icon fa fa-spinner fa-spin fa-2x light-blue'></i></div>";
            $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="ace-icon fa fa-check"></i></button>'+
                    '<button type="button" class="btn editable-cancel"><i class="ace-icon fa fa-times"></i></button>';

            // *** editable avatar *** //
            try {//ie8 throws some harmless exceptions, so let's catch'em

                //first let's add a fake appendChild method for Image element for browsers that have a problem with this
                //because editable plugin calls appendChild, and it causes errors on IE at unpredicted points
                try {
                    document.createElement('IMG').appendChild(document.createElement('B'));
                } catch(e) {
                    Image.prototype.appendChild = function(el){}
                }

                var last_gritter
                $('#avatar').editable({
                    type: 'image',
                    name: 'avatar',
                    value: null,
                    image: {
                        //specify ace file input plugin's options here
                        btn_choose: 'Change Photo',
                        droppable: true,
                        maxSize: 310000,//~100Kb
                        //and a few extra ones here
                        name: 'avatar',//put the field name here as well, will be used inside the custom plugin
                        on_error : function(error_type) {//on_error function will be called when the selected file has a problem
                            if(last_gritter) $.gritter.remove(last_gritter);
                            if(error_type == 1) {//file format error
                                last_gritter = $.gritter.add({
                                    title: '选择的文件不是图片！',
                                    text: '文件后缀应该为jpg/gif/png！',
                                    time: 1500,
                                    class_name: 'gritter-error gritter-center'
                                });
                            } else if(error_type == 2) {//file size rror
                                last_gritter = $.gritter.add({
                                    title: '选择的文件太大了！',
                                    text: '文件大小不能超过300Kb！',
                                    time: 1500,
                                    class_name: 'gritter-error gritter-center'
                                });
                            }
                            else {//other error
                            }
                        },
                        on_success : function() {
                            $.gritter.removeAll();
                        }
                    },
                    url: function(params) {
                        // ***UPDATE AVATAR HERE*** //
                        //for a working upload example you can replace the contents of this function with
                        //examples/profile-avatar-update.js
                        var deferred = new $.Deferred
                        var value = $('#avatar').next().find('input[type=hidden]:eq(0)').val();
                        if(!value || value.length == 0) {
                            deferred.resolve();
                            return deferred.promise();
                        }
                        //dummy upload
                        setTimeout(function(){
                            if("FileReader" in window) {
                                //for browsers that have a thumbnail of selected image
                                var thumb = $('#avatar').next().find('img').data('thumb');
                                if(thumb) $('#avatar').get(0).src = thumb;
                                $("#PHOTO").val(thumb);
                            }
                            deferred.resolve({'status':'OK'});
                            if(last_gritter) $.gritter.remove(last_gritter);
                            last_gritter = $.gritter.add({
                                title: '照片更新成功!',
                                text: '',
                                time: 1000,
                                class_name: 'gritter-info gritter-center'
                            });
                        } , parseInt(Math.random() * 800 + 800))
                        return deferred.promise();
                        // ***END OF UPDATE AVATAR HERE*** //
                    },
                    success: function(response, newValue) {
                    }
                })
            }catch(e) {
            }


            $('#attachment').ace_file_input({
                no_file:'选择文件...',
                btn_choose:'选择',
                btn_change:'更换',
                droppable:false,
                onchange:null,
                thumbnail:false
            });


            $('#id-add-attachment')
                    .on('click', function () {
                        var file = $('<input type="file" name="attachments" />').appendTo('#form-attachments');
                        file.ace_file_input({
                            no_file: '选择文件...',
                            btn_choose: '选择',
                            btn_change: '更换'
                        });

                        file.closest('.ace-file-input')
                                .addClass('width-90 inline')
                                .wrap('<div class="form-group file-input-container"><div class="col-sm-7"></div></div>')
                                .parent().append('<div class="action-buttons pull-right col-xs-1">\
							<a href="#" data-action="delete" class="middle">\
								<i class="ace-icon fa fa-trash-o red bigger-130 middle"></i>\
							</a>\
						</div>')
                                .find('a[data-action=delete]').on('click', function (e) {
                                    //the button that removes the newly inserted file input
                                    e.preventDefault();
                                    $(this).closest('.file-input-container').hide(300, function () {
                                        $(this).remove()
                                    });
                                });
                    });
        });
		
		
		//是否存在指定函数 
		function isExitsFunction(funcName) {
		    try {
		        if (typeof(eval(funcName)) == "function") {
		            return true;
		        }
		    } catch(e) {}
		    return false;
		}
		//是否存在指定变量 
		function isExitsVariable(variableName) {
		    try {
		        if (typeof(variableName) == "undefined") {
		            //alert("value is undefined"); 
		            return false;
		        } else {
		            //alert("value is true"); 
		            return true;
		        }
		    } catch(e) {}
		    return false;
		}
	</script>
</body>
</html>