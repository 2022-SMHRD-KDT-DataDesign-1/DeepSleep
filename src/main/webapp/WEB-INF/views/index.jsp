<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">
	<!-- nav 시작  -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${contextPath}/index">ILEM</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle navuser" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-user fa-fw"></i>
				</a>
				<ul class="dropdown-menu dropdown-menu-end navuserSub"	aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="${contextPath}/index">보관함</a></li>

					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="${contextPath}/logout.do">로그아웃</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">

				<!-- 사이드바 수정 -->
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">오토라벨링</div>
						<a class="nav-link" href="${contextPath}/imageupload">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 이미지 업로드
						</a>

						<div class="sb-sidenav-menu-heading">마이페이지</div>
						<a class="nav-link" href="${contextPath}/index">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 보관함
						</a>
						<a class="nav-link" href="${contextPath}/labeledit">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 라벨링 수정
						</a>
						<a class="nav-link" href="${contextPath}/objectdetection">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 라벨링 결과
						</a>
					</div>
				</div>
				<!-- 사이드바 수정 -->

				<div class="sb-sidenav-footer">
					&nbsp;<br>
					<div class="small"><strong>객체탐지 키워드 종류 20가지</strong></div>
					01. tv&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;02. car<br>
					03. bus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;04. cat<br> 
					05. dog&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;06. bed<br>
					07. ship&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;08. bird<br>
					09. tree&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10. train<br>
					11. zebra&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12. chair<br>
					13. table&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14. apple<br>
					15. banana&nbsp;&nbsp;&nbsp;&nbsp;16. person<br>
					17. giraffe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18. airplane<br>
					19. elephant &nbsp;20. bicycle<br>
					&nbsp;<br>
				</div>
			</nav>
		</div>
		<!-- nav 시작 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">보관함</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">마이페이지</a></li>
						<li class="breadcrumb-item active">보관함</li>
					</ol>
					<form action="#">
						<input type="hidden" id="user_id" name="user_id" value="${mvo.id}">
					</form>
					<div class="row">
						<c:choose>
							<c:when test="${mvo.email eq 'admin'}">
								<div class="col-xl-6">
									<div class="card mb-4">
										<div class="card-header">
											<i class="fas fa-chart-area me-1"></i> 총 사용자 일별 업로드 수
											
										</div>
										<div class="card-body">
											<canvas id="allAreaChart" width="100%" height="70"></canvas>
										</div>
									</div>
								</div>
								<div class="col-xl-6">
									<div class="card mb-4">
										<div class="card-header">
											<i class="fas fa-chart-bar me-1"></i> 총 사용자 월별 업로드 수
											
										</div>
										<div class="card-body">
											<canvas id="allBarChart" width="100%" height="70"></canvas>
										</div>
									</div>
								</div>
							</c:when>
							<c:when test="${mvo.email ne 'admin'}">
								<div class="col-xl-6">
									<div class="card mb-4">
										<div class="card-header">
											<i class="fas fa-chart-area me-1"></i> 일별 업로드 수
										</div>
										<div class="card-body">
											<canvas id="myAreaChart" width="100%" height="70"></canvas>
										</div>
									</div>
								</div>
								<div class="col-xl-6">
									<div class="card mb-4">
										<div class="card-header">
											<i class="fas fa-chart-bar me-1"></i> 월별 업로드 수
										</div>
										<div class="card-body">
											<canvas id="myBarChart" width="100%" height="70"></canvas>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>

				</div>

				<!-- 테이블 -->
				<div class="container-fluid px-4">

						<c:choose>
							<c:when test="${empty mvo}">
								<div class="card mb-4">
									<div class="card-header">오토 라벨</div>
									<div class="card-body">
										<p>
											"<a href="${contextPath}/">로그인</a> 하세요."
										</p>
									</div>
							</c:when>
							<c:when test="${mvo.email eq 'admin'}">
								<div class="card mb-4">
								<div class="card-header">수정된 라벨</div>
								<div class="card-body">
									<table id="datatablesSimple">
										<thead>
											<tr>
												<th class='table__th' id="thNum">No.↓</th>
												<th class='table__th' id="thpic1">Original Image</th>
												<th class='table__th' id="thpic2">Result Image</th>
												<th class='table__th'>Detected Object(Before)</th>
												<th class='table__th'>Detected Object(After)</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="vo" items="${list}" varStatus="s">
												<tr>
													<td>${s.count}</td>
													<td><img class="pic_size"
														src="/filepath/${vo.image_path}" style="cursor: pointer;"
														onclick="doImgPop(src)" /></td>
													<td><img class="pic_size"
														src="/filepath/${vo.result_path1}/${vo.result_path2}"
														style="cursor: pointer;" onclick="doImgPop(src)" /></td>
													<td><p>${vo.result_label}</p></td>
													<td><p>${vo.edit_label}</p></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:when>
							<c:when test="${mvo.email ne 'admin'}">
								<div class="card mb-4">
									<div class="card-header">오토 라벨</div>
									<div class="card-body">
										<table id="datatablesSimple">
											<thead>
												<tr>
													<th class='table__th' id="thNum">No.↓</th>
													<th class='table__th' id="thpic1">Original Image</th>
													<th class='table__th' id="thpic2">Result Image</th>
													<th class='table__th'>Detected Object</th>
													<th class='table__th'>Category</th>
													<th class='table__th'>Created date</th>
													<th class='table__th'>Delete</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="vo" items="${list}" varStatus="s">
													<tr>
														<td>${s.count}</td>
														<td><img class="pic_size"
															src="/filepath/${vo.image_path}" style="cursor: pointer;"
															onclick="doImgPop(src)" /></td>
														<td><img class="pic_size"
															src="/filepath/${vo.result_path1}/${vo.result_path2}"
															style="cursor: pointer;" onclick="doImgPop(src)" /></td>
														<td><p>${vo.detected_object}</p></td>
														<td><p>${vo.category}</p></td>
														<td><p>${vo.date}</p></td>
														<td><a class='yjbt'
															onclick="if(confirm('삭제하시겠습니까?')){location.href=this.href}return false;"
															href="boardDelete.do?id=${vo.id}">🗑︎</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
							</c:when>
						</c:choose>

					</div>
				</div>

			</main>

			<%@ include file="./header/footer.jsp"%>
		</div>


	</div>

	<!-- jquery  -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!--  <script th:src="@{js/jquery-3.5.1.min.js}"></script> -->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-area-all.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="assets/demo/chart-bar-all.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>

</body>
</html>