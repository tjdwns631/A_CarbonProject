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
			<!-- 대시보드 -->
			<li class="nav_list depth1">
				<div class="depth1_box">
					<div class="nav_icon">
						<!-- 차트 아이콘 -->
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
							<path d="M64 64c0-17.7-14.3-32-32-32S0 46.3 0 64V400c0 44.2 35.8 80 80 80H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H80c-8.8 0-16-7.2-16-16V64zm406.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L320 210.7l-57.4-57.4c-12.5-12.5-32.8-12.5-45.3 0l-112 112c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L240 221.3l57.4 57.4c12.5 12.5 32.8 12.5 45.3 0l128-128z"/>
						</svg>
					</div>
					<div class="nav_name" onclick="location.href='${pageContext.request.contextPath}/dashboard.do';">대시보드</div>
				</div>
			</li>
			<li class="nav_list depth1">
				<div class="depth1_box">
					<div class="nav_icon">
					<!-- 돋보기 아이콘 -->
					<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
						<path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
					</svg>
					</div>
					<div class="nav_name">상세 조회</div>
					<!-- 화살표 아이콘 -->
					<div class="arrow_down">
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
							<path d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z"/>
						</svg>
					</div>
				</div>
				<ul class="depth2">
					<!-- 상세조회 - 배출량 현황 -->
					<li class="nav_list">
						<div class="nav_name" onclick="location.href='${pageContext.request.contextPath}/cf_dispose.do';">배출량현황</div>
					</li>
					<!-- 상세조회 - 감축 인벤토리 -->
					<li class="nav_list">
						<div class="nav_name" onclick="location.href='${pageContext.request.contextPath}/cf_lowdispose_detail.do';">감축인벤토리</div>
					</li>
				</ul>
			</li>
			<li class="nav_list depth1">
				<div class="depth1_box">
					<div class="nav_icon">
						<!-- 설정 아이콘 -->
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
							<path d="M495.9 166.6c3.2 8.7 .5 18.4-6.4 24.6l-43.3 39.4c1.1 8.3 1.7 16.8 1.7 25.4s-.6 17.1-1.7 25.4l43.3 39.4c6.9 6.2 9.6 15.9 6.4 24.6c-4.4 11.9-9.7 23.3-15.8 34.3l-4.7 8.1c-6.6 11-14 21.4-22.1 31.2c-5.9 7.2-15.7 9.6-24.5 6.8l-55.7-17.7c-13.4 10.3-28.2 18.9-44 25.4l-12.5 57.1c-2 9.1-9 16.3-18.2 17.8c-13.8 2.3-28 3.5-42.5 3.5s-28.7-1.2-42.5-3.5c-9.2-1.5-16.2-8.7-18.2-17.8l-12.5-57.1c-15.8-6.5-30.6-15.1-44-25.4L83.1 425.9c-8.8 2.8-18.6 .3-24.5-6.8c-8.1-9.8-15.5-20.2-22.1-31.2l-4.7-8.1c-6.1-11-11.4-22.4-15.8-34.3c-3.2-8.7-.5-18.4 6.4-24.6l43.3-39.4C64.6 273.1 64 264.6 64 256s.6-17.1 1.7-25.4L22.4 191.2c-6.9-6.2-9.6-15.9-6.4-24.6c4.4-11.9 9.7-23.3 15.8-34.3l4.7-8.1c6.6-11 14-21.4 22.1-31.2c5.9-7.2 15.7-9.6 24.5-6.8l55.7 17.7c13.4-10.3 28.2-18.9 44-25.4l12.5-57.1c2-9.1 9-16.3 18.2-17.8C227.3 1.2 241.5 0 256 0s28.7 1.2 42.5 3.5c9.2 1.5 16.2 8.7 18.2 17.8l12.5 57.1c15.8 6.5 30.6 15.1 44 25.4l55.7-17.7c8.8-2.8 18.6-.3 24.5 6.8c8.1 9.8 15.5 20.2 22.1 31.2l4.7 8.1c6.1 11 11.4 22.4 15.8 34.3zM256 336a80 80 0 1 0 0-160 80 80 0 1 0 0 160z"/>
						</svg>
					</div>
					<div class="nav_name">설정</div>
					<!-- 화살표 아이콘 -->
					<div class="arrow_down">
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
							<path d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z"/>
						</svg>
					</div>
				</div>
				<ul class="depth2">
					<!-- 설정 - 데이터 관리 -->
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
			<div class="account_name" id="user_name">홍길동</div>
		</div>
		<button class="logout" onclick="location.href='${pageContext.request.contextPath}/login.do';">LOGOUT</button>
	</div>
	<script>
		//버튼 눌렀을 때 화면 깜빡이면서 버벅이는 거 수정 할 수 있으면 수정하기ㅋㅋ
		//클릭된 sidebar 버튼에 active class 추가하기
		$(document).ready(function(){
			//sidebar의 버튼을 클릭해서 페이지가 이동하거나 새로고침 됐을 때
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
			    
				$('.nav_list.depth1').click(function(){
					$('.nav_list.depth1').siblings('.depth1').removeClass('active');
					$('.nav_list.active .depth2').css('display','none');
					$(this).addClass('active');
				});	
			});
			
			 user_info()
			
		});
		
		
		function user_info() { // 연간 배출량 그래프
			$.post('/user_info.do', {}, function(json) {
				$("#user_name").empty();
				$("#user_name").html(json.usernames);
			}, "json");
		}

	</script>
</body>
</html>
