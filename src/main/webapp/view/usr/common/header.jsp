<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 테일윈드 -->
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<link rel="stylesheet" href="/resource/css/common.css" />
<script src="/resource/js/common.js"></script>
<meta charset="UTF-8">
<title>${pageTitle }</title>
</head>
<body>
	<div class="container h-20 flex mx-auto text-3xl">
		<div><a class="flex h-full px-3 items-center" href="/">로고</a></div>
		<div class="grow"></div>
		<ul class="flex">
			<li><a class="flex h-full px-3 items-center hover:underline underline-offset-8" href="/">HOME</a></li>
			<li><a class="flex h-full px-3 items-center hover:underline underline-offset-8" href="/usr/article/list">LIST</a></li>
			<li><a class="flex h-full px-3 items-center hover:underline underline-offset-8" href="/usr/member/join">JOIN</a></li>
		</ul>
	</div>