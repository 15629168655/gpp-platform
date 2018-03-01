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
									<div id="zhongxin" style="padding-top: 13px;">
									<div class="form-group">
										<div class="widget-box col-xs-12">
											<div class="widget-header">
												<h5 class="widget-title">检验结果指标</h5>
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
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JYZBLSH"  >检验指标流水号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JYZBLSH" id="JYZBLSH" value="${pd.JYZBLSH }" maxlength="32"  title="检验指标流水号" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BGDH">检验报告单号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="BGDH" id="BGDH" value="${pd.BGDH }" maxlength="32"  title="检验报告单号" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for=JCRGH  >检测人工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JCRGH" id="JCRGH" value="${pd.JCRGH }" maxlength="32"  title="检测人工号" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JCRXM">检测人姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="JCRXM" id="JCRXM" value="${pd.JCRXM }" maxlength="20"   title="检测人姓名" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SHRGH"  >审核人工号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SHRGH" id="SHRGH" value="${pd.SHRGH }" maxlength="32"  title="审核人工号" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SHRXM">审核人姓名:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="SHRXM" id="SHRXM" value="${pd.SHRXM }" maxlength="20"   title="审核人姓名" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JCZBDM"  >检测指标代码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JCZBDM" id="JCZBDM" value="${pd.JCZBDM }" maxlength="32"   title="检测指标代码" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="BGRQ">报告日期:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="BGRQ" id="BGRQ" value="${pd.BGRQ }" maxlength="32"  title="报告日期" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JCFF"  >检测方法:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="JCFF" id="JCFF" value="${pd.JCFF }" maxlength="32"   title="检测方法" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="LOINC">LOINC编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="LOINC" id="LOINC" value="${pd.LOINC}" maxlength="255"   title="LOINC编码" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="SBBM"  >设备编码:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="SBBM" id="SBBM" value="${pd.SBBM}" maxlength="255"   title="设备编码" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YQBH">仪器编号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YQBH" id="YQBH" value="${pd.YQBH}" maxlength="255"   title="仪器编号" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YQMC"  >仪器名称:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="YQMC" id="YQMC" value="${pd.YQMC}" maxlength="255"   title="仪器名称" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JCZBJG">检测指标结果:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="JCZBJG" id="JCZBJG" value="${pd.JCZBJG }" maxlength="32"   title="检测指标结果" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="CKZ"  >参考值范围:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="CKZ" id="CKZ" value="${pd.CKZ}" maxlength="255"   title="参考值范围" />
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="JLDW">计量单位:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="JLDW" id="JLDW" value="${pd.JLDW}" maxlength="255"   title="计量单位" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YCTS"  >异常显示:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<select name="BRXB" id="BRXB" style="width:65%;" disabled>
															         <option value="" <c:if test="${pd.BRXB == '' }">selected</c:if> ></option>
															         <option value="1" <c:if test="${pd.YCTS == '1' }">selected</c:if> >正常</option>
														             <option value="2" <c:if test="${pd.YCTS == '2' }">selected</c:if> >无法识别的异常</option>
														             <option value="3" <c:if test="${pd.YCTS == '3' }">selected</c:if> >异常偏高</option>
														             <option value="4" <c:if test="${pd.YCTS == '4' }">selected</c:if> >异常偏低</option>
															     </select>
															</span>
	                                                    </div>
	                                                </div>
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="YZID">相关医嘱ID或处方项目明细编号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span  id="" class="col-sm-12 from-control-span">
																<input type="text" name="YZID" id="YZID" value="${pd.YZID }" maxlength="32"   title="相关医嘱ID或处方项目明细编号" />
															</span>
	                                                    </div>
	                                                 </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-xs-12 col-sm-6">
	                                                    <label class="col-sm-4 control-label no-padding-right" for="DYXH"  >打印序号:</label>
	                                                    <div class="col-sm-8">
	                                                        <span id="" class="col-sm-12 from-control-span">
																<input type="text" name="DYXH" id="DYXH" value="${pd.DYXH}" maxlength="255"   title="打印序号" />
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
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
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