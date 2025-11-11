<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="회원가입"/>

<%@ include file="/view/usr/common/header.jsp" %>
	
	<script>
		let validLoginId = null;
	
		const joinFormSubmit = function(form) {
			form.loginId.value = form.loginId.value.trim();
			form.loginPw.value = form.loginPw.value.trim();
			form.loginPwChk.value = form.loginPwChk.value.trim();
			form.name.value = form.name.value.trim();
			
			if (form.loginId.value.length == 0) {
				alert('아이디는 필수 입력 정보입니다');
				form.loginId.focus();
				return false;
			}
			
			if (form.loginId.value != validLoginId) {
				alert('[ ' + form.loginId.value + ' ]은(는) 사용할 수 없는 아이디입니다');
				form.loginId.value = '';
				form.loginId.focus();
				return false;
			}
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호는 필수 입력 정보입니다');
				form.loginPw.focus();
				return false;
			}
			
			if (form.name.value.length == 0) {
				alert('이름은 필수 입력 정보입니다');
				form.name.focus();
				return false;
			}
			
			if (form.loginPw.value != form.loginPwChk.value) {
				alert('비밀번호가 일치하지 않습니다');
				form.loginPw.value = '';
				form.loginPwChk.value = '';
				form.loginPw.focus();
				return false;
			}
			
			return true;
		}
	
		const loginIdDupChk = function(el) {
			el.value = el.value.trim();

			let chkMsg = $('#chkMsg');
			
			if (el.value.length == 0) {
				chkMsg.removeClass('text-green-500');
				chkMsg.addClass('text-red-500');
				chkMsg.html('아이디는 필수 입력 정보입니다');
				return;
			}
			
			$.ajax({
				url : '/usr/member/loginIdDupChk',
				type : 'get',
				data : {
					loginId : el.value
				},
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						chkMsg.removeClass('text-red-500');
						chkMsg.addClass('text-green-500');
						chkMsg.html(`\${data.rsMsg}`);
						validLoginId = el.value
					} else {
						chkMsg.removeClass('text-green-500');
						chkMsg.addClass('text-red-500');
						chkMsg.html(`\${data.rsMsg}`);
						validLoginId = null;
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
			<form action="/usr/member/doJoin" method="post" onsubmit="return joinFormSubmit(this);">
				<div class="table-box">
					<table class="table">
						<tr>
							<th>아이디</th>
							<td>
								<input class="input input-neutral" name="loginId" type="text" onblur="loginIdDupChk(this);"/>
								<div id="chkMsg" class="mt-2 text-sm h-5 text-center mx-auto w-72"></div>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="input input-neutral" name="loginPw" type="text"/></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input class="input input-neutral" name="loginPwChk" type="text"/></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input class="input input-neutral" name="name" type="text"/></td>
						</tr>
						<tr>
							<td colspan="2"><button class="btn btn-neutral btn-outline btn-sm btn-wide">가입</button></td>
						</tr>
					</table>
				</div>
			</form>
			<div class="bg-white p-6">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
			</div>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>