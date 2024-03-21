<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<title>My Project</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/include/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/include/images/common/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css" /> -->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
		<link rel="stylesheet" href="/resources/include/css/navbar-fixed.css"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" >
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
		<script src="/resources/include/js/common.js"></script>
		
		<style>
			.container-main {
				width: 70%;
				margin: 0 auto;
			}

			.footer {
				text-align: center;
				padding: 20px 0;
				background-color: #f8f9fa; /* Optional: Set your footer's background color */
			}
			 .navbar-custom {
		        height: 100px;
		        line-height: 100px; /* 중앙 정렬을 위해 추가 */
		    }
		   .hidden-banner {
		       
		        position: fixed;
		        top: 0;
		        right: -300px; /* 배너가 열렸을 때의 위치 */
		        width: 300px;
		        height: 100%;
		        background-color: #f0f0f0;
		        z-index: 9999;
		        transition: right 0.3s ease;
		    }
		
		    #banner-con {
		        padding: 20px;
		    }
			#showBannerButton {
			    position: fixed;
			    top: 160px;
			    right: 0px; /* 배너의 너비와 동일한 값으로 설정 */
			    width: 80px;
			    height: 100px;
			    background-color: #007bff;
			    color: #fff;
			    border: none;
			    cursor: pointer;
			    z-index: 10001; /* 배너보다 위에 표시되도록 설정 */
			    padding: 10px;
			    box-sizing: border-box;
			    line-height: 1.5;
			    border-top-left-radius: 25px;
			    border-bottom-left-radius: 25px;
			}
			.container {
				text-align: center;
				margin-top: 110px;
				padding: 20px;
			
			}
			 
		    body {
		        margin: 0;
		        padding: 0;
		        font-family: Arial, sans-serif;
		        display: flex;
		        justify-content: center;
		        align-items: center;
		        height: 100vh;
		    }
		  
		</style>
		
		<script>
		    document.addEventListener("DOMContentLoaded", function() {
		        var showBannerButton = document.getElementById("showBannerButton");
		        var banner = document.getElementById("banner");
		        const bannerCon = document.getElementById('banner-con');
		        
		        showBannerButton.addEventListener("click", function() {
		            if (banner.style.right === "0px") {
		                banner.style.right = "-300px";
		                showBannerButton.style.right = '0'; // 버튼 위치 초기화
		            } else {
		                banner.style.right = "0px";
		                showBannerButton.style.right = bannerCon.offsetWidth + 'px'; // 버튼을 배너 내용의 너비만큼 이동
		            }
		        });
		    });
		</script>

	</head>
	  <%-- 상단 navbar-fixed --%>
	<body >
	<%--class="d-flex h-100 text-center text-bg-dark " --%>
		<nav class="navbar navbar-expand-md fixed-top bg-primary navbar-custom" style="background-color: skyblue; height: 100px;">

			
			<img src="/resources/images/adoption/nav.jpg" alt="Your Image" class="ml-auto" style="height : 100px; width : 200px;" onclick="showBanner()">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Protect Center</a><div><a>&#x1F1FA;&#x1F1F8;</a></div>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<!-- <ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/board/boardList">게시판</a>
						</li>
						<li class="nav-item">
							 <a class="nav-link disabled" aria-disabled="true">Disabled</a>
						</li>
						
					</ul> -->
					<!-- <form class="d-flex" role="search">
						<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form> -->
				</div>
				 <button id="showBannerButton" class="btn btn-primary ml-auto">Menu</button>
				
			</div>
			
		</nav>
		<div id="banner" class="hidden-banner">
				<div id="banner-con">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="/">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList"></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList"></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList"></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList"></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList">게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList"></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/animal/animalList">동물 리스트</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList"></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList">입양 공고</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ap/apList"></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/adoption/adoptionList">입양 후기</a>
						</li>
						<!--<li class="nav-item">
							 <a class="nav-link disabled" aria-disabled="true">Disabled</a>
						</li>-->
						
					</ul>
				</div>
			    <!-- 배너 내용을 여기에 추가합니다 -->
			</div>
					
		<br>
		<br>	
		<br>
		<br>
		<br>
		<br>	
		<br>
		<br>

</html>