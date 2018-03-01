<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String nowtime = formatter.format(currentTime); //将日期时间格式化 


%>
<!-- 随访记录新增和修改页面 -->
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

<link rel="stylesheet" href="../assets/css/select2.css" />
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
								<form action="" name="Form" id="Form" method="post" enctype="multipart/form-data">
								<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
										
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:120px;text-align: right;padding-top: 13px;">名称<span class="red">*</span>:</td>
											<td><input type="text" name="MC" id="MC" value="${pd.MC}" readonly="readonly" style="width:98%;"/>
										</tr>
										
										<tr>
										    <td style="width:120px;text-align: right;padding-top: 13px;">内容<span class="red">*</span>:</td>
											<td><textarea type="text" name="NR" id="NR" rows="4" cols="78%">${pd.NR}</textarea></td>
																	    
										</tr>
										<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">居民标签：</td>
											<td>
												<span>${pd.JMBQ}</span>
											</td>
										</tr>
									</table>
									</div>
									<div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">图片信息<span class="red">*</span></h5>
                                    <span class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                        </span>
                                </div>
                                <div class="widget-body col-xs-12">
                                    <div class="widget-main col-xs-12">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                            <div class="form-group" id="attachmentListDiv">
                                            <div class="col-xs-12">
                                                <label class="col-sm-4 control-label no-padding-right" style="width: 16.1%;"></label>
                                                <div class="col-sm-8" style="width: 83.9%;">
                                                    <ul class="attachment-list pull-left list-unstyled" id="attachmentListUl">
                                                        <c:forEach items="${listPd}" var="item">
                                                            <li id = "${item.ATTACHMENT_ID}">
                                                                <a onclick="downloadAttachment('${item.ATTACHMENT_ID}');" class="attached-file" style="cursor: pointer">
                                                                    <i class="ace-icon fa fa-file-o bigger-110"></i>
                                                                    <span class="attached-name">${item.NAME}</span>(${item.SIZE})
                                                                </a>
                                                                <span class="action-buttons">
                                                                    <a onclick="downloadAttachment('${item.ATTACHMENT_ID}');" style="cursor: pointer">
                                                                        <i class="ace-icon fa fa-download bigger-125 blue"></i>
                                                                    </a>
                                                                    <a onclick="deleteAttachment('${item.ATTACHMENT_ID}');" style="cursor: pointer">
                                                                        <i class="ace-icon fa fa-trash-o bigger-125 red"></i>
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
                            </div>
									
							<tr>
								<td class="center" colspan="6">
									<a class="btn btn-mini btn-danger" onclick="close1();">关闭</a>
								</td>
							</tr>
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
	<!-- 编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 编辑框-->
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/fhsms.js"></script>
	<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
</body>
<script type="text/javascript">
    $(top.hangge());
    
  //关闭窗口刷新列表（因为浏览量+1）
    function close1(){
    	top.jzts();
    	top.siMenu('z136','lm102','推送消息','tsxx/list.do');
    	top.Dialog.close();
    }
    
  //下载附件
    function downloadAttachment(id){
        window.location.href = "<%=basePath%>attachment/download.do?ATTACHMENT_ID="+id+"&tm="+new Date().getTime();
    }

    
</script>
</html>