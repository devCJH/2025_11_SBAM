<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="로그인"/>

<%@ include file="/view/usr/common/header.jsp" %>
	
	<script>
		const loginFormSubmit = function(form) {
			form.loginId.value = form.loginId.value.trim();
			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginId.value.length == 0) {
				alert('아이디는 필수 입력 정보입니다');
				form.loginId.focus();
				return false;
			}
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호는 필수 입력 정보입니다');
				form.loginPw.focus();
				return false;
			}
			
			let validLoginInfoMsg = $('#validLoginInfoMsg');
			
			$.ajax({
				url : '/usr/member/validLoginInfo',
				type : 'post',
				data : {
					loginId : form.loginId.value,
					loginPw : form.loginPw.value
				},
				dataType : 'json',
				success : function(data) {
					if (data.fail) {
						validLoginInfoMsg.addClass('text-red-500');
						validLoginInfoMsg.html(`\${data.rsMsg}`);
					} else {
						validLoginInfoMsg.removeClass('text-red-500');
						validLoginInfoMsg.empty();
						
						let addInputHidden = `
							<input type='hidden' name='loginedMemberId' value='\${data.rsData.id}' />
							<input type='hidden' name='loginedMemberAuthLevel' value='\${data.rsData.authLevel}' />
						`

						$(form).append(addInputHidden);
						
						form.submit();
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
			<form action="/usr/member/doLogin" method="post" onsubmit="loginFormSubmit(this); return false;">
				<div class="flex justify-center">
					<fieldset class="fieldset bg-base-200 border-base-300 rounded-box w-xs border p-4">
					  <legend class="fieldset-legend">로그인</legend>
					
					  <label class="label">아이디</label>
					  <input name="loginId" type="text" class="input"/>
					
					  <label class="label">비밀번호</label>
					  <input name="loginPw" type="password" class="input"/>
					  
					  <div id="validLoginInfoMsg" class="mt-2 text-sm h-5 text-center mx-auto w-72"></div>
					  <button class="btn btn-neutral mt-2">로그인</button>
					</fieldset>
				</div>
			</form>
			<div class="mt-4 w-xs mx-auto flex justify-between">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
				<div class="flex">
					<div class="mr-2"><a class="btn btn-neutral btn-outline btn-xs" href="/usr/member/findLoginId">아이디 찾기</a></div>
					<div><a class="btn btn-neutral btn-outline btn-xs" href="/usr/member/findLoginPw">비밀번호 찾기</a></div>
				</div>
			</div>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>