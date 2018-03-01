<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
							
						<!-- 检索  -->
						<form action="referral/query.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="输入查询的患者姓名" class="nav-search-input" id="nav-search-input" autocomplete="off" name="queryName" value="${pd.queryName}" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="applyDateStart" id="applyDateStart"  value="${pd.applyDateStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="申请开始日期" title="申请开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="applyDateEnd" name="applyDateEnd"  value="${pd.applyDateEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="申请结束日期" title="申请结束日期"/></td>
								<td style="vertical-align:top;padding-left:2px;">
                                    <select class="chosen-select form-control" name="queryApplyStatus" id="queryApplyStatus" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
                                        <option value="-1">全部</option>
                                        <c:forEach items="${pd.enumApplyStatus}" var="item">
                                            <c:choose>
                                                <c:when test="${pd.queryApplyStatus == item.key}">
                                                    <option value="${item.key}" selected="selected">${item.value}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${item.key}">${item.value}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<%--<th class="center" style="width:50px;">序号</th>--%>
									<th class="center">患者姓名</th>
									<th class="center">患者健康档案编号</th>
                                    <th class="center">转出医疗机构名称</th>
                                    <th class="center">转出科室名称</th>
                                    <th class="center">转入医疗机构名称</th>
                                    <th class="center">转入科室名称</th>
									<th class="center">患者联系电话</th>
									<th class="center">申请时间</th>
									<th class="center">申请状态</th>
									<th class="center">诊疗信息</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.REFERRAL_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<%--<td class='center' style="width: 30px;">${vs.index+1}</td>--%>
											<td >
											<c:if test="${var.EMERGENCYLEVEL=='0'}">
											<i class="ace-icon fa fa-star orange2" title="一般急"></i>
											<i class="ace-icon fa fa-star-o light-grey" title="一般急"></i>
											<i class="ace-icon fa fa-star-o light-grey" title="一般急"></i>
											</c:if>
											<c:if test="${var.EMERGENCYLEVEL=='1'}">
											<i class="ace-icon fa fa-star orange2" title="比较急"></i>
											<i class="ace-icon fa fa-star orange2" title="比较急"></i>
											<i class="ace-icon fa fa-star-o light-grey" title="比较急"></i>
											</c:if>
											<c:if test="${var.EMERGENCYLEVEL=='2'}">
											<i class="ace-icon fa fa-star orange2" title="非常急"></i>
											<i class="ace-icon fa fa-star orange2" title="非常急"></i>
											<i class="ace-icon fa fa-star orange2" title="非常急"></i>
											</c:if>
											<a onclick="showInfo('${var.REFERRAL_ID}');" title="点击查看转诊申请单详情" style="cursor: pointer">${var.NAME}</a>
											</td>
											<td class='center'>${var.HEALTHSN}</td>
                                            <td class='center'>${var.OUTORGNAME}</td>
                                            <td class='center'>${var.OUTDEPTNAME}</td>
                                            <td class='center'>${var.INORGNAME}</td>
                                            <td class='center'>${var.INDEPTNAME}</td>
											<td class='center'>${var.PHONE}</td>
											<td class='center'><fmt:formatDate pattern="yyyy-MM-dd"  value="${var.APPLYDATE}"/></td>
											<td class='center'>
                                                <c:forEach items="${pd.enumApplyStatus}" var="entry">
                                                    <c:if test="${entry.key == var.APPLYSTATUS}">
                                                        <c:choose>
                                                            <c:when test="${var.APPLYSTATUS == '1'}">
                                                                <span class="label label-warning arrowed-in-right arrowed tooltip-warning" data-rel="tooltip" data-placement="bottom" title="" data-original-title="${var.APPROVALSUGGEST}" style="cursor: pointer"> ${entry.value}</span>
                                                            </c:when>
                                                            <c:when test="${var.APPLYSTATUS == '0' || var.APPLYSTATUS == '5'}">
                                                                <span class="label label-success arrowed-in-right arrowed tooltip-success" data-rel="tooltip" data-placement="bottom" title="" data-original-title="${var.APPROVALSUGGEST}" style="cursor: pointer"> ${entry.value}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="label label-info  arrowed-in arrowed-right  tooltip-info" data-rel="tooltip" data-placement="bottom" title="" data-original-title="${var.APPROVALSUGGEST}" style="cursor: pointer"> ${entry.value}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td><a class="btn btn-xs btn-info" title="诊疗信息" href="ssologin/referralCI?loginname=shjmz_01&password=123456&REFERRAL_ID=${var.REFERRAL_ID}"  target="_blank">诊疗信息</a></td>
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
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/jquery.raty.js"></script>

	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	
	<script type="text/javascript">
		//检索
		function tosearch(){
			$("#Form").submit();
		}
		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
            $('[data-rel=tooltip]').tooltip();
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
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
	 
        //查看详情
		function showInfo(Id){
            window.location.href="<%=basePath%>/referral/showInfo.do?REFERRAL_ID="+Id+"&fromUrl="+encodeURIComponent(window.location.href);
		}

      

        //转诊申请评价弹窗
        function evaluateDialog(business_id, outdoctorid, outdoctorname, indoctorid, indoctorname){
            var evaluateScore = 0;
            $('.rating').raty('destroy');
            bootbox.dialog({
                title: "请对此转诊申请单评价打分",
                message: '<div class="row">  ' +
                            '<div class="col-xs-12"> ' +
                                '<form class="form-horizontal"> ' +
                                    '<div class="form-group"> ' +
                                        '<label class="col-sm-3 control-label no-padding-top" for="APPROVALSUGGEST">评分：</label> ' +
                                        '<div class="col-sm-9"> ' +
                                            '<div class="rating inline"></div>' +
                                            '<div class="hr hr-16 hr-dotted"></div>' +
                                            '<span class="help-block" id="score" name="score">请选择评分</span> ' +
                                        '</div> ' +
                                    '</div> ' +
                                '</form> ' +
                            '</div> ' +
                        '</div>',
                buttons: {
                    evaluate:{
                        label: "确定",
                        className: "btn-success",
                        callback: function () {
                            $.ajax({
                                type: "POST",
                                url: '<%=basePath%>referralEvaluate/evaluate.do?tm=' + new Date().getTime(),
                                data: {
                                    BUSINESS_ID: business_id,
                                    OUTDOCTORID: outdoctorid,
                                    OUTDOCTORNAME: outdoctorname,
                                    INDOCTORID: indoctorid,
                                    INDOCTORNAME:indoctorname,
                                    SCORE: evaluateScore
                                },
                                cache: false,
                                success: function (data) {
                                    window.location.reload();
                                }
                            })
                        }
                    }
              }
            })
            $('.rating').raty({
                hints:['1','2','3','4','5'],
                number:5,
                numberMax:100,
                starType: 'i',
                precision:false,
                scoreName:'hiddScore',
                cancel: false,
                click: function(score) {
                    evaluateScore = score*20;
                    $('#score').text('你选择的评分是：'+evaluateScore+'分');
                }
            })
        }

		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>referral/excel.do';
		}
		
		 
	</script>


</body>
</html>