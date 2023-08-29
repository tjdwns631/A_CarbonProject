<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
			<a class="sidebar-brand brand-logo" href="dashboard.do"><img src="${pageContext.request.contextPath}/images/logo.svg" alt="logo" /></a> 
			<a class="sidebar-brand brand-logo-mini" href="dashboard.do"><img src="${pageContext.request.contextPath}/images/logo-mini.svg" alt="logo" /></a>
		</div>
		<ul class="nav" style="margin-top: 30px">
			<li class="nav-item menu-items" style="margin-top: 20px"><a class="nav-link" href="${pageContext.request.contextPath}/dashboard.do"> <span class="menu-icon"> <i class="mdi mdi-speedometer"></i>
				</span> <span class="menu-title">대시보드</span>
				</a>
			</li>
			<li class="nav-item menu-items" style="margin-top: 20px"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic"> <span class="menu-icon"> <i class="mdi mdi-laptop"></i>
				</span> <span class="menu-title">배출현황 조회</span> <i class="menu-arrow"></i>
				</a>
				<div class="collapse" id="ui-basic">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item" style="margin-top: 20px"><a class="nav-link" href="${pageContext.request.contextPath}/despose.do">현황조회</a></li>
						<li class="nav-item" style="margin-top: 20px"><a class="nav-link" href="${pageContext.request.contextPath}/despose_detail.do">상세현황 조회</a></li>
					</ul>
				</div>
			</li>
			<li class="nav-item menu-items" style="margin-top: 20px"><a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth"> <span class="menu-icon"> <i class="mdi mdi-security"></i>
				</span> <span class="menu-title">설정</span> <i class="menu-arrow"></i>
				</a>
				<div class="collapse" id="auth">
					<ul class="nav flex-column sub-menu">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_data.do">데이터관리</a></li>
					</ul>
				</div>
			</li>
		</ul>
</body>
</html>
