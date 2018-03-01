<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 


%>
<!-- 住院病案首页详情页面 -->
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
									<div id="zhongxin" style="padding-top: 13px;">
									<div class="form-group">
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">居民基本信息</h5>
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
													<img id="avatar0" class="editable img-responsive" alt="${pdJmxx.USER_NAME}"  src="${pdJmxx.IMAGE_URL}" onerror="onerror=null;src='static/ace/avatars/profile-pic.jpg'" width="182" height="207"/>
												</span>
                                                <div class="space-4"></div>
                                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                                    <div class="inline position-relative">
                                                        <span class="white">${pdJmxx.USER_NAME}</span>
                                                    </div>
                                                </div>
                                	 	</div>
                                	 	<div class="col-xs-12 col-sm-8">
                                	 		<div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >姓名:</label>
                                                    <div class="col-sm-8">
                                                        <span   class="col-sm-12 from-control-span">
                                                        	<input type="text" name="USER_NAME" id="USER_NAME" value="${pdJmxx.USER_NAME }" placeholder="这里输入姓名" title="姓名" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SEX">性别:</label>
                                                    <div class="col-sm-8">
                                                        <span  class="col-sm-12 from-control-span">
															<select class="chosen-select form-control" name="SEX" id="SEX" data-placeholder="性别" style="vertical-align:top;width: 98%;">
																<option value="2" <c:if test="${pdJmxx.SEX == '2' }">selected</c:if> >女</option>
																<option value="1" <c:if test="${pdJmxx.SEX == '1' }">selected</c:if> >男</option>
															</select>
														</span>
                                                    </div>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDTYPE">证件类型:</label>
                                                    <div class="col-sm-8">
                                                       <span  class="col-sm-12 from-control-span">居民身份证</span> 
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDNO">证件号码:</label>
                                                    <div class="col-sm-8">
                                                        <span  class="col-sm-12 from-control-span"><input type="text" name="ID_NUMBER" id="ID_NUMBER" value="${pdJmxx.ID_NUMBER }" maxlength="18" placeholder="这里输入身份证号" title="身份证号" onblur="hasI()" style="width:98%;" /></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="BIRTHDAY_TIME">出生日期:</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group col-xs-12">
                                                            <span  class="col-sm-12 from-control-span">
                                                            	<input class="span10 date-picker" name="BIRTHDAY_TIME" id="BIRTHDAY_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pdJmxx.BIRTHDAY_TIME}" />' type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:98%;" placeholder="出生日期" title="出生日期"/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="PHONE">联系电话:</label>
                                                    <div class="col-sm-8">
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="TELEPHONE" id="TELEPHONE" value="${pdJmxx.TELEPHONE }" placeholder="手机号" title="手机号" onblur="yanT();" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="POSTCODE "  >邮政编码:</label>
                                                    <div class="col-sm-8"  >
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="POSTCODE" id="POSTCODE" value="${pdJmxx.POSTCODE }" placeholder="邮政编码" title="邮政编码" onblur="yanP();" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="ADDRESS">详细地址:</label>
                                                    <div class="col-sm-8" id="STREETDiv">
                                                        <span class="col-sm-12 from-control-span">
                                                              <input type="text" name="ADDRESS" id="ADDRESS" value="${pdJmxx.ADDRESS }" placeholder="详细地址" title="详细地址" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="form-group">
												 <div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >区域</label>
													 <div class="col-sm-8"  >
														 <span  class="col-sm-12 from-control-span">
															<input type="text" name="AREA" id="AREA" value="${pdJmxx.AREA }" placeholder="区域" title="区域" style="width:98%;" />
														</span>
													 </div>
												 </div>
												<div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >头像URL</label>
													 <div class="col-sm-8" >
														 <span   class="col-sm-12 from-control-span">
															<input type="text" name="IMAGE_URL" id="IMAGE_URL" value="${pdJmxx.IMAGE_URL }" placeholder="头像URL" title="头像URL" style="width:98%;" />
														 </span>
													 </div>
												</div>
											</div>
											<div class="form-group">
												 <div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="IS_LOCK" >区域ID</label>
													 <div class="col-sm-8"  >
														 <span class="col-sm-12 from-control-span">
															<input type="text" name="AREA_ID" id="AREA_ID" value="${pdJmxx.AREA_ID }" placeholder="区域ID" title="区域ID" style="width:98%;" />
														</span>
													 </div>
												 </div>
												<div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="OPERATOR_ID " >手机定位地址:</label>
													 <div class="col-sm-8" >
														 <span   class="col-sm-12 from-control-span">
															<input type="text" name="LOCAL_ADDRESS" id="LOCAL_ADDRESS" value="${pdJmxx.LOCAL_ADDRESS }" placeholder="手机定位传入的地址" title="手机定位传入的地址" style="width:98%;" />
														 </span>
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
												<h5 class="widget-title">住院病案首页详情</h5>
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
												<div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YLJGDM"  >医院机构代码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="YLJGDM" class="col-sm-12 from-control-span">
	                                                           <input type="text" name="YLJGDM" id="YLJGDM" value="${pd.YLJGDM}" readonly="readonly" style="width:98%;"/>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JZLSH">住院就诊流水号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="JZLSH" id="JZLSH" value="${pd.JZLSH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYSJ"  >入院时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
	                                                        	<input type="text" name="RYSJ" id="RYSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.RYSJ}" />' readonly="readonly" style="width:98%;"/>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYLX">入院类型:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																 <select name="RYLX" id="RYLX" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumRylx}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.RYLX == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >主治医生工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
	                                                        	<input type="text" name="ZZYSGH" id="ZZYSGH" value="${pd.ZZYSGH}" readonly="readonly" style="width:98%;"/>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZZYSGH">主治医生姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZZYSXM" id="ZZYSXM" value="${pd.ZZYSXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CH"  >床号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
	                                                        	<input type="text" name="CH" id="CH" value="${pd.CH}" readonly="readonly" style="width:98%;"/>	
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BAH">病案号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="BAH" id="BAH" value="${pd.BAH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KH"  >卡号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
	                                                        	<input type="text" name="KH" id="KH" value="${pd.KH}" readonly="readonly" style="width:98%;"/>	
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KLX">卡类型:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="KLX" id="KLX" value="${pd.KLX}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JKKH"  >健康卡号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
	                                                        	<input type="text" name="JKKH" id="JKKH" value="${pd.JKKH}" readonly="readonly" style="width:98%;"/>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZYCS">住院次数:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZYCS" id="ZYCS" value="${pd.ZYCS}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
												<div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYBQ"  >入院病区（房）:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="RYBQ" id="RYBQ" value="${pd.RYBQ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CYBQ">出院病区（房）:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="CYBQ" id="CYBQ" value="${pd.CYBQ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
												<div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XM"  >姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="XM" id="XM" value="${pd.XM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XB">性别:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="XB" id="XB" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumSexGB}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.XB == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
												<div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >出生日期:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="CSNY" id="CSNY" value="${pd.CSNY}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="HYZK">婚姻状况:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="HYZK" id="HYZK" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumHyzk}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.HYZK == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
												<div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XSECSTZ"  >新生儿出生体重:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="XSECSTZ" id="XSECSTZ" value="${pd.XSECSTZ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XSERYTZ">新生儿入院体重:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="XSERYTZ" id="XSERYTZ" value="${pd.XSERYTZ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
												<div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZ"  >名族:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="MZ" id="MZ" value="${pd.MZ}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="GJ">国籍:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="GJ" id="GJ" value="${pd.GJ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
												<div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JG"  >籍贯:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JG" id="JG" value="${pd.JG}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CSD">出生地:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="CSD" id="CSD" value="${pd.CSD}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
												<div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SFZ"  >身份证号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SFZ" id="SFZ" value="${pd.SFZ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="LXDH">联系电话:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="LXDH" id="LXDH" value="${pd.LXDH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="GZDW"  >工作单位:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="GZDW" id="GZDW" value="${pd.GZDW}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="GZDWDH">工作单位电话:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="GZDWDH" id="GZDWDH" value="${pd.GZDWDH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="GZDWYB"  >工作单位邮编:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="GZDWYB" id="GZDWYB" value="${pd.GZDWYB}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZYBM">职业:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZYBM" id="ZYBM" value="${pd.ZYBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JZD"  >居住地（现住址）:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JZD" id="JZD" value="${pd.JZD}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">现住址电话:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="XZZDH" id="XZZDH" value="${pd.XZZDH}" readonly="readonly" style="width:98%;"/>	 
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XZZYB"  >现住址邮编:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="XZZYB" id="XZZYB" value="${pd.XZZYB}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="HKDZ">户口地址:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="HKDZ" id="HKDZ" value="${pd.HKDZ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="HKDH"  >户口电话:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="HKDH" id="HKDH" value="${pd.HKDH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="HKYB">户口邮编:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="HKYB" id="HKYB" value="${pd.HKYB}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div><div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="DQBM"  >地区编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="DQBM" id="DQBM" value="${pd.DQBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="QXBM">区县编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="QXBM" id="QXBM" value="${pd.QXBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JDBM"  >街道编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JDBM" id="JDBM" value="${pd.JDBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">联系人姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="LXRXM" id="LXRXM" value="${pd.LXRXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="LXRGX"  >联系人与患者的关系:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																 <select name="LXRGX" id="LXRGX" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumLxrgx}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.LXRGX == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="LXRDZ">联系人地址:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="LXRDZ" id="LXRDZ" value="${pd.LXRDZ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="LXRTXDZ"  >联系人通讯地址:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="LXRTXDZ" id="LXRTXDZ" value="${pd.LXRTXDZ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="LXRDH">联系人电话:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="LXRDH" id="LXRDH" value="${pd.LXRDH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYKSBM"  >入院科室编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="RYKSBM" id="RYKSBM" value="${pd.RYKSBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZKKSBM1">转科科室编码1:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZKKSBM1" id="ZKKSBM1" value="${pd.ZKKSBM1}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZKKSBM2"  >转科科室编码2:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZKKSBM2" id="ZKKSBM2" value="${pd.ZKKSBM2}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">转科科室编码3:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZKKSBM3" id="ZKKSBM3" value="${pd.ZKKSBM3}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >所转病区:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SZBQ" id="SZBQ" value="${pd.SZBQ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CYSJ">出院时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="CYSJ" id="CYSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.CYSJ}" />' readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CYKSBM"  >出院科室编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="CYKSBM" id="CYKSBM" value="${pd.CYKSBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">实际住院天数:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="SJZYTS" id="SJZYTS" value="${pd.SJZYTS}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYQK"  >入院病情:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<select name="RYQK" id="RYQK" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumRybq}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.RYQK == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYQWYZZ">入院前经外院诊治:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="RYQWYZZ" id="RYQWYZZ" value="${pd.RYQWYZZ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="QZRQ"  >确诊日期:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="QZRQ" id="QZRQ" value="${pd.QZRQ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YYGRMC">医院感染名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YYGRMC" id="YYGRMC" value="${pd.YYGRMC}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YYGRJG"  >医院感染结果:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YYGRJG" id="YYGRJG" value="${pd.YYGRJG}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZCYZD">门诊出院诊断符合编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="MZCYZD" id="MZCYZD" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZdfhqk}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.MZCYZD == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYCYZD"  >入院出院诊断符合编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
	                                                       	 <select>
																  <c:forEach items="${pd.EnumZdfhqk}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.RYCYZD == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															    </select>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SQSHZD">术前术后诊断符合编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="SQSHZD" id="SQSHZD" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZdfhqk}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.SQSHZD == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="LCBLZD"  >临床病理诊断符合编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<select name="LCBLZD" id="LCBLZD" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZdfhqk}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.LCBLZD == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="FSBLZD">放射病理诊断符合编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="FSBLZD" id="FSBLZD" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZdfhqk}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.FSBLZD == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SSZD"  >损伤中毒的外部因素:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SSZD" id="SSZD" value="${pd.SSZD}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SSZDBM">损伤中毒的外部原因的疾病编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="SSZDBM" id="SSZDBM" value="${pd.SSZDBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YWGM"  >药物过敏:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YWGM" id="YWGM" value="${pd.YWGM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="QJCS">抢救次数:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="QJCS" id="QJCS" value="${pd.QJCS}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CGCS"  >成功次数:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="CGCS" id="CGCS" value="${pd.CGCS}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SFCXWJN">住院是否出现危重、急症、疑难:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="SFCXWJN" id="SFCXWJN" value="${pd.SFCXWJN}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div><div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RSMDSC"  >是否妊娠梅毒筛查:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="RSMDSC" id="RSMDSC" value="${pd.RSMDSC}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XSEJBSC">新生儿疾病筛查:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="XSEJBSC" id="XSEJBSC" value="${pd.XSEJBSC}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >主任医师工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZRYSGH" id="ZRYSGH" value="${pd.ZRYSGH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZRYSXM">主任医师姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZRYSXM" id="ZRYSXM" value="${pd.ZRYSXM}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZYYSGH"  >住院医师工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZYYSGH" id="ZYYSGH" value="${pd.ZYYSGH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZYYSXM">住院医师姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
	                                                            <input type="text" name="ZYYSXM" id="ZYYSXM" value="${pd.ZYYSXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZZYSGH"  >主治医师工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZZYSGH" id="ZZYSGH" value="${pd.ZZYSGH}" readonly="readonly" style="width:98%;"/>		
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZZYSXM">主治医师姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZZYSXM" id="ZZYSXM" value="${pd.ZZYSXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BAZL"  >病案质量:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BAZL" id="BAZL" value="${pd.BAZL}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZKYSGH">质控医师工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZKYSGH" id="ZKYSGH" value="${pd.ZKYSGH}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZKYSXM"  >质控医师姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZKYSXM" id="ZKYSXM" value="${pd.ZKYSXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZYSGH">门诊医师工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="MZYSGH" id="MZYSGH" value="${pd.MZYSGH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZYSXM"  >门诊医师姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="MZYSXM" id="MZYSXM" value="${pd.MZYSXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="LYFS">离院方式:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="LYFS" id="LYFS" value="${pd.LYFS}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZYF"  >住院费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZYF" id="ZYF" value="${pd.ZYF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZLF">诊疗费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZLF" id="ZLF" value="${pd.ZLF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZHF"  >治疗费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZHF" id="ZHF" value="${pd.ZHF}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="HLF">护理费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="HLF" id="HLF" value="${pd.HLF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >手术费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SSF" id="SSF" value="${pd.SSF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">材料费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="CLF" id="CLF" value="${pd.CLF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZF"  >麻醉费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="MZF" id="MZF" value="${pd.MZF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JCF">检查费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="JCF" id="JCF" value="${pd.JCF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="HYF"  >化验费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="HYF" id="HYF" value="${pd.HYF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XYF">西药费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="XYF" id="XYF" value="${pd.XYF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >中成药费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZCYF" id="ZCYF" value="${pd.ZCYF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">中草药费:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZCAF" id="ZCAF" value="${pd.ZCAF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="QTF"  >其他费用:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="QTF" id="QTF" value="${pd.QTF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZFY">总费用:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZFY" id="ZFY" value="${pd.ZFY}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KZRGH"  >科主任工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="KZRGH" id="KZRGH" value="${pd.KZRGH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KZRXM">科主任姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="KZRXM" id="KZRXM" value="${pd.KZRXM}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XGBZ"  >修改标志:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<select name="XGBZ" id="XGBZ" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZyjzjlXGBZ}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.XGBZ == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YLFYLYLB">医疗费用类别:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="YLFYLYLB" id="YLFYLYLB" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZyjzjlYLFYLYLB}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.YLFYLYLB == item.key}">
						                                                       <option value="${item.key}" selected="selected">${item.value}</option>
						                                                 </c:when>
						                                                 
						                                                       <c:otherwise>
						                                                        <option value="${item.key}">${item.value}</option>
						                                                       </c:otherwise>
						                                                  </c:choose>
						                                             </c:forEach>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="PERSONID"  >院类患者唯一ID:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="PERSONID" id="PERSONID" value="${pd.PERSONID}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MJ">密级:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="MJ" id="MJ" value="${pd.MJ}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YLYL1"  >预留1:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YLYL1" id="YLYL1" value="${pd.YLYL1}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YLYL2">预留2:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YLYL2" id="YLYL2" value="${pd.YLYL2}" readonly="readonly" style="width:98%;"/>	
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            
                                	 	</div>
									  	</div>
									</div>
									</div>
										<div align="center">
											<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
										</div>
												
									</form>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
				<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			    </a>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
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
	<!-- 页面底部js¨ -->
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
    $(top.hangge());

</script>
</html>