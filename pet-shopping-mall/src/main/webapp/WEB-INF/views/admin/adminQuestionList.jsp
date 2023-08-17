<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
<%-- 1:1 문의 내역 (예라) --%>
<section class="common-section" id="common-section-List">
	<div class="common-title">1:1 문의 내역 (관리자)</div>
	<div class="common-container">
		<div class="common-div">
			<form:form name="questionSearchFrm" 
				action="${pageContext.request.contextPath}/admin/adminQuestionSearch.do" method="get">
				<div class="service-search">
					<img src="${pageContext.request.contextPath}/resources/images/home/search.png" alt="">
					<input type="text" name="searchKeyword" id="searchKeyword" value="" placeholder="제목 또는 내용" required>
				<div class="searchKeyword2">
       			<input type="submit" id="searchKeyword2" value="검색">
       			</div>
			</div>
			</form:form>
			<div class="service-util-div">
				<table class="service-product-utility-admin">
					<thead>
						<tr>
							<th>번호</th>
							<th>상태</th>
							<th>아이디</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${questions}" var="question" varStatus="vs">
							<tr class="question-row">
								<td>
									<a href="${pageContext.request.contextPath}/servicecenter/inquiry/questionDetail.do?questionId=${question.questionId}">${question.questionId}</a>
								</td>
								<td>
									<a href="${pageContext.request.contextPath}/servicecenter/inquiry/questionDetail.do?questionId=${question.questionId}">
								<c:if test="${question.answerCount <= 0}"><span>답변대기</span></c:if>
								<c:if test="${question.answerCount >= 1}">답변완료</c:if>
								</td>
								<td><a href="${pageContext.request.contextPath}/servicecenter/inquiry/questionDetail.do?questionId=${question.questionId}">${question.questionMemberId}</a></td>
								<td><a href="${pageContext.request.contextPath}/servicecenter/inquiry/questionDetail.do?questionId=${question.questionId}">${question.questionTitle}</a></td>
								<td class="qna-date">
									<a href="${pageContext.request.contextPath}/servicecenter/inquiry/questionDetail.do?questionId=${question.questionId}">
									<fmt:parseDate value="${question.questionCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm" var="questionCreatedAt" />
									<fmt:formatDate value="${questionCreatedAt}" pattern="yy/MM/dd" /></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<nav aria-label="...">
 	<ul class="pagination pagination-sm">
    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
        <li class="page-item ${page == pageNumber ? 'active' : ''}">
            <a class="page-link" href="${pageContext.request.contextPath}/servicecenter/inquiry/questionList.do?page=${pageNumber}">
                   <span class="page-number">${pageNumber}</span>
               </a>
        </li>
    </c:forEach>
</ul>
</nav>
</section>
<script>
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />