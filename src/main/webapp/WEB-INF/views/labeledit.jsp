<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

        <!-- 부트스트랩 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <!-- flickity -->
        <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
        <style>
			.btnsty{
			  display: inline-block;
			  width: 100%; 
			  text-align: center;
			}
			
			.addInput{
			  text-align: center;
			}
			
			#inputstyle{
			  border: 0;
			  border-radius: 5px;
			  outline: none;
			  background-color: #8ec5fc;
			}
		</style>
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
		<!-- nav 시작  -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">라벨 수정</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
                            <li class="breadcrumb-item active">라벨링 수정</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                라벨링이 잘못된 이미지를 선택하고 라벨을 수정해주세요. 수정된 데이터는 관리자에게 전송됩니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <!-- 이미지 아이콘 -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                </svg>
                                Object Detection
                            </div>
                            <form action = "${contextPath}/downLoad.do">
                            <div style="background-image: linear-gradient(to right, #6a11cb 0%, #2575fc 100%) !important;" class="card-body" id="upload">

                                <!-- 라벨링 결과 -->
                                <link href="./css/obj.css" rel="stylesheet">

                            <!-- 이중 for 문 -->
							<!-- 여기 for 문 -->
                            <div class="celldiv">
                                <!-- 여기도 for 문 -->
                                <div class="gallery js-flickity"
                                    data-flickity-options='{ "wrapAround": true }'>
                                        <div class="gallery-cell">
                                            <input type="radio" id="myCheckbox1" name = "imgsel">
                                            <label for="myCheckbox1"><img src="./assets/img/윈터13.jpg"></label>
                                        </div>
                                        <div class="gallery-cell">
                                            <input type="radio" id="myCheckbox2" name = "imgsel">
                                            <label for="myCheckbox2"><img src="./assets/img/포켓몬18.jpg"></label>
                                        </div>
                                        <div class="gallery-cell">
                                            <input type="radio" id="myCheckbox3" name = "imgsel">
                                            <label for="myCheckbox3"></label>
                                        </div>
                                        
                                    </div>  
                                    
                             </div>  
                             
                            
                            
                            <!-- 이 버튼들을 이미지를 클릭시 나타나게 할지 흠... 다운로드 클릭시 이미지 선택창 나오게,,, -->
                        <div class="btnsty">
                            <button type="button" class="btn btn-outline-primary" id="key1" style="color:#fff; border-color:#fff;">수정 키워드</button>
                            
                        </div>    
                        <div class="addInput">
                                
                        </div>

                            </div>
                            </form>
                            
                        </div>
                    </div>
                    
                </main>
                <%@ include file="./header/footer.jsp"%>
            </div>
        </div>
        <!-- gsap 애니메이션 js보다 위에 둘 것 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.6/gsap.min.js"></script>
        
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

        <!-- flickity js -->
	    <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="./js/edit.js"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        

        <!-- 부트스트랩 -->
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
        <!-- 위에 부트스트랩 5버전 적용시키면 드랍다운 토글 안먹음 주의 -->

        
        <!-- 이미지 슬라이드 -->
        
        
    </body>
</html>
