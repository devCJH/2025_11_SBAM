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
			
			<div>
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
		</div>
	</section>

<%@ include file="/view/usr/common/footer.jsp" %>