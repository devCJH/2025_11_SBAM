<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="비밀번호 변경" />

<%@ include file="/view/usr/common/header.jsp" %>

	<script>
		const doModifyPw = function () {
			let inputPw = $("input[name='loginPw']");
			let inputPwChk = $("input[name='loginPwChk']");
			
			let inputPwTrim = inputPw.val(inputPw.val().trim());
			let inputPwChkTrim = inputPwChk.val(inputPwChk.val().trim());
			
			if (inputPwTrim.val().length == 0) {
				alert('새 비밀번호를 입력해주세요');
				inputPw.focus();
				return;
			}
			
			if (inputPwTrim.val() != inputPwChkTrim.val()) {
				alert('새 비밀번호가 일치하지 않습니다');
				inputPw.val('');
				inputPwChk.val('');
				inputPw.focus();
				return;
			}
			
			$.ajax({
				url : '/usr/member/doModifyPw',
				type : 'POST',
				data : {
					loginPw : inputPwTrim.val(),
				},
				dataType : 'text',
				success : function(data) {
					alert(data);
					
					if (window.opener && !window.opener.closed) {
						window.opener.handlePopResult();
					}
					
					window.close();
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
						<th>새 비밀번호</th>
						<td><input class="input input-neutral" name="loginPw" type="text" /></td>
					</tr>
					<tr>
						<th>새 비밀번호 확인</th>
						<td><input class="input input-neutral" name="loginPwChk" type="text" /></td>
					</tr>
					<tr>
						<td colspan="2"><button class="btn btn-neutral btn-outline btn-sm btn-wide" onclick="doModifyPw();">변경</button></td>
					</tr>
				</table>
			</div>
		</div>
	</section>

<%@ include file="/view/usr/common/footer.jsp" %>