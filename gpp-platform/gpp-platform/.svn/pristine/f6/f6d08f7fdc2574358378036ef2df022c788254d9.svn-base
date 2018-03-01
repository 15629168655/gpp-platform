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
%>

<!DOCTYPE html>
<!-- 指标结果的范围新增与编辑-->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->

<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->

 <!--颜色控件 -->
 <!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="static/ace/css/chosen.css" />
		<link rel="stylesheet" href="static/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="static/ace/css/font-awesome.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="static/ace/css/colorpicker.css"/>

		<link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />


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
						<form action="indexResultRange/${msg }.do?" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<input type="hidden" name="ID" id="ID" value="${pd.ID }"/>
							<input type="hidden" readonly="readonly" name="INDEX_ID" id="INDEX_ID" value="${pd.INDEX_ID }" placeholder="请输入ID" title="指标ID" style="width:98%;" />
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="form-group">
                            <div class="widget-box col-xs-12">
                             <div class="widget-body col-xs-12">
				               <div class="tabable">
					                <ul class="nav nav-tabs" id="myTab">
					                    <li id="ResultRangeTab">
					                        <a href="#ResultRange" data-toggle="tab" style="cursor:pointer;">
					                            结果范围提示
					                        </a>
					                    </li>
					                </ul>
					
					                <div class="tab-content">
					                    <div id="ResultRange" class="tab-pane">
					                       <table id="table_report" class="table table-striped table-bordered table-hover">
	    										<tr>
													<td style="width:130px;text-align: right;padding-top: 8px;" >
														<label>年龄限制:
				                                        <c:if test="${pd.IS_LIMIT_AGE == 1 }">
				                                        	<input name="IS_LIMIT_AGE" type="radio" value="1" checked="true"/ onchange="isLimitAge()">是
				                                        	<input name="IS_LIMIT_AGE" type="radio" value="0" onchange="isLimitAge()" />否
				                                        </c:if>
				                                        <c:if test="${pd.IS_LIMIT_AGE == 0 }">
				                                        	<input name="IS_LIMIT_AGE" type="radio" value="1"/ onchange="isLimitAge()">是
				                                        	<input name="IS_LIMIT_AGE" type="radio" value="0" checked="true"/ onchange="isLimitAge()">否
				                                        </c:if>
				                                        <c:if test="${empty pd.IS_LIMIT_AGE}">
				                                        	<input name="IS_LIMIT_AGE" type="radio" value="1" onchange="isLimitAge()"/>是
				                                        	<input name="IS_LIMIT_AGE" type="radio" value="0" onchange="isLimitAge()"/>否
				                                        </c:if>
                                       				  </label>
                                       				 </td>
                                       				 <td style="width:200px;text-align: left;padding-top: 8px;" >
                                       				  <lable>下限</lable><input type="text" readonly="readonly" name="AGE_DOWN" id="AGE_DOWN" value="${pd.AGE_DOWN }" placeholder="请输入年龄下限" title="年龄下限" style="width:20%;" /><label>岁～上限</label>
                                       				  <input type="text" readonly="readonly" name="AGE_UP" id="AGE_UP"  value="${pd.AGE_UP }" placeholder="请输入年龄上限"  title="年龄上限"  style="width:20%;" /><lable>岁</lable>
													</td  >
													<td style="width:140px;text-align: right;padding-top: 8px;" >适用的性别：</td> 
													<td style="width:140px;text-align: right;padding-top: 8px;" >
			                                           	<select class="form-control" id="FIT_SEX" name="FIT_SEX" style="width:98%;" onchange="isLimitAge()" >
											              <option value="" selected="selected">--请选择--</option>
													         <c:forEach items="${FITSEX}" var="tw">
				                                                  <option value="${tw.key}" <c:if test="${tw.key == pd.FIT_SEX}"> selected="selected" </c:if> >${tw.value}</option>
				                                             </c:forEach>
	                                          		  	</select>
													</td>
												</tr>
												<tr>
													<td style="width:150px;text-align: right;padding-top: 8px;">结果值下限:</td>
													<td>
													<input type="text" name="RESULT_DOWN" id="RESULT_DOWN"  value="${pd.RESULT_DOWN}" placeholder="请输入结果下限"  title="结果值下限"  style="width:98%;" />
														
													</td>
													<td style="width:150px;text-align: right;padding-top: 8px;">结果值上限:</td>
													<td>
														<input type="text" name="RESULT_UP" id="RESULT_UP" value="${pd.RESULT_UP }" placeholder="请输入结果上限" title="结果上限" style="width:98%;" />
													</td>
												</tr>
											</table >
											<table>
												<tr>
												<td style="width:50%;text-align: right;padding-top: 8px;">
													<div class="tabable">
											              <ul class="nav nav-tabs" id="low">
											                  <li id="lowT">
											                      <a href="#lowM" data-toggle="tab" style="cursor:pointer;">
											                          低于结果值下限提示
											                      </a>
											                  </li>
											              </ul>
											
											              <div class="tab-content">
											                  <div id="lowM" class="tab-pane">
											                     <table class="table table-striped table-bordered table-hover">
											                     <tr>
												                     <td>提示内容</td>
												                     <td>
												                     	<input type="text" name="LOW_CONTENT" id="LOW_CONTENT" value="${pd.LOW_CONTENT }" placeholder="请输入低值提示内容" title="低值提示内容" style="width:98%;" />
												                     </td>
												                     <td>提示颜色</td>
												                     <td>
												                     	<select id="LOW_COLOUR" class="hide" name = "LOW_COLOUR">
																			<option value="#ac725e">#ac725e</option>
																			<option value="#d06b64">#d06b64</option>
																			<option value="#f83a22">#f83a22</option>
																			<option value="#fa573c">#fa573c</option>
																			<option value="#ff7537">#ff7537</option>
																			<option value="#ffad46" selected="">#ffad46</option>
																			<option value="#42d692">#42d692</option>
																			<option value="#16a765">#16a765</option>
																			<option value="#7bd148">#7bd148</option>
																			<option value="#b3dc6c">#b3dc6c</option>
																			<option value="#fbe983">#fbe983</option>
																			<option value="#fad165">#fad165</option>
																			<option value="#92e1c0">#92e1c0</option>
																			<option value="#9fe1e7">#9fe1e7</option>
																			<option value="#9fc6e7">#9fc6e7</option>
																			<option value="#4986e7">#4986e7</option>
																			<option value="#9a9cff">#9a9cff</option>
																			<option value="#b99aff">#b99aff</option>
																			<option value="#c2c2c2">#c2c2c2</option>
																			<option value="#cabdbf">#cabdbf</option>
																			<option value="#cca6ac">#cca6ac</option>
																			<option value="#f691b2">#f691b2</option>
																			<option value="#cd74e6">#cd74e6</option>
																			<option value="#a47ae2">#a47ae2</option>
																			<option value="#555">#555</option>
																		</select>
												                     </td>
											                     </tr>
											                     <tr>
											                     	<td colspan="1">疾病名称:</td>
												                    <td colspan="3">
												                    	<input type="text" readonly="readonly" name="LOW_NAME" id="LOW_NAME" value="${pd.LOW_NAME }" onclick="choosejblow();" placeholder="请输入低值疾病" title="低值疾病" style="width:98%;" />
                                            							<input type="hidden" readonly="readonly" name="LOW_DISEASE_ID" id="LOW_DISEASE_ID" value="${pd.LOW_DISEASE_ID }" onclick="choosejblow();" placeholder="请输入低值疾病" title="低值疾病" style="width:98%;" />
												                    </td>
											                     </tr>
											                     </table>
											                  </div>
											              </div>
											          </div>
												</td>
												<td style="width:50%;text-align: right;padding-top: 8px;">
													<div class="tabable">
										                <ul class="nav nav-tabs" id="hig">
										                    <li id="higT">
										                        <a href="#higM" data-toggle="tab" style="cursor:pointer;">
										                            高于结果值上限提示
										                        </a>
										                    </li>
										                </ul>
										
										                <div class="tab-content">
										                    <div id="higM" class="tab-pane">
										                      <table class="table table-striped table-bordered table-hover">
											                     <tr>
												                     <td>提示内容</td>
												                     <td>
												                     	<input type="text" name="HIG_CONTENT" id="HIG_CONTENT" value="${pd.HIG_CONTENT }" placeholder="请输入高值提示内容" title="高值提示内容" style="width:98%;" />
												                     </td>
												                     <td>提示颜色</td>
												                     <td>
												                     	<select id="HIG_COLOUR" class="hide" name = "HIG_COLOUR">
																			<option value="#ac725e">#ac725e</option>
																			<option value="#d06b64">#d06b64</option>
																			<option value="#f83a22">#f83a22</option>
																			<option value="#fa573c">#fa573c</option>
																			<option value="#ff7537">#ff7537</option>
																			<option value="#ffad46" selected="">#ffad46</option>
																			<option value="#42d692">#42d692</option>
																			<option value="#16a765">#16a765</option>
																			<option value="#7bd148">#7bd148</option>
																			<option value="#b3dc6c">#b3dc6c</option>
																			<option value="#fbe983">#fbe983</option>
																			<option value="#fad165">#fad165</option>
																			<option value="#92e1c0">#92e1c0</option>
																			<option value="#9fe1e7">#9fe1e7</option>
																			<option value="#9fc6e7">#9fc6e7</option>
																			<option value="#4986e7">#4986e7</option>
																			<option value="#9a9cff">#9a9cff</option>
																			<option value="#b99aff">#b99aff</option>
																			<option value="#c2c2c2">#c2c2c2</option>
																			<option value="#cabdbf">#cabdbf</option>
																			<option value="#cca6ac">#cca6ac</option>
																			<option value="#f691b2">#f691b2</option>
																			<option value="#cd74e6">#cd74e6</option>
																			<option value="#a47ae2">#a47ae2</option>
																			<option value="#555">#555</option>
																		</select>
												                     </td>
											                     </tr>
											                     <tr>
											                     	<td colspan="1">疾病名称:</td>
												                    <td colspan="3">
												                    	<input type="text" readonly="readonly" name="HIG_NAME" id="HIG_NAME" value="${pd.HIG_NAME }" onclick="choosejbhig();" placeholder="请输入高值疾病" title="高值疾病" style="width:98%;" />
                                            							<input type="hidden" readonly="readonly" name="HIG_DISEASE_ID" id="HIG_DISEASE_ID" value="${pd.HIG_DISEASE_ID }" onclick="choosejbhig();" placeholder="请输入高值疾病ID" title="高值疾病" style="width:98%;" />
												                    </td>
											                     </tr>
											                     </table>
										                    </div>
										                </div>
										            </div>
												</td>
												</tr>
											</table>
					                    </div>
					                </div>
				            </div>
                         	
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
	<!-- 颜色控件 -->
	<script src="static/ace/js/jquery-ui.custom.js"></script>
		
		<script src="static/ace/js/chosen.jquery.js"></script>
		
		<script src="static/ace/js/fuelux/fuelux.spinner.js"></script>
		
		<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
		<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
		
		<script src="static/ace/js/date-time/moment.js"></script>
		<script src="static/ace/js/date-time/daterangepicker.js"></script>
		<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
		<script src="static/ace/js/bootstrap-colorpicker.js"></script>
		
		<script src="static/ace/js/jquery.autosize.js"></script>
		<script src="static/ace/js/jquery.inputlimiter.1.3.1.js"></script>
		<script src="static/ace/js/jquery.maskedinput.js"></script>
		<script src="static/ace/js/bootstrap-tag.js"></script>

		<!-- ace scripts -->
		<script src="static/ace/js/ace/elements.scroller.js"></script>
		<script src="static/ace/js/ace/elements.colorpicker.js"></script>
		<script src="static/ace/js/ace/elements.fileinput.js"></script>
		<script src="static/ace/js/ace/elements.typeahead.js"></script>
		<script src="static/ace/js/ace/elements.wysiwyg.js"></script>
		<script src="static/ace/js/ace/elements.spinner.js"></script>
		<script src="static/ace/js/ace/elements.treeview.js"></script>
		<script src="static/ace/js/ace/elements.wizard.js"></script>
		<script src="static/ace/js/ace/elements.aside.js"></script>
		<script src="static/ace/js/ace/ace.js"></script>
		<script src="static/ace/js/ace/ace.ajax-content.js"></script>
		<script src="static/ace/js/ace/ace.touch-drag.js"></script>
		<script src="static/ace/js/ace/ace.sidebar.js"></script>
		<script src="static/ace/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="static/ace/js/ace/ace.submenu-hover.js"></script>
		<script src="static/ace/js/ace/ace.widget-box.js"></script>
		<script src="static/ace/js/ace/ace.settings.js"></script>
		<script src="static/ace/js/ace/ace.settings-rtl.js"></script>
		<script src="static/ace/js/ace/ace.settings-skin.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>	
					
<script type="text/javascript">
	$(top.hangge());

	//保存
	function save(){
		if($("#IS_LIMIT_AGE").val()==""){
			$("#IS_LIMIT_AGE").tips({
				side:3,
	            msg:'请输入是否限制年龄',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_LIMIT_AGE").focus();
			return false;
		} else {
			$("#IS_LIMIT_AGE").val($.trim($("#IS_LIMIT_AGE").val()));
		}
		
		if($("#AGE_UP").val()==""){
			$("#AGE_UP").tips({
				side:3,
	            msg:'请输入年龄上限',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#AGE_UP").focus();
			return false;
		}else{
			$("#AGE_UP").val($.trim($("#AGE_UP").val()));
		}	
		if($("#AGE_DOWN").val()==""){
			$("#AGE_DOWN").tips({
				side:3,
	            msg:'请输入年龄下限',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#AGE_DOWN").focus();
			return false;
		}else{
			$("#AGE_DOWN").val($.trim($("#AGE_DOWN").val()));
		}
		if($("#FIT_SEX").val()==""){
			$("#FIT_SEX").tips({
				side:3,
	            msg:'请选择是否限制性别',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#FIT_SEX").focus();
			return false;
		}else{
			$("#FIT_SEX").val($.trim($("#FIT_SEX").val()));
		}
		if($("#RESULT_UP").val()==""){
			$("#RESULT_UP").tips({
				side:3,
	            msg:'请输入结果上限',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#RESULT_UP").focus();
			return false;
		}else{
			$("#RESULT_UP").val($.trim($("#RESULT_UP").val()));
		}
		
		if($("#RESULT_DOWN").val()==""){
			$("#RESULT_DOWN").tips({
				side:3,
	            msg:'请输入结果下限',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#RESULT_DOWN").focus();
			return false;
		}else{
			$("#RESULT_DOWN").val($.trim($("#RESULT_DOWN").val()));
		}
		if($("#LOW_CONTENT").val()==""){
			$("#LOW_CONTENT").tips({
				side:3,
	            msg:'请输入低值提示内容',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#LOW_CONTENT").focus();
			return false;
		}else{
			$("#LOW_CONTENT").val($.trim($("#LOW_CONTENT").val()));
		}
		if($("#LOW_COLOUR").val()==""){
			$("#LOW_COLOUR").tips({
				side:3,
	            msg:'请输入低值提示颜色',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#LOW_COLOUR").focus();
			return false;
		}else{
			$("#LOW_COLOUR").val($.trim($("#LOW_COLOUR").val()));
		}
		if($("#LOW_DISEASE_ID").val()==""){
			$("#LOW_DISEASE_ID").tips({
				side:3,
	            msg:'请选择低值疾病ID',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#LOW_DISEASE_ID").focus();
			return false;
		}else{
			$("#LOW_DISEASE_ID").val($.trim($("#LOW_DISEASE_ID").val()));
		}		
		
	
	
		if($("#HIG_CONTENT").val()==""){
			$("#HIG_CONTENT").tips({
				side:3,
	            msg:'请输入高值提示内容',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HIG_CONTENT").focus();
			return false;
		}else{
			$("#HIG_CONTENT").val($.trim($("#HIG_CONTENT").val()));
		}	
		if($("#HIG_COLOUR").val()==""){
			$("#HIG_COLOUR").tips({
				side:3,
	            msg:'请输入高值疾病颜色',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HIG_COLOUR").focus();
			return false;
		}else{
			$("#HIG_COLOUR").val($.trim($("#HIG_COLOUR").val()));
		}	
		if($("#HIG_DISEASE_ID").val()==""){
			$("#HIG_DISEASE_ID").tips({
				side:3,
	            msg:'请选择高值疾病ID',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HIG_DISEASE_ID").focus();
			return false;
		}else{
			$("#HIG_DISEASE_ID").val($.trim($("#HIG_DISEASE_ID").val()));
		}	
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	//判断是否限制年龄
	function isLimitAge(){
		var is_limit_age =$('input:radio[name="IS_LIMIT_AGE"]:checked').val();
		if(is_limit_age == 1){
			$("#AGE_UP").attr("readOnly",false);
			$("#AGE_DOWN").attr("readOnly",false);
		}
		else {
			$("#AGE_UP").attr("readOnly",true);
			$("#AGE_DOWN").attr("readOnly",true);
			$("#AGE_DOWN").val(0);
			$("#AGE_UP").val(0);
		}
	}
	
	/******疾病列表******/
	function choosejblow(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "疾病列表";
		 diag.URL = '<%=basePath%>kcf/jbzd_list.do';
		 diag.Width = 800;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
			 var id = diag.innerFrame.contentWindow.document.getElementById('JBBM').value;
	         var name = diag.innerFrame.contentWindow.document.getElementById('JBMC').value;
	         	if(id !=''){
		         	$("#LOW_DISEASE_ID").val(id);
		         	$("#LOW_NAME").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
	}
	
	function choosejbhig(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag = true;
		 diag.Title = "疾病列表";
		 diag.URL = '<%=basePath%>kcf/jbzd_list.do';
		 diag.Width = 800;
		 diag.Height = 700;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.OKEvent = function(){
	         	var id = diag.innerFrame.contentWindow.document.getElementById('JBBM').value;
	         	var name=diag.innerFrame.contentWindow.document.getElementById('JBMC').value;
	         	if(id !=''){
		         	$("#HIG_DISEASE_ID").val(id);
		         	$("#HIG_NAME").val(name);
	         	}
	         	diag.close();
	      };
		 diag.show();
	}
	function changeHig() {
		var col = $("#colorpicker1").val();
		alert(col);
		$("#COLOUR").style.backgroundColor = col;
	}
	$(function() {
		//日期框
		$('.date-picker').datetimepicker({
			language: 'zh',
		        format:'YYYY-MM-DD HH:mm:ss '
	    }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$('#colorpicker1').colorpicker();
		$('#simple-colorpicker-1').ace_colorpicker();
		$('#HIG_COLOUR').ace_colorpicker();
		$('#LOW_COLOUR').ace_colorpicker();
		var is_limit_age =$('input:radio[name="IS_LIMIT_AGE"]:checked').val();
		if(is_limit_age == 1){
			$("#AGE_UP").attr("readOnly",false);
			$("#AGE_DOWN").attr("readOnly",false);
		}
		else {
			$("#AGE_UP").attr("readOnly",true);
			$("#AGE_DOWN").attr("readOnly",true);
			$("#AGE_DOWN").val(0);
			$("#AGE_UP").val(0);
		}
});
	$(document).ready(function(){
    	$('#myTab a:first').tab('show');
    	$('#low a:first').tab('show');
    	$('#hig a:first').tab('show');
    });
    
    $('#myTab a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    })
    $('#hig a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    })
    $('#hig a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    })
</script>
	
		
</html>