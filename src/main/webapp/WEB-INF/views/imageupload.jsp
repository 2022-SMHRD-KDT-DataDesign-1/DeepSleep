<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="${contextPath}/tables">My Page</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="${contextPath}/logout.do">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="${contextPath}/index">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Layouts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a> <a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="${contextPath}/">Login</a> <a
											class="nav-link" href="${contextPath}/signUpForm">Register</a> <a
											class="nav-link" href="${contextPath}/forgetPwForm">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="404.html">404 Page</a>
									</nav>
								</div>

								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesImage" aria-expanded="false"
									aria-controls="pagesCollapseError"> 오토라벨링
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesImage"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="${contextPath}/imageupload">이미지 업로드</a>
									</nav>
								</div>
								<div class="collapse" id="pagesImage"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="${contextPath}/objectdetection">라벨링 결과</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="${contextPath}/tables">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">오늘도</div>
					조흔 하루 되세용
				</div>
			</nav>
		</div>
		<!-- nav 시작  -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">이미지 업로드</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">이미지 업로드</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                오토라벨링 하기를 원하는 이미지를 업로드 해주세요.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <!-- 이미지 아이콘 -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                </svg>
                                No Label Data
                            </div>
                            <div class="card-body" id="upload">

                                <!-- 이미지 업로드 공간 -->
                                <link href="./css/upload.css" rel="stylesheet">
                                
                                <div class="droppable">
                                    <div class="list"></div>
                                    <div class="info">
                                      <div class="info-drag info-item">
                                        <svg class="info-svg" fill="#3f4754" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                          <path class="filled-ball" d="M149.332031 360.078125c0 41.238281-33.429687 74.667969-74.664062 74.667969C33.429688 434.746094 0 401.316406 0 360.078125c0-41.234375 33.429688-74.664063 74.667969-74.664063 41.234375 0 74.664062 33.429688 74.664062 74.664063zm0 0" fill="#e0c3fc"/>
                                          <path class="ball" d="M220.332031 304.078125c0 41.238281-33.429687 74.667969-74.664062 74.667969C104.429688 378.746094 71 345.316406 71 304.078125c0-41.234375 33.429688-74.664063 74.667969-74.664063 41.234375 0 74.664062 33.429688 74.664062 74.664063zm0 0" fill="#8ec5fc" opacity="0" />
                                          <path class="hand" d="M331.734375 509.414062H202.667969c-5.890625 0-10.667969-4.78125-10.667969-10.667968 0-29.417969 23.9375-53.332032 53.332031-53.332032H262.25l-81.558594-81.558593c-12.96875-12.96875-12.96875-34.113281 0-47.082031 12.992188-12.949219 34.113282-12.949219 47.085938 0l19.132812 19.113281c1.625-3.625 3.90625-7.039063 6.890625-10.027344 7.40625-7.402344 18.050781-10.835937 28.203125-9.429687 1.21875-6.3125 4.246094-12.351563 9.132813-17.234376 9.320312-9.34375 22.824219-11.96875 34.496093-7.894531 1.554688-4.90625 4.289063-9.535156 8.167969-13.441406 12.972657-12.96875 34.113281-12.96875 47.085938 0l33.066406 33.089844C435.902344 332.902344 448 362.105469 448 393.167969c0 64.105469-52.160156 116.246093-116.265625 116.246093zm-116.585937-21.335937h116.585937c52.351563 0 94.933594-42.578125 94.933594-94.910156 0-25.367188-9.878907-49.214844-27.796875-67.113281l-33.070313-33.089844c-4.671875-4.671875-12.242187-4.671875-16.914062 0s-4.671875 12.246094 0 16.917968C350.953125 311.953125 352 314.683594 352 317.414062c0 2.730469-1.046875 5.460938-3.113281 7.550782-4.160157 4.160156-10.925781 4.160156-15.085938 0l-10.664062-10.667969c-4.671875-4.671875-12.246094-4.671875-16.917969 0-2.261719 2.242187-3.5 5.269531-3.5 8.449219 0 3.179687 1.238281 6.207031 3.5 8.449218l10.667969 10.664063C318.953125 343.953125 320 346.683594 320 349.414062c0 2.730469-1.046875 5.460938-3.113281 7.550782-4.160157 4.160156-10.925781 4.160156-15.085938 0l-16-16c-4.519531-4.5-12.394531-4.5-16.914062 0-2.261719 2.238281-3.5 5.269531-3.5 8.449218 0 3.175782 1.238281 6.164063 3.476562 8.445313l26.6875 26.691406c2.070313 2.066407 3.117188 4.796875 3.117188 7.527344s-1.046875 5.460937-3.117188 7.554687c-4.160156 4.160157-10.921875 4.160157-15.082031 0l-67.777344-67.777343c-4.671875-4.671875-12.242187-4.671875-16.914062 0-2.261719 2.238281-3.5 5.269531-3.5 8.449219 0 3.175781 1.238281 6.207031 3.5 8.445312l99.773437 99.777344c3.050781 3.050781 3.96875 7.636718 2.304688 11.625-1.640625 3.992187-5.546875 6.59375-9.855469 6.59375h-42.667969c-13.90625 0-25.769531 8.917968-30.183593 21.332031zm0 0"/>
                                          <path d="M74.667969 434.746094C33.492188 434.746094 0 401.253906 0 360.078125c0-41.171875 33.492188-74.664063 74.667969-74.664063 41.171875 0 74.664062 33.492188 74.664062 74.664063 0 41.175781-33.492187 74.667969-74.664062 74.667969zm0-128c-29.398438 0-53.335938 23.914062-53.335938 53.332031 0 29.421875 23.9375 53.335937 53.335938 53.335937C104.0625 413.414062 128 389.5 128 360.078125c0-29.417969-23.9375-53.332031-53.332031-53.332031zm0 0"/>
                                          <path d="M452.414062 144.976562c-4.796874 0-9.171874-3.265624-10.34375-8.148437-1.386718-5.742187 2.132813-11.5 7.851563-12.886719 5.78125-1.410156 11.261719-3.753906 16.253906-6.976562 4.949219-3.15625 11.5625-1.75 14.742188 3.199218 3.179687 4.949219 1.769531 11.5625-3.199219 14.742188-7 4.5-14.65625 7.785156-22.765625 9.769531-.851563.191407-1.707031.300781-2.539063.300781zm-41.703124-4.011718c-1.472657 0-2.988282-.320313-4.4375-.960938-7.554688-3.453125-14.464844-8.128906-20.503907-13.910156-4.265625-4.050781-4.414062-10.8125-.339843-15.082031 4.074218-4.265625 10.835937-4.4375 15.082031-.339844 4.308593 4.117187 9.238281 7.464844 14.65625 9.917969 5.355469 2.457031 7.703125 8.769531 5.269531 14.144531-1.792969 3.925781-5.675781 6.230469-9.726562 6.230469zm87.125-37.289063c-1.152344 0-2.328126-.195312-3.5-.578125-5.566407-1.917968-8.511719-8-6.59375-13.566406 1.941406-5.589844 2.925781-11.457031 2.925781-17.453125 0-5.117187-.707031-10.175781-2.132813-15.015625-1.664062-5.65625 1.578125-11.5625 7.230469-13.25 5.71875-1.640625 11.582031 1.601562 13.246094 7.234375C510.996094 57.871094 512 64.953125 512 72.101562c0 8.363282-1.367188 16.574219-4.074219 24.40625-1.535156 4.414063-5.675781 7.167969-10.089843 7.167969zM373.953125 91.835938c-5.226563 0-9.773437-3.839844-10.5625-9.152344-.488281-3.480469-.722656-7.019532-.722656-10.625 0-4.820313.445312-9.535156 1.34375-14.121094 1.109375-5.761719 6.65625-9.515625 12.5-8.449219 5.78125 1.109375 9.558593 6.699219 8.449219 12.5C384.339844 65.253906 384 68.625 384 72.078125c0 2.605469.171875 5.121094.535156 7.574219.832032 5.824218-3.203125 11.242187-9.046875 12.074218-.511719.085938-1.023437.109376-1.535156.109376zm21.480469-57.453126c-2.984375 0-5.949219-1.257812-8.0625-3.691406-3.863282-4.4375-3.371094-11.175781 1.066406-15.039062 6.292969-5.460938 13.417969-9.792969 21.121094-12.882813 5.4375-2.21875 11.6875.445313 13.867187 5.90625 2.195313 5.460938-.449219 11.691407-5.910156 13.867188-5.527344 2.21875-10.605469 5.332031-15.125 9.238281-1.984375 1.75-4.480469 2.601562-6.957031 2.601562zm79.019531-3.773437c-2.15625 0-4.308594-.640625-6.1875-1.984375-4.839844-3.457031-10.195313-6.058594-15.890625-7.722656-5.65625-1.664063-8.898438-7.574219-7.234375-13.25 1.664063-5.652344 7.550781-8.851563 13.25-7.230469 8 2.347656 15.507813 5.992187 22.292969 10.859375 4.800781 3.433594 5.910156 10.089844 2.472656 14.867188-2.109375 2.902343-5.375 4.460937-8.703125 4.460937zm0 0"/>
                                          <path d="M106.667969 306.746094c-.832031 0-1.664063-.105469-2.519531-.296875-5.738282-1.367188-9.257813-7.148438-7.871094-12.886719 1.664062-6.914062 4.585937-14.398438 8.703125-22.230469 2.730469-5.203125 9.21875-7.273437 14.402343-4.5 5.226563 2.730469 7.230469 9.171875 4.5 14.398438-3.285156 6.292969-5.609374 12.117187-6.847656 17.324219-1.171875 4.90625-5.546875 8.191406-10.367187 8.191406zM138.515625 251.75c-2.367187 0-4.777344-.789062-6.738281-2.410156-4.566406-3.734375-5.226563-10.453125-1.496094-15.019532 4.480469-5.460937 9.324219-11.007812 14.464844-16.578124 4.011718-4.328126 10.730468-4.585938 15.082031-.597657 4.332031 4.011719 4.585937 10.753907.597656 15.085938-4.863281 5.246093-9.40625 10.453125-13.632812 15.613281-2.132813 2.582031-5.183594 3.90625-8.277344 3.90625zm44.355469-46.1875c-2.882813 0-5.761719-1.152344-7.851563-3.457031-3.988281-4.328125-3.691406-11.09375.640625-15.082031 5.289063-4.863282 10.707032-9.683594 16.253906-14.421876 4.460938-3.796874 11.179688-3.304687 15.039063 1.175782 3.839844 4.457031 3.308594 11.199218-1.171875 15.039062-5.332031 4.585938-10.601562 9.238282-15.679688 13.929688-2.070312 1.878906-4.652343 2.816406-7.230468 2.816406zm49.300781-40.980469c-3.222656 0-6.421875-1.453125-8.511719-4.246093-3.5625-4.695313-2.625-11.390626 2.089844-14.933594 5.800781-4.394532 11.648438-8.660156 17.515625-12.820313 4.796875-3.394531 11.453125-2.261719 14.867187 2.558594 3.414063 4.800781 2.261719 11.457031-2.558593 14.871094-5.675781 4.007812-11.351563 8.148437-16.980469 12.414062-1.921875 1.472657-4.183594 2.15625-6.421875 2.15625zm52.949219-36.054687c-3.605469 0-7.125-1.835938-9.132813-5.140625-3.050781-5.035157-1.429687-11.585938 3.605469-14.65625 6.421875-3.902344 12.757812-7.550781 18.964844-10.902344 5.183594-2.792969 11.671875-.894531 14.464844 4.289063 2.816406 5.183593.898437 11.648437-4.289063 14.464843-5.90625 3.199219-11.945313 6.675781-18.089844 10.386719-1.75 1.046875-3.648437 1.558594-5.523437 1.558594zm57.300781-28.5c-4.375 0-8.46875-2.710938-10.046875-7.0625-1.984375-5.546875.894531-11.648438 6.441406-13.652344 8.148438-2.921875 15.679688-4.972656 22.378906-6.125 5.757813-.980469 11.304688 2.925781 12.308594 8.75.980469 5.800781-2.921875 11.304688-8.746094 12.308594-5.460937.917968-11.777343 2.664062-18.730468 5.160156-1.195313.40625-2.410156.621094-3.605469.621094zm0 0"/>
                                        </svg>
                                        <div class="info-text">Drag an image to upload</div>
                                      </div>
                                    </div>
                                </div>
                                <!-- 버튼 -->
                                <div class="btnsty">
                                <button type="button" class="btn btn-outline-primary" id="key1">키워드 입력</button>
                                <button type="button" class="btn btn-outline-primary">전체 객체</button>
                                </div>
                                <div class="addInput">
                                
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <!-- gsap 애니메이션 js보다 위에 둘 것 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.6/gsap.min.js"></script>
		
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<!-- 업로드 js -->
        <script src="./js/upload.js"></script>
		
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>

        <!-- 부트스트랩 -->
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
        <!-- 위에 부트스트랩 5버전 적용시키면 드랍다운 토글 안먹음 주의 -->

        
    </body>
</html>