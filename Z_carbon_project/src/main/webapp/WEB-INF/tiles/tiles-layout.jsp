<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
    <%-- <tiles:insertAttribute name="loadFile"/> --%>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/jvectormap/jquery-jvectormap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/owl-carousel-2/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/owl-carousel-2/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/add.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jys.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
	<!-- JS -->     
	<script src="${pageContext.request.contextPath}/js/jquery-3.7.0.min.js"></script> 
    <script src="${pageContext.request.contextPath}/js/dashboard_chart.js"></script>
    <script src="${pageContext.request.contextPath}/js/cf_dispose_chart.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/chart.js/Chart.min.js"></script>
    <script src="https://kit.fontawesome.com/63ee985f7b.js" crossorigin="anonymous"></script>
 
</head>
<body>
<div id="container">
	<!--왼쪽 사이드 메뉴-->
    <aside id="sidebar"><tiles:insertAttribute name="sidebar"  ignore="true" /></aside>
    <main id="body"><tiles:insertAttribute name="body"  ignore="true" /></main>
</div>
<script>
$(function(){
	//aside 클릭시 토글 (메뉴부분, 사이드바)
	$('.depth2').hide();
	$('.nav_list.depth1').on('click', function() {
		$(this).children('.depth2').slideToggle();
		$(this).toggleClass('reverse');
	})
})
</script>
<!-- JS -->
<script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
<script src="${pageContext.request.contextPath}/vendors/progressbar.js/progressbar.min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/jvectormap/jquery-jvectormap.min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/vendors/owl-carousel-2/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/boot/jquery.cookie.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/boot/off-canvas.js"></script>
<script src="${pageContext.request.contextPath}/js/boot/hoverable-collapse.js"></script>
<script src="${pageContext.request.contextPath}/js/boot/misc.js"></script>
<script src="${pageContext.request.contextPath}/js/boot/settings.js"></script>
<script src="${pageContext.request.contextPath}/js/boot/todolist.js"></script>
<script src="${pageContext.request.contextPath}/js/boot/dashboard.js"></script>
<script src="${pageContext.request.contextPath}/js/chartjs-plugin-doughnutlabel.js"></script>

</body>
</html>
