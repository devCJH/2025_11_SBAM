<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="아이디 찾기" />

<%@ include file="/view/usr/common/header.jsp" %>

	<script>
		const findLoginId = async function() {
			let inputName = $("input[name='name']");
			let inputEmail = $("input[name='email']");
			
			let inputNameTrim = inputName.val(inputName.val().trim());
			let inputEmailTrim = inputEmail.val(inputEmail.val().trim());
			
			if (inputNameTrim.val().length == 0) {
				alert('이름을 입력해주세요');
				inputName.focus();
				return;
			}
			
			if (inputEmailTrim.val().length == 0) {
				alert('이메일을 입력해주세요');
				inputEmail.focus();
				return;
			}
	
			const rs = await doFindLoginId(inputNameTrim.val(), inputEmailTrim.val());
	
			if (rs) {
				alert(rs.rsMsg);
				
				if (rs.success) {
					location.replace("/usr/member/login");
				} else {
					inputName.val('');
					inputEmail.val('');
					inputName.focus();
				}
			}
		}
		
		const doFindLoginId = function(name, email) {
			return $.ajax({
				url : '/usr/member/doFindLoginId',
				type : 'GET',
				data : {
					name : name,
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
						<th>이름</th>
						<td><input class="input input-neutral" name="name" type="text" /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class="input input-neutral" name="email" type="text" /></td>
					</tr>
					<tr>
						<td colspan="2"><button class="btn btn-neutral btn-outline btn-sm btn-wide" onclick="findLoginId();">아이디 찾기</button></td>
					</tr>
				</table>
			</div>
			
			<div class="p-6 flex justify-between">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
				<div class="flex">
					<div class="mr-2"><a class="btn btn-neutral btn-outline btn-xs" href="/usr/member/findLoginPw">비밀번호 찾기</a></div>
					<div><a class="btn btn-neutral btn-outline btn-xs" href="/usr/member/login">로그인</a></div>
				</div>
			</div>
		</div>
	</section>

<%@ include file="/view/usr/common/footer.jsp" %>