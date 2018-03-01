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
<!-- 指标结果模板-->
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
	<div class="main-container" id="main-container">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					<table>
						<tr>
							<td></td>
						</tr>
					</table>
						<textarea rows="20" cols="20">
首先感谢您在配合我们完成了这次的健康筛查！
    我们要提醒您注意的是：鉴于医学技术发展的局限性，
  个体间可能存在的生物差异以及您选择的检查项目的局限性，
 而且任何一次医学检查手段和方法都不具备绝对的特异性和灵敏度。
 因此，医生所做的医学诊断及健康指导是根据您的陈述和本次体检结果而得出的。
 所以，我们建议您在临床医生的指导下，对异常检查结果进行随诊复查和其他相关检查。
						<c:forEach items="${varList}" var="element" varStatus="vs" >
								${element.DISEASE_ADVICE }
							</c:forEach>
						</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- /.main-container -->
<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp"%>
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
	<script type="text/javascript">
		$(top.hangge());
		
		$(function() {
			var _change = {
			           ary0:["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"],
			           ary1:["", "十", "百", "千"],
			           ary2:["", "万", "亿", "兆"],
			           init:function (name) {
			               this.name = name;
			           },
			           strrev:function () {
			               var ary = []
			               for (var i = this.name.length; i >= 0; i--) {
			                   ary.push(this.name[i])
			               }
			               return ary.join("");
			           }, //倒转字符串。
			           pri_ary:function () {
			               var $this = this
			               var ary = this.strrev();
			               var zero = ""
			               var newary = ""
			               var i4 = -1
			               for (var i = 0; i < ary.length; i++) {
			                   if (i % 4 == 0) { //首先判断万级单位，每隔四个字符就让万级单位数组索引号递增
			                       i4++;
			                       newary = this.ary2[i4] + newary; //将万级单位存入该字符的读法中去，它肯定是放在当前字符读法的末尾，所以首先将它叠加入$r中，
			                       zero = ""; //在万级单位位置的“0”肯定是不用的读的，所以设置零的读法为空
			 
			                   }
			                   //关于0的处理与判断。
			                   if (ary[i] == '0') { //如果读出的字符是“0”，执行如下判断这个“0”是否读作“零”
			                       switch (i % 4) {
			                           case 0:
			                               break;
			                           //如果位置索引能被4整除，表示它所处位置是万级单位位置，这个位置的0的读法在前面就已经设置好了，所以这里直接跳过
			                           case 1:
			                           case 2:
			                           case 3:
			                               if (ary[i - 1] != '0') {
			                                   zero = "零"
			                               }
			                               ; //如果不被4整除，那么都执行这段判断代码：如果它的下一位数字（针对当前字符串来说是上一个字符，因为之前执行了反转）也是0，那么跳过，否则读作“零”
			                               break;
			 
			                       }
			 
			                       newary = zero + newary;
			                       zero = '';
			                   }
			                   else { //如果不是“0”
			                       newary = this.ary0[parseInt(ary[i])] + this.ary1[i % 4] + newary; //就将该当字符转换成数值型,并作为数组ary0的索引号,以得到与之对应的中文读法，其后再跟上它的的一级单位（空、十、百还是千）最后再加上前面已存入的读法内容。
			                   }
			 
			               }
			               if (newary.indexOf("零") == 0) {
			                   newary = newary.substr(1)
			               }//处理前面的0
			               return newary;
			           }
			       }
			 
			       //创建class类
			       function change() {
			           this.init.apply(this, arguments);
			       }
			       change.prototype = _change
			 
			//创建实例
			       var k = new change("00102040");
			       alert(k.pri_ary())
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
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
	  /* function add(){
          //top.jzts();
          top.siMenu('z71','lm70','新增住院证','hospitalization/goAdd.do');
		} */
		
		
		/* function add(){
            //top.jzts();
            top.siMenu('z71','lm70','新增住院证','hospitalization/goAdd.do');
		} */
		
		
		/* function editHospitalization(id){
            //top.jzts();
            top.siMenu('z71','lm70','修改住院证','hospitalization/goEdit.do?ID='+id);
		} */
		
		

		</script>
</html>