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
<!DOCTYPE html>
<!-- 弹出居民信息新增页面 -->
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
 <link rel="stylesheet" href="static/ace/css/bootstrap-editable.css">
 <link rel="stylesheet" href="static/ace/css/jquery.gritter.css" />
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
						<form action="regAppointment/" name="Form" id="Form" method="post" class="form-horizontal" autocomplete="off">
							<div id="zhongxin" style="padding-top: 13px;">
                                <div class="form-group">
                            <div class="widget-box col-xs-12">
                                <div class="widget-header">
                                    <h5 class="widget-title">患者基本信息</h5>
                                        <span class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                            <a href="#" data-action="fullscreen" class="orange2">
                                                <i class="ace-icon fa fa-expand"></i>
                                            </a>
                                        </span>
                                </div>
                                <div class="widget-body col-xs-12">
                                    <div class="widget-main col-xs-12">
                                        <div class="col-xs-12 col-sm-4 center">
												<span class="profile-picture">
													<img id="avatar0" class="editable img-responsive" alt="${pds.NAME}"  src="${pds.PHOTO}" onerror="onerror=null;src='static/ace/avatars/profile-pic.jpg'" width="182" height="207"/>
												</span>
                                                <div class="space-4"></div>
                                                <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                                    <div class="inline position-relative">
                                                        <span class="white">${pds.NAME}</span>
                                                    </div>
                                                </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8">
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="NAME">患者姓名:</label>
                                                    <div class="col-sm-8">
                                                        <span id="NAME" class="col-sm-12 from-control-span">${pds.NAME}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="SEX">患者性别:</label>
                                                    <div class="col-sm-8">
                                                        <span id="SEX" class="col-sm-12 from-control-span">${pds.SEX}</span>
                                                    </div>
                                                 </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HEALTHSN">健康档案编号:</label>
                                                    <div class="col-sm-8">
                                                        <span id="HEALTHSN" class="col-sm-12 from-control-span">${pds.HEALTHSN}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="HEADTHCARDNO">健康卡卡号:</label>
                                                    <div class="col-sm-8">
                                                        <span id="HEADTHCARDNO" class="col-sm-12 from-control-span">${pds.HEADTHCARDNO}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDTYPE">患者证件类型:</label>
                                                    <div class="col-sm-8">
                                                       <span  id="CARDTYPE" class="col-sm-12 from-control-span">${pds.CARDTYPE}</span> 
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CARDNO">患者证件号码:</label>
                                                    <div class="col-sm-8">
                                                        <span  id="CARDNO" class="col-sm-12 from-control-span">${pds.CARDNO}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="INSURETYPE">参保类型:</label>
                                                    <div class="col-sm-8">
                                                        <span id="INSURETYPE" class="col-sm-12 from-control-span">${pds.INSURETYPE}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="INSURENO">参保卡号:</label>
                                                    <div class="col-sm-8">
                                                        <span  id="INSURENO" class="col-sm-12 from-control-span">${pds.INSURENO}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="BIRTHDAY">患者出生日期:</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group col-xs-12">
                                                            <span  id="BIRTHDAY" class="col-sm-12 from-control-span"><fmt:formatDate pattern='yyyy-MM-dd'  value='${pds.BIRTHDAY}'/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="PHONE">患者联系电话:</label>
                                                    <div class="col-sm-8">
                                                        <span  id="PHONE" class="col-sm-12 from-control-span">${pds.PHONE}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="CITY">市:</label>
                                                    <div class="col-sm-8">
                                                        <span id="CITY" class="col-sm-12 from-control-span">${pds.CITY}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="AREA">区:</label>
                                                    <div class="col-sm-8" id="AREADiv">
                                                        <span id="AREA" class="col-sm-12 from-control-span">${pds.AREA}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="STREET">街道/办事处:</label>
                                                    <div class="col-sm-8" id="STREETDiv">
                                                        <span id="STREET" class="col-sm-12 from-control-span">${pds.STREET}</span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="COMMUNITY">社区:</label>
                                                    <div class="col-sm-8" id="COMMUNITYDiv">
                                                        <span  id="COMMUNITY" class="col-sm-12 from-control-span">${pds.COMMUNITY}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <label class="col-sm-4 control-label no-padding-right" for="ADDRESS"  style="width: 16.1%;">患者家庭住址:</label>
                                                    <div class="col-sm-8"  style="width: 83.9%;">
                                                        <span  id="ADDRESS" class="col-sm-12 from-control-span">${pds.ADDRESS}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="form-group">
                            <div class="widget-box col-xs-12">
			                     <div class="widget-header">
			                           <h5 class="widget-title">患者的挂号信息</h5>
			                               <span class="widget-toolbar">
	                                            <a href="#" data-action="collapse">
	                                                <i class="ace-icon fa fa-chevron-up"></i>
	                                            </a>
	                                            <a href="#" data-action="fullscreen" class="orange2">
	                                                <i class="ace-icon fa fa-expand"></i>
	                                            </a>
	                                      </span>
	                             </div>
	                              <div class="widget-body col-xs-12">
	                              	<div class="form-group">
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="ORGNAME">预约的机构:</label>
                                               <div class="col-sm-8">
                                                   <span  id="ORGNAME" class="col-sm-12 from-control-span">${pd.ORGNAME}</span>
                                               </div>
                                           </div>
                                           <div class="col-xs-12 col-sm-6">
                                               <label class="col-sm-4 control-label no-padding-right" for="ORGID">预约医院代码:</label>
                                               <div class="col-sm-8">
                                                   <span id="ORGID" class="col-sm-12 from-control-span">${pd.ORGID}</span>
                                               </div>
                                           </div>
                                  	</div>
                                  	<div class="form-group">
                                                <div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="APPTIME">预约时间:</label>
                                                    <div class="col-sm-8" id="COMMUNITYDiv">
                                                        <span id="APPTIME" class="col-sm-12 from-control-span"><fmt:formatDate pattern="yyyy-MM-dd"  value="${pd.APPTIME }"/></span>
                                                    </div>
                                                </div>
												<div class="col-xs-12 col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DEPTNAME ">预约的科室:</label>
                                                    <div class="col-sm-8" id="AREADiv">
                                                        <span id="DEPTNAME " class="col-sm-12 from-control-span">${pd.DEPTNAME }</span>
                                                    </div>
                                                </div>
							  		 </div>
							  		 <div class="form-group">
                                                <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTORID "  >预约的医生代码:</label>
                                                    <div class="col-sm-8"  >
                                                        <span id="DOCTORID " class="col-sm-12 from-control-span">${pd.DOCTORID }</span>
                                                    </div>
                                                </div>
												<div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="DOCTORNAME "  >预约的医生:</label>
                                                    <div class="col-sm-8"  >
                                                        <span  id="DOCTORNAME  " class="col-sm-12 from-control-span">${pd.DOCTORNAME }</span>
                                                    </div>
                                                </div>
                                     </div>
                                     <div class="form-group">
                                               <div class="col-xs-12  col-sm-6">
                                                    <label class="col-sm-4 control-label no-padding-right" for="STATE "  >当前状态:</label>
                                                    <div class="col-sm-8"  >
                                                        <span id="STATE  " class="col-sm-12 from-control-span">
                                                        	<c:if test="${pd.STATE==0 }">取消预约</c:if>
                              								<c:if test="${pd.STATE==1 }">预约成功</c:if>
                                                        </span>
                                                    </div>
                                                </div>
												
                                      </div>
                                 </div>
                                 </div>   
                              
                       		</div>
                       		</div>
                        </form>
                        <div align="center">
                              	<c:if test="${pd.STATE==0 }"><a class="btn btn-mini btn-danger" onclick="reRegAPP('${pd.REFERRAL_ID}')">再次预约</a></c:if>
                              	<c:if test="${pd.STATE==1 }"><a class="btn btn-mini btn-danger" onclick="cancle()">取消预约</a></c:if>
									
								<a class="btn btn-mini btn-danger" onclick="back('${pd.formUrl}');">返回</a>
							 </div>
                      </div>
                      </div>                 
		    </div>
		</div>
							
	
	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>					
</div>	
</div>		
						<!-- /.col -->
					
					<!-- /.row -->
				
				<!-- /.page-content -->
			
		
		<!-- /.main-content -->

	<!-- /.main-container -->
	<!-- basic scripts -->
	
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp" %>
	<script src="static/ace/js/chosen.jquery.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>
    <script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
    <script src="static/ace/js/ace/elements.scroller.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript" src="static/js/common/DateFormat.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/elements.fileinput.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/bootstrap-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/x-editable/ace-editable.js"></script>
    <script type="text/javascript" src="static/ace/js/ace/ace.widget-box.js"></script>
    <script type="text/javascript" src="static/ace/js/jquery.gritter.js"></script>
    <!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog2.0/zDialog.js"></script>
	<!-- 页面底部js¨ -->
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>						
<script type="text/javascript">
	$(top.hangge());
	//验证身份证正则表达式
	function isSfzh(sfzh){
		return(new RegExp(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/).test(sfzh));
	}
	
	//验证邮箱正则表达式
	function isEmail(email){
		return(new RegExp(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/).test(email));
	}
	
	//验证手机号正则表达式
	function isTel(telephone){
		return(new RegExp(/^(13[0-9]{9})|(14[0-9]{9})|(15[0-9]{9})|(18[0-9]{9})$/).test(telephone));
	}
	
	//验证QQ号正则表达式
	function isQQ(qqaccount){
		return(new RegExp(/^\d{5,10}$/).test(qqaccount));
	}
	
	//验证邮编正则表达式
	function isPostcode(postcode){
		return(new RegExp(/^\d{6}$/).test(postcode));
	}
	
	//验证身高,体重
	function isHEIGHT(height){
		return(new RegExp(/^[0-9]{2,3}$/).test(height));
	}
	 //再次预约挂号
    function reRegAPP(Id){
        top.jzts();
        window.location.href="<%=basePath%>/regAppointment/doctor.do?REFERRAL_ID="+Id+"&fromUrl="+encodeURIComponent(window.location.href);
    }
	//验证邮箱格式
	function yanE(){
		if(!isEmail($("#EMAIL").val()) && $("#EMAIL").val() != ""){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").val("");
			return false;
		}
	}
	//返回原页面
    function back(fromUrl){
        window.location.href=fromUrl;
    }
	//验证电话号码号格式
	function yanT(){
		if(!isTel($("#TELEPHONE").val()) && $("#TELEPHONE").val() != ""){
			$("#TELEPHONE").tips({
				side:3,
	            msg:'手机号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#TELEPHONE").val("");
			return false;
		}
	}
	
	//验证QQ格式
	function yanQ(){
		if(!isQQ($("#QQACCOUNT").val()) && $("#QQACCOUNT").val() !=""){
			$("#QQACCOUNT").tips({
				side:3,
	            msg:'QQ号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#QQACCOUNT").val("");
			return false;
		}
	}
	
	//验证邮编格式
	function yanP(){
		if(!isPostcode($("#POSTCODE").val()) && $("#POSTCODE").val() !=""){
			$("#POSTCODE").tips({
				side:3,
	            msg:'邮政编码格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#POSTCODE").val("");
			return false;
		}
	}
	//取消预约
	function cancle(){
		bootbox.confirm("您确定,为患者${pds.NAME}取消预约", function(result) {
			if(result){
				top.jzts();//开启加载
				var url="<%=basePath%>regAppointment/cancle.do?GUID=${pd.ARRANGEID}&RGUID=${pd.GUID}"//请求保存的url
				$.get(url,function(data){
					//成功回调函数
					if("success"==data.result){
						window.event.returnValue=false; 
						window.location.href="<%=basePath%>regAppointment/list.do";
					}else{
						top.hangge();
						bootbox.dialog({
							message: "<span class='bigger-110'>您的预约不能取消</span>",
							buttons: 			
							{
								"button" :
								{
									"label" : "确定",
									"className" : "btn-sm btn-success"
								}
							}
						});
					}
						
				});
			}
		});
	}
	//验证身高
	function yanHEIGHT(){
		if(!isHEIGHT($("#HEIGHT").val()) && $("#HEIGHT").val() !=""){
			$("#HEIGHT").tips({
				side:3,
	            msg:'身高值不在范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HEIGHT").val("");
			return false;
		}
	}
	
	//验证体重
	function yanWEIGHT(){
		if(!isHEIGHT($("#WEIGHT").val()) && $("#WEIGHT").val() !=""){
			$("#WEIGHT").tips({
				side:3,
	            msg:'体重值不在范围',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#WEIGHT").val("");
			return false;
		}
	}
	
	//保存
	function save(){
		if($("#USER_NAME").val()==""){
			$("#USER_NAME").tips({
				side:3,
	            msg:'请输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_NAME").focus();
			return false;
		} else {
			$("#USER_NAME").val($.trim($("#USER_NAME").val()));
		}
		
		if($("#HEALTH_ACCOUNT").val()==""){
			$("#HEALTH_ACCOUNT").tips({
				side:3,
	            msg:'请输入健康账号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#HEALTH_ACCOUNT").focus();
			return false;
		}else{
			$("#HEALTH_ACCOUNT").val($.trim($("#HEALTH_ACCOUNT").val()));
		}	
		if($("#ID_NUMBER").val()==""){
			
			$("#ID_NUMBER").tips({
				side:3,
	            msg:'请输入身份证号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ID_NUMBER").focus();
			return false;
		}else if(!isSfzh($("#ID_NUMBER").val())){
			$("#ID_NUMBER").tips({
				side:3,
	            msg:'身份证号格式错误',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#ID_NUMBER").val("");
			return false;
		} else {
			$("#ID_NUMBER").val($.trim($("#ID_NUMBER").val()));
		}
		
		
		if($("#MI_CARD").val()==""){
			$("#MI_CARD").tips({
				side:3,
	            msg:'输入医保卡号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MI_CARD").focus();
			return false;
		} else {
			$("#MI_CARD").val($.trim($("#MI_CARD").val()));
		}
		
		
		$("#userForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		
	}	
	//判断医保卡号是否存在
	function hasM(){
		var MI_CARD = $("#MI_CARD").val();
		var USER_AGENT_ID = $("#USER_AGENT_ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>jmxx/hasM.do',
	    	data: {MI_CARD:MI_CARD,USER_AGENT_ID:USER_AGENT_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#MI_CARD").tips({
							side:3,
				            msg:'医保卡号'+MI_CARD+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#MI_CARD').val('');
				 }
			}
		});
	}
	
	//判断身份证号是否存在
	function hasI(){
		var ID_NUMBER = $("#ID_NUMBER").val();
		var USER_AGENT_ID = $("#USER_AGENT_ID").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>jmxx/hasI.do',
	    	data: {ID_NUMBER:ID_NUMBER,USER_AGENT_ID:USER_AGENT_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("success" != data.result){
					 $("#ID_NUMBER").tips({
							side:3,
				            msg:'身份证'+ID_NUMBER+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#ID_NUMBER').val('');
				 }
			}
		});
	}	
	
	
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
</script>
</html>