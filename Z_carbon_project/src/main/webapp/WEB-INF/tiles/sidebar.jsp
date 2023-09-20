<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--로고-->
	<div class="top">
		<h1>
			<a href="${pageContext.request.contextPath}/dashboard.do"> <img src="${pageContext.request.contextPath}/images/logo_wh.png" alt="임시 로고">
			</a>
		</h1>
	</div>
	<!--로고와 nav 구분선-->
	<hr class="nav_line"></hr>
	<!--nav-->
	<nav>
		<ul class="nav_wrap">
			<li class="nav_list depth1">
				<div class="depth1_box">
					<div class="nav_icon">
						<i class="fa-solid fa-chart-line"></i>
					</div>
					<div class="nav_name" onclick="location.href='${pageContext.request.contextPath}/dashboard.do';">대시보드</div>
				</div>
			</li>
			<li class="nav_list depth1">
				<div class="depth1_box">
					<div class="nav_icon">
						<i class="fa-solid fa-magnifying-glass"></i>
					</div>
					<div class="nav_name">상세 조회</div>
					<i class="fa-solid fa-chevron-down"></i>
				</div>
				<ul class="depth2">
					<li class="nav_list">
						<div class="nav_name" onclick="location.href='${pageContext.request.contextPath}/cf_dispose.do';">배출량현황</div>
					</li>
					<li class="nav_list">
						<div class="nav_name" onclick="location.href='${pageContext.request.contextPath}/cf_lowdispose_detail.do';">감축인벤토리</div>
					</li>
				</ul>
			</li>
			<li class="nav_list depth1">
				<div class="depth1_box">
					<div class="nav_icon">
						<i class="fa-solid fa-gear"></i>
					</div>
					<div class="nav_name">설정</div>
					<i class="fa-solid fa-chevron-down"></i>
				</div>
				<ul class="depth2">
					<li class="nav_list">
						<div class="nav_name" onclick="location.href='${pageContext.request.contextPath}/admin/admin_data.do';">데이터 관리</div>
					</li>
				</ul>
			</li>
		</ul>
	</nav>
	<!--계정 account profile-->
	<div class="bot">
		<div class="account">
			<div class="user_icon">
				<i class="fa-solid fa-user"></i>
			</div>
			<div class="account_name">홍길동</div>
			<button class="account_edit">정보수정</button>
		</div>
		<button class="logout">LOGOUT</button>
	</div>
	<script>
		//클릭된 sidebar 버튼에 active class 추가하기
		$(document).ready(function(){
			$('.nav_list.depth1').click(function(){
				$('.nav_list.depth1').removeClass('active');
				$(this).addClass('active');
			});	
			
			var pageUrl = window.location.href; //창의 url을 가져온다.
			$(window).on('load', function(){ //load가 되었을때 실행
			    $('.nav_list.depth1').siblings('.depth1').removeClass('active'); //다른 active가 있으면 지워준다.
			    $('.depth2 .nav_list .nav_name').siblings('.nav_name').removeClass('active');
			    
			    if (pageUrl.indexOf('cf_dispose') > -1) { //url에 about이라는 글자가 있으면 실행
			        $('.nav_list.depth1').eq(1).addClass('active');
			        $('.depth2 .nav_list .nav_name').eq(0).addClass('active');
			    } else if (pageUrl.indexOf('admin') > -1) { //url에 contact라는 글자가 있으면 실행
			        $('.nav_list.depth1').eq(2).addClass('active');
			        $('.depth2 .nav_list .nav_name').eq(2).addClass('active');
			    } else {
			        $('.nav_list.depth1').eq(0).addClass('active'); 
			        $('.depth2 .nav_list .nav_name').eq(1).addClass('active');
			        //메인 url은 main이라는 단어가 들어가지 않아서 모든 조건이 아닐때 실행하도록 함
			    }
			});
		});
	</script>
</body>
</html>
