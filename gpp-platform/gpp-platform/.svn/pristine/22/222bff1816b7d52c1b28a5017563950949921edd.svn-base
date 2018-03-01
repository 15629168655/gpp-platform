<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
    <link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp"%>
    <script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
</head>
<body>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                    	<input id = "ID" name ="ID" type = "hidden"/>
                    	<input id = "ID" name ="NAME" type = "hidden"/>
                        <div id="zhongxin">
                            <div style="overflow: scroll; scrolling: yes;height:415px;width: 319px;background-color:#F9F9F9;">
                                <ul id="leftTree" class="ztree" style="overflow:auto;"></ul>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.page-content -->
    </div>
</div>
<!-- /.main-content -->
<div style="width: 100%;padding-top: 5px;" class="center">
    <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
</div>


<script type="text/javascript">
    $(top.hangge());
    var zTree;
    $(document).ready(function(){

        var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            }
            ,async: {
                enable: true,
                url:"<%=basePath%>/departments/depTree.do",
                autoParam: ["id", "name"]
            },callback:{
                // beforeAsync: zTreeBeforeAsync, // 异步加载事件之前得到相应信息
                asyncSuccess: zTreeOnAsyncSuccess,//异步加载成功的fun
                asyncError: zTreeOnAsyncError//加载错误的fun
                //beforeClick:beforeClick, //捕获单击节点之前的事件回调函数
            },view:{
                selectedMulti: false
            },key:{
                url:"noUrl"
            }
        };      
         if(${size} > 0){
            var zn = '[{"id":"${orgCode}","name":"全部","url":"","target":"treeFrame","isParent":true,"pId":"0"}]';//'${zTreeNodes}';
        	
        }else{
			var zn = '[{"id":"${orgCode}","name":"全部","target":"treeFrame","isParent":false,"pId":"0"}]';//'${zTreeNodes}';
        } 
        var zTreeNodes = eval(zn);
        zTree = $.fn.zTree.init($("#leftTree"), setting, zTreeNodes);
		$('#leftTree_1_switch', window.document).trigger('click');

    });

    function zTreeOnAsyncError(event, treeId, treeNode){
        alert("异步加载失败");
    }
    function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
        alert("异步加载成功");
    }

    function treeFrameT(){
        var hmainT = document.getElementById("treeFrame");
        var bheightT = document.documentElement.clientHeight;
        hmainT .style.width = '100%';
        hmainT .style.height = (bheightT-26) + 'px';
    }
    treeFrameT();
    window.onresize=function(){
        treeFrameT();
    };

    function save()
    {
        var treeObj = $.fn.zTree.getZTreeObj("leftTree");
        var nodes = treeObj.getSelectedNodes();
        if(jQuery.isEmptyObject(nodes))
        {
            bootbox.alert("请选择上级机构标识", function() {
                return;
            });
        }
        $("#ID").val(nodes[0].id);
        $("#NAME").val(nodes[0].name);
   
        top.Dialog.close();
    }

</SCRIPT>
</body>
</html>