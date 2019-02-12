<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>注册</title>
		<link rel="stylesheet" href="css/register.css" />
	</head>

	<body>
		<div class="frameTop">
			<img src="img/1.png" class="img_1" />
			<form action="" method="post">
				<input type="text" class="form">
			</form>
			<img src="img/2.jpg" class="img_2" onclick="frmsubmit()" />
			<ul class="f_ul">
				<a href="index.jsp">
					<li>首页</li>
				</a>
			</ul>
		</div>
		<div class="form_2">
			<h3>注册</h3>
			<form action="" method="post" id="fr">
				<div>
					用户类型 ：
					<select name="status" id="status">
						<option value="1">
							管理员
						</option>
						<option value="2">
							新闻发布员
						</option>
						<option value="3">
							普通用户
						</option>
					</select>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名 ：
					<input type="text" name="form-account" id="account" onblur="" />
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码 ：
					<input type="password" id="password" name="form-password" onblur="" />
					<span class="message">
						只能输入六个字母、数字或者下划线
					</span>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重新输入密码 ：
					<input id="password2" type="password" onblur="" />
					<span class="message" style="position: relative;top: -25px;left: 300px;">
						前后密码不一致
					</span>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入邮箱 ：
					<input id="password2" type="email" onblur="" />
				</div>
				请输入验证码：
				<input type="text" id="code" /><img src="VerifyCodeServlet" id="img" />
				<a href="#">
					<div id="reflesh">看不清？点此刷新</div>
				</a>
				<br />
				<input type="button" value="注册" onclick="register()" />
				<div style="color: red;" id="mess"></div>
			</form>
		</div>
		<div class="frameThree">
			<hr /> Copyright @ 2006-2015 renming.com All Rights Reserved. 人民网 版权所有
			<br />京ICP证120085号 京ICP备16004154号 京网文[2012]0620-206号
			<br />京公网安备 11011202000608号
		</div>
	</body>
	<script type="text/javascript" src="js/register.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script type="text/javascript">
		//	    $("#password2").blur(function(){
		//	    	var check = $("#password").attr("value") == $("#password2").attr("value")
		//	    	if(check) {
		//	    		$(".message").CSS("display","none")
		//	    	} else {
		//	    		$(".message").CSS("display","block")
		//	    	}
		//	    })
		//      $(function(){
		//      	$.ajax({
		//      		type:"get",
		//      		url:"VerifyCodeServlet",
		//      		async:true,
		//      		dataType:"json",
		//      		success:function(data) {
		////                   $("#img").attr("src",buffImg)
		////                   alert(code)
		//                   console.log(data)
		//      		},
		//      		error:function(XMLHttpRequest, textStatus, errorThrown){
		//      		     console.log(XMLHttpRequest)
		//      		     console.log(textStatus)
		//      		     console.log(errorThrown)
		//      	    }
		//      	})
		//      })
		function register() {
			$.ajax({
				type: "post",
				url: "./Register",
				traditional: false,
				data: {
					"status": $("#status").val(),
					"form-account": $("#account").attr("value"),
					"form-password": $("#password").attr("value"),
					"email": $("#email").attr("value"),
					"code": $("#code").attr("value")
				},
				async: true,
				dataType: "json",
				success: function(data) {
					console.log(data)
					$("#mess").text(data.mess)
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					console.log(XMLHttpRequest)
					console.log(textStatus)
					console.log(errorThrown)
				}
			});
		}
		//		$("#code").blur(function(){
		//			var realCode = "<%=request.getSession().getAttribute("validateCode")%>"
		//			var inputCode = $("#code").attr("value")
		//			var check = realCode == inputCode
		//			alert(check)
		//		})
		$("#reflesh").click(function() {
			//	      	$.ajax({
			//      		type:"get",
			//      		url:"./VerifyCodeServlet",
			//      		data:{
			//      			"flag":Math.random()
			//      		},
			//      		async:true,
			//      		success:function(buffImg) {
			//                 $("#img").attr("src",buffImg)
			//      		},
			//      		error:function(XMLHttpRequest, textStatus, errorThrown){
			//      		     console.log(XMLHttpRequest)
			//      		     console.log(textStatus)
			//      		     console.log(errorThrown)
			//      	    }
			//      	})	   
			$("#img").attr("src", "VerifyCodeServlet?flag=" + Math.random());
		})
	</script>

</html>