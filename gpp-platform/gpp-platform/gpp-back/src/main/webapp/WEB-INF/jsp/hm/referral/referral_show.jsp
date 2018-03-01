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
					<form action="referral/${msg }.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
						<input type="hidden" name="REFERRAL_ID" id="REFERRAL_ID" value="${pd.REFERRAL_ID}"/>
						<input type="hidden" name="add_success" id="add_success" value="${pd.success}"/>
                        <input type="hidden" name="AREA_ID" id="AREA_ID" value="${pd.AREA}"/>
                        <input type="hidden" name="STREET_ID" id="STREET_ID" value="${pd.STREET}"/>
                        <input type="hidden" name="COMMUNITY_ID" id="COMMUNITY_ID" value="${pd.COMMUNITY}"/>
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
													<img id="avatar0" class="editable img-responsive" alt="${pd.NAME}"  src="${pd.PHOTO}" onerror="onerror=null;src='static/ace/avatars/profile-pic.jpg'" width="182" height="207"/>
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
                                                    <label class="col-sm-4 control-label no-padding-right" for="NAME">患者姓名:</label>
                                                    <div class="col-sm-8">
                                                        <span name="NAME" id="NAME" class="col-sm-12 from-control-span">${pd.NAME}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SEX">患者性别:</label>
                                                    <div class="col-sm-8">
                                                        <span name="SEX" id="SEX" class="col-sm-12 from-control-span">${pd.SEX}</span>
                                                    </div>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HEALTHSN">健康档案编号:</label>
                                                    <div class="col-sm-8">
                                                        <span name="HEALTHSN" id="HEALTHSN" class="col-sm-12 from-control-span">${pd.HEALTHSN}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HEADTHCARDNO">健康卡卡号:</label>
                                                    <div class="col-sm-8">
                                                        <span name="HEADTHCARDNO" id="HEADTHCARDNO" class="col-sm-12 from-control-span">${pd.HEADTHCARDNO}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDTYPE">患者证件类型:</label>
                                                    <div class="col-sm-8">
                                                       <span name="CARDTYPE" id="CARDTYPE" class="col-sm-12 from-control-span">${pd.CARDTYPE.NAME}</span> 
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDNO">患者证件号码:</label>
                                                    <div class="col-sm-8">
                                                        <span name="CARDNO" id="CARDNO" class="col-sm-12 from-control-span">${pd.CARDNO}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="INSURETYPE">参保类型:</label>
                                                    <div class="col-sm-8">
                                                        <span name="INSURETYPE" id="INSURETYPE" class="col-sm-12 from-control-span">${pd.INSURETYPE.NAME}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="INSURENO">参保卡号:</label>
                                                    <div class="col-sm-8">
                                                        <span name="INSURENO" id="INSURENO" class="col-sm-12 from-control-span">${pd.INSURENO}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="BIRTHDAY">患者出生日期:</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group col-xs-12">
                                                            <span name="BIRTHDAY" id="BIRTHDAY" class="col-sm-12 from-control-span"><fmt:formatDate pattern='yyyy-MM-dd'  value='${pd.BIRTHDAY}'/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="PHONE">患者联系电话:</label>
                                                    <div class="col-sm-8">
                                                        <span name="PHONE" id="PHONE" class="col-sm-12 from-control-span">${pd.PHONE}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CITY">市:</label>
                                                    <div class="col-sm-8">
                                                        <span name="CITY" id="CITY" class="col-sm-12 from-control-span">${pd.CITY}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="AREA">区:</label>
                                                    <div class="col-sm-8" id="AREADiv">
                                                        <span name="AREA" id="AREA" class="col-sm-12 from-control-span">${pd.AREA}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="STREET">街道/办事处:</label>
                                                    <div class="col-sm-8" id="STREETDiv">
                                                        <span name="STREET" id="STREET" class="col-sm-12 from-control-span">${pd.STREET}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="COMMUNITY">社区:</label>
                                                    <div class="col-sm-8" id="COMMUNITYDiv">
                                                        <span name="COMMUNITY" id="COMMUNITY" class="col-sm-12 from-control-span">${pd.COMMUNITY}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <label class="col-sm-4 control-label no-padding-right" for="ADDRESS"  style="width: 16.1%;">患者家庭住址:</label>
                                                    <div class="col-sm-8"  style="width: 83.9%;">
                                                        <span name="ADDRESS" id="ADDRESS" class="col-sm-12 from-control-span">${pd.ADDRESS}</span>
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
                                                <label class="col-sm-4 control-label no-padding-right" for="VISITCARDNO">就诊卡卡号:</label>
                                                <div class="col-sm-8">
                                                    <span name="VISITCARDNO" id="VISITCARDNO" class="col-sm-12 from-control-span">${pd.VISITCARDNO}</span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="EMERGENCYLEVEL">紧急级别:</label>
                                                <div class="col-sm-8">
                                                    <span name="EMERGENCYLEVEL" id="EMERGENCYLEVEL" class="col-sm-12 from-control-span">${pd.EMERGENCYLEVEL}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="APPLYTYPE">申请类型:</label>
                                                <div class="col-sm-8">
                                                    <span name="APPLYTYPE" id="APPLYTYPE" class="col-sm-12 from-control-span">${pd.APPLYTYPE}</span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="REFERRALTYPE">转诊类型:</label>
                                                <div class="col-sm-8">
                                                    <span name="REFERRALTYPE" id="REFERRALTYPE" class="col-sm-12 from-control-span">${pd.REFERRALTYPE}</span>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTORGNAME">转出机构名称:</label>
                                                <div class="col-sm-8">
                                                    <span name="OUTORGNAME" id="OUTORGNAME" class="col-sm-12 from-control-span">${pd.OUTORGNAME}</span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTDEPTNAME">转出科室名称:</label>
                                                <div class="col-sm-8">
                                                    <span name="OUTDEPTNAME" id="OUTDEPTNAME" class="col-sm-12 from-control-span">${pd.OUTDEPTNAME}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTDOCTORID">转出医生工号:</label>
                                                <div class="col-sm-8">
                                                    <span name="OUTDOCTORID" id="OUTDOCTORID" class="col-sm-12 from-control-span">${pd.OUTDOCTORID}</span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTDOCTORNAME">转出医生姓名:</label>
                                                <div class="col-sm-8">
                                                    <span name="OUTDOCTORNAME" id="OUTDOCTORNAME" class="col-sm-12 from-control-span">${pd.OUTDOCTORNAME}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="OUTDOCTORPHONE">转出医生电话:</label>
                                                <div class="col-sm-8">
                                                    <span name="OUTDOCTORPHONE" id="OUTDOCTORPHONE" class="col-sm-12 from-control-span">${pd.OUTDOCTORPHONE}</span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="FIRSTDIAGNOSIS">初步诊断:</label>
                                                <div class="col-sm-8">
                                                    <span name="FIRSTDIAGNOSIS" id="FIRSTDIAGNOSIS" class="col-sm-12 from-control-span">${pd.FIRSTDIAGNOSISNAME}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="REFERRALREASON">转诊原因:</label>
                                                <div class="col-sm-8">
                                                    <span name="REFERRALREASON" id="REFERRALREASON" class="col-sm-12 from-control-span">${pd.REFERRALREASON}</span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INDATE">拟定转入日期:</label>
                                                <div class="col-sm-8">
                                                    <span name="INDATE" id="INDATE" class="col-sm-12 from-control-span"><fmt:formatDate pattern='yyyy-MM-dd'  value='${pd.INDATE}'/></span>
                                                </div>
                                            </div>
                                        </div>
                                       
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INORGNAME">转入机构名称:</label>
                                                <div class="col-sm-8">
                                                    <input type="hidden" name="INORGID" id="INORGID" value="${pd.INORGID}">
                                                    <input type="hidden" name="INORGNAME" id="INORGNAME" value="${pd.INORGNAME}">
                                                    
                                                    <span name="INORGNAME" id="INORGNAME" class="col-sm-12 from-control-span">${pd.INORGNAME}</span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INDEPTNAME">转入科室名称:</label>
                                                <div class="col-sm-8">
                                                    <c:choose>
                                                        <c:when test="${pd.fromUrl != null && pd.fromUrl != ''}">
                                                            <span name="INDEPTNAME" id="INDEPTNAME" class="col-sm-12 from-control-span">${pd.INDEPTNAME}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="input-group col-xs-12">
                                                                <input type="hidden" class="col-sm-11 form-control" name="INDEPTID" id="INDEPTID" value="${pd.INDEPTID}" maxlength="30" placeholder="转入科室代码" title="转入科室代码" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;" >
                                                                <input type="text" class="col-sm-11 form-control" name="INDEPTNAME" id="INDEPTNAME" value="${pd.INDEPTNAME}" maxlength="60" placeholder="转入科室名称" title="转入科室名称" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;" onclick="deptGrid();">
                                                                <span class="input-group-addon" id="indeptid_icon" style="cursor: pointer" onclick="deptGrid()">
                                                                    <i class="fa fa-list-alt"></i>
                                                                </span>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INDOCTORNAME">转入医生姓名:</label>
                                                <div class="col-sm-8">
                                                    <c:choose>
                                                        <c:when test="${pd.fromUrl != null && pd.fromUrl != ''}">
                                                              <span name="INDOCTORNAME" id="INDOCTORNAME" class="col-sm-12 from-control-span">${pd.INDOCTORNAME}</span>
                                                      </c:when>
                                                        <c:otherwise>
                                                                    <div class="input-group col-xs-12">
                                                                <input type="text" class="col-sm-11 form-control" name="INDOCTORNAME" id="INDOCTORNAME" value="${pd.INDOCTORNAME}" maxlength="60" placeholder="转入医生姓名" title="转入医生姓名" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;" onclick="providerGrid();">
                                                                <span class="input-group-addon" id="indoctorname_icon" style="cursor: pointer" onclick="providerGrid()">
                                                                    <i class="fa fa-list-alt"></i>
                                                                </span>
                                                            </div>
                                                </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INDOCTORID">转入医生工号:</label>
                                                <div class="col-sm-8">
                                                    <c:choose>
                                                        <c:when test="${pd.fromUrl != null && pd.fromUrl != ''}">                                                            <span name="INDOCTORID" id="INDOCTORID" class="col-sm-12 from-control-span">${pd.INDOCTORID}</span>

                                                        </c:when>
                                                        <c:otherwise><input type="text" class="col-sm-12" name="INDOCTORID" id="INDOCTORID" value="${pd.INDOCTORID}" maxlength="30" placeholder="转入医生工号" title="转入医生工号" readonly="readonly" style="background-color: #ffffff !important; cursor: pointer;" >
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6">
                                                <label class="col-sm-4 control-label no-padding-right" for="INDOCTORPHONE">转入医生电话:</label>
                                                <div class="col-sm-8">
                                                    <c:choose>
                                                        <c:when test="${pd.fromUrl != null && pd.fromUrl != ''}">
                                                            <span name="INDOCTORPHONE" id="INDOCTORPHONE" class="col-sm-12 from-control-span">${pd.INDOCTORPHONE}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="col-sm-12" name="INDOCTORPHONE" id="INDOCTORPHONE" value="${pd.INDOCTORPHONE}" maxlength="20" placeholder="转入医生电话" title="转入医生电话">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                         -->
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label class="col-sm-4 control-label no-padding-right" for="ILLDESC" style="width: 16.1%;">病情描述:</label>
                                                <div class="col-sm-8" style="width: 83.9%;">
                                                    <span name="ILLDESC" id="ILLDESC" class="col-sm-12 from-control-span">${pd.ILLDESC}</span>
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
                                                                </span>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix form-actions">
                            <c:choose>
                                <c:when test="${pd.fromUrl != null && pd.fromUrl != ''}">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button class="btn btn-info" type="button" onclick="pageBack('${pd.fromUrl}');">
                                            <i class="ace-icon fa fa-arrow-left bigger-110"></i>
                                            返回
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-md-offset-3 col-md-9">
                                        <button class="btn btn-info" type="button" onclick="save();">
                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                            保存
                                        </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
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
	<script type="text/javascript">
		//保存
		function save() {
			var _side = 3, _msg = '', _bg = '#AE81FF', _time = 2;
			var selector = null;
			if($("#INDEPTID").val() == "") {
				selector = $("#INDEPTID");
				_msg = '请输入转入科室代码';
			}else if ($("#INDEPTNAME").val() == "") {
				selector = $("#INDEPTNAME");
				_msg = '请输入转入科室名称';
			}/*else if ($("#INDOCTORID").val() == "") {
				selector = $("#INDOCTORID");
				_msg = '请输入转入医生工号';
			}else if ($("#INDOCTORNAME").val() == "") {
				selector = $("#INDOCTORNAME");
				_msg = '请输入转入医生姓名';
            }else if ($("#INDOCTORPHONE").val() == "") {
                selector = $("#INDOCTORPHONE");
                _msg = '请输入转入医生电话';
            }else if (!(/^((1[0-9]{10})|(\d{7,8})|(\d{3,4})-(\d{7,8}))$/.test($("#INDOCTORPHONE").val()))) {
                selector = $("#INDOCTORPHONE");
                _msg = '请输入正确格式的转入医生电话';
            }*/
			if(_msg == ''){
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

        //返回原页面
        function pageBack(fromUrl){
            window.location.href=fromUrl;
        }

        //下载附件
        function downloadAttachment(id){
            window.location.href = "<%=basePath%>attachment/download.do?ATTACHMENT_ID="+id+"&tm="+new Date().getTime()
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

        //根据转入机构、科室信息选择医护人员
        function providerGrid(){
            var inorgid = $("#INORGID").val();
            var indeptid = $("#INDEPTID").val();
            if(inorgid == null || inorgid == ""){
                bootbox.alert("转入机构不能为空，非法数据");
                return;
            }
            if(indeptid == null || indeptid == ""){
                bootbox.alert("请选择转入科室");
                return;
            }

            var Title = "请选择转入医生";
            var diag = new Dialog();
            diag.Drag = true;
            diag.Title = Title;
            diag.URL = '<%=basePath%>/referral/chooseProviderlistPage.do?ORG_CODE='+inorgid+'&DEP_ID='+indeptid;
            diag.Width = 900;
            diag.Height = 575;
            diag.CancelEvent = function(){ //关闭事件
                diag.close();
            };
            diag.OKEvent = function(){
            	var INDOCTORID = diag.innerFrame.contentWindow.document.getElementById('PROVIDER_ID').value;
            	if(INDOCTORID!=''){
            		$("#INDOCTORID").val(INDOCTORID);
                	$("#INDOCTORNAME").val(diag.innerFrame.contentWindow.document.getElementById('PROVIDER_NAME').value);
                	$("#INDOCTORPHONE").val(diag.innerFrame.contentWindow.document.getElementById('TELECOM').value);
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
            console.log($('#add_success').val());
            if($('#add_success').val() == 'success'){
                $('li #z74 a', window.parent.parent.document).trigger('click');
            }

            if($('#Form').attr('action').indexOf('edit') != -1){
                $("#attachmentListDiv").show();
            }

            if($('#APPLYTYPE').val() == ('转康复')){
                $('#RECOVERSUGGESTION').closest('div.form-group').show();
            }else{
                $('#RECOVERSUGGESTION').closest('div.form-group').hide();
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
                        maxSize: 110000,//~100Kb
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
                                    text: '文件大小不能超过100Kb！',
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

	</script>
</body>
</html>