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
<!-- 弹出居民信息新增页面 -->
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
						<form action="indexScore/save.do" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/><!-- 筛查问卷ID -->
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">${pd.QUESTIONNAIRE_NAME }评分量表</h5>
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
                                	 	<div class="col-xs-12 col-sm-8">
                                	 		<table align="center" id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                	 			<thead>
                                	 				<tr>
	                                	 				<td class="center">评分指标</td>
	                                	 				<td class="center">评分</td>
                                	 				</tr>
                                	 			</thead>
                                	 			<tbody>
                                	 				<c:forEach items="${varList}" var="tw">
                                	 					<tr>
                                	 						<td style="text-align: left">${tw.INDEX_NAME }</td>
                                	 						<td class="center">${tw.INDEX_SCORE }</td>
                                	 					</tr>
                                	 				</c:forEach>
                                	 				<tr>
	                                	 				<td class="center">总分</td>
	                                	 				<td class="center">${pd.AMOUNT }</td>
                                	 				</tr>
                                	 			</tbody>
                                	 		</table>
										</div>
                                	 </div>
                                </div>
                            </div>
                            </div>
							<div class="form-group">
                            <div class="widget-box col-xs-12">
			                     <div class="widget-header">
			                           <h5 class="widget-title">评价分层</h5>
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
                                               <label class="col-sm-4 control-label no-padding-right" for="MOUNT_SCORE">最大分值:</label>
                                               <div class="col-sm-8">
                                                   <span  class="col-sm-12 from-control-span">
                                                   		<input readonly="readonly" type="text" name="MOUNT_SCORE" id="MOUNT_SCORE" value="${pd.MAMOUNT }" placeholder="评价总分" title="健康账号" style="width:98%;" />
                                                   </span>
                                               </div>
                                           </div>
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="HEADTHCARDNO">评分等级:</label>
                                               <div class="col-sm-8">
                                                   <span  class="col-sm-12 from-control-span">
                                                   		<select class="chosen-select form-control" name="SCORE_RANK" id="SCORE_RANK" data-placeholder="评分等级" style="vertical-align:top;width: 98%;" onchange="scoreRank()">
															<option value="0" <c:if test="${pd.SCORE_RANK == 0 }">selected</c:if> >0</option>
															<option value="2" <c:if test="${pd.SCORE_RANK == 2 }">selected</c:if> >2</option>
															<option value="3" <c:if test="${pd.SCORE_RANK == 3 }">selected</c:if> >3</option>
															<option value="4" <c:if test="${pd.SCORE_RANK == 4 }">selected</c:if> >4</option>
															<option value="5" <c:if test="${pd.SCORE_RANK == 5 }">selected</c:if> >5</option>
															<option value="6" <c:if test="${pd.SCORE_RANK == 6 }">selected</c:if> >6</option>
															<option value="7" <c:if test="${pd.SCORE_RANK == 7 }">selected</c:if> >7</option>
														</select>
                                                   </span>
                                               </div>
                                           </div>
                                  	</div>
                                  	<div class="form-group">
                                  		<table id="simple" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
	                                  		<thead>
	                                  			<tr>
	                                  				<th class="center">序号</th>
	                                  				<th class="center">等级描述</th>
	                                  				<th class="center">等级下限</th>
	                                  				<th class="center">等级上限</th>
	                                  			</tr>
	                                  		</thead>
	                                  		<tbody>
	                                  			<c:choose>
													<c:when test="${not empty scoreList}">
														<c:forEach items="${scoreList }" var="score" varStatus="vs">
															<tr>
																<td class="center">${vs.index+1}</td>
																<td class="center">${score.RANK_DISCRIBE }</td>
																<td class="center" >${score.RANGE_DOWN }</td>
																<td class="center">${score.RANGE_UP }</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr class="main_info">
															<td colspan="100" class="center" >没有相关数据</td>
														</tr>
													</c:otherwise>
												</c:choose>
	                                  		</tbody>
                                  		</table>
                                  	</div>
	                              </div>
                            </div>
                            </div>
							    <div align="center">
									<a class="btn btn-mini btn-primary" onclick="save();" >保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</div>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
		var rangeScore = $("#SCORE_RANK").val();//评分的等级
		if(rangeScore) {
			$("#SCORE_RANK").val($.trim($("#SCORE_RANK").val()));
			for(var i = 0; i < rangeScore; i++) {
				if($("#RANK_DISCRIBE"+i).val()==""){
					$("#RANK_DISCRIBE"+i).tips({
						side:3,
			            msg:'请填写等级描述',
			            bg:'#AE81FF',
			            time:3
			        });
					$("#RANK_DISCRIBE"+i).focus();
					return false;
				}else{
					$("#RANK_DISCRIBE"+i).val($.trim($("#RANK_DISCRIBE"+i).val()));
				}
				if($("#RANGE_DOWN"+i).val()==""){
					$("#RANGE_DOWN"+i).tips({
						side:3,
			            msg:'请填写等级下限',
			            bg:'#AE81FF',
			            time:3
			        });
					$("#RANGE_DOWN"+i).focus();
					return false;
				}else{
					$("#RANGE_DOWN"+i).val($.trim($("#RANGE_DOWN"+i).val()));
				}
				if($("#RANGE_UP"+i).val()==""){
					$("#RANGE_UP"+i).tips({
						side:3,
			            msg:'请填写等级上限',
			            bg:'#AE81FF',
			            time:3
			        });
					$("#RANGE_UP"+i).focus();
					return false;
				}else{
					$("#RANGE_UP"+i).val($.trim($("#RANGE_UP"+i).val()));
				}
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		else {
			$("#SCORE_RANK").tips({
				side:3,
	            msg:'请选择评分等级',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SCORE_RANK").focus();
			return false;
		}
	}	
	//添加等级描述
	function scoreRank() {
		var scoreRanks = $("#SCORE_RANK").val();
		$("#simple tbody").html("");
		for(var i = 0; i < scoreRanks; i ++) {
			var html = "<tr><td>"+(i+1)+"</td>" +
					   "<td><input class = 'center' type  = 'text' name = 'RANK_DISCRIBE"+i+"' id = 'RANK_DISCRIBE"+i+"' placeholder='等级描述' title='等级描述'/></td>" +
					   "<td><input class = 'center' type  = 'number' name = 'RANGE_DOWN"+i+"' id = 'RANGE_DOWN"+i+"' placeholder='等级下限' title='等级下限'/></td>" +
					   "<td><input class = 'center' type  = 'number' name = 'RANGE_UP"+i+"' id = 'RANGE_UP"+i+"' placeholder='等级上限' title='等级上限'/></td></tr>" ;
			$("#simple tbody").append(html);
		}
	}
	
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
</script>
</html>