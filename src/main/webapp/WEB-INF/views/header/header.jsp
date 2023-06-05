<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header role="banner" id="fh5co-header">
        <div class="container">
            <nav class="navbar navbar-default">
                <div class="navbar-header">
                    <!-- Mobile Toggle Menu Button -->
                    <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                    <img class="logo" src="images/logo.png"><a class="navbar-brand" href="index.html">Deep Sleep</a><!-- 브랜드명 수정  -->
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="#" data-nav-section="home"><span>Home</span></a></li>
                        <li><a href="#" data-nav-section="about"><span>About</span></a></li>
                        <li><a href="#" data-nav-section="services"><span>Services</span></a></li>
                        <li><a href="#" data-nav-section="mypage"><span>MyPage</span></a></li>
                        <!-- 상단바 - 로그인 -->
					    <c:if test="${empty mvo}">
			            	<li><a data-toggle="modal" href="#loginModal" onclick="openLoginModal()">Login</a></li>
						</c:if>
						<c:if test="${not empty mvo}">
			            	<li><a href="${contextPath}/logout.do">${mvo.nickname}</a></li>
						</c:if>
                    </ul>
                </div>
            </nav>
      </div>
    </header>
  