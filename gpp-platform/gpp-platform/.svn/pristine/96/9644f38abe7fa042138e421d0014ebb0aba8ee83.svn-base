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

<!DOCTYPE html>
<!-- 弹出协议维护新增页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
	<style type="text/css">
		#dialog-add,#dialog-message,#dialog-comment{width:100%; height:100%; position:fixed; top:0px; z-index:99999999; display:none;}
		.commitopacity{position:absolute; width:100%; height:700px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
		.commitbox{width:100%; margin:0px auto; position:absolute; top:0px; z-index:99999;}
		.commitbox_inner{width:96%; height:255px;  margin:6px auto; background:#efefef; border-radius:5px;}
		.commitbox_top{width:100%; height:253px; margin-bottom:10px; padding-top:10px; background:#FFF; border-radius:5px; box-shadow:1px 1px 3px #e8e8e8;}
		.commitbox_top textarea{width:95%; height:195px; display:block; margin:0px auto; border:0px;}
		.commitbox_cen{width:95%; height:40px; padding-top:10px;}
		.commitbox_cen div.left{float:left;background-size:15px; background-position:0px 3px; padding-left:18px; color:#f77500; font-size:16px; line-height:27px;}
		.commitbox_cen div.left img{width:30px;}
		.commitbox_cen div.right{float:right; margin-top:7px;}
		.commitbox_cen div.right span{cursor:pointer;}
		.commitbox_cen div.right span.save{border:solid 1px #c7c7c7; background:#6FB3E0; border-radius:3px; color:#FFF; padding:5px 10px;}
		.commitbox_cen div.right span.quxiao{border:solid 1px #f77400; background:#f77400; border-radius:3px; color:#FFF; padding:4px 9px;}
	</style>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						
						<form action="xywh/${msg }.do" name="userForm" id="userForm" method="post" enctype="multipart/form-data">
				<!-- 		<textarea name="CONTENT" id="CONTENT" style="display:none" ></textarea> -->
							<input type="hidden" name="ID" id="id" value="${pd.ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<div class="col-xs-12">
							<table id="table_report" class="table table-striped table-bordered table-hover">
							
								<tr>
									<td style="width:85px;text-align: right;padding-top: 13px;">协议名称<span class="red">*</span>:</td>
									<td><input type="text" name="AGREEMENT_NAME" id="agreement_name" value="${pd.AGREEMENT_NAME }" placeholder="这里输入协议名称" maxlength="120" title="协议名称" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:85px;text-align: right;padding-top: 13px;">协议内容<span class="red">*</span>:</td>
									<td style="padding-top: 3px;" id="applicant_content" >
										 <script id="editor" name="APPLICANT_CONTENT" type="text/plain" style="width:660px;height:159px;">${pd.APPLICANT_CONTENT }</script>
									</td>
								</tr>
								<tr>
									<td style="width:85px;text-align: right;padding-top: 13px;">历史版本:</td>
									<td><input type="text" name="VERSIONS" id="versions" value="${pd.VERSIONS }" placeholder="这里输入历史版本" maxlength="36"  title="历史版本" style="width:98%;" /></td>
								</tr>
						</table>
						</div>		
							
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">附件信息<span class="red">*</span></h5>
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
                                                <label class="col-sm-4 control-label no-padding-right" style="width: 16.1%;">上传:</label>
                                                <div class="col-sm-8" style="width: 83.9%;">
                                                    <div id="form-attachments">
                                                        <div class="form-group file-input-container">
                                                            <div class="col-sm-7">
                                                                <label class="ace-file-input width-90 inline">
                                                                    <input id="attachment" type="file" name="attachments"/>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="align-right">
                                            <button id="id-add-attachment" type="button" class="btn btn-sm btn-danger">
                                                <i class="ace-icon fa fa-paperclip bigger-140"></i>
                                                添加附件
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                      
														
								<tr>
									<td class="center" colspan="6">
										<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
							
							
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	
	//保存
	function save(){
		if($("#agreement_name").val()==""){
			$("#agreement_name").tips({
				side:3,
	            msg:'请输入协议名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#agreement_name").focus();
			return false;
		} else {
			$("#agreement_name").val($.trim($("#agreement_name").val()));
		}
		
//		$("#CONTENT").val(getContentTxt());
		if(getContentTxt()==""){
			$("#editor").tips({
				side:1,
	            msg:'请输入协议内容',
	            bg:'#AE81FF',
	            time:3
	        });
			return false;
		}
	
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	}	
	/**
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
	*/
	
	$('#id-add-attachment')
    .on('click', function () {
        var file = $('<input type="file" name="attachments" />').appendTo('#form-attachments');
        file.ace_file_input({
            no_file: '选择文件...',
            btn_choose: '选择',
            btn_change: '更换'
        });

        file.closest('.ace-file-input')
                .addClass('width-90 inline')
                .wrap('<div class="form-group file-input-container"><div class="col-sm-7"></div></div>')
                .parent().append('<div class="action-buttons pull-right col-xs-1">\
			<a href="#" data-action="delete" class="middle">\
				<i class="ace-icon fa fa-trash-o red bigger-130 middle"></i>\
			</a>\
		</div>')
                .find('a[data-action=delete]').on('click', function (e) {
                    //the button that removes the newly inserted file input
                    e.preventDefault();
                    $(this).closest('.file-input-container').hide(300, function () {
                        $(this).remove()
                    });
                });
    });
	
	
	
    
    $('#attachment').ace_file_input({
        no_file:'选择文件...',
        btn_choose:'选择',
        btn_change:'更换',
        droppable:false,
        onchange:null,
        thumbnail:false
    });
    
  //下载附件
    function downloadAttachment(id){
        window.location.href = "<%=basePath%>attachment/download.do?ATTACHMENT_ID="+id+"&tm="+new Date().getTime()
    }

    //删除附件
    function deleteAttachment(id){
        bootbox.confirm("确定要删除附件吗?", function(result) {
            if(result) {
                top.jzts();
                $.ajax({
                    type : "get",
                    url : "<%=basePath%>attachment/delete.do?ATTACHMENT_ID="+id+"&tm="+new Date().getTime(),
                    success : function(data) {
                        $("#attachmentListUl").find("li#"+id).remove();
                        top.hangge();
                    }
                })
            }
        });
    }


</script>
</html>