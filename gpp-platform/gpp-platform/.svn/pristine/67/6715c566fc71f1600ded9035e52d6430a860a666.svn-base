<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
								<form action="" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
								
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
                                                        	<input type="text" name="TELEPHONE" id="TELEPHONE" value="${pdJmxx.TELEPHONE }" placeholder="手机号" title="手机号" ;" style="width:98%;" />
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
												<h5 class="widget-title">医学影像报告</h5>
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >卡号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="KH" id="KH" value="${pd.KH }" maxlength="32"  title="卡号" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KLX">卡类型:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="KLX" id="KLX" disabled="disabled" style="width:60%;">
														             <c:forEach items="${pd.EnumKLX}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.KLX == item.key}">
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BGDH"  >检验报告单号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BGDH" id="BGDH" value="${pd.BGDH }" maxlength="32"  title="检验报告单号" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JZLSH">就诊流水号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="JZLSH" id="JZLSH" value="${pd.JZLSH }" maxlength="32"  title="就诊流水号" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YYLSH"  >预约流水号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YYLSH" id="YYLSH" value="${pd.YYLSH }" maxlength="20"   title="预约流水号" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZZYBZ">就诊标志:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="MZZYBZ" id="MZZYBZ" style="width:60%;" disabled>
															         <option value="" <c:if test="${pd.MZZYBZ == '' }">selected</c:if> ></option>
														             <option value="1" <c:if test="${pd.MZZYBZ == '1' }">selected</c:if> >门诊</option>
														             <option value="2" <c:if test="${pd.MZZYBZ == '2' }">selected</c:if> >住院</option>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BRXM"  >姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BRXM" id="BRXM" value="${pd.BRXM }" maxlength="32"   title="姓名" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BRXB">性别:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
													    		 <select name="BRXB" id="BRXB" style="width:60%;"disabled>
															         <option value="" <c:if test="${pd.BRXB == '' }">selected</c:if> ></option>
															         <option value="0" <c:if test="${pd.BRXB == '0' }">selected</c:if> >未知性别</option>
														             <option value="1" <c:if test="${pd.BRXB == '1' }">selected</c:if> >男</option>
														             <option value="2" <c:if test="${pd.BRXB == '2' }">selected</c:if> >女</option>
														             <option value="9" <c:if test="${pd.BRXB == '9' }">selected</c:if> >未说明性别</option>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SQRXM"  >申请人姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SQRXM" id="SQRXM" value="${pd.SQRXM}" maxlength="255"   title="申请人姓名" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BGRXM">报告人姓名；</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="BGRXM" id="BGRXM" value="${pd.BGRXM}" maxlength="255"   title="报告人姓名" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SHRXM"  >审核人姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SHRXM" id="SHRXM" value="${pd.SHRXM}" maxlength="255"   title="审核人姓名" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SQRGH">申请人工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="SQRGH" id="SQRGH" value="${pd.SQRGH}" maxlength="255"   title="申请人工号" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BGRGH"  >报告人工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BGRGH" id="BGRGH" value="${pd.BGRGH}" maxlength="255"   title="报告人工号" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SHRGH">审核人工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="SHRGH" id="SHRGH" value="${pd.SHRGH}" maxlength="255"   title="审核人工号" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BQ"  >病区:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BQ" id="BQ" value="${pd.BQ}" maxlength="255"   title="病区" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CH">床号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="CH" id="CH" value="${pd.CH}" maxlength="255"   title="床号" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="DYRQ"  >打印日期:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																	<input class="span10 date-picker" name="DYRQ" id="DYRQ" value="${pd.DYRQ}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="打印日期"  title="打印日期"/>
										  
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SQRQ">申请日期:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input class="span10 date-picker" name="SQRQ" id="SQRQ" value="${pd.SQRQ}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="申请日期"  title="申请日期"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CJRQ"  >采集日期:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input class="span10 date-picker" name="CJRQ" id="CJRQ" value="${pd.CJRQ}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="采集日期"  title="采集日期"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JYRQ">检验日期:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input class="span10 date-picker" name="JYRQ" id="JYRQ" value="${pd.JYRQ}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="检验日期"  title="检验日期"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BGBZ"  >报告备注:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BGBZ" id="BGBZ" value="${pd.BGBZ}" maxlength="255"   title="报告备注" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BBDM">标本代码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="BBDM" id="BBDM" value="${pd.BBDM}" maxlength="255"   title="标本代码" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BBMC"  >标本名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BBMC" id="BBMC" value="${pd.BBMC}" maxlength="255"   title="标本名称" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BGDLBBM">报告单类别:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="BGDLBBM" id="BGDLBBM" style="width:60%;" disabled>
															         <option value="" <c:if test="${pd.BGDLBBM == '' }">selected</c:if> ></option>
															         <option value="10" <c:if test="${pd.BGDLBBM == '01' }">selected</c:if> >一般临床检验</option>
														             <option value="20" <c:if test="${pd.BGDLBBM == '02' }">selected</c:if> >血液学检查</option>
														             <option value="21" <c:if test="${pd.BGDLBBM == '03' }">selected</c:if> >临床化学检查</option>
														             <option value="22" <c:if test="${pd.BGDLBBM == '04' }">selected</c:if> >临床免疫学检查</option>
														             <option value="23" <c:if test="${pd.BGDLBBM == '05' }">selected</c:if> >临床微生物学检查</option>
														             <option value="30" <c:if test="${pd.BGDLBBM == '06' }">selected</c:if> >临床寄生虫学检查</option>
														             <option value="40" <c:if test="${pd.BGDLBBM == '07' }">selected</c:if> >分子生物学检查</option>
														             <option value="90" <c:if test="${pd.BGDLBBM == '99' }">selected</c:if> >其它</option>
															     </select>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MJ"  >密级:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="MJ" id="MJ" value="${pd.MJ}" readonly="readonly" style="width:60%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="PERSONID">院内内部档案号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="PERSONID" id="personid" value="${pd.PERSONID }" maxlength="20"   title="医院内部档案号" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="WJLJ"  >文件链接:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="WJLJ" id="WJLJ" value="${pd.WJLJ }" maxlength="200"   title="文件链接" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="报告日期:"></label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="BGRQ" id="BGRQ" value="${pd.BGRQ }" maxlength="32"  title="报告日期" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                             <div class="form-group">
	                                                
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SQKSMC">申请科室人名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="SQKSMC" id="SQKSMC" value="${pd.SQKSMC}" maxlength="255"   title="申请科室名称" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                           
	                                            
	                                            
                                	 	</div>
											</div>
										</div>	
										<div align = "center">
											<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
										</div>		
									
												
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
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
    $(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
    }
	
	/* $(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		} 
	}*/
	);
	
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
	
	$(function(){
		   $("input").attr("disabled",true);
		});
	
</script>
</html>