<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="수정"/>

<%@ include file="/view/usr/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<form action="/usr/article/doModify" method="post">
				<input name="id" type="hidden" value="${article.getId() }"/>
				<div class="table-box">
					<table class="w-full">
						<tr>
							<th>번호</th>
							<td>${article.getId() }</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${article.getRegDate() }</td>
						</tr>
						<tr>
							<th>수정일</th>
							<td>${article.getUpdateDate() }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="border w-full" name="title" type="text" value="${article.getTitle() }" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="border w-full" name="content">${article.getContent() }</textarea></td>
						</tr>
						<tr>
							<td colspan="2"><button class="submitBtn w-32">수정</button></td>
						</tr>
					</table>
				</div>
			</form>
			<div class="btns mt-3 text-sm flex justify-between">
				<div><button onclick="history.back();">뒤로가기</button></div>
				<div><a class="block" href="/usr/article/delete?id=${article.getId() }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a></div>
			</div>
		</div>
	</section>

<%@ include file="/view/usr/common/footer.jsp" %>