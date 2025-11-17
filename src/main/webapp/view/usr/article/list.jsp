<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="${boardName } 게시판"/>

<%@ include file="/view/usr/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<div class="table-box">
				<table class="table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${articles }" var="article">
						<tr class="hover:bg-base-300">
							<td>${article.getId() }</td>
							<td class="hover:underline underline-offset-4"><a href="/usr/article/detail?id=${article.getId() }">${article.getTitle() }</a></td>
							<td>${article.getWriterName() }</td>
							<td>${article.getRegDate() }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="bg-white p-6 flex justify-end">
				<c:if test="${req.getLoginedMember().getId() != 0 }">
					<c:choose>
						<c:when test="${req.getLoginedMember().getAuthLevel() == 0 }">
							<div><a class="btn btn-neutral btn-outline btn-xs" href="/usr/article/write?boardId=${param.boardId }">글쓰기</a></div>
						</c:when>
						<c:otherwise>
							<c:if test="${param.boardId != 1 }">
								<div><a class="btn btn-neutral btn-outline btn-xs" href="/usr/article/write?boardId=${param.boardId }">글쓰기</a></div>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>