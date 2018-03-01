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
						<input type="hidden" id="PROVIDER_ID" />
						<input type="hidden" id="PROVIDER_NAME"  />
						<input type="hidden" id="TELECOM"  />
                        <!-- 检索  -->
                        <form action="referral/chooseProviderlistPage.do?ORG_CODE=${pd.ORG_CODE}&DEP_ID=${pd.DEP_ID}" method="post" name="Form" id="Form">
                            <table style="margin-top:5px;">
                                <tr>
                                    <td>
                                        <div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入转入医生" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords}" placeholder="这里输入转入医生" style="width: 200px"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
                                        </div>
                                    </td>
                                    <td>
                                    <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                    </td>
                                </tr>
                            </table>
                            <!-- 检索  -->
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center" style="width:50px;">序号</th>
                                    <th class="center">姓名</th>
                                    <th class="center">性别</th>
                                    <th class="center">职位名称</th>
                                    <th class="center">联系电话</th>
                                    <th class="center">地址</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList}">
                                        <c:forEach items="${varList}" var="var" varStatus="vs">
                                            <tr GH="${var.PROVIDER_ID}" MC="${var.PROVIDER_NAME}" DH="${var.TELECOM}" JG="${var.ORG_CODE}">
                                                <td class='center' style="width: 30px;">${vs.index+1}</td>
                                                <td class='center'>${var.PROVIDER_NAME}</td>
                                                <td class='center'>
                                                    <c:forEach items="${pd.enumSex}" var="s">
                                                        <c:if test="${s.key == var.SEX}">${s.value}</c:if>
                                                    </c:forEach>
                                                </td>
                                                <td class='center'>${var.PRO_POSITION_NAME}</td>
                                                <td class='center'>${var.ADDRESS}</td>
                                                <td class='center'>${var.TELECOM}</td>
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
                                        <td style="vertical-align:top;">
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
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
<script type="text/javascript">
   // $(top.hangge());//关闭加载状态
    //检索
    function tosearch(){
     //   top.jzts();
        $("#Form").submit();
    }

    $(function () {
        var active_class = 'success';
        
     // 选择行变色 
        $("#simple-table > tbody > tr").click(function (){ 
            var trThis = this; 
            $("#simple-table > tbody > tr").removeClass(active_class); 
            $(trThis).addClass(active_class);
            $("#PROVIDER_ID").val($(trThis).attr("GH"));
            $("#PROVIDER_NAME").val($(trThis).attr("MC"));
            $("#TELECOM").val($(trThis).attr("DH"));
        });
    }) 

</script>


</body>
</html>