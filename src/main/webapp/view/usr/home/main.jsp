<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="메인"/>

<%@ include file="/view/usr/common/header.jsp" %>
	
	<script>
		const ajaxSample1 = function() {
			$.ajax({
				url : '/usr/home/ajaxSample1',
				type : 'get',
				dataType : 'text',
				success : function(data) {
					$('#msg').html(`비동기 통신 성공 - [\${data}] 를 수신함`);
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})
		}
		
		const ajaxSample2 = function() {
			$.ajax({
				url : '/usr/home/ajaxSample2',
				type : 'get',
				data : {
					t1 : '비동기 테스트',
					t2 : '123'
				},
				dataType : 'text',
				success : function(data) {
					console.log(data);
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})
		}
	</script>
	
	<section class="mt-8">
		<div class="container mx-auto">
			<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat eaque soluta asperiores magni ab inventore non atque quas consequatur libero facere nihil eius earum consectetur dolorem quod recusandae impedit rem.</div>
			<div id="msg">안녕~~~</div>
			<div><button onclick="ajaxSample1();">ajaxSample1 호출 버튼</button><button onclick="ajaxSample2();">ajaxSample2 호출 버튼</button></div>
		</div>
	</section>

<%@ include file="/view/usr/common/footer.jsp" %>