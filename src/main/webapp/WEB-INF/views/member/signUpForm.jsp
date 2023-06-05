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
	
	body{background-color: #0f0f0f}
	
	#back {margin: 13px 0px -35px 565px;}
	#Aback { color: #cccccc}
	
	.signUpForm{ background-color: #ffffff; overflow:hidden; display:block; width:52% ; height: 800px; margin:32px 0px 0px 280px ;border-radius:1%;}
	
	.LF{ width: 120%; transform: translateX(-33px) translateY(230px); padding: 100px; height:770px;}

	.LF h1{text-align:left; font-weight: bold; font-size: 55px; margin: -200px 0px 0px 5px;}	
	
	.LF label{color: #d3d3d3}
	
	.form-group{margin-top:40px ; margin-bottom: -30px;}
	
	.memberinfo{margin-top: 40px}
	.memberinfo p{margin-top: 5px; color: #d3d3d3}
	
	
	#fl{margin-left:260px;}
	
	#fl2{margin-left:225px;}
	
	#ju{margin-left: 15px;  color: #6173f4}
	
	#fp{color: #d3d3d3}
	
	.form-control{width: 88%; height: 35px}
	.CreateBtn{background-color: #6173f4 ; color: #ffffff;  border: none; border-radius:10px; width: 90%; height: 40px; margin: 10px 0px 0px 0px }
	.MemCk{background-color: #6173f4 ; color: #ffffff;  border: none; border-radius:10px; width: 40%; height: 40px; margin: 0px 0px 0px 250px}
	.memberinfo{margin:70px 0px 0px 0px}
  </style>
  <script type="text/javascript">
	
  	/* 중복확인  */
  	function registerCheck(){
		var email = $("#email").val();
		$.ajax({
			url : "${contextPath}/registerCheck.do",
			type : "get",
			data : {"email":email},
			success : function(data){
				console.log(data);
				if(data == 0){
					$("#fl").html("사용할 수 있는 이메일 입니다.").css("color","blue");
				}else{
					$("#fl").html("사용할 수 없는 이메일 입니다.").css("color","red");
				}
			},
			error : function(){alert("error");}
		})
	}
	 
  	/* 비밀번호 일치 확인 */
  	function passwordCheck(){
  		var password1 = $("#password1").val();
  		var password2 = $("#password2").val();
  		
  		if(password1 == password2){
				$("#fl2").html("");
				$("#password").val(password1);
  		} else if(password1 != password2){
				$("#fl2").html("비밀번호가 서로 일치하지 않습니다.").css("color","red");
  		}
  		
  	}
  	
  </script>
</head>
<body>

	<div class="container">
	<%-- <jsp:include page="${contextPath}/header.jsp"></jsp:include> --%>
		
		<div class="signUpForm">
		<div id="back"><a id="Aback" href="${contextPath}/">✖</a></div>
		<div class="LF">
			<h1 align="center">Sign Up</h1>
			<form action="${contextPath}/SignUp.do" method="post">
			<input type="hidden" id="password" name="password" value="">				
				<div class="form-group">
					<label for="email">Email</label> 
					<input type="text" name="email" id="email" class="form-control" placeholder="Enter Email" maxlength="20">
				</div>
				<div class="form-group">
					<span id='fl' style="color:red;"></span>
				</div>
				<div class="form-group">
					<button onclick="registerCheck()" type="button" class="MemCk"  >Member verification</button>
				</div>
				<div class="form-group">
					<label for="nickname">nickname</label> 
					<input type="text" name="nickname" id="nickname" class="form-control" placeholder="Enter nickname" maxlength="20">
				</div>
				<div class="form-group">
					<label for="password">Password</label> 
					<input onkeyup="passwordCheck()" type="password" name="password1" id="password1" class="form-control" placeholder="Enter password" maxlength="20">
				</div>
				<div class="form-group">
					<label for="password">Password Check</label> 
					<input onkeyup="passwordCheck()" type="password" name="password2" id="password2" class="form-control" placeholder="Enter password" maxlength="20">
				</div>
				<div class="form-group">
					<span id='fl2' style="color:red;"></span>
				</div>
				<div class="form-group">
					<button type="submit" class="CreateBtn" >CREATE</button>
				</div>
				 
				<div class="memberinfo">
				<a id="fp" href= "${contextPath}/">되돌아가기</a>
				</div>
				
				</div>
			</form>
		</div>
		</div>
	<%-- <jsp:include page="${contextPath}/footer.jsp"></jsp:include> --%>
	</div>
</body>

</html>