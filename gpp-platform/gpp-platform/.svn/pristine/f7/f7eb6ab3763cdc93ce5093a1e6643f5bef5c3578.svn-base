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
<!-- 基层卫生提醒页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
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
						<form action="jcws/jcwstxList.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<input class="nav-search-input" autocomplete="off" id="keywords" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入标题" />
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="GMT_START" id="GMT_START"  value="${pd.GMT_START}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="生成时间范围起" title="生成时间范围起"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="GMT_END" id="GMT_END"  value="${pd.GMT_END}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="生成时间范围止" title="生成时间范围止"/></td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="TXLX" id="TXLX" data-placeholder="TXLX" style="vertical-align:top;width: 129px;">
									<option value="">请选择提醒类型</option>
									<c:forEach items="${pd.EnumJcwstxLX}" var="item">
                                        <option value="${item.key}" <c:if test="${pd.TXLX == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                    </c:forEach>
									</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="pos-rel" name="ZT" id="ZT" data-placeholder="ZT" style="vertical-align:top;width: 99px;">
									<option value="">请选择状态</option>
									<c:forEach items="${pd.enumJcwstxZT}" var="item">
                                        <option value="${item.key}" <c:if test="${pd.ZT == item.key}"> selected="selected" </c:if> >${item.value}</option>
                                    </c:forEach>
									</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i>检索</a></td>
								<td><a class="btn btn-grey btn-xs" onclick="reset();"  title="重置"><i class="fa fa-undo bigger-110 nav-search-icon"  ></i>重置</a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">标题</th>
									<th class="center">内容</th>
									<th class="center">状态</th>
									<th class="center">生成时间</th>
									<th class="center">更新时间</th>
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
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.BT}</td>
											<td class='center'>${var.NR}</td>
											
											<td class='center'>
                                                <c:forEach items="${pd.enumJcwstxZT}" var="s">
                                                    <c:if test="${s.key == var.ZT}">${s.value}</c:if>
                                                </c:forEach>
                                            </td>
											
											<td class='center'>
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${var.SCSJ}"/>
											</td>
											<td class='center'>
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${var.GXSJ}"/>
											</td>
											
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.cha != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
                                                        <a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">
                                                                                                                                                                                                                 编辑
                                                        </a>  
                                                    <c:if test="${var.ZT == 0 }">
														<a class="btn btn-xs btn-success" title="已读" onclick="read('${var.ID}','${var.BT }');">已读</a>
                                                    </c:if>
                                                    <c:if test="${var.ZT == 1 }">
                                                      		<a class="btn btn-xs btn-success" title="未读" onclick="unRead('${var.ID}','${var.BT}');">未读</a>
													</c:if>
                                                        <a class="btn btn-xs btn-danger"  title="删除" onclick="del('${var.ID}','${var.BT}');">删除</a>
                                                    </c:if>
                                                    <c:if test="${QX.cha == 1 }">
                                                        <a class="btn btn-xs btn-success" onclick="see('${var.ID }');">查看</a>
                                                    </c:if>
                                                        <!-- 
                                                        <a class="btn btn-xs btn-danger" onclick="del('${var.ID}','${var.STATUS}');">
                                                            <i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
                                                        </a>
                                                         -->
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
																<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.ID}');">编辑</a>
																<c:if test="${var.ZT == 0 }">
																<a class="btn btn-xs btn-success" title="已读" onclick="read('${var.ID}','${var.BT }');">已读</a>
                                                        		</c:if>
                                                        		<c:if test="${var.ZT == 1 }">
                                                        		<a class="btn btn-xs btn-success" title="未读" onclick="unRead('${var.ID}','${var.BT}');">未读</a>
																</c:if>
															</c:if>
															<c:if test="${QX.del == 1 }">
																<a class="btn btn-xs btn-danger"  title="删除" onclick="del('${var.ID}','${var.BT}');">删除</a>
															</c:if>
															<c:if test="${QX.cha == 1 }">
		                                                        <a class="btn btn-xs btn-success" onclick="see('${var.ID }');">查看</a>
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
									<c:if test="${QX.add == 1 }">
										<a class="btn btn-mini btn-success" onclick="add();">
												<i class="ace-icon fa fa-plus-square" aria-hidden="true"></i>
												新增
										</a>
									</c:if>
									<c:if test="${QX.edit == 1 }">
									<!-- 
								  	<a class="btn btn-mini btn-success" onclick="makeAll('确定要将选中的数据标记为已读吗?');" title="批量标记为已读" >已读</a>
								  	<a class="btn btn-mini btn-success" onclick="makeAll('确定要将选中的数据标记为未读吗?');" title="批量标记为未读" >未读</a>  
									 --> 
									</c:if>
									<c:if test="${QX.del == 1 }">
									  <a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i>批量删除</a>  
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		//清空查询条件
		function reset(){
			$("#keywords").val("");
			$("#GMT_START").val("");
			$("#GMT_END").val("");
			$("#TXLX").find("option:selected").attr("selected",false);
			$("#TXLX").find("option[text='']").attr("selected",true);
			$("#ZT").find("option:selected").attr("selected",false);
			$("#ZT").find("option[text='']").attr("selected",true);
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		
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
                 var diag = new top.Dialog();
                 diag.Drag=true;
                 diag.Title ="新增";
                 diag.URL = '<%=basePath%>jcws/goAddJcwstx.do';
                 diag.Width = 580;
                 diag.Height = 270;
                 diag.CancelEvent = function(){ //关闭事件
                     if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                         if('${page.currentPage}' == '0'){
                             top.jzts();
                             setTimeout("self.location=self.location",100);
                         }else{
                             //nextPage(${page.currentPage});
                             window.location.reload();
                         }
                    }
                    diag.close();
                 };
                 diag.show();
            }
		
		//修改
		function edit(id){
			
			
				 top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="编辑";
				 diag.URL = '<%=basePath%>jcws/goEdit.do?id='+id;
				 diag.Width = 580;
                 diag.Height = 270;
				 diag.CancelEvent = function(){ //关闭事件
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 //nextPage(${page.currentPage});
						 window.location.reload();
					}
					diag.close();
				 };
				 diag.show();
				
		}
		
		//查看
		function see(id){
                 var diag = new top.Dialog();
                 diag.Drag=true;
                 diag.Title ="基层卫生提醒服务信息";
                 diag.URL = '<%=basePath%>jcws/goSeeJcwstx.do?id='+id;
                 diag.Width = 600;
                 diag.Height = 430;
                 diag.CancelEvent = function(){ //关闭事件
                     if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                         if('${page.currentPage}' == '0'){
                             top.jzts();
                             setTimeout("self.location=self.location",100);
                         }else{
                             //nextPage(${page.currentPage});
                             window.location.reload();
                         }
                    }
                    diag.close();
                 };
                 diag.show();
            }
		
		//单条标记已读
		function read(id,msg){
			bootbox.confirm("确定要将["+msg+"]标记为已读吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>jcws/editZT.do?ID="+id+"&MSG="+1;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//单条标记未读
		function unRead(id,msg){
			bootbox.confirm("确定要将["+msg+"]标记为未读吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>jcws/editZT.do?ID="+id+"&MSG="+0;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//单条标记删除状态
		function del(id,msg){
			bootbox.confirm("确定要将["+msg+"]删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>jcws/editZT.do?ID="+id+"&MSG="+9;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}
					if(msg == '确定要删除选中的数据吗?'){
						top.jzts();
						$.ajax({
							type: "POST",
							url: '<%=basePath%>jcws/deleteAll.do?tm='+new Date().getTime(),
					    	data: {ids:str},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								nextPage(${page.currentPage});
							}
						});
					}
				}
			});
		}
		
		</script>


</body>
</html>