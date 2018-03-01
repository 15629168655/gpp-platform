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
    <%--tab相关--%>
    <link rel="stylesheet" href="static/ace/css/chosen.css" />
    <link href="static/ace/css/bootstrap.css" rel="stylesheet" />
    <link href="static/ace/css/ace.css" rel="stylesheet" />


    <%--<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>--%>
    <link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>

    <%@ include file="../../system/index/top.jsp"%>
    <%--覆盖ace.css中的背景颜色--%>
    <style>
        body{
            background-color: #fff;
        }
    </style>
</head>
<body>
<table style="width: 100%;" border="0">
    <tr>
        <td style="width: 15%;" valign="top" bgcolor="#F9F9F9">
            <div style="width: 15%;">
                <ul id="leftTree" class="ztree"></ul>
            </div>
        </td>
        <td style="width: 85%;" valign="top">
            <div class="tabable">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="active" id="ORG">
                        <a data-toggle="tab" style="cursor:pointer;">
                            签约机构配置
                        </a>
                    </li>

                    <li id="DIS">
                        <a data-toggle="tab" style="cursor:pointer;">
                            疾病配置
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="workflow" class="tab-pane fade in active">
                        <iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>workflow/list.do?ORG_CODE=AAA"  style="margin:0 auto;width:100%;height:100%;"></iframe>
                    </div>

                    <div id="curedisease" class="tab-pane fade">
                        <iframe name="disFrame" id="disFrame" frameborder="0" src="<%=basePath%>curedisease/list.do?ORG_CODE=AAA"  style="margin:0 auto;width:100%;height:100%;"></iframe>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>

<%@ include file="../../system/index/foot.jsp"%>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript">
    $(top.hangge());
    var zTree;
    $(document).ready(function(){

        //设置tab监听函数
        document.getElementById("ORG").onclick = turnORG;
        document.getElementById("DIS").onclick = turnDIS;

        var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            }
            ,async: {
                enable: true,
                url:"<%=basePath%>/organization/treeData.do?type=workflow&action=list",
                autoParam: ["id", "name"]
            },callback:{
                // beforeAsync: zTreeBeforeAsync, // 异步加载事件之前得到相应信息
                asyncSuccess: zTreeOnAsyncSuccess,//异步加载成功的fun
                asyncError: zTreeOnAsyncError,//加载错误的fun
                //beforeClick:beforeClick, //捕获单击节点之前的事件回调函数
                onClick: fresh
            },view:{
                selectedMulti: false
            }
        };
        var zn = '[{"id":"AAA","name":"全部","url":"","target":"treeFrame","isParent":true,"pId":"0"}]';//'${zTreeNodes}';
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

    //签约机构配置tab
    function turnORG() {
        //设置激活tab
        $('#ORG').attr("class","active");
        $('#DIS').attr("class","");

        //设置显示的iframe
        $('#workflow').attr("class","tab-pane fade in active");
        $('#curedisease').attr("class","tab-pane fade");
    }

    //疾病配置tab
    function turnDIS() {
        $('#ORG').attr("class","");
        $('#DIS').attr("class","active");

        $('#workflow').attr("class","tab-pane fade");
        $('#curedisease').attr("class","tab-pane fade in active");

        $('#curedisease').css("height",$('#workflow').height());

        //修改疾病iframe的src
        var treeObj = window.$.fn.zTree.getZTreeObj("leftTree");
        var nodes = treeObj.getSelectedNodes();

        $('#disFrame').attr("src","<%=basePath%>curedisease/list.do?ORG_CODE="+nodes[0].id);

    }

    //如果当前tab为疾病配置tab,那么这时候点击节点，则需要刷新疾病配置iframe
    function fresh() {
        if($('#curedisease').attr("class") == "tab-pane fade in active")
        {
            turnDIS();
        }
    }
</SCRIPT>
</body>
</html>