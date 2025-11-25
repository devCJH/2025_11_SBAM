<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="작성"/>

<%@ include file="/view/usr/common/header.jsp" %>
<%@ include file="/view/usr/common/toastUiEditorLib.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">	
			<form action="/usr/article/doWrite" method="post" onsubmit="return submitFormChk(this);">
				<input name="content" type="hidden"/>
				<div class="table-box">
					<table class="table">
						<tr>
							<th>게시판</th>
							<td>
								<c:if test="${req.getLoginedMember().getAuthLevel() == 0 }">
									<label><input class="radio radio-neutral radio-xs" name="boardId" type="radio" value="1" /> 공지</label>
								</c:if>
								&nbsp;&nbsp;&nbsp;
								<label><input class="radio radio-neutral radio-xs" name="boardId" type="radio" value="2" ${boardId == 2 ? "checked" : ""} /> 자유</label>
								&nbsp;&nbsp;&nbsp;
								<label><input class="radio radio-neutral radio-xs" name="boardId" type="radio" value="3" ${boardId == 3 ? "checked" : ""} /> 질문과 답변</label>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="input input-neutral" name="title" type="text"/></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<div id="toast-ui-editor">
									<div>${article.getContent() }</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><button class="btn btn-neutral btn-outline btn-sm btn-wide">작성</button></td>
						</tr>
					</table>
				</div>
			</form>
			<div class="p-6">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
			</div>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>