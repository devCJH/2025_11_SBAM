<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="마이페이지" />

<%@ include file="/view/usr/common/header.jsp" %>

	<script>
		const accessMember = '${member }';
		
		if (accessMember == '') {
			requestAnimationFrame(() => {
				alert('허용되지 않은 접근입니다');
			})
			
			setTimeout(() => {
				location.replace('/usr/home/main');
			}, 100);
		}
	
		const modifyFormChk = function (form) {
			form.name.value = form.name.value.trim();
			form.email.value = form.email.value.trim();
			
			if (form.name.value.length == 0) {
				alert('이름은 필수 입력 정보입니다');
				form.name.focus();
				return false;
			}
			
			if (form.email.value.length == 0) {
				alert('이메일은 필수 입력 정보입니다');
				form.email.focus();
				return false;
			}
			
			return true;
		}
		
		const modifyBtn = function () {
			let member = {
				id: '${member.getId() }',
				regDate: '${member.getRegDate() }',
				updateDate: '${member.getUpdateDate() }',
				loginId: '${member.getLoginId() }',
				name: '${member.getName() }',
				email: '${member.getEmail() }'
			};
			
			let formHtml = `
				<form action="modify" onsubmit="return modifyFormChk(this);">
					<input type="hidden" name="id" value="\${member.id }" />
					<table class="table">
						<tr>
							<th>번호</th>
							<td>\${member.id }</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td>\${member.regDate.substring(2, 16) }</td>
						</tr>
						<tr>
							<th>정보 수정일</th>
							<td>\${member.updateDate.substring(2, 16) }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>\${member.loginId }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input class="input input-neutral" type="text" name="name" value="\${member.name }" />
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input class="input input-neutral" type="text" name="email" value="\${member.email }" />
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<button type="button" class="btn btn-neutral btn-outline btn-xs" onclick="modifyPwPop();">비밀번호 변경</button>
							</td>
						</tr>
						<tr>
							<td colspan="2"><button class="btn btn-neutral btn-outline btn-sm btn-wide">수정</button></td>
						</tr>
					</table>
				</form>
			`;
			
			$('.table-box').html(formHtml);
			$('#modifyMember').empty();
		}
		
		const modifyPwPop = function () {
			let popOption = 'width=500px, height=500px, top=200px, scrollbars=yes';
			let openUrl = '/usr/member/modifyPwPop';
			
			window.open(openUrl, 'modifyPwPop', popOption);
		}
		
		var handlePopResult = function () {
			location.reload();
		}
	</script>

	<section class="mt-8">
		<div class="container mx-auto">
			<div class="table-box">
				<table class="table">
					<tr>
						<th>번호</th>
						<td>${member.getId() }</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${member.getRegDate().substring(2, 16) }</td>
					</tr>
					<tr>
						<th>정보 수정일</th>
						<td>${member.getUpdateDate().substring(2, 16) }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${member.getLoginId() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${member.getName() }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.getEmail() }</td>
					</tr>
				</table>
			</div>
			
			<div class="p-6 flex justify-between">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
				<div id="modifyMember" class="mr-2"><button class="btn btn-neutral btn-outline btn-xs" onclick="modifyBtn();">회원정보수정</button></div>
			</div>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>