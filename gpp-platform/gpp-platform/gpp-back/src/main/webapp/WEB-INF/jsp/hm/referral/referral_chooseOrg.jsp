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

                        <!-- 检索  -->
                        <form action="referral/chooseOrglistPage.do?ORG_CODE=${pd.ORG_CODE}&DISEASE_CODE=${pd.DISEASE_CODE}" method="post" name="Form" id="Form">
                        <input type="hidden" id="INORGID">
						<input type="hidden" id="INORGNAME">
                            <table style="margin-top:5px;">
                                <tr>
                                    <td>
                                        <div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入机构名称" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords}" placeholder="这里输入机构名称" style="width: 200px"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
                                        </div>
                                    </td>
                                    <td>
                                    <td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
                                    </td>
                                    <td style="padding-left:30px">
                                        接诊疾病不为"-"时表明此机构为诊断接诊疾病的推荐机构
                                    </td>
                                </tr>
                            </table>
                            <!-- 检索  -->
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
                                <thead>
                                <tr>
                                    <th class="center" style="width:50px;">序号</th>
                                    <th class="center">转入机构编码</th>
                                    <th class="center">转入机构名称</th>
                                    <th class="center">接诊疾病编码</th>
                                    <th class="center">接诊疾病名称</th>
                                    <th class="center">疾病类型</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList}">
                                        <c:forEach items="${varList}" var="var" varStatus="vs">
                                            <tr bm="${var.SIGN_ORG_CODE}" mc="${var.SIGN_ORG_NAME}">
                                                <td class='center' style="width: 30px;">${vs.index+1}</td>
                                                <td class='center'>${var.SIGN_ORG_CODE}</td>
                                                <td class='center'>${var.SIGN_ORG_NAME}</td>
                                                <td class='center'>
                                                    <c:choose>
                                                        <c:when test="${var.DISEASE_CODE != null && var.DISEASE_CODE != ''}">
                                                            ${var.DISEASE_CODE}
                                                        </c:when>
                                                        <c:otherwise>-</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class='center'>
                                                    <c:choose>
                                                        <c:when test="${var.DISEASE_NAME != null && var.DISEASE_NAME != ''}">
                                                            ${var.DISEASE_NAME}
                                                        </c:when>
                                                        <c:otherwise>-</c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class='center'>
                                                    <c:choose>
                                                        <c:when test="${var.DISEASE_TYPE != null && var.DISEASE_TYPE != ''}">
                                                            ${var.DISEASE_TYPE}
                                                        </c:when>
                                                        <c:otherwise>-</c:otherwise>
                                                    </c:choose>
                                                </td>
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
    //$(top.hangge());//关闭加载状态
    //检索
    function tosearch(){
       // top.jzts();
        $("#Form").submit();
    }

    //选中机构
    function orgSelected(code, name){
        var iframe = $("#page_z71",parent[0].document.body);
        iframe.contents().find("#INORGID").val(code);
        iframe.contents().find("#INORGNAME").val(name);
        top.Dialog.close();
    }
    
    
    $(function () {
        var active_class = 'success';
        
     // 选择行变色 
        $("#simple-table > tbody > tr").click(function (){ 
            var trThis = this; 
            $("#simple-table > tbody > tr").removeClass(active_class); 
            $(trThis).addClass(active_class);
            $("#INORGID").val($(trThis).attr("BM"));
            $("#INORGNAME").val($(trThis).attr("MC"));
        });
    })
</script>


</body>
</html>