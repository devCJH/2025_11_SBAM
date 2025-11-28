<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="메인"/>

<%@ include file="/view/usr/common/header.jsp" %>
	
	<section class="mt-8">
		<div class="container mx-auto">
			<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat eaque soluta asperiores magni ab inventore non atque quas consequatur libero facere nihil eius earum consectetur dolorem quod recusandae impedit rem.</div>
			<div>안녕~~~</div>
			
			<br />
			<hr />
			<br />
			<div class="flex">
				<div class="mr-5">
					<form action="checkboxSubmit">
						<label>
							<input type="checkbox" name="chk" value="체크박스1" />
							체크박스1
						</label>
						<br />
						<label>
							<input type="checkbox" name="chk" value="체크박스2" />
							체크박스2
						</label>
						<br />
						<label>
							<input type="checkbox" name="chk" value="체크박스3" />
							체크박스3
						</label>
						<br />
						<label>
							<input type="checkbox" name="chk" value="체크박스4" />
							체크박스4
						</label>
						<br />
						<button class="btn btn-neutral btn-outline btn-xs">체크박스 전송</button>
					</form>
				</div>
				
				<br />
				<hr />
				<br />
				
				<script>
					const ajaxChkBtn = function () {
						let param = [];
			         
						$("input[name='ajaxChk']:checked").each(function () {
							param.push($(this).val());
						})
						
						$.ajax({
							url : 'ajaxCheckbox',
							type : 'POST',
							data : {
								chkList : param,
							},
							dataType : 'json',
							success : function(data) {
								for (idx in data) {
									console.log(data[idx]);
								}
							},
			            	error : function(xhr, status, error) {
			               		console.log(error);
			            	}
			         	})
		      		}
				</script>
				
				<div>
			    	<input type="checkbox" name="ajaxChk" value="1" /> ajaxChk1
			    	<br />
			    	<input type="checkbox" name="ajaxChk" value="2" /> ajaxChk2
			    	<br />
			    	<input type="checkbox" name="ajaxChk" value="3" /> ajaxChk3
			    	<br />
			    	<input type="checkbox" name="ajaxChk" value="4" /> ajaxChk4
			    	<br />
			    	<button class="btn btn-neutral btn-outline btn-xs" onclick="ajaxChkBtn();">ajaxChk</button>
				</div>
				
				<div class="ml-10">
					<form action="upload" method="post" enctype="multipart/form-data">
						<div class="flex">
							<fieldset class="fieldset">
		  					  <input type="file" class="file-input" name="file" />
							  <label class="label">최대크기 10MB</label>
							</fieldset>
			  				<button class="btn btn-neutral btn-outline btn-xs m-3">업로드</button>
		  				</div>
					</form>
					<div>
						<a class="btn btn-neutral btn-outline btn-xs m-3" href="/usr/home/view">파일보러가기</a>
					</div>
				</div>
			</div>
			
			<br />
			<hr />
			<br />
			
			<script>
				let stompClient = null;
		
			    const connect = function () {
			    	let userId = $('#sender').text();
			    	let socket = new SockJS('/ws-stomp');
					stompClient = Stomp.over(socket);
					
					stompClient.connect({}, function (frame) {
						stompClient.subscribe('/sub/user/' + userId, function (message) {
							let notificationDiv = $('#notifications');
							notificationDiv.append(`<div>\${message.body }</div>`);
						})
					})
			    }
			    
			    const sendMessage = function () {
			    	let recipient = $('#recipient').val();
			    	let content = $('#content').val();
			    	let message = {
			            recipient: recipient,
			            content: content
			        };
			        stompClient.send("/pub/send", {}, JSON.stringify(message));
			    }
			
			    $(function () {
			        connect();
			        $('#sendNotification').click(function () {
			            sendMessage();
			        });
			    });
			</script>
			
			<div>
				<div>알림테스트</div>
				<div>현재 로그인된 회원의 ID : <span id="sender">${req.getLoginedMember().getId() }</span></div>
				<label>
					알림을 받을 사용자 ID : 
					<input class="input input-bordered" id="recipient" type="text">
				</label>
				<br />
				<label>
					알림으로 보낼 메시지 : 
					<input class="input input-bordered" id="content" type="text">
				</label>
				<br />
				
				<button class="btn btn-neutral btn-outline btn-xs" id="sendNotification">알림 보내기</button>
				
				<div>알림으로 받은 메시지 내용</div>
				<div id="notifications"></div>
			</div>
		</div>
	</section>

<%@ include file="/view/usr/common/footer.jsp" %>