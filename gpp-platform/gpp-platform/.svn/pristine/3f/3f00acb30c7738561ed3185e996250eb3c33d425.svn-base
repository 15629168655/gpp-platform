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
					<form action="" name="Form" id="Form" method="post"  class="form-horizontal" autocomplete="off">
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
									<h5 class="widget-title">出院小节详情</h5>
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
                                                  <label class="col-sm-4 control-label no-padding-right" for="XM"  >患者姓名:</label>
                                                  <div class="col-sm-8">
                                                      <span id="" class="col-sm-12 from-control-span">
														<input type="text"  name="XM" id="XM" value="${pd.XM }" readonly="readonly"  style="width:98%;"/>
													  </span>
                                                  </div>
                                              </div>
                                              <div class="col-xs-12 col-sm-6">
                                                  <label class="col-sm-4 control-label no-padding-right" for="">患者性别:</label>
                                                  <div class="col-sm-8">
                                                      <span  id="" class="col-sm-12 from-control-span">
														<input type="text" name="XB" id="XB" value="${pd.XB }" readonly="readonly" style="width:98%;"/>
													  </span>
                                                  </div>
                                               </div>
                                          </div>
                                          <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="NL"  >患者年龄:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input value="${pd.NL }" style="width:98%;" name="NL" id="NL"   type="text" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="KSMC">科室:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="KSMC" id="KSMC" value="${pd.KSMC }"  readonly="readonly" style="width:98%;"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BQMC"  >病区名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="BQMC" id="BQMC" value="${pd.BQMC }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BFH">病房号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="BFH" id="BFH" value="${pd.BFH }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CH"  >床号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="CH" id="CH" value="${pd.CH }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZLJG">诊疗结果:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<c:if test="${pd.ZLJG == '1' }">治愈</c:if>
																<c:if test="${pd.ZLJG == '2' }">好转</c:if>
																<c:if test="${pd.ZLJG == '3' }">无效</c:if>
																<c:if test="${pd.ZLJG == '4' }">未治</c:if>
																<c:if test="${pd.ZLJG == '5' }">死亡</c:if>
																<c:if test="${pd.ZLJG == '9' }">其他</c:if>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYSJ"  >入院时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="RYSJ" id="RYSJ" value="${pd.RYSJ }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CYSJ">出院时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="CYSJ" id="CYSJ" value="${pd.CYSJ }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZZYSXM"  >主治医师姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZZYSXM" id="ZZYSXM" value="${pd.ZZYSXM }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZYYSXM">住院医师姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="ZYYSXM" id="ZYYSXM" value="${pd.ZYYSXM }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SSCZMC"  >手术操作名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SSCZMC" id="SSCZMC" value="${pd.SSCZMC }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SSCZSJ">手术/操作日期时间:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="SSCZSJ" id="SSCZSJ" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pd.SSCZSJ}"/>"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZFFMC"  >麻醉方法名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="MZFFMC" id="MZFFMC" value="${pd.MZFFMC }"  style="width:98%;" readonly="readonly"/>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZFS">麻醉方法:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<c:if test="${pd.MZFS == '1' }">全麻</c:if>
																<c:if test="${pd.MZFS == '2' }">椎管内麻醉</c:if>
																<c:if test="${pd.MZFS == '3' }">局部麻醉</c:if>
																<c:if test="${pd.MZFS == '4' }">复合麻醉</c:if>
																<c:if test="${pd.MZFS == '9' }">其他</c:if>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="MZZD"  >门诊诊断:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<textarea type="text" name="MZZD" id="MZZD"  style="width:98%;" readonly="readonly">${pd.MZZD }</textarea>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="RYZD">入院诊断:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<textarea type="text" name="RYZD" id="RYZD"  style="width:98%;" readonly="readonly">${pd.RYZD }</textarea>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CYZD"  >出院诊断:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<textarea type="text" name="CYZD" id="CYZD"   style="width:98%;" readonly="readonly">${pd.CYZD }</textarea>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="ZLGC">诊疗过程:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<textarea type="text" name="ZLGC" id="ZLGC"  style="width:98%;" readonly="readonly">${pd.ZLGC }</textarea>
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  ></label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for=""></label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="USER_NAME"  ></label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for=""></label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																
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
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
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
		$(top.hangge());
		</script>
</body>
</html>