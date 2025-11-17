<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="${boardName } 게시판"/>

<%@ include file="/view/usr/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<div class="ml-8 mb-2">
				<div class="mb-1"><span class="text-2xl">${boardName } 게시판</span></div>
				<div><span>총 : ${articlesCnt }개</span></div>
			</div>
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
			<div class="bg-white px-6 pt-6 flex justify-end">
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
			
			<div class="flex justify-center">
				<div class="join">
					<c:set var="queryString" value="?boardId=${param.boardId }" />
					
					<c:if test="${begin != 1 }">
						<a class="join-item btn btn-sm" href="${queryString }&cPage=1"><i class="fa-solid fa-angles-left"></i></a>
						<a class="join-item btn btn-sm" href="${queryString }&cPage=${begin - 1 }"><i class="fa-solid fa-caret-left"></i></a>
					</c:if>
					<c:forEach begin="${begin }" end="${end }" var="i">
						<a class="join-item btn btn-sm ${cPage == i ? 'btn-active' : '' }" href="${queryString }&cPage=${i }">${i }</a>
					</c:forEach>
					<c:if test="${end != totalPagesCnt }">
						<a class="join-item btn btn-sm" href="${queryString }&cPage=${end + 1 }"><i class="fa-solid fa-caret-right"></i></a>
						<a class="join-item btn btn-sm" href="${queryString }&cPage=${totalPagesCnt }"><i class="fa-solid fa-angles-right"></i></a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>