<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer id="footer" role="contentinfo">
		<div class="container">
			<div class="row row-bottom-padded-sm">
				<div class="col-md-12">
					<p class="copyright text-center">&copy; 2023 <a href="${contextPath}/"><strong class="stDeep">Deep Sleep</strong></a>. All Rights Reserved. 
				</div>
			</div>
		</div>
	</footer>
    
    <!-- jQuery -->
	<script src="js1/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js1/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js1/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js1/jquery.waypoints.min.js"></script>
	<!-- Owl Carousel -->
	<script src="js1/owl.carousel.min.js"></script>

	<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
	<script src="js1/jquery.style.switcher.js"></script>
	<script>
	$(function(){
		$('#colour-variations ul').styleSwitcher({
			defaultThemeId: 'theme-switch',
			hasPreview: false,
			cookie: {
	          	expires: 30,
	          	isManagingLoad: true
	      	}
		});	
		$('.option-toggle').click(function() {
			$('#colour-variations').toggleClass('sleep');
		});
	});
	</script>

</body>
</html>