<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="비밀번호 찾기" />

<%@ include file="/view/usr/common/header.jsp" %>

	<script>
		const findLoginPw = async function() {
			let inputLoginId = $("input[name='loginId']");
			let inputEmail = $("input[name='email']");
			
			let inputLoginIdTrim = inputLoginId.val(inputLoginId.val().trim());
			let inputEmailTrim = inputEmail.val(inputEmail.val().trim());
			
			if (inputLoginIdTrim.val().length == 0) {
				alert('아이디를 입력해주세요');
				inputLoginId.focus();
				return;
			}
			
			if (inputEmailTrim.val().length == 0) {
				alert('이메일을 입력해주세요');
				inputEmail.focus();
				return;
			}
	
			$('#findBtn').prop('disabled', true);
			$('.loading-layer').show();
			
			const rs = await doFindLoginPw(inputLoginIdTrim.val(), inputEmailTrim.val());
	
			if (rs) {
				alert(rs.rsMsg);
				$('.loading-layer').hide();
				$('#findBtn').prop('disabled', false);
				
				if (rs.success) {
					location.replace("login");
				} else {
					inputLoginId.val('');
					inputEmail.val('');
					inputLoginId.focus();
				}
			}
		}
		
		const doFindLoginPw = function(loginId, email) {
			return $.ajax({
				url : '/usr/member/doFindLoginPw',
				type : 'GET',
				data : {
					loginId : loginId,
					email : email
				},
				dataType : 'json'
			})
		}
	</script>

	<section class="mt-8">
		<div class="container mx-auto">
			<div class="table-box">
				<table class="table">
					<tr>
						<th>아이디</th>
						<td><input class="input input-neutral" name="loginId" type="text" /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class="input input-neutral" name="email" type="text" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="findBtn" class="btn btn-neutral btn-outline btn-sm btn-wide" onclick="findLoginPw();">비밀번호 찾기</button>
							<div class="mt-4 loading-layer hidden">
								<span class="loading loading-bars loading-xl"></span>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="p-6 flex justify-between">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
				<div class="flex">
					<div class="mr-2"><a class="btn btn-neutral btn-outline btn-xs" href="/usr/member/findLoginId">아이디 찾기</a></div>
					<div><a class="btn btn-neutral btn-outline btn-xs" href="/usr/member/login">로그인</a></div>
				</div>
			</div>
		</div>
	</section>

<%@ include file="/view/usr/common/footer.jsp" %>