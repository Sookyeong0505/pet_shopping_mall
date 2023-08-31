<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sidebar2.jsp" />

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .container {
            margin: 0 auto;
            max-width: 1200px;
        }

        .sub_title {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            line-height: 120px;
        }

        .list {
            display: flex;
            flex-wrap: wrap;
        }
        
        .listImgSize {
        	width: 220px;
        	height:200px !important;
        }

        .box {
            width: 230	px;
            height: 400px;
            margin-right: 25px;
        }

        .box>img {
            width: 100%;
            height: 275px;
            object-fit: cover;
            margin-bottom: 10px;
            cursor: pointer; /* Add cursor pointer to indicate it's clickable */
        }

        .box p {
            font-size: 14px;
            margin: 0;
            padding-bottom: 10px;
        }

        .box h5 {
            margin: 0;
            line-height: 20px;
            font-size: 16px;
        }

        .box span {
            font-size: 14px;
        }

        .box span img {
            width: 10px;
            height: 10px;
            object-fit: cover;
            margin-right: 5px;
        }

        .box:nth-child(4n) {
            margin-left: 0;
            
        }


        /* 이미지 크기 조정 관련 CSS */
        .box img {
            height: auto; /* Reset the height to maintain aspect ratio */
            max-height: 275px; /* Set a maximum height to prevent stretching */
        }
        
        .nextDiv {
        	float: right;
        	margin-left: 10%;
        }
    </style>
</head>

<body>
    <div class="common-section">
        <div class="common-title">찜 목록</div>
        
        <div class="list nextDiv">
            <c:forEach items="${myWishList}" var="list">
                <div class="box">
                    <a href="<c:url value='/product/productDetail.do'/>?productId=${list.PRODUCT_ID}">
                        <img class="listImgSize" src="${pageContext.request.contextPath}/resources/upload/product/${list.IMAGE_RENAMED_FILENAME}" alt="">
                        <p>${list.PRODUCT_NAME}</p>
                        <h5><fmt:formatNumber value="${list.PRODUCT_PRICE}" pattern="#,###"/> 원</h5>
						<span class="review-star"><img src="${pageContext.request.contextPath}/resources/images/상품/star.png" alt="별점" >
						<c:if test="${productInfo.productReviewStarAvg.reviewStarRate == null}">
							<span>0.0</span>
						</c:if>
						<c:if test="${productInfo.productReviewStarAvg.reviewStarRate != 0}" >
							<span>${productInfo.productReviewStarAvg.reviewStarRate}</span>
						</c:if>
						</span>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</body>

</html>