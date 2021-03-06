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
<% java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 
String no = nowtime.replace("-", "").replace(" ", "").replace(":", "");
nowtime = nowtime.substring(0, 13);
%>

<!DOCTYPE html>
<!-- 指标组合范围编辑与添加 -->
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
						<form action="indexResidentQuse/saveQues.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<input type="hidden" name="USER_AGENT_ID" id="USER_AGENT_ID" value="${pdJmxx.USER_AGENT_ID }"/>
							<input type="hidden" name="QUES_ID" id="ID" value="${pd.QUES_ID }"/>
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                             <div class="widget-body col-xs-12">
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
                                                        	<input type="text" readonly="readonly" name="USER_NAME" id="USER_NAME" value="${pdJmxx.USER_NAME }" placeholder="这里输入姓名" title="姓名" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SEX">性别:</label>
                                                    <div class="col-sm-8">
                                                        <span  class="col-sm-12 from-control-span">
															<select  class="chosen-select form-control" name="SEX" id="SEX" data-placeholder="性别" style="vertical-align:top;width: 98%;">
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
                                                       <span   readonly="readonly" class="col-sm-12 from-control-span">居民身份证</span> 
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDNO">证件号码:</label>
                                                    <div class="col-sm-8">
                                                        <span   class="col-sm-12 from-control-span"><input type="text" readonly="readonly" name="ID_NUMBER" id="ID_NUMBER" value="${pd.ID_NUMBER }" maxlength="18" placeholder="这里输入身份证号" title="身份证号" style="width:98%;" /></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="BIRTHDAY_TIME">出生日期:</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group col-xs-12">
                                                            <span  class="col-sm-12 from-control-span">
                                                            	<input  readonly="readonly" class="span10 date-picker" name="BIRTHDAY_TIME" id="BIRTHDAY_TIME"  value='<fmt:formatDate pattern="yyyy-MM-dd" value="${pdJmxx.BIRTHDAY_TIME}" />' type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:98%;" placeholder="出生日期" title="出生日期"/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="PHONE">联系电话:</label>
                                                    <div class="col-sm-8">
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" readonly="readonly"  name="TELEPHONE" id="TELEPHONE" value="${pdJmxx.TELEPHONE }" placeholder="手机号" title="手机号" onblur="yanT();" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="POSTCODE "  >邮政编码:</label>
                                                    <div class="col-sm-8"  >
                                                        <span  class="col-sm-12 from-control-span">
                                                        	<input type="text" name="POSTCODE" id="POSTCODE" readonly="readonly"  value="${pdJmxx.POSTCODE }" placeholder="邮政编码" title="邮政编码" onblur="yanP();" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="ADDRESS">详细地址:</label>
                                                    <div class="col-sm-8" id="STREETDiv">
                                                        <span class="col-sm-12 from-control-span">
                                                              <input type="text" name="ADDRESS" id="ADDRESS"  readonly="readonly" value="${pdJmxx.ADDRESS }" placeholder="详细地址" title="详细地址" style="width:98%;" />
                                                        </span>
                                                    </div>
                                                </div>
                                             </div>
                                             <div class="form-group">
												 <div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="AREA" >区域</label>
													 <div class="col-sm-8"  >
														 <span  class="col-sm-12 from-control-span">
															<input type="text" name="AREA" id="AREA"  readonly="readonly" value="${pdJmxx.AREA }" placeholder="区域" title="区域" style="width:98%;" />
														</span>
													 </div>
												 </div>
												<div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="IMAGE_URL " >头像URL</label>
													 <div class="col-sm-8" >
														 <span   class="col-sm-12 from-control-span">
															<input type="text" name="IMAGE_URL" id="IMAGE_URL"  readonly="readonly" value="${pdJmxx.IMAGE_URL }" placeholder="头像URL" title="头像URL" style="width:98%;" />
														 </span>
													 </div>
												</div>
											</div>
											<div class="form-group">
												 <div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="AREA_ID" >区域</label>
													 <div class="col-sm-8"  >
														 <span class="col-sm-12 from-control-span">
															<input type="text" name="AREA_ID" id="AREA_ID"  readonly="readonly" value="${pdJmxx.AREA_ID }" placeholder="区域ID" title="区域ID" style="width:98%;" />
														</span>
													 </div>
												 </div>
												<div class="col-xs-12  col-sm-6">
													 <label class="col-sm-4 control-label no-padding-right" for="LOCAL_ADDRESS " >手机定位地址:</label>
													 <div class="col-sm-8" >
														 <span   class="col-sm-12 from-control-span">
															<input type="text" readonly="readonly" name="LOCAL_ADDRESS" id="LOCAL_ADDRESS" value="${pdJmxx.LOCAL_ADDRESS }" placeholder="手机定位传入的地址" title="手机定位传入的地址" style="width:98%;" />
														 </span>
													 </div>
												</div>
											</div>
										</div>
                                	 </div>
                                </div>
                            </div>
                            </div>
                             <!-- 循环每个指标组合的指标-->
	                             <c:choose>
									<c:when test="${not empty indexCombinationList}">
										<c:forEach items="${indexCombinationList}" var="element" varStatus="vs">
											<div class="form-group">
												<div class="widget-box col-xs-12">
													 <div class="widget-header">
														   <h5 class="widget-title">指标组合：${element.INDEX_COMBINATION_NAME }</h5>
															   <span class="widget-toolbar">
																	<a href="#" data-action="collapse">
																		<i class="ace-icon fa fa-chevron-up"></i>
																	</a>
																	<a href="#" data-action="fullscreen" class="orange2">
																		<i class="ace-icon fa fa-expand"></i>
																	</a>
															  </span>
															  <input name = "${element.ID }" type="hidden"/>
													 </div>
													  <div class="widget-body col-xs-12">
														<div class="form-group">
															   <table class="table table-striped table-bordered table-hover" >
															   	<thead>
															   		<th>
															   			<td style="width:50px;text-align: center;padding-top: 5px;">指标名称</td>
															   			<td style="width:5px;text-align: center;padding-top: 5px;">是否异常</td>
															   			<td style="width:350px;text-align: center;padding-top: 5px;">结果</td>
															   			<td style="width:20px;text-align: center;padding-top: 5px;">单位</td>
															   			<td style="width:200px;text-align: center;padding-top: 5px;">提示</td>
															   			<td style="width:50px;text-align: center;padding-top: 5px;">参考范围</td>
															   			<td style="width:10px;text-align: center;padding-top: 5px;" >弃答</td>
															   		</th>
															   	</thead>
															   	<tbody>
															   	<!-- 循环各个指标组合 -->
															    <c:forEach items="${indexsMap}" var="indexs" varStatus="ins">
															   	<c:if test="${indexs.key==element.ID }">
													   			<c:if test="${not empty indexs.value }">
														   		<c:forEach items="${indexs.value}" var="index" varStatus="inde">
														   		<tr>
														   		<!-- 判断指标适合的性别-->
														   		<c:if test="${index.FIT_SEX == 0 || index.FIT_SEX == pdJmxx.SEX }">
														   			<td style="width:2px;text-align: right;padding-top: 8px;"></td>
																   	<td style="width:10px;text-align: right;padding-top: 8px;">${index.INDEX_NAME }</td>
																   	<td style="width:5px;text-align: right;padding-top: 8px;"><label class="pos-rel"><input id = "${element.ID }${index.ID}ids" type='checkbox' name='${element.ID }${index.ID}ids' value="${element.ID }${index.ID}" class="ace" /><span class="lbl"></span></label></td>
																   	<!--当结果为下拉的时候，循环指标模板范围-->
																   	<td style="width:400px;text-align: left;padding-top: 8px;">
																   	<table>
																   	<tr>
																   	<c:if test="${index.RESULT_MODEL == 1 }"><!--  下拉的方式 -->
																	   	<td>
																		   	<!-- 循环指标结果的模板-->
																	   		<c:forEach items="${indexResultModelsMap}" var="indexResultModels" varStatus="irms">
																			 <c:if test="${indexResultModels.key ==  index.ID}">
																			 	 <c:forEach items="${indexResultModels.value}" var="indexResultModelg" varStatus="irmgg">
										                                             <input type ="hidden" id="${element.ID }${index.ID}${indexResultModelg.ID}m" value = "${indexResultModelg.MESSAGE_CONTENT}"/><!-- 提示的内容 -->
										                                             <input type ="hidden" id="${element.ID }${index.ID}${indexResultModelg.ID}sex" value = "${indexResultModelg.FIT_SEX}"/><!-- 是否限制性别 -->
										                                             <input type ="hidden" id="${element.ID }${index.ID}${indexResultModelg.ID}d" value = "${indexResultModelg.DIAGNOSIS_DISCRIBE}"/><!-- 诊断描述 -->
										                                        </c:forEach>
																		 		<select class="form-control"  name="${element.ID }${index.ID }" id = "${element.ID }${index.ID }" style="width:100%;" onchange="select(this,'${element.ID }${index.ID }')">
																	              <option value="" selected="selected">--请选择--</option>
																			         <c:forEach items="${indexResultModels.value}" var="indexResultModel" varStatus="irmg">
										                                                  <option value="${element.ID }${index.ID }${indexResultModel.ID}">${indexResultModel.MODEL_CONTENT}</option>
										                                             </c:forEach>
							                                          		  	</select>
																			</c:if>
																			</c:forEach>
																		</td>
																   		<td>模板描述:</td>
																   		<td><input type="text" readonly="readonly" name="${element.ID }${index.ID}d" id="${element.ID }${index.ID}d" value=""  placeholder="模板描述" title="模板描述" style="width:100%;"/></td>
																   	</c:if>
																   	<tr>
																   	</table>
																   	<!--当结果类型为输入的时候循环结果范围-->
																   	<c:if test = "${index.RESULT_MODEL == 0 }">
																   	<!-- 循环指标结果的范围 -->
																		 <c:forEach items="${indexResultRangesMap}" var="indexResultRanges" varStatus="irgsgg">
																		 <c:if test="${indexResultRanges.key ==  index.ID}">
																		 	<c:forEach items="${indexResultRanges.value}" var="indexResultRange" varStatus="irmrgg" >
																	    	 	<input type = "hidden" id = "${element.ID }${index.ID }${indexResultRange.ID }low" value = "${indexResultRange.RESULT_DOWN }"/><!-- 低值下限 -->
																			    <input type = "hidden" id = "${element.ID }${index.ID }${indexResultRange.ID }lowc" value = "${indexResultRange.LOW_COLOUR }"/><!-- 低值提示颜色 -->
																			    <input type = "hidden" id = "${element.ID }${index.ID }${indexResultRange.ID }lowm" value = "${indexResultRange.LOW_CONTENT }"/><!-- 低值提示内容 -->
																			    <input type = "hidden" id = "${element.ID }${index.ID }${indexResultRange.ID }hig" value = "${indexResultRange.RESULT_UP }"/><!--  高值上限-->
																			    <input type = "hidden" id = "${element.ID }${index.ID }${indexResultRange.ID }higc" value = "${indexResultRange.HIG_COLOUR }"/><!-- 高值显示的颜色 -->
																			    <input type = "hidden" id = "${element.ID }${index.ID }${indexResultRange.ID }higm" value = "${indexResultRange.HIG_CONTENT }"/><!-- 高值提示内容-->
																	    	 	<input name = "${element.ID }${index.ID }" id = "${element.ID }${index.ID }${indexResultRange.ID }" placeholder="测试${index.INDEX_NAME }结果" title="问卷结果" style="width:100%;" onchange="judge(this,'${element.ID }${index.ID }')" /><!-- 问卷的结果 -->
																			</c:forEach>
																		</c:if>
																		</c:forEach>
																   	</c:if>
																   	</td>
																   	<td style="width:20px;text-align: center;padding-top: 5px;">${index.INDEX_COMPANY }</td><!-- 单位 -->
																   	<!-- 提示内容 -->
																   	<td style="width:200px;text-align: center;padding-top: 5px;">
																   		<span id="${element.ID }${index.ID}m">正常</span>
																   	</td>
																	<td style="width:50px;text-align: center;padding-top: 5px;"><span id = "${element.ID }${index.ID }range" name = "${element.ID }${index.ID }range"></span></td><!-- 参考范围 -->
																	<td style="width:10px;text-align: center;padding-top: 5px;"><label class="pos-rel"><input type='checkbox' name='${element.ID }${index.ID}up' value="${element.ID }${index.ID}" class="ace" /><span class="lbl"></span></label></td>
															   	</c:if>
															   	<!-- 性别不符合规范，让其显示但不能填写 -->
															   	<c:if test="${index.FIT_SEX != 0 && index.FIT_SEX != pdJmxx.SEX}">
															   		<td style="width:2px;text-align: right;padding-top: 8px;"></td>
																   	<td style="width:10px;text-align: right;padding-top: 8px;">${index.INDEX_NAME }</td>
																   	<td style="width:5px;text-align: right;padding-top: 8px;"><label class="pos-rel"><input id = "${index.ID}ids" type='checkbox' name='${index.ID}ids' value="${index.ID}" class="ace" /><span class="lbl"></span></label></td>
																   	<!--当结果为下拉的时候，循环指标模板范围-->
																   	<td style="width:400px;text-align: left;padding-top: 8px;">
																   	<table>
																   	<tr>
																   	<c:if test="${index.RESULT_MODEL == 1 }"><!--  下拉的方式 -->
																	   	<td>
																		   	<!-- 循环指标结果的模板-->
																	   		<c:forEach items="${indexResultModelsMap}" var="indexResultModels" varStatus="irms">
																			 <c:if test="${indexResultModels.key ==  index.ID}">
																			 	 <c:forEach items="${indexResultModels.value}" var="indexResultModelg" varStatus="irmgg">
										                                             <input type ="hidden" id="${indexResultModelg.ID}m" value = "${indexResultModelg.MESSAGE_CONTENT}"/><!-- 提示的内容 -->
										                                             <input type ="hidden" id="${indexResultModelg.ID}sex" value = "${indexResultModelg.FIT_SEX}"/><!-- 是否限制性别 -->
										                                             <input type ="hidden" id="${indexResultModelg.ID}d" value = "${indexResultModelg.DIAGNOSIS_DISCRIBE}"/><!-- 诊断描述 -->
										                                        </c:forEach>
																		 		<select class="form-control"  name="${element.ID }${index.ID }" id = "${element.ID }${index.ID }" style="width:100%;" onchange="select(this,'${index.ID }')">
																	              <option value="" selected="selected">--性别限制下列不可选--</option>
																			         <c:forEach items="${indexResultModels.value}" var="indexResultModel" varStatus="irmg">
										                                                  <option value="${indexResultModel.ID}" disabled="disabled">${indexResultModel.MODEL_CONTENT}</option>
										                                             </c:forEach>
							                                          		  	</select>
																			</c:if>
																			</c:forEach>
																		</td>
																   		<td>模板描述:</td>
																   		<td><input type="text" readonly="readonly" name="${index.ID}d" id="${index.ID}d" value=""  placeholder="模板描述" title="模板描述" style="width:100%;"/></td>
																   	</c:if>
																   	<tr>
																   	</table>
																   	<!--当结果类型为输入的时候循环结果范围-->
																   	<c:if test = "${index.RESULT_MODEL == 0 }">
																   	<!-- 循环指标结果的范围 -->
																		 <c:forEach items="${indexResultRangesMap}" var="indexResultRanges" varStatus="irgsgg">
																		 <c:if test="${indexResultRanges.key ==  index.ID}">
																		 	<c:forEach items="${indexResultRanges.value}" var="indexResultRange" varStatus="irmrgg" >
																	    	 	<input type = "hidden" id = "${index.ID }${indexResultRange.ID }low" value = "${indexResultRange.RESULT_DOWN }"/><!-- 低值下限 -->
																			    <input type = "hidden" id = "${index.ID }${indexResultRange.ID }lowc" value = "${indexResultRange.LOW_COLOUR }"/><!-- 低值提示颜色 -->
																			    <input type = "hidden" id = "${index.ID }${indexResultRange.ID }lowm" value = "${indexResultRange.LOW_CONTENT }"/><!-- 低值提示内容 -->
																			    <input type = "hidden" id = "${index.ID }${indexResultRange.ID }hig" value = "${indexResultRange.RESULT_UP }"/><!--  高值上限-->
																			    <input type = "hidden" id = "${index.ID }${indexResultRange.ID }higc" value = "${indexResultRange.HIG_COLOUR }"/><!-- 高值显示的颜色 -->
																			    <input type = "hidden" id = "${index.ID }${indexResultRange.ID }higm" value = "${indexResultRange.HIG_CONTENT }"/><!-- 高值提示内容-->
																	    	 	<input name = "${index.ID }" id = "${index.ID }${indexResultRange.ID }" placeholder="测试${index.INDEX_NAME }结果" title="问卷结果" value="该指标由于性别的限制，您不能填写" style="width:100%;" onchange="judge(this,'${index.ID }')" /><!-- 问卷的结果 -->
																			</c:forEach>
																		</c:if>
																		</c:forEach>
																   	</c:if>
																   	</td>
																   	<td style="width:20px;text-align: center;padding-top: 5px;">${index.INDEX_COMPANY }</td><!-- 单位 -->
																   	<!-- 提示内容 -->
																   	<td style="width:200px;text-align: center;padding-top: 5px;">
																   		<span id="${index.ID}m">正常</span>
																   	</td>
																	<td style="width:50px;text-align: center;padding-top: 5px;"><span id = "${index.ID }range" name = "${index.ID }range"></span></td><!-- 参考范围 -->
																	<td style="width:10px;text-align: center;padding-top: 5px;"><label class="pos-rel"><input type='checkbox' name='${index.ID}up' value="${index.ID}" class="ace" /><span class="lbl"></span></label></td>
															   	</c:if>
															   	</tr>
															   	</c:forEach>
																</c:if>
															   	</c:if>
															   	</c:forEach>
															   	<!-- 循环各个指标组合 -->
															   	</tbody>
															   </table>
														</div>
													  </div>
												</div>
											</div>
										</c:forEach>
									</c:when>
								</c:choose>
                           	<!-- 循环组合列表 -->
                           		<div align="center">
									<a class="btn btn-mini btn-primary" onclick="save();" >保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</div>
							</div>
						   <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						</div>
						</div>
						</div>
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
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
    <script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
		<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<script src="static/ace/js/bootstrap-multiselect.js"></script>
	<script src="static/ace/js/select2.js"></script>	
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

	//保存
	function save(){
		//查看 问卷信息是否添加完整
		<c:forEach items="${indexCombinationList}" var="element1" varStatus="vs1">	
		<c:forEach items="${indexsMap}" var="indexsj" varStatus="insj">	 
		<c:if test="${indexs.key==element.ID }">
		<c:forEach items="${indexsj.value}" var="indexj" varStatus="indej">
			if($("#${element1.ID}${indexj.ID}").val()==""){
				$("#${element1.ID}${indexj.ID}").tips({
					side:3,
		            msg:'请填写${indexj.INDEX_NAME}指标',
		            bg:'#AE81FF',
		            time:3
		        });
				$("${element1.ID}#${indexj.ID}").focus();
				return false;
			}else{
				$("${element1.ID}#${indexj.ID}").val($.trim($("${element1.ID}#${indexj.ID}").val()));
			}
		</c:forEach>
		</c:if>
	</c:forEach>
	</c:forEach>
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	//选择模板生成相应的建议
	function select(obj,id) {
		//获得select的值
		var selectid = obj.value;//获得选择模板的id
		var dcontent=$("#"+selectid+"d").val();//获得选择的模板描述的内容
		var mcontent=$("#"+selectid+"m").val();//选择模板的提示的内容
		var sex = $("#"+selectid+"sex").val();//选择模板适用的类别
		//判断用户选择的性别是不是合乎规范
		if(sex == 0 || sex == ${pdJmxx.SEX} ){//性别条件满足
			$("#"+id+"d").val(dcontent);//给模板添加相应的描述
			$("#"+id+"m").text(mcontent);//给模板相应的提示
		}
		else {//性别条件不满足
			$("#"+id+"d").val("");//给模板添加相应的描述
			$("#"+id).val("");
			//select模板为空
			$("#"+id).tips({//给出相应的提示
				side:3,
	            msg:'由于性别的限制您不能选择该结果',
	            bg:'#AE81FF',
	            time:3
	        });
		}
	}
	//通过填写的范围来提示显示的颜色以及参考的范围
	function judge(obj, indexid) {
		var id = obj.id;
		var objvalue = obj.value;
		var lowval = $("#" + id + "low").val();
		var higval = $("#" + id + "hig").val();
		
		var reference =  lowval + "～" + higval;//参考范围
		if(parseInt(objvalue) < parseInt(lowval)) {
			var msg = $("#" + id + "lowm").val();
			var clour = $("#" + id + "lowc").val();
			$("[name = "+ indexid+"ids]:checkbox").attr("checked", true);
		}
		else if(parseInt(objvalue) >　parseInt(higval)) {
			var msg = $("#" + id + "higm").val();
			var clour = $("#" + id + "higc").val();
			$("[name = "+ indexid+"ids]:checkbox").attr("checked", true);
		}
		else {
			var msg = "正常";
			var clour = "1048575"
				$("[name = "+ indexid+"ids]:checkbox").attr("checked", false);
		}
		$("#" + indexid + "range").text(reference);//参考范围
		$("#" + indexid + "m").text(msg);//提示的内容
		$("#" + indexid + "m").css("background-color", "#"+parseInt(clour).toString(16));
	}
	//科室菜单
	function chooseDepart(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "科室菜单";
		 diag.URL = '<%=basePath%>autoRegister/getDepartData.do';
		 diag.Width = 320;
		 diag.Height = 450;
		 diag.CancelEvent = function(){ //关闭事件
			 var name = diag.innerFrame.contentWindow.document.getElementById('DEP_NAME').value;
	         	if(id !=''){
		         	$("#DEPARTMENT").val(name);
	         	}
	         	diag.close();
		 };
		 diag.show();
	}

	/*根据出生日期算出年龄*/  
	function jsGetAge(strBirthday){         
	    var returnAge;  
	    var strBirthdayArr=strBirthday.split("-");  
	    var birthYear = strBirthdayArr[0];  
	    var birthMonth = strBirthdayArr[1];  
	    var birthDay = strBirthdayArr[2];  
	      
	    d = new Date();  
	    var nowYear = d.getFullYear();  
	    var nowMonth = d.getMonth() + 1;  
	    var nowDay = d.getDate();  
	      
	    if(nowYear == birthYear){  
	        returnAge = 0;//同年 则为0岁  
	    }  
	    else{  
	        var ageDiff = nowYear - birthYear ; //年之差  
	        if(ageDiff > 0){  
	            if(nowMonth == birthMonth) {  
	                var dayDiff = nowDay - birthDay;//日之差  
	                if(dayDiff < 0)  
	                {  
	                    returnAge = ageDiff - 1;  
	                }  
	                else  
	                {  
	                    returnAge = ageDiff ;  
	                }  
	            }  
	            else  
	            {  
	                var monthDiff = nowMonth - birthMonth;//月之差  
	                if(monthDiff < 0)  
	                {  
	                    returnAge = ageDiff - 1;  
	                }  
	                else  
	                {  
	                    returnAge = ageDiff ;  
	                }  
	            }  
	        }  
	        else  
	        {  
	            returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天  
	        }  
	    }  
	      
	    return returnAge;//返回周岁年龄  
	      
	}  

	
	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
			language: 'zh',
		        format:'YYYY-MM-DD HH:mm:ss '
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
});
</script>
</html>