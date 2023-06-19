<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Deep Sleep - Image Labeling Every Moment</title>
  <link rel="shortcut icon" href="images/logo.png" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
	
	.LoginForm{overflow:hidden; display:block; height: 775px; margin-top:-60px}
	
	.LF{ background-color: #ffffff ;width: 120%; transform: translateX(-50px) translateY(230px); padding: 100px; height:770px;}

	.LF h1{text-align:left; font-weight: bold; font-size: 60px; margin: -200px 0px 0px 0px;}	
	
	.LF label{color: #d3d3d3}
	
	.form-group{margin-top:80px ; margin-bottom: -35px;}
	
	.memberinfo{margin-top: 40px}
	.memberinfo p{margin-top: 5px; color: #d3d3d3}
	
	
	#fl{margin-left:210px;}
	
	#ju{margin-left: 15px;  color: #6173f4}
	
	#fp{color: #d3d3d3}
	
	#memID{width: 100%; height: 35px}
	#memPW{width: 100%; height: 35px}
	.LoginBtn{background-color: #6173f4 ; color: #ffffff;  border: none; border-radius:10px; width: 100%; height: 40px; margin: -10px 0px 60px 0px }
  
  </style>
  <script type="text/javascript" src="https://ajax.googleapis.com.ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.js"integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
  <script type="text/javascript">
  
  	/* 로그인 */
  	 function login() {
  		var email = $("#email").val();
  		var password = $("#password").val();
  		
  		$.ajax({
  			url : "${contextPath}/login",
  			type : "post",
  			data : {"email" : email, "password" : password},
  			dataType : "text",
  			success : function(data){
				$("#fl").css("display", "none");
  				
				if(data == "success"){ 
					$("#fl").text(" ")
  					location.href = "${contextPath}/index";
 				
  				} else if(data == "fail") {
  					$("#fl").css("display","block")
  					$("#fl").text("아이디 또는 패스워드가 틀렸습니다.")
  					console.log("fail")
  				}
  			},
  			error : function(){
  					console.log("연결 오류.")  				
  			}
  		});
  	} 
  	
	function enterkey(){
		if(window.event.keyCode == 13) { 	// 13 == enter
			login();
		}
	}
  	
		</script>
</head>


<body>

	<div class="container">
		
		
		<div class="LoginForm">
		<div class="LF">
			<h1 align="center">Login</h1>
			<form action="${contextPath}/login.do" method="post" name="login">		
				<div class="form-group">
					<label for="email">Email</label> 
					<input type="text" name="email" id="email" class="form-control" placeholder="Enter Email" maxlength="20">
				</div>
				<div class="form-group">
					<label for="password">Password</label> 
					<input onkeyup="enterkey()" type="password" name="password" id="password" class="form-control" placeholder="Enter password" maxlength="20">
				</div>
				<div class="form-group">
					<span id='fl' style="color:red;"></span>
				</div>
				<div class="form-group">
					<button onclick="login()"  type="button" class="LoginBtn">Start</button>
				</div>
				<div class="memberinfo">
				<a id="fp" href= "${contextPath}/forgetPwForm">Forget password?</a>
				<p>New User? <a id="ju" href="${contextPath}/signUpForm">SignUP</a></p>
				</div>
				
				</div>
			</form>
		</div>
		</div>
		
		
		
	</div>
	<script src="js/jquery.min.js"></script>
</body>

</html>