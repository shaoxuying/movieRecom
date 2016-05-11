<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请登录 - 电影推荐系统</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/layer/skin/layer.css">

<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>

</head>
<body>

<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container" style="margin-top:80px;">
			<div  id="logintitle"><h1>电影推荐系统</h1></div>
			<form class="form">
				<input type="text" placeholder="UserID" name="userId" id="userId" >
				<input type="password" placeholder="Password" name="userPwd" id="userPwd">
				<div style="width: 300px; margin-left:auto; margin-right:auto;">
					<span style="float:left;"><input type="checkbox" name="rememberMe" id="rememberMe"></span>
					<span style="margin-left:3px; float:left; font-weight: 600; font-size: 18px;">记住我</span>
					<u style="float:right; font-weight:600; font-size:18px; cursor:pointer;" id="forgetPwd" onclick="forgetPwd();">忘记密码</u>
				</div>
				<button type="submit" id="login-button"><span style="font-weight: 900;">登录</span></button>
				
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		
	</div>
</div>

<script>
$('#login-button').click(function (event) {
	
	event.preventDefault();
	var userIdVal = $('#userId').val();
	var passwordVal = $('#userPwd').val();
	var rememberMeVal='0';
	if(document.getElementById("rememberMe").checked){
	    rememberMeVal = '1';
	}
	
	if(userIdVal == ""){
		layer.tips('请输入用户ID', '#userId');
	}else if(passwordVal == ""){
		layer.tips('请输入用密码', '#userPwd');
	}
	
	if(userIdVal != "" && passwordVal !=""){
		$.post('/movieRecom/login/checkLogin.action',{userId:userIdVal,userPwd:passwordVal,rememberMe:rememberMeVal},function(data){
			
			if (data == 'error1') {
				layer.tips('用户名不存在', '#userId');
			} else if (data == 'error2') {
				layer.tips('密码错误', '#userPwd');
			} else if (data == 'user') {
				$('form').fadeOut(500);
 				$('#logintitle').fadeOut(100,function(){
					$('#logintitle').html('<h1>Welcome</h1>');
					$('#logintitle').fadeIn(100,function(){
						$('.wrapper').addClass('form-success'); 
		 				setTimeout(function(){location.href = '/movieRecom/movie/queryByCurruserId.action';}, 1200);
					});
				});
			} else if (data == 'admin') {
				$('form').fadeOut(500);
 				$('#logintitle').fadeOut(100,function(){
					$('#logintitle').html('<h1>Welcome</h1>');
					$('#logintitle').fadeIn(100,function(){
						$('.wrapper').addClass('form-success'); 
		 				setTimeout(function(){location.href = '/movieRecom/user/queryUserId.action?startId=1';}, 1200);
					});
				});
			}
		});
	}
});

function forgetPwd(){
	layer.open({
		type: 2,
		title: '',
		maxmin: false,
		shadeClose: true, 
		area : ['400px' , '200px'],
		content: '<%=request.getContextPath()%>/pages/system/ForgetPwd.jsp'
	});
}



</script>

</body>
</html>