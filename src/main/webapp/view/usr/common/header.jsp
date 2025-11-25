<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html data-theme="light">
<head>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 테일윈드, daisyUI -->
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/resource/css/common.css" />
<link rel="shortcut icon" href="/resource/images/favicon.ico" />
<meta charset="UTF-8">
<title>${pageTitle }</title>
</head>
<body>
	<div class="container h-20 flex mx-auto text-3xl">
		<div><a class="flex h-full px-3 items-center" href="/">로고</a></div>
		<div class="grow flex items-center justify-end mr-5">
			<label class="swap swap-rotate">
			  <!-- this hidden checkbox controls the state -->
			  <input id="swapChk" type="checkbox" onchange="themeSwap();" />
			
			  <!-- sun icon -->
			  <svg
			    class="swap-on h-10 w-10 fill-current"
			    xmlns="http://www.w3.org/2000/svg"
			    viewBox="0 0 24 24">
			    <path
			      d="M5.64,17l-.71.71a1,1,0,0,0,0,1.41,1,1,0,0,0,1.41,0l.71-.71A1,1,0,0,0,5.64,17ZM5,12a1,1,0,0,0-1-1H3a1,1,0,0,0,0,2H4A1,1,0,0,0,5,12Zm7-7a1,1,0,0,0,1-1V3a1,1,0,0,0-2,0V4A1,1,0,0,0,12,5ZM5.64,7.05a1,1,0,0,0,.7.29,1,1,0,0,0,.71-.29,1,1,0,0,0,0-1.41l-.71-.71A1,1,0,0,0,4.93,6.34Zm12,.29a1,1,0,0,0,.7-.29l.71-.71a1,1,0,1,0-1.41-1.41L17,5.64a1,1,0,0,0,0,1.41A1,1,0,0,0,17.66,7.34ZM21,11H20a1,1,0,0,0,0,2h1a1,1,0,0,0,0-2Zm-9,8a1,1,0,0,0-1,1v1a1,1,0,0,0,2,0V20A1,1,0,0,0,12,19ZM18.36,17A1,1,0,0,0,17,18.36l.71.71a1,1,0,0,0,1.41,0,1,1,0,0,0,0-1.41ZM12,6.5A5.5,5.5,0,1,0,17.5,12,5.51,5.51,0,0,0,12,6.5Zm0,9A3.5,3.5,0,1,1,15.5,12,3.5,3.5,0,0,1,12,15.5Z" />
			  </svg>
			
			  <!-- moon icon -->
			  <svg
			    class="swap-off h-10 w-10 fill-current"
			    xmlns="http://www.w3.org/2000/svg"
			    viewBox="0 0 24 24">
			    <path
			      d="M21.64,13a1,1,0,0,0-1.05-.14,8.05,8.05,0,0,1-3.37.73A8.15,8.15,0,0,1,9.08,5.49a8.59,8.59,0,0,1,.25-2A1,1,0,0,0,8,2.36,10.14,10.14,0,1,0,22,14.05,1,1,0,0,0,21.64,13Zm-9.5,6.69A8.14,8.14,0,0,1,7.08,5.22v.27A10.15,10.15,0,0,0,17.22,15.63a9.79,9.79,0,0,0,2.1-.22A8.11,8.11,0,0,1,12.14,19.73Z" />
			  </svg>
			</label>
		</div>
		
		<script>
			const themeInit = function() {
				const theme = localStorage.getItem("theme") ?? "light";
				
				let swapChk = $('#swapChk');
				
				if (theme == "light") {
					swapChk.prop('checked', true);
				} else {
					swapChk.prop('checked', false);
				}
				
				themeApply(theme);
			}
			
			const themeApply = function (themeName) {
				$('html').attr('data-theme', themeName);
			}
			
			const themeSwap = function () {
				const theme = localStorage.getItem("theme") ?? "light";
				
				let editorTheme = $('.toastui-editor-defaultUI');
				
				if (theme == "light") {
					localStorage.setItem("theme", "dark");
					editorTheme.addClass('toastui-editor-dark');
				} else {
					localStorage.setItem("theme", "light");
					editorTheme.removeClass('toastui-editor-dark');
				}
				
				themeApply(localStorage.getItem("theme"));
			}
			
			themeInit();
		</script>
		<ul class="flex header-menu">
			<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 items-center" href="/">HOME</a></li>
			<li>
				<a class="flex h-full px-3 items-center hover:underline underline-offset-8" href="#">LIST</a>
				<ul class="hidden">
					<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 py-1 items-center" href="/usr/article/list?boardId=1">NOTICE</a></li>
					<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 py-1 items-center" href="/usr/article/list?boardId=2">FREE</a></li>
					<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 py-1 items-center" href="/usr/article/list?boardId=3">QNA</a></li>
				</ul>
			</li>
			<c:if test="${req.getLoginedMember().getId() == 0 }">
				<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 items-center" href="/usr/member/join">JOIN</a></li>
				<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 items-center" href="/usr/member/login">LOGIN</a></li>
			</c:if>
			<c:if test="${req.getLoginedMember().getId() != 0 }">
				<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 items-center" href="/usr/member/logout">LOGOUT</a></li>
			</c:if>
			<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 items-center" href="/usr/home/apiTest1">API1</a></li>
			<li class="hover:underline underline-offset-8"><a class="flex h-full px-3 items-center" href="/usr/home/apiTest2">API2</a></li>
		</ul>
	</div>
	
	
	
	
	