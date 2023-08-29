<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
			<a class="navbar-brand brand-logo-mini" href="dashboard.do"><img src="${pageContext.request.contextPath}/images/logo-mini.svg" alt="logo" /></a>
		</div>
		<div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
			<button class="navbar-toggler navbar-toggler align-self-center ttt" type="button" data-toggle="minimize">
				<span class="mdi mdi-menu"></span>
			</button>

			<ul class="navbar-nav navbar-nav-right">
				<li class="nav-item dropdown"><a class="nav-link" id="profileDropdown" href="#" data-bs-toggle="dropdown">
						<div class="navbar-profile">
							<img class="img-xs rounded-circle" src="${pageContext.request.contextPath}/images/user_img.svg" alt="User" style="background-color: white;" >
							<!-- <i class="far fa-user"></i> -->
							<p class="mb-0 d-none d-sm-block navbar-profile-name">관리자</p>
							<i class="mdi mdi-menu-down d-none d-sm-block"></i>
						</div>
				</a>
					<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
						<h6 class="p-3 mb-0">Profile</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item preview-item">
							<div class="preview-thumbnail">
								<div class="preview-icon bg-dark rounded-circle">
									<i class="mdi mdi-settings text-success"></i>
								</div>
							</div>
							<div class="preview-item-content">
								<p class="preview-subject mb-1">정보수정</p>
							</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item preview-item">
							<div class="preview-thumbnail">
								<div class="preview-icon bg-dark rounded-circle">
									<i class="mdi mdi-logout text-danger"></i>
								</div>
							</div>
							<div class="preview-item-content">
								<p class="preview-subject mb-1">로그아웃</p>
							</div>
						</a>
					</div></li>
			</ul>
			<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
				<span class="mdi mdi-format-line-spacing"></span>
			</button>
		</div>
		
		<script>
		$(function(){
			$(".ttt").trigger('click');
		})
		</script>
</body>
</html>