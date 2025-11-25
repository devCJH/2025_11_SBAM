<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="API TEST3"/>

<%@ include file="/view/usr/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<div>의료기관 정보</div>
			<div class="table-box">
				<table class="table">
					<tr>
						<th>병원종류</th>
						<th>의료기관명칭</th>
						<th>병실 수</th>
						<th>병상 수</th>
						<th>법인 구분</th>
						<th>개설일자</th>
						<th>소재지 주소</th>
						<th>전화번호</th>
						<th>팩스번호</th>
					</tr>
					<c:forEach items="${mdlcnst }" var="md">
						<tr class="hover:bg-base-300">
							<td>${md.hsptlKnd }</td>
							<td>${md.hsptlNm }</td>
							<td>${md.roomSo }</td>
							<td>${md.patntCo }</td>
							<td>${md.fondSe }</td>
							<td>${md.estblde }</td>
							<td>${md.locplc }</td>
							<td>${md.telno }</td>
							<td>${md.fxnum }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>

<%@ include file="/view/usr/common/footer.jsp" %>