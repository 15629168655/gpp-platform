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
<!-- 住院医嘱详情页面 -->
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
								<form action="#" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
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
												<h5 class="widget-title">住院医嘱记录</h5>
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YLJGDM"  >医疗机构代码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YLJGDM" id="YLJGDM" value="${pd.YLJGDM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZID">医嘱ID:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZID" id="YZID" value="${pd.YZID}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JZLSH"  >住院就诊流水号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JZLSH" id="JZLSH" value="${pd.JZLSH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CXBZ">撤销标志:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="CXBZ" id="CXBZ" disabled="disabled" style="width:98%;">
													             <c:forEach items="${pd.EnumZyyzjlCXBZ}" var="item">
					                                             <c:choose>
					                                                 <c:when test="${pd.CXBZ == item.key}">
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KH"  >卡号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="KH" id="KH" value="${pd.KH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">卡类型:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																 <select name="KLX" id="KLX" disabled="disabled" style="width:98%;">
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BQ"  >病区:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BQ" id="BQ" value="${pd.BQ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XDKSBM">下达科室编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="XDKSBM" id="XDKSBM" value="${pd.XDKSBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XDKSMC"  >下达科室名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="XDKSMC" id="XDKSMC" value="${pd.XDKSMC}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">医嘱下达工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="XDRGH" id="XDRGH" value="${pd.XDRGH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XDRXM"  >医嘱下达姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="XDRXM" id="XDRXM" value="${pd.XDRXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZXDSJ">医嘱下达时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZXDSJ" id="YZXDSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.YZXDSJ}" />' readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZXKSBM"  >执行科室编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZXKSBM" id="ZXKSBM" value="${pd.ZXKSBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZXKSMC">执行的科室的名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZXKSMC" id="ZXKSMC" value="${pd.ZXKSMC}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZXRGH"  >医嘱执行人工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZXRGH" id="ZXRGH" value="${pd.ZXRGH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZXRXM">医嘱执行人姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZXRXM" id="ZXRXM" value="${pd.ZXRXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="TZYZYSGH"  >停止医嘱医生工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="TZYZYSGH" id="TZYZYSGH" value="${pd.TZYZYSGH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="TZYZYSXM">停止医嘱医生姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="TZYZYSXM" id="TZYZYSXM" value="${pd.TZYZYSXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KDKSDM"  >开单科室代码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="KDKSDM" id="KDKSDM" value="${pd.KDKSDM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KDKSMC">开单科室名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="KDKSMC" id="KDKSMC" value="${pd.KDKSMC}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KDYSGH"  >开单医生工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="KDYSGH" id="KDYSGH" value="${pd.KDYSGH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KDYSXM">开单医生姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="KDYSXM" id="KDYSXM" value="${pd.KDYSXM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KDSJ"  >开单时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="KDSJ" id="KDSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.KDSJ}" />' readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZZXSJ">医嘱执行时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZZXSJ" id="YZZXSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.YZZXSJ}" />' readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZZZSJ"  >医嘱终止时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZZZSJ" id="YZZZSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.YZZZSJ}" />' readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZSM">医嘱说明:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZSM" id="YZSM" value="${pd.YZSM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZZH"  >医嘱组好:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZZH" id="YZZH" value="${pd.YZZH}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZLB">医嘱类别:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="YZLB" id="YZLB" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZyyzYZLB}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.YZLB == item.key}">
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZMXBM"  >医嘱明细编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZMXBM" id="YZMXBM" value="${pd.YZMXBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZBS">医嘱标识:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZBS" id="YZBS" value="${pd.YZBS}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZMXBMYB"  >医嘱明细编码(医保):</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZMXBMYB" id="YZMXBMYB" value="${pd.YZMXBMYB}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZMXMC">医嘱明细名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZMXMC" id="YZMXMC" value="${pd.YZMXMC}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YPTYM"  >药品通用名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YPTYM" id="YPTYM" value="${pd.YPTYM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZLX">是否药品:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="YZLX" id="YZLX" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZyyzSFYP}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.YZLX == item.key}">
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YPGG"  >药品规格:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YPGG" id="YPGG" value="${pd.YPGG}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YPGGDW">药品规格单位:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YPGGDW" id="YPGGDW" value="${pd.YPGGDW}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YPBZGGXS"  >药品规格系数:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YPBZGGXS" id="YPBZGGXS" value="${pd.YPBZGGXS}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YWJXDM">药物剂型代码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YWJXDM" id="YWJXDM" value="${pd.YWJXDM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YWJXMC"  >药物剂型名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YWJXMC" id="YWJXMC" value="${pd.YWJXMC}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YWLXBM">药物类型编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YWLXBM" id="YWLXBM" value="${pd.YWLXBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YWLXMC"  >药物类型名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YWLXMC" id="YWLXMC" value="${pd.YWLXMC}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YYPD">用药频度:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YYPD" id="YYPD" value="${pd.YYPD}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JL"  >每次使用的剂量:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JL" id="JL" value="${pd.JL}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="DW">每次使用的剂量单位:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="DW" id="DW" value="${pd.DW}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YF"  >用药途径:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YF" id="YF" value="${pd.YF}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YYTS">用药天数:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YYTS" id="YYTS" value="${pd.YYTS}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YYKSSJ"  >用药开始时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YYKSSJ" id="YYKSSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.YYKSSJ}" />' readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YYTZSJ">用药停止时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YYTZSJ" id="YYTZSJ" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.YYTZSJ}" />' readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SFPS"  >皮试判别:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<select name="SFPS" id="SFPS" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZyyzPSPD}" var="item">
						                                             <c:choose>
						                                                 <c:when test="${pd.SFPS == item.key}">
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YPSL">发药数量:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YPSL" id="YPSL" value="${pd.YPSL}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YPDW"  >发药单位:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YPDW" id="YPDW" value="${pd.YPDW}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JYDM">中药煎煮法代码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="JYDM" id="JYDM" value="${pd.JYDM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZFYBS"  >主副药标识:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZFYBS" id="ZFYBS" value="${pd.ZFYBS}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JCBWACRBM">检查部位ACR代码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="JCBWACRBM" id="JCBWACRBM" value="${pd.JCBWACRBM}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JCBW"  >检查部位:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JCBW" id="JCBW" value="${pd.JCBW}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="DJ">单价:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="DJ" id="DJ" value="${pd.DJ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BZ"  >备注:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BZ" id="BZ" value="${pd.BZ}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="XGBZ">修改标志:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<select name="XGBZ" id="XGBZ" disabled="disabled" style="width:98%;">
														             <c:forEach items="${pd.EnumZyyzXGBZ}" var="item">
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
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="PERSONID"  >患者唯一的ID:</label>
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  >预留1:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YLYL1" id="YLYL1" value="${pd.YLYL1}" readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="">预留2:</label>
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
		<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
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
</body>
<script type="text/javascript">
    $(top.hangge());
	
</script>
</html>