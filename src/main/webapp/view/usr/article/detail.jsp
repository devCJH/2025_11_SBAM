<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="상세"/>

<%@ include file="/view/usr/common/header.jsp" %>
	
	<script>
		$(function() {
			getLikePoint();
		})
	
		const clickLikePointBtn = async function() {
			let likePointBtn = $('#likePointBtn > i').hasClass('fa-regular');
			
			await $.ajax({
				url : '/usr/likePoint/clickLikePoint',
				type : 'get',
				data : {
					relTypeCode : 'article',
					relId : ${article.getId() },
					likePointBtn : likePointBtn
				}
			})
			
			await getLikePoint();
		}
		
		const getLikePoint = function() {
			$.ajax({
				url : '/usr/likePoint/getLikePoint',
				type : 'get',
				data : {
					relTypeCode : 'article',
					relId : ${article.getId() }
				},
				dataType : 'json',
				success : function(data) {
					$('#likePointCnt').html(data.rsData);
					
					if (data.success) {
						$('#likePointBtn').html(`<i class="fa-solid fa-heart"></i>`);
					} else {
						$('#likePointBtn').html(`<i class="fa-regular fa-heart"></i>`);
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})
		}
	</script>
	
	<section class="mt-8">
		<div class="container mx-auto">
			<div class="table-box">
				<table class="table">
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
						<th>추천수</th>
						<td>
							<c:if test="${req.getLoginedMember().getId() == 0 }">
								<span id="likePointCnt"></span>
							</c:if>
							<c:if test="${req.getLoginedMember().getId() != 0 }">
							    <button class="btn btn-neutral btn-outline btn-xs" onclick="clickLikePointBtn();">
							    	<span id="likePointBtn"></span>
	  							    <span id="likePointCnt"></span>
							    </button>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.getWriterName() }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${article.getTitle() }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${article.getContent() }</td>
					</tr>
				</table>
			</div>
			<div class="bg-white p-6 flex justify-between">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
				<c:if test="${req.getLoginedMember().getId() == article.getMemberId() }">
					<div class="flex">
						<div class="mr-2"><a class="btn btn-neutral btn-outline btn-xs" href="/usr/article/modify?id=${article.getId() }">수정</a></div>
						<div><a class="btn btn-neutral btn-outline btn-xs" href="/usr/article/delete?id=${article.getId() }&boardId=${article.getBoardId() }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a></div>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>