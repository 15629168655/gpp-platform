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
						<form action="referral/list.do?status=${pd.status}" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input type="text" placeholder="输入查询的患者姓名" class="nav-search-input" id="queryName" autocomplete="off" name="queryName" value="${pd.queryName}" placeholder="这里输入关键词"/>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="applyDateStart" id="applyDateStart"  value="${pd.applyDateStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="申请开始日期" title="申请开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="applyDateEnd" id="applyDateEnd"  value="${pd.applyDateEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:95px;" placeholder="申请结束日期" title="申请结束日期"/></td>
								<td style="vertical-align:top;padding-left:2px;">
                                    <select class="pos-rel" name="queryApplyStatus" id="queryApplyStatus" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
                                        <option value="-1">全部</option>
                                        <c:forEach items="${pd.enumApplyStatus}" var="item">
                                        	<option value="${item.key}" <c:if test="${pd.queryApplyStatus == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                        </c:forEach>
								  	</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="reset();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-bordered " style="margin-top:5px;">	
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
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
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
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
                                                    <c:choose>
                                                        <c:when test="${pd.status == -1}"><!-- 菜单：申请信息管理 -->
                                                            <c:if test="${var.APPLYSTATUS == 0 || var.APPLYSTATUS == 1 }">
                                                                <c:if test="${QX.edit == 1 }">
                                                                    <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.REFERRAL_ID}');">
                                                                        <!-- <i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i> -->编辑
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${QX.del == 1 }">
                                                                    <a class="btn btn-xs btn-danger" title="删除" onclick="del('${var.REFERRAL_ID}');">
                                                                        <!-- <i class="ace-icon fa fa-trash-o bigger-120" title=""></i> -->删除
                                                                    </a>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${var.APPLYSTATUS == 5 && var.REFERRALTYPE == 1}"><!-- 申请状态为完成状态 && 转诊类型为下转 -->
                                                            	<a class="btn btn-xs btn-success" title="下转回访" onclick="track_XZ('${var.REFERRAL_ID}');">
                                                                    <!-- <i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i> -->下转回访
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${var.APPLYSTATUS == 3 && var.REFERRALTYPE == 0}"><!-- 申请状态为接诊状态 && 转诊类型为上转 -->
                                                            	<a class="btn btn-xs btn-success" title="上转追踪" onclick="track_SZ('${var.REFERRAL_ID}');">
                                                                    <!-- <i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i> -->上转追踪
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${var.APPLYSTATUS >=2 && var.APPLYSTATUS <=4}">
                                                                <c:if test="${QX.edit == 1 }">
                                                                    <a class="btn btn-xs btn-info" title="预约挂号" onclick="regApp('${var.REFERRAL_ID}')">
                                                                        <!-- <i class="ace-icon fa fa-medkit" title="预约挂号"></i> -->预约挂号
                                                                    </a>
                                                                </c:if>
                                                            </c:if>
                                                            <c:choose>
                                                                <c:when test="${var.SCORE == null }">
                                                                     <span class="btn btn-warning btn-xs tooltip-warning" data-rel="tooltip" data-placement="top" title="" data-original-title="未评分">
                                                                        <!-- <i class="ace-icon fa fa-star" title="转诊申请评价"></i> -->评价
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="btn btn-info btn-xs tooltip-info" data-rel="tooltip" data-placement="top" title="" data-original-title="${var.SCORE}分">
                                                                        <!-- <i class="ace-icon fa fa-star" title="转诊申请评价"></i> -->评价
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:when test="${pd.status == 2}"><!-- 菜单：医务审核管理 -->
                                                            <c:if test="${var.APPLYSTATUS == 2}">
                                                                <a class="btn btn-xs btn-info" title="审核" onclick="approvalDialog('${var.REFERRAL_ID}','${var.APPLYSTATUS}');">
                                                                    <!-- <i class="ace-icon fa fa-check bigger-120" title="审核"></i> -->审核
                                                                </a>
                                                            </c:if>
                                                            <c:choose>
                                                                <c:when test="${var.SCORE == null }">
                                                                     <span class="btn btn-warning btn-xs tooltip-warning" data-rel="tooltip" data-placement="top" title="" data-original-title="未评分">
                                                                         <!-- <i class="ace-icon fa fa-star" title="转诊申请评价"></i> -->评价
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="btn btn-info btn-xs tooltip-info" data-rel="tooltip" data-placement="top" title="" data-original-title="${var.SCORE}分">
                                                                         <!-- <i class="ace-icon fa fa-star" title="转诊申请评价"></i> -->评价
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:when test="${pd.status == 3}"><!-- 菜单：接诊处理管理 -->
                                                            <c:if test="${var.APPLYSTATUS == 3}">
                                                                <a class="btn btn-xs btn-success" title="编辑" onclick="edit3('${var.REFERRAL_ID}');">
                                                                    <!-- <i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i> -->编辑
                                                                </a>
                                                                <a class="btn btn-xs btn-info" title="审核" onclick="approvalDialog('${var.REFERRAL_ID}','${var.APPLYSTATUS}');">
                                                                    <!-- <i class="ace-icon fa fa-check bigger-120" title="审核"></i> -->审核
                                                                </a>
                                                            </c:if>
                                                            <c:choose>
                                                                <c:when test="${var.SCORE == null }">
                                                                     <span class="btn btn-warning btn-xs tooltip-warning" data-rel="tooltip" data-placement="top" title="" data-original-title="未评分">
                                                                        <!-- <i class="ace-icon fa fa-star" title="转诊申请评价"></i> -->评价
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="btn btn-info btn-xs tooltip-info" data-rel="tooltip" data-placement="top" title="" data-original-title="${var.SCORE}分">
                                                                        <!-- <i class="ace-icon fa fa-star" title="转诊申请评价"></i> -->评价
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:when test="${pd.status == 4}"><!-- 菜单：就诊确认管理 -->
                                                            <c:if test="${var.APPLYSTATUS == 4}">
                                                                <a class="btn btn-xs btn-info" title="审核" onclick="approvalDialog('${var.REFERRAL_ID}','${var.APPLYSTATUS}');">
                                                                    <!-- <i class="ace-icon fa fa-check bigger-120" title="审核"></i> -->审核
                                                                </a>
                                                            </c:if>
                                                            <c:choose>
                                                                <c:when test="${var.SCORE == null }">
                                                                    <a class="btn btn-xs btn-success" onclick="evaluateDialog('${var.REFERRAL_ID}','${var.OUTDOCTORID}','${var.OUTDOCTORNAME}','${var.INDOCTORID}','${var.INDOCTORNAME}')">
                                                                       <!--  <i class="ace-icon fa fa-star" title="转诊申请评价"></i> -->评价
                                                                    </a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="btn btn-info btn-xs tooltip-info" data-rel="tooltip" data-placement="top" title="" data-original-title="${var.SCORE}分">
                                                                        <!-- <i class="ace-icon fa fa-star" title="转诊申请评价"></i> -->评价
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                    </c:choose>
                                                    <a class="btn btn-xs btn-info" title="诊疗信息" onclick="goClinicalInfo('${var.REFERRAL_ID}');">诊疗信息</a>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.REFERRAL_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.REFERRAL_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
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
								<td style="vertical-align:top;">
                                    <c:if test="${pd.status == 0 || pd.status == 1}">
                                        <c:if test="${QX.add == 1 }">
                                        <a class="btn btn-sm btn-success" onclick="add();">新增</a>
                                        </c:if>
                                        <c:if test="${QX.del == 1 }">
                                        <a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
                                        </c:if>
                                    </c:if>
								</td>
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
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		//清空查询条件
		function reset(){
			$("#queryName").val("");
			$("#applyDateStart").val("");
			$("#applyDateEnd").val("");
			$("#queryApplyStatus").find("option:selected").attr("selected",false);
			$("#queryApplyStatus").find("option[text='']").attr("selected",true);
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
		
		//新增
		function add(){
			 top.jzts();
            $('li #z71 a', window.parent.parent.document).trigger('click');
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>referral/delete.do?REFERRAL_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//诊疗信息
		function goClinicalInfo(Id){
            top.jzts();
            top.siMenu('z106','lm70','诊疗信息','referral/goClinicalInfo.do?REFERRAL_ID='+Id);
		}
		
		//修改
		function edit(Id){
            top.jzts();
            top.siMenu('z71','lm70','转诊申请','referral/goEdit.do?REFERRAL_ID='+Id);
		}

        //接诊修改
        function edit3(Id){
            top.jzts();
            top.siMenu('z71','lm70','转诊申请','referral/showInfo.do?REFERRAL_ID='+Id);
        }

        //查看详情
		function showInfo(Id){
            top.jzts();
            window.location.href="<%=basePath%>/referral/showInfo.do?REFERRAL_ID="+Id+"&fromUrl="+encodeURIComponent(window.location.href);
		}

        //预约挂号
        function regApp(Id){
            top.jzts();
            window.location.href="<%=basePath%>/regAppointment/doctor.do?REFERRAL_ID="+Id;
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
                            top.jzts();
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

        //审核弹窗
        function approvalDialog(id, curStatus) {
            var buttons={};
            var reject ={
                label: "驳回",
                className: "btn-danger",
                callback: function () {
                    var APPROVALSUGGEST = $('#APPROVALSUGGEST').val();
                    approvalReferral(id, curStatus, "reject", APPROVALSUGGEST);
                }
            };
            var pass ={
                label: "通过",
                className: "btn-success",
                callback: function () {
                    var APPROVALSUGGEST = $('#APPROVALSUGGEST').val();
                    approvalReferral(id, curStatus, "pass", APPROVALSUGGEST);
                }
            };
            if (curStatus == 0 || curStatus == 1){
                buttons.pass = pass;
            }else{
                buttons.pass = pass;
                buttons.reject = reject;
            }
            bootbox.dialog({
                title: "请输入审核意见",
                message: '<div class="row">  ' +
                '<div class="col-xs-12"> ' +
                '<form class="form-horizontal"> ' +
                '<div class="form-group"> ' +
                '<label class="col-sm-2 control-label no-padding-right" for="APPROVALSUGGEST">审核意见：</label> ' +
                '<div class="col-sm-9"> ' +
                '<textarea id="APPROVALSUGGEST" name="APPROVALSUGGEST" class="form-control limited" style="resize: none;" rows="3" maxlength="80" placeholder="请输入审核意见"></textarea>' +
                '<span class="help-block">审核通过或者驳回的意见</span> ' +
                '</div> ' +
                '</div> ' +
                '</form> ' +
                '</div> ' +
                '</div>',
                buttons: buttons
            })
        }

        //转诊审核
        function approvalReferral(id, curStatus, APPROVALRESULT, APPROVALSUGGEST) {
            top.jzts();
            $.ajax({
                type: "POST",
                url: '<%=basePath%>referralApproval/approval.do?tm=' + new Date().getTime(),
                data: {
                    BUSINESS_ID: id,
                    curStatus: curStatus,
                    APPROVALRESULT: APPROVALRESULT,
                    APPROVALSUGGEST: APPROVALSUGGEST
                },
                cache: false,
                success: function (data) {
                    window.location.reload();
                }
            })
        }

		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>referral/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		
		//上转追踪
		function track_SZ(REFERRAL_ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="上转追踪";
			 diag.URL = '<%=basePath%>szzz/goAdd.do?REFERRAL_ID='+REFERRAL_ID;
			 diag.Width = 500;
			 diag.Height = 350;
			 diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 nextPage(${page.currentPage});
					 }else{
						 top.siMenu('z110','lm102','上转追踪','szzz/list.do?REFERRAL_ID='+REFERRAL_ID);
					 }
				}
				diag.close();
			 };
			 diag.show();
			 
		}
		
		//下转回访
		function track_XZ(REFERRAL_ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="下转回访";
			 diag.URL = '<%=basePath%>xzhf/goAdd.do?REFERRAL_ID='+REFERRAL_ID;
			 diag.Width = 500;
			 diag.Height = 350;
			 diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 nextPage(${page.currentPage});
					 }else{
						 top.siMenu('z111','lm102','下转回访','xzhf/list.do?REFERRAL_ID='+REFERRAL_ID);
					 }
				}
				diag.close();
			 };
			 diag.show();
			 
		}
		
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>referral/excel.do';
		}
	</script>


</body>
</html>