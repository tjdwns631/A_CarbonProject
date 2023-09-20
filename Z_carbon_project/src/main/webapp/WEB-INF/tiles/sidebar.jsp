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
			    $('.nav_list .depth2').css('display','none');
			    
			    if (pageUrl.indexOf('cf_dispose') > -1) { //url에 cf_dispose(-=현황 조회) 라는 글자가 있으면 실행
			        $('.nav_list.depth1').eq(1).addClass('active'); //상세조회 불 들어오게 하기
			        $('.depth2 .nav_list .nav_name').eq(0).addClass('active'); //현황 조회 색깔 바꾸기
			        
			    } else if (pageUrl.indexOf('admin') > -1) { //url에 admin 이라는 글자가 있으면 실행
			        $('.nav_list.depth1').eq(2).addClass('active'); //설정 불 들어오게 하기
			        $('.depth2 .nav_list .nav_name').eq(2).addClass('active'); //데이터 관리 색깔 바꾸기
		    	} else if (pageUrl.indexOf('cf_lowdispose') > -1) { //url에 cf_lowdispose 라는 글자가 있으면 실행
				        $('.nav_list.depth1').eq(1).addClass('active'); //상세조회 불 들어오게 하기
				        $('.depth2 .nav_list .nav_name').eq(1).addClass('active'); //데이터 관리 색깔 바꾸기
			    } else if (pageUrl.indexOf('dashboard') > -1) { //url에 dashboard 라는 글자가 있으면 실행
			        $('.nav_list.depth1').eq(0).addClass('active'); //대시보드 불 들어오게 하기 
			    }
			    
			    $('.nav_list.active .depth2').css('display','block');
			});
		});
	</script>
</body>
</html>
