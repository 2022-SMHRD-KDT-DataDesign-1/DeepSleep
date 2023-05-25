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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
 	body{background-color: #dbdbdb6e;}
	
	.LoginForm{overflow:hidden; display:block; height: 900px; margin-top:-60px}
	
	.LF{ background-color: #ffffff ;width: 50%; transform: translateX(554px) translateY(230px); padding: 100px; height:770px;}

	.LF h1{text-align:left; font-weight: bold; font-size: 60px; margin: 25px 0px 40px 0px;}	
	
	.LF label{color: #d3d3d3}
	
	.form-group{margin-top:80px ; margin-bottom: -35px;}
	.form-group p{margin-top: 35px; color: #d3d3d3}
	
	#fp{margin-left:256px; color: #d3d3d3 }
	
	#ju{margin-left: 15px;  color: #a55eff}
	
	
	#memID{width: 100%; height: 35px}
	#memPW{width: 100%; height: 35px}
	.LoginBtn{background-color: #a55eff ; color: #ffffff;  border: none; border-radius:10px; width: 100%; height: 35px; margin: 30px 0px 0px 0px }
	
	.LI img{margin: -539px 0px 0px -15px ; width:50%; height: 769px;}
	
	.LI h3{font-size: 53px ; margin: -505px 0px 0px 39px; color: #ffffff;}
	
	.LI p{font-size: 30px  ;margin: -1px 0px 0px 41px; color: #ffffff; line-height: 45px;}
  </style>

</head>


<body>

	<div class="container">
		
		<%-- <jsp:include page="../common/header.jsp"></jsp:include> --%>
		<div class="LoginForm">
		<div class="LF">
			<h1 align="center">Login</h1>
			<jsp:include page=""></jsp:include>
			<form action="${contextPath}/login.do" method="post">				
				<div class="form-group">
					<label for="email">Email</label> 
					<input type="text" name="email" id="email" class="form-control" placeholder="Enter Email" maxlength="20">
				</div>
				<div class="form-group">
					<label for="password">Password</label> 
					<input type="password" name="password" id="password" class="form-control" placeholder="Enter password" maxlength="20">
				</div>
				<div class="form-group">
				<a id="fp" href="#">Forget password?</a>
					<button type="submit" class="LoginBtn">Start</button>
				<p>New User? <a id="ju" href="#">SignUP</a></p>
				</div>
			</form>
		</div>
		<div class="LI">
			<img src="${contextPath}/resources/images/login.png">
			<h3>Welcome!</h3>
			<p>Please login to
			<br> your account.</p>
		</div>
		</div>
	</div>

</body>
</html>