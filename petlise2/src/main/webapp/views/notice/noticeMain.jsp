<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/notice/noticeMain.css">
    <link rel="stylesheet" href="/css/style.css" /> 
   

    <title>공지사항메인</title>
    <script src="/js/jquery-3.6.4.min.js"></script>
        <script>
      $(document).ready(function () {});
    </script>  
</head>
 <header>
		<jsp:include page="../header.jsp" />
	</header>
<body>
    
    <div id = "container">
        <!-- 본문 -->
        <div class="notice_wrap">
            <div class="notice_title">
                공지사항	  
            </div> 
          
               <div class="categoryWrap">
        <div class="category">
          <a href="/noticeMain">공지사항</a>
        </div>
        <div class="category">
          <a href="/eventMain">이벤트</a>
        </div>
        <div class="category">
          <a href="/qna">문의사항</a>
        </div>
        <div class="category">
          <a href="/findfamily">가족찾기</a>
        </div>
      </div>
		<!-- searchdiv -->
            <div class="search-container">
             
           
			<div class="searchbox">
				<button id="searchbtn">
					<img src="/images/board/Vector.png" alt="검색">
				</button>
				<c:choose>
					<c:when test="${param.keyword == '' || param.keyword eq null}">
						<input type="text" id="keyword" placeholder="검색">
					</c:when>
					<c:otherwise>
						<input type="text" id="keyword" value="${param.keyword}" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
         
           
            <div class="notice_list_wrap">
                
                <div class="notice_list">
                  
        
                    <div class="notice_list">
			<div class="top">
				<div class="title">제목</div>
				<div class="writer">작성자</div>
				<div class="date" style="padding-left: 45px">날짜</div>
				<div class="view" style="padding-left: 53px">조회</div>
			</div>

			<table style="width: 1240px; margin-top: -14px;" >
				<c:if test="${empty response.list}">
					<tr>
						<td colspan="9" class="no_data_msg">
							<div>
								검색된 결과가 없습니다.<br> 검색어를 다시 입력해 주세요.
							</div>
						</td>
					</tr>
				</c:if>

				<c:forEach var="notices" items="${response.list}">
					<tr>
						<td class="title" >
							<a href="noticeDetail?notice_id=${notices.notice_id}">
								${notices.title}
							</a>
						</td>
						<td class="writer" style="padding-left: 12px;"> ${notices.name}</td>
						<td class="date" style="padding-right:  65px">
							<fmt:formatDate value="${notices.notice_created}" pattern="yyyy-MM-dd :mm" />
						</td>
						<td class="view" style="padding-right:180px">${notices.view_count}</td>
						
				</c:forEach>
			</table>

			<div id="pagination" style="visibility: visible;">
				<c:if test="${not empty response.list}">
					<div class="pagefirst"
						<c:if test="${not response.pagination.existPrevPage}">style="visibility: hidden;"</c:if>>
						<div class="prevArrow"></div>
						<div class="prevArrow" style="margin-left: -3px"></div>
					</div>
					<div class="prev" id="${response.pagination.startPage-1}"
						<c:if test="${not response.pagination.existPrevPage}">style="visibility: hidden;"</c:if>>
						<div class="prevArrow"></div>
					</div>

					<c:choose>
						<c:when test="${empty param.page}">
							<c:forEach begin="1" end="${response.pagination.endPage}" varStatus="vs">
								<c:if test="${vs.index == 1}">
									<div class="pageNumber active">${vs.index}</div>
								</c:if>
								<c:if test="${vs.index != 1}">
									<div class="pageNumber">${vs.index}</div>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach begin="${response.pagination.startPage}" end="${response.pagination.endPage}" varStatus="vs">
								<c:if test="${vs.index == param.page}">
									<div class="pageNumber active">${vs.index}</div>
								</c:if>
								<c:if test="${vs.index != param.page}">
									<div class="pageNumber">${vs.index}</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<div class="next" id="${response.pagination.startPage+10}"
						<c:if test="${not response.pagination.existNextPage}">style="visibility: hidden;"</c:if>>
						<div class="nextArrow"></div>
					</div>
					<div class="pagelast" id="${response.pagination.totalPageCount}"
						<c:if test="${not response.pagination.existNextPage}">style="visibility: hidden;"</c:if>>
						<div class="nextArrow"></div>
						<div class="nextArrow" style="margin-left: -6px"></div>
					</div>
				</c:if>
		             
            </div>
        </div>

</div>
</div>
</div>
</div>
<footer>
<jsp:include page="../footer.jsp" />
</footer>
<!-- pagination -->
	<script src="/js/board/Notice.js"></script>
</body>
</html>