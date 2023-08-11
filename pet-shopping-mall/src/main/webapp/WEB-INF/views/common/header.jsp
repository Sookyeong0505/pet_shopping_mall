<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>반려동물 쇼핑몰</title>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberLogin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/serviceCenter.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css" />
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"></jsp:include>

   
<body>

<header>
    <div class="header">
        <span id="notification"></span>
        <ul class="utility">
             <li class="login_li">
                <a href="<%= request.getContextPath() %>/member/memberCreateComplete.do">회원가입완료</a>
            </li>
            <li class="login_li">
                <a href="<%= request.getContextPath() %>/member/petProfile.do">펫프로필등록</a>
            </li>
            <li class="login_li">
                <a href="<%= request.getContextPath() %>/member/memberLogin.do">로그인</a>
            </li>
            <li class="signup_li">
                <a href="<%= request.getContextPath() %>/member/memberCreate.do">회원가입</a>
            </li>
			<li class="logout_li">
			        <a href="<%= request.getContextPath() %>/servicecenter/service.do">고객센터</a>
			</li>
			<li class="admin_li">
			        <a href="<%= request.getContextPath() %>/admin/admin.do">관리자페이지</a>
			</li>
        </ul>
        <div class="logo_top_wrap">
	        <div class="logo_wrap">
	        	<!-- 로고 이미지 -->
		        <div class="logo_img">
		         	<a href="${pageContext.request.contextPath}/">
		            	<img src="${pageContext.request.contextPath}/resources/images/home/logo.png" id="center-image" alt="로고"/>
		        	</a>
		        </div>
		    <div class="cdt">
		        <!-- 검색 -->
		        <div class="search_top_btn">
		        <!-- 검색 창 -->
		        	<div class="search_box">
		        		<form name="searchBoxForm" id="searchBoxForm" action="">
		        			<img src="${pageContext.request.contextPath}/resources/images/home/search.png" id="center-image" alt="검색"/>
		        		</form>
		        	</div>
		        </div>
		        <!-- 주문조회 -->
		        <div class="order_checks_top_btn">
		        	<a href="<%= request.getContextPath() %>/member/myPage.do">
		        		<img src="${pageContext.request.contextPath}/resources/images/home/login.png" id="center-image" alt="주문조회"/>
		        	</a>
		        </div>
		        <!-- 장바구니 -->
		        <div class="cart_top_btn">
		       	 	<a href="<%= request.getContextPath() %>/cart/shoppingCart.do">
		        		<img src="${pageContext.request.contextPath}/resources/images/home/cart.png" id="center-image" alt="장바구니"/>
		       		</a>
		       	</div>
		    	</div>
	        </div>
	    </div>
        <div class="menu-container">
            <ul class="nav">
                <ul>
                    <li class="on">
                        <a href="${pageContext.request.contextPath}/product/productList.do" class="font">사료</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do" class="font">간식</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do" class="font">패션용품</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do" class="font">산책용품</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do" class="font">위생용품</a>
                    </li>
                     <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do" class="font">장난감</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do" class="font">고양이</a>
                    </li>
                     <li>
                        <a href="${pageContext.request.contextPath}/product/productList.do" class="font">기타용품</a>
                    </li>
                </ul>
            </ul>
        </div>
    </div>
</header>