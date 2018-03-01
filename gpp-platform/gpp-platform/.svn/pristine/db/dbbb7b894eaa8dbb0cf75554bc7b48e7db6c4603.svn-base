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
														   <h5 class="widget-title">指标组合:${element.INDEX_COMBINATION_NAME }</h5>
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
															   			<td style="width:80px;text-align: center;padding-top: 5px;">指标名称</td>
															   			<td style="width:10px;text-align: center;padding-top: 5px;">是否异常</td>
															   			<td style="width:350px;text-align: center;padding-top: 5px;">结果</td>
															   			<td style="width:20px;text-align: center;padding-top: 5px;">单位</td>
															   			<td style="width:200px;text-align: center;padding-top: 5px;">提示</td>
															   			<td style="width:50px;text-align: center;padding-top: 5px;">参考范围</td>
															   		</th>
															   	</thead>
															   	<tbody>
															   	<!-- 循环各个指标组合 -->
															    <c:forEach items="${indexsMap}" var="indexs" varStatus="ins">
															   	<c:if test="${indexs.key==element.ID }">
													   			<c:if test="${not empty indexs.value }">
														   		<c:forEach items="${indexs.value}" var="index" varStatus="inde">
														   		<tr>
														   			<td style="width:2px;text-align: right;padding-top: 8px;"></td>
																   	<td style="width:80px;text-align: right;padding-top: 8px;">${index.INDEX_NAME }</td>
																   	<td style="width:10px;text-align: right;padding-top: 8px;"><label class="pos-rel">
																   		<c:if test="${index.IS_ABNORMAL == 1}">
																   			<input readonly="readonly" type='checkbox' checked="checked" name='${index.ID}ids' value="${index.ID}" class="ace"/><span class="lbl"></span></label>
																   		</c:if>
																   		<c:if test="${index.IS_ABNORMAL == 0}">
																   			<input readonly="readonly" type='checkbox' name='${index.ID}ids' value="${index.ID}" class="ace"/><span class="lbl"></span></label>
																   		</c:if>
																   	</td>
																   	<!--当结果为下拉的时候，循环指标模板范围-->
																   	<td style="width:350px;text-align: left;padding-top: 8px;">
																   	<table>
																   	<tr>
																   	<c:if test="${index.RESULT_MODEL == 1 }">
																	   	<td>
																		   <input value ="${index.SCREENING_RESULT}"/>
																		</td>
																   		<td>模板描述:</td>
																   		<td><input type="text" readonly="readonly" name="${index.ID}d" id="${index.ID}d" value="${index.DESCRIBE}"  placeholder="模板描述" title="模板描述" style="width:100%;"/></td>
																   	</c:if>
																   	<tr>
																   	</table>
																   	<!--当结果类型为输入的时候循环结果范围-->
																   	<c:if test = "${index.RESULT_MODEL == 0 }">
																   		<input value ="${index.SCREENING_RESULT}" readonly = "readonly"/>
																   	</c:if>
																   	</td>
																   	<td style="width:20px;text-align: center;padding-top: 5px;">${index.INDEX_COMPANY }</td><!-- 单位 -->
																   	
																   	<!-- 提示内容 -->
																   	<td style="width:200px;text-align: center;padding-top: 5px;">
																   		<c:if test="${index.RESULT_MODEL == 1 }">
																   			<label id="${index.id}m">正常</label>
																   		</c:if>
																   		<c:if test="${index.RESULT_MODEL == 0 }">
																   			<label style = "background-color: ${index.COLOUR};" id="${index.id}m" >${index.MSG }</label>
																   		</c:if>
																   	</td>
																	<td style="width:50px;text-align: center;padding-top: 5px;">
																	<lable id = "${index.ID }range" name = "${index.ID }range">${index.REFER_RANGE }</lable></td><!--  -->
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
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
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
		
		<c:forEach items="${indexsMap}" var="indexsj" varStatus="insj">	 		 
		<c:forEach items="${indexsj.value}" var="indexj" varStatus="indej">
			if($("#${indexj.ID}").val()==""){
				$("#${indexj.ID}").tips({
					side:3,
		            msg:'请填写${indexj.INDEX_NAME}指标',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#${indexj.ID}").focus();
				return false;
			}else{
				$("#${indexj.ID}").val($.trim($("#${indexj.ID}").val()));
			}
		</c:forEach>	  
	</c:forEach>
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	//选择模板生成相应的建议
	function select(obj,id) {
		//获得select的值
		var selectid = obj.value;
		var content=$("#"+selectid+"d").val();
		$("#"+id+"d").val(content);
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