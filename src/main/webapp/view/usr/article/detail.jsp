<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="상세"/>

<%@ include file="/view/usr/common/header.jsp" %>
	
	<script>
		$(function() {
			getLikePoint();
			getReplies();
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
	
	<section class="my-4">
		<div class="container mx-auto">
			<div id="replyArea">
				<div class="text-lg">댓글</div>
			</div>
			
			<script>
				const getReplies = function (){
					$.ajax({
						url : '/usr/reply/list',
						type : 'get',
						data : {
							relTypeCode : 'article',
							relId : ${article.getId() }
						},
						dataType : 'json',
						success : function(data) {
							for (idx in data) {
								let addHtml = `
									<div class="py-2 border-b-2 border-gray-200 pl-20">
										<div class="font-semibold">\${data[idx].writerName }</div>
										<div class="text-lg my-1 ml-2">\${data[idx].content }</div>
										<div class="text-xs text-gray-400">\${data[idx].updateDate }</div>
									</div>
								`;
								
								$('#replyArea').append(addHtml);
							}
						},
						error : function(xhr, status, error) {
							console.log(error);
						}
					})
				}
				
				const writeReply = function () {
					let replyContent = $('#replyContent');
					
					if (replyContent.val().trim().length == 0) {
						alert('내용이 없는 댓글은 작성할 수 없습니다');
						replyContent.focus();
						return;
					}
					
					$.ajax({
						url : '/usr/reply/write',
						type : 'post',
						data : {
							relTypeCode : 'article',
							relId : ${article.getId() },
							content : $('#replyContent').val()
						},
					})
				}
			</script>
			
			<c:if test="${req.getLoginedMember().getId() != 0 }">
				<div class="border-2 border-gray-200 rounded-xl px-4 mt-2">
					<div class="mt-3 mb-2 font-semibold text-sm">닉네임</div>
					<textarea style="resize: none;" class="textarea w-full" id="replyContent"></textarea>
					<div class="flex justify-end my-2">
						<button class="btn btn-neutral btn-outline btn-xs" onclick="writeReply();">등록</button>
					</div>
				</div>
			</c:if>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>