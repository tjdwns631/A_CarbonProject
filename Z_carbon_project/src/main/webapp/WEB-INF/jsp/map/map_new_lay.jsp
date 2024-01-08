<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/ol@v8.1.0/dist/ol.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ol@v8.1.0/ol.css">
<script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
<script src="https://cdn.jsdelivr.net/npm/hls.js@1"></script>
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.7.0.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/map_js.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/test_map.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/maps/map_new_sty.css">
</head>
<body>
<div id="container">
    <div id="header">
        <div class="left">
            <h1 class="home">
                <a href="index.html">
                    <img src="${pageContext.request.contextPath}/images/map_top/재난연로고_흰글자.png" alt="국립재난안전연구원">
                </a>
            </h1>
            <div class="project_title">
                재난현장 실시간영상 프로토타입 시스템
            </div>
        </div>
        <div class="right">
            <ul class="gnb">
                <li>
                    <a href="#">
                        관리자페이지
                    </a>
                </li>
                <div class="bar"></div>
                <li class="user_name">
                    <a href="#">
                        홍길동
                    </a>
                </li>
                <div class="bar"></div>
                <!--경우에 따라 로그인/로그아웃 글자 바뀌게 해주세요-->
      <li class="login">
          <a href="#" style="color:#70e38f;">
                    로그아웃
                </a>
            </li>
        </ul>
    </div>
</div>
<div id="main">
    <ul class="left_side_bar">
        <!--위치검색-->
  <li class="on" data-title="위치검색">
      <a href="#">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19 19">
              <g>
                  <path class="ls_icon" d="m18.74,16.43l-3.7-3.7c-.17-.17-.39-.26-.63-.26h-.6c1.02-1.31,1.63-2.96,1.63-4.75C15.44,3.45,11.98,0,7.72,0S0,3.45,0,7.72s3.46,7.72,7.72,7.72c1.79,0,3.44-.61,4.75-1.63v.6c0,.24.09.46.26.63l3.7,3.7c.35.35.91.35,1.26,0l1.05-1.05c.35-.35.35-.91,0-1.26Zm-11.02-3.96c-2.62,0-4.75-2.12-4.75-4.75S5.09,2.97,7.72,2.97s4.75,2.12,4.75,4.75-2.12,4.75-4.75,4.75Z"/>
              </g>
          </svg>
      </a>
  </li>
  <!--재난정보-->
  <li data-title="재난정보">
      <a href="#">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 22.61">
              <g>
                  <path class="ls_icon" d="m24.41,16.87c-2.1-3.65-4.21-7.29-6.32-10.93-.81-1.41-1.61-2.83-2.46-4.21-.66-1.06-1.89-1.7-3.13-1.72-1.23.02-2.47.66-3.13,1.72-.86,1.38-1.65,2.81-2.46,4.21-2.11,3.64-4.21,7.29-6.32,10.93-.81,1.4-.8,2.8.11,4.15.65.97,1.59,1.47,2.75,1.58.13.01.26.01.39.01h17.32c.13,0,.26,0,.39-.01,1.16-.1,2.1-.61,2.75-1.58.91-1.35.91-2.75.11-4.15Zm-11.91,1.83c-.64,0-1.16-.52-1.16-1.16s.52-1.16,1.16-1.16,1.16.52,1.16,1.16-.52,1.16-1.16,1.16Zm1.42-10.1c-.08,1.3-.16,2.61-.24,3.91-.04.7-.07,1.41-.14,2.11-.05.53-.48.88-1.02.88,0,0-.01,0-.02,0,0,0-.01,0-.02,0-.54,0-.97-.35-1.02-.88-.07-.7-.1-1.41-.14-2.11-.08-1.3-.16-2.61-.24-3.91-.02-.38-.04-.76.13-1.12.24-.53.76-.86,1.29-.84.53-.02,1.05.32,1.29.84.17.36.15.74.13,1.12Z"/>
              </g>
          </svg>
      </a>
  </li>
  <!--영상정보-->
  <li data-title="영상정보">
      <a href="#">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 22.82 25">
              <g>
                  <path class="ls_icon" d="m3.66,0c1.36.49,2.72.97,4.08,1.46,3.77,1.37,7.54,2.74,11.31,4.11.92.33,1.51.94,1.61,1.94.08.84-.48,2.5-1.56,2.84-.3.09-.61.15-.93.17-1.68.16-3.35.32-5.03.44-.33.03-.69-.02-1-.13-3.5-1.26-7-2.53-10.49-3.81C.46,6.6-.12,5.52.25,4.3c.31-1.02.7-2.03,1.11-3.02C1.65.57,2.22.17,2.98.04c.03,0,.06-.03.09-.04.2,0,.39,0,.59,0Z"/>
                  <path class="ls_icon" d="m.38,8.14c3.76,1.37,7.49,2.72,11.21,4.08.77.28,1.54.25,2.33.17,1.19-.12,2.38-.22,3.57-.32.05,0,.1,0,.17,0-.03.09-.05.16-.08.24-.29.79-.58,1.59-.87,2.38-.5,1.36-1.68,1.91-3.03,1.42-2.92-1.06-5.83-2.12-8.75-3.19-1.12-.41-2.24-.82-3.37-1.23-.9-.33-1.44-.95-1.55-1.91-.02-.2-.02-.41.03-.6.09-.36.22-.71.32-1.04Z"/>
                  <path class="ls_icon" d="m2.93,21.98c0,.29,0,.54,0,.8-.03,1.21-.82,2.07-2.01,2.21-.54.06-.91-.24-.91-.78,0-2.43,0-4.87,0-7.3,0-.53.37-.84.9-.78,1.21.13,2,1,2.03,2.22,0,.22,0,.44,0,.68.09,0,.17.01.25.01,1.1,0,2.2,0,3.3,0,.98,0,1.58-.61,1.59-1.58,0-.6,0-1.2,0-1.83.08.02.15.04.22.06.84.3,1.68.61,2.52.91.14.05.2.12.2.28,0,.76,0,1.51-.28,2.24-.62,1.64-2.18,2.8-3.93,2.85-1.19.03-2.38,0-3.56.01-.09,0-.17,0-.29,0Z"/>
                  <path class="ls_icon" d="m21.9,9.86c.56.01.85.2.91.6.02.14,0,.31-.05.45-.65,1.8-1.3,3.59-1.95,5.38-.21.56-.74.71-1.21.35-.48-.37-.95-.76-1.44-1.13-.11-.09-.13-.16-.08-.29.39-1.07.78-2.14,1.17-3.2.04-.1.16-.2.26-.24.81-.32,1.45-.84,1.87-1.6.13-.24.26-.4.52-.31Z"/>
              </g>
          </svg>
      </a>
  </li>
  <!--주제도-->
<!--   <li data-title="주제도">
      <a href="#">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25">
              <g>
                  <path class="ls_icon" d="m7.62,11.29c.12-.49.32-.96.57-1.38L2.8,4.52C1.26,6.4.25,8.73,0,11.29h7.62Z"/>
                  <path class="ls_icon" d="m8.19,15.09c-.26-.42-.45-.89-.57-1.38H0c.25,2.56,1.26,4.89,2.8,6.77l5.39-5.39Z"/>
                  <path class="ls_icon" d="m9.91,8.19c.42-.26.89-.45,1.38-.57V0c-2.56.25-4.89,1.26-6.77,2.8l5.39,5.39Z"/>
                  <path class="ls_icon" d="m13.71,0v7.62c.49.12.96.32,1.38.57l5.39-5.39c-1.88-1.55-4.21-2.56-6.77-2.8Z"/>
                  <path class="ls_icon" d="m16.81,9.91c.26.42.45.89.57,1.38h7.62c-.25-2.56-1.26-4.89-2.8-6.77l-5.39,5.39Z"/>
                  <path class="ls_icon" d="m17.38,13.71c-.12.49-.32.96-.57,1.38l5.39,5.39c1.55-1.88,2.56-4.21,2.8-6.77h-7.62Z"/>
                  <path class="ls_icon" d="m11.29,17.38c-.49-.12-.96-.32-1.38-.57l-5.39,5.39c1.88,1.55,4.21,2.56,6.77,2.8v-7.62Z"/>
                  <path class="ls_icon" d="m15.09,16.81c-.42.26-.89.45-1.38.57v7.62c2.56-.25,4.89-1.26,6.77-2.8l-5.39-5.39Z"/>
              </g>
          </svg>
      </a>
  </li> -->
  <!--국토관리-->
  <!-- <li data-title="국토관리">
      <a href="#">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 21.06 25">
              <g>
                  <path class="ls_icon" d="m16.38,25H4.69c-2.58,0-4.69-2.1-4.69-4.69V4.69C0,2.1,2.1,0,4.69,0h11.69c2.58,0,4.69,2.1,4.69,4.69v15.62c0,2.58-2.1,4.69-4.69,4.69ZM4.69,1.56c-1.72,0-3.12,1.4-3.12,3.12v15.62c0,1.72,1.4,3.12,3.12,3.12h11.69c1.72,0,3.12-1.4,3.12-3.12V4.69c0-1.72-1.4-3.12-3.12-3.12H4.69Z"/>
                  <path class="ls_icon" d="m12.99,7.42h-4.93c-.43,0-.78-.35-.78-.78s.35-.78.78-.78h4.93c.43,0,.78.35.78.78s-.35.78-.78.78Z"/>
                  <path class="ls_icon" d="m15.13,12.49H5.93c-.43,0-.78-.35-.78-.78s.35-.78.78-.78h9.21c.43,0,.78.35.78.78s-.35.78-.78.78Z"/>
                  <path class="ls_icon" d="m15.13,15.81H5.93c-.43,0-.78-.35-.78-.78s.35-.78.78-.78h9.21c.43,0,.78.35.78.78s-.35.78-.78.78Z"/>
                  <path class="ls_icon" d="m15.13,19.14H5.93c-.43,0-.78-.35-.78-.78s.35-.78.78-.78h9.21c.43,0,.78.35.78.78s-.35.78-.78.78Z"/>
              </g>
          </svg>
      </a>
  </li> -->
  <!--배경지도-->
   <!--  <li data-title="배경지도">
        <a href="#">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25">
                <g>
                    <path class="ls_icon" d="m11.35.25c.73-.34,1.57-.34,2.29,0l10.67,4.93c.42.19.68.61.68,1.02,0,.5-.26.91-.68,1.11l-10.67,4.93c-.73.34-1.57.34-2.29,0L.68,7.31c-.41-.2-.68-.61-.68-1.11,0-.42.27-.83.68-1.02L11.35.25Zm12.97,11.18c.42.19.68.61.68,1.02,0,.5-.26.91-.68,1.11l-10.67,4.93c-.73.34-1.57.34-2.29,0L.68,13.56c-.41-.2-.68-.61-.68-1.11,0-.42.27-.83.68-1.02l2.6-1.2,7.42,3.43c1.14.53,2.46.53,3.6,0l7.42-3.43,2.6,1.2Zm-10.02,8.48l7.42-3.43,2.6,1.2c.42.19.68.61.68,1.02,0,.5-.26.91-.68,1.11l-10.67,4.93c-.73.34-1.57.34-2.29,0L.68,19.81c-.41-.2-.68-.61-.68-1.11,0-.42.27-.83.68-1.02l2.6-1.2,7.42,3.43c1.14.53,2.46.53,3.6,0h0Z"/>
                </g>
            </svg>
        </a>
    </li> -->
</ul>
<div class="right_map">
    <!--left_side_bar 버튼 클릭시 펼쳐지는 공간-->
<div class="left_side_cont">
      <div class="slide_toggle_btn on">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8.82 14.7">
              <path class="ls_icon" d="m0,7.35c0-.38.14-.75.43-1.04L6.31.43c.57-.57,1.5-.57,2.08,0s.57,1.5,0,2.08L3.55,7.35l4.84,4.84c.57.57.57,1.5,0,2.08s-1.5.57-2.08,0L.43,8.39c-.29-.29-.43-.66-.43-1.04Z"/>
          </svg>
      </div>
      
<div class="section_wrap">
          <!--위치 검색 location_search.html-->
          <!--위치 검색 location_search.html-->
<div class="section location_search">
	<div class="center">
		<h2 class="section_title">위치검색</h2>
		<!--브이월드/카카오맵 고르기-->
		<div class="radiobox">
			<form action="">
				<label> <input type="radio" name="mapTheme" value="브이월드">
					<div class="imgbox">
						<img src="img/left_side_icon/브이월드.png" alt="브이월드">
					</div> 브이월드
				</label> <label> <input type="radio" name="mapTheme" value="카카오맵">
					<div class="imgbox">
						<img src="img/left_side_icon/카카오맵.png" alt="카카오맵">
					</div> 카카오맵
				</label>
			</form>
		</div>
		<!--위치 검색하는 곳-->
		<div class="searchbox">
			<input type="text" id="search_juso" name="search_juso" placeholder="검색어를 입력하세요">
			<button type="button">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
          <g>
              <path class="ls_icon" d="m19.72,17.29l-3.89-3.89c-.18-.18-.41-.27-.66-.27h-.64c1.08-1.38,1.72-3.11,1.72-5C16.25,3.64,12.61,0,8.12,0S0,3.64,0,8.12s3.64,8.12,8.12,8.12c1.89,0,3.62-.64,5-1.72v.64c0,.25.1.49.27.66l3.89,3.89c.37.37.96.37,1.32,0l1.11-1.11c.37-.37.37-.96,0-1.33Zm-11.6-4.17c-2.76,0-5-2.23-5-5s2.23-5,5-5,5,2.23,5,5-2.23,5-5,5Z" />
          </g>
      </svg>
			</button>
		</div>
		<h2 class="section_title">검색결과</h2>
	</div>
	<!--스크롤 되는 구간-->
	<div class="scrollbox">
		<div class="center">
			<h3 class="section_sub_title">
				<div class="arrow">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8.82 14.7">
              <path class="ls_icon" d="m0,7.35c0-.38.14-.75.43-1.04L6.31.43c.57-.57,1.5-.57,2.08,0s.57,1.5,0,2.08L3.55,7.35l4.84,4.84c.57.57.57,1.5,0,2.08s-1.5.57-2.08,0L.43,8.39c-.29-.29-.43-.66-.43-1.04Z" />
          </svg>
				</div>
				<p class="left">지번 주소</p>
				<p class="right">
					검색 결과 <span>11</span>건
				</p>
			</h3>
			<!--접힐 수 있는 공간은 fold 안에 들어갑니다-->
			<div class="fold">
				<div class="juso_box">
					<div class="pic"></div>
					<div class="textbox">
						<h4>전주식당</h4>
						<p>경상남도 합천군 가야면 치인2길 27</p>
						<p>경상남도 합천군 가야면 치인리 1230대</p>
					</div>
					<div class="btn_wrap">
						<button class="map_go" title="지도이동">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13.33 13.33">
                  <path class="ls_icon" d="m6.67,0c-1.93,0-3.5,1.57-3.5,3.5s2.64,5.81,3.5,5.79c.86.02,3.5-3.85,3.5-5.79s-1.57-3.5-3.5-3.5Zm0,5.41c-1.1,0-2-.89-2-2s.89-2,2-2,2,.89,2,2-.89,2-2,2Z" />
                  <path class="ls_icon" d="m9.21,7.98h0c-.23.36-.03.84.39.94,1.57.37,2.51.98,2.51,1.43,0,.7-2.17,1.75-5.44,1.75s-5.44-1.05-5.44-1.75c0-.46.94-1.07,2.51-1.43.42-.1.62-.58.39-.94h0c-.14-.22-.41-.32-.66-.27-1.97.45-3.46,1.34-3.46,2.64,0,1.96,3.35,2.98,6.67,2.98s6.67-1.02,6.67-2.98c0-1.3-1.49-2.19-3.46-2.64-.25-.06-.52.05-.66.27Z" />
              </svg>
						</button>
					</div>
				</div>
				<div class="juso_box">
					<div class="pic"></div>
					<div class="textbox">
						<h4>전주식당</h4>
						<p>경상남도 합천군 가야면 치인2길 27</p>
						<p>경상남도 합천군 가야면 치인리 1230대</p>
					</div>
					<div class="btn_wrap">
						<button class="map_go" title="지도이동">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13.33 13.33">
                  <path class="ls_icon" d="m6.67,0c-1.93,0-3.5,1.57-3.5,3.5s2.64,5.81,3.5,5.79c.86.02,3.5-3.85,3.5-5.79s-1.57-3.5-3.5-3.5Zm0,5.41c-1.1,0-2-.89-2-2s.89-2,2-2,2,.89,2,2-.89,2-2,2Z" />
                  <path class="ls_icon" d="m9.21,7.98h0c-.23.36-.03.84.39.94,1.57.37,2.51.98,2.51,1.43,0,.7-2.17,1.75-5.44,1.75s-5.44-1.05-5.44-1.75c0-.46.94-1.07,2.51-1.43.42-.1.62-.58.39-.94h0c-.14-.22-.41-.32-.66-.27-1.97.45-3.46,1.34-3.46,2.64,0,1.96,3.35,2.98,6.67,2.98s6.67-1.02,6.67-2.98c0-1.3-1.49-2.19-3.46-2.64-.25-.06-.52.05-.66.27Z" />
              </svg>
						</button>
					</div>
				</div>
				<div class="juso_box">
					<div class="pic"></div>
					<div class="textbox">
						<h4>전주식당</h4>
						<p>경상남도 합천군 가야면 치인2길 27</p>
						<p>경상남도 합천군 가야면 치인리 1230대</p>
					</div>
					<div class="btn_wrap">
						<button class="map_go" title="지도이동">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13.33 13.33">
                  <path class="ls_icon" d="m6.67,0c-1.93,0-3.5,1.57-3.5,3.5s2.64,5.81,3.5,5.79c.86.02,3.5-3.85,3.5-5.79s-1.57-3.5-3.5-3.5Zm0,5.41c-1.1,0-2-.89-2-2s.89-2,2-2,2,.89,2,2-.89,2-2,2Z" />
                  <path class="ls_icon" d="m9.21,7.98h0c-.23.36-.03.84.39.94,1.57.37,2.51.98,2.51,1.43,0,.7-2.17,1.75-5.44,1.75s-5.44-1.05-5.44-1.75c0-.46.94-1.07,2.51-1.43.42-.1.62-.58.39-.94h0c-.14-.22-.41-.32-.66-.27-1.97.45-3.46,1.34-3.46,2.64,0,1.96,3.35,2.98,6.67,2.98s6.67-1.02,6.67-2.98c0-1.3-1.49-2.19-3.46-2.64-.25-.06-.52.05-.66.27Z" />
              </svg>
						</button>
					</div>
				</div>
				<div class="juso_box">
					<div class="pic"></div>
					<div class="textbox">
						<h4>전주식당</h4>
						<p>경상남도 합천군 가야면 치인2길 27</p>
						<p>경상남도 합천군 가야면 치인리 1230대</p>
					</div>
					<div class="btn_wrap">
						<button class="map_go" title="지도이동">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13.33 13.33">
                  <path class="ls_icon" d="m6.67,0c-1.93,0-3.5,1.57-3.5,3.5s2.64,5.81,3.5,5.79c.86.02,3.5-3.85,3.5-5.79s-1.57-3.5-3.5-3.5Zm0,5.41c-1.1,0-2-.89-2-2s.89-2,2-2,2,.89,2,2-.89,2-2,2Z" />
                  <path class="ls_icon" d="m9.21,7.98h0c-.23.36-.03.84.39.94,1.57.37,2.51.98,2.51,1.43,0,.7-2.17,1.75-5.44,1.75s-5.44-1.05-5.44-1.75c0-.46.94-1.07,2.51-1.43.42-.1.62-.58.39-.94h0c-.14-.22-.41-.32-.66-.27-1.97.45-3.46,1.34-3.46,2.64,0,1.96,3.35,2.98,6.67,2.98s6.67-1.02,6.67-2.98c0-1.3-1.49-2.19-3.46-2.64-.25-.06-.52.05-.66.27Z" />
              </svg>
						</button>
					</div>
				</div>
				<div class="paging_box">
					<ul>
						<li class="first arrow"><a href="#"></a></li>
						<li class="prev arrow"><a href="#"></a></li>
						<li class="current"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li class="next arrow"><a href="#"></a></li>
						<li class="last arrow"><a href="#"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="box" style="height: 1000px;"></div>
	</div>
</div>
<!--재난 정보 disaster_info.html-->
<!--재난 정보 disaster_info.html-->

<div class="section disaster_info">
	<div class="center">
		<h2 class="section_title">선택지역 조회</h2>
		<!--재난 분류 선택-->
		<label for="disaster_category" class="top_select">재난 분류 선택:</label> <select id="disaster_category" name="disaster_category" style="width: 100%;">
			<option value="">사회</option>
			<option value="">자연</option>
		</select>
		<!--재난 유형 선택-->
		<label for="disaster" class="top_select">재난 유형 선택:</label> <select id="disaster" name="disaster" style="width: 100%;">
			<option value="">호우</option>
			<option value="">지진</option>
			<option value="">폭염</option>
		</select>
		<!--재난 기간 선택-->
		<label for="startDate" class="top_select">재난 기간 선택:</label>
		<div class="datebox">
			<input type="date" id="startDate" name="startDate" style="width: 46%;"> <span style="margin-bottom: 10px;">-</span> <input type="date" id="endDate" name="endDate" style="width: 46%;">
		</div>
		<!--위치 검색하는 곳-->
		<div class="searchbox">
			<input type="text" id="search_juso" name="search_juso" placeholder="검색어를 입력하세요">
			<button type="button">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
          <path class="ls_icon" d="m19.72,17.29l-3.89-3.89c-.18-.18-.41-.27-.66-.27h-.64c1.08-1.38,1.72-3.11,1.72-5C16.25,3.64,12.61,0,8.12,0S0,3.64,0,8.12s3.64,8.12,8.12,8.12c1.89,0,3.62-.64,5-1.72v.64c0,.25.1.49.27.66l3.89,3.89c.37.37.96.37,1.32,0l1.11-1.11c.37-.37.37-.96,0-1.33Zm-11.6-4.17c-2.76,0-5-2.23-5-5s2.23-5,5-5,5,2.23,5,5-2.23,5-5,5Z" />
      </svg>
			</button>
		</div>
		<h2 class="section_title">검색결과</h2>
	</div>
	<!--스크롤 되는 구간-->
	<div class="scrollbox">
		<div class="center">
			<h3 class="section_sub_title">
				<div class="arrow">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8.82 14.7">
              <g>
                  <path class="ls_icon" d="m0,7.35c0-.38.14-.75.43-1.04L6.31.43c.57-.57,1.5-.57,2.08,0s.57,1.5,0,2.08L3.55,7.35l4.84,4.84c.57.57.57,1.5,0,2.08s-1.5.57-2.08,0L.43,8.39c-.29-.29-.43-.66-.43-1.04Z" />
              </g>
          </svg>
				</div>
				<p class="left">지번 주소</p>
				<p class="right">
					검색 결과 <span>11</span>건
				</p>
			</h3>
			<!--접힐 수 있는 공간은 fold 안에 들어갑니다-->
			<div class="fold">
				<div class="juso_box">
					<div class="pic"></div>
					<div class="textbox">
						<h4>전주식당</h4>
						<p>경상남도 합천군 가야면 치인2길 27</p>
						<p>경상남도 합천군 가야면 치인리 1230대</p>
					</div>
					<div class="btn_wrap btn2">
						<!--disaster_info_pop.html 열어주시면 됩니다-->
						<button title="상세정보">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17.01 17.01">
                          <g>
                              <path class="ls_icon" d="m8.5,17.01c4.7,0,8.5-3.81,8.5-8.5S13.2,0,8.5,0,0,3.81,0,8.5s3.81,8.5,8.5,8.5Zm-1.75-5h1.05v-2.81h-1.05c-.58,0-1.05-.47-1.05-1.05s.47-1.05,1.05-1.05h2.1c.58,0,1.05.47,1.05,1.05v3.86h.35c.58,0,1.05.47,1.05,1.05s-.47,1.05-1.05,1.05h-3.51c-.58,0-1.05-.47-1.05-1.05s.47-1.05,1.05-1.05Zm1.75-9.12c.77,0,1.4.63,1.4,1.4s-.63,1.4-1.4,1.4-1.4-.63-1.4-1.4.63-1.4,1.4-1.4Z" />
                          </g>
                      </svg>
						</button>
						<button class="map_go" title="지도이동">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13.33 13.33">
                          <g>
                              <path class="ls_icon" d="m6.67,0c-1.93,0-3.5,1.57-3.5,3.5s2.64,5.81,3.5,5.79c.86.02,3.5-3.85,3.5-5.79s-1.57-3.5-3.5-3.5Zm0,5.41c-1.1,0-2-.89-2-2s.89-2,2-2,2,.89,2,2-.89,2-2,2Z" />
                              <path class="ls_icon" d="m9.21,7.98h0c-.23.36-.03.84.39.94,1.57.37,2.51.98,2.51,1.43,0,.7-2.17,1.75-5.44,1.75s-5.44-1.05-5.44-1.75c0-.46.94-1.07,2.51-1.43.42-.1.62-.58.39-.94h0c-.14-.22-.41-.32-.66-.27-1.97.45-3.46,1.34-3.46,2.64,0,1.96,3.35,2.98,6.67,2.98s6.67-1.02,6.67-2.98c0-1.3-1.49-2.19-3.46-2.64-.25-.06-.52.05-.66.27Z" />
                          </g>
                      </svg>
						</button>
					</div>
				</div>
				<div class="paging_box">
					<ul>
						<li class="first arrow"><a href="#"></a></li>
						<li class="prev arrow"><a href="#"></a></li>
						<li class="current"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li class="next arrow"><a href="#"></a></li>
						<li class="last arrow"><a href="#"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!--영상 정보 image_info.html-->
<!--영상 정보 image_info.html-->

<div class="section image_info">
    <div class="center">
        <h2 class="section_title">영상정보</h2>
        <!--영상 분류 선택-->
<label for="" class="top_select">영상 분류 :</label>
<select id="" name="" style="width:100%;">
    <option value="">사회</option>
    <option value="">자연</option>
</select>
<!--재난 유형 선택-->
<label for="" class="top_select">재난 유형 :</label>
<select id="" name="" style="width:100%;">
    <option value="">호우</option>
    <option value="">지진</option>
    <option value="">폭염</option>
</select>
<!--영상 등록 기간 선택-->
<label for="" class="top_select">영상 등록 기간 :</label>
<div class="datebox">
    <input type="date" class="blue" id="startDate" name="startDate" style="width: 46%;">
<span style="margin-bottom:10px;">-</span>
<input type="date" class="blue" id="endDate" name="endDate" style="width: 46%;">
</div>
<!--위치 검색하는 곳-->
    <div class="searchbox">
        <input type="text" id="search_juso" name="search_juso" placeholder="검색어를 입력하세요">
        <button type="button">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                <g>
                    <path class="ls_icon" d="m19.72,17.29l-3.89-3.89c-.18-.18-.41-.27-.66-.27h-.64c1.08-1.38,1.72-3.11,1.72-5C16.25,3.64,12.61,0,8.12,0S0,3.64,0,8.12s3.64,8.12,8.12,8.12c1.89,0,3.62-.64,5-1.72v.64c0,.25.1.49.27.66l3.89,3.89c.37.37.96.37,1.32,0l1.11-1.11c.37-.37.37-.96,0-1.33Zm-11.6-4.17c-2.76,0-5-2.23-5-5s2.23-5,5-5,5,2.23,5,5-2.23,5-5,5Z"/>
                </g>
            </svg>
        </button>
    </div>
    <h2 class="section_title">검색결과</h2>
</div>
<!--스크롤 되는 구간-->
<div class="scrollbox">
    <div class="center">
        <h3 class="section_sub_title">
            <div class="arrow">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8.82 14.7">
                    <g>
                        <path class="ls_icon" d="m0,7.35c0-.38.14-.75.43-1.04L6.31.43c.57-.57,1.5-.57,2.08,0s.57,1.5,0,2.08L3.55,7.35l4.84,4.84c.57.57.57,1.5,0,2.08s-1.5.57-2.08,0L.43,8.39c-.29-.29-.43-.66-.43-1.04Z"/>
                    </g>
                </svg>
            </div>
            <p class="left">지번 주소</p>
            <p class="right">검색 결과 <span>11</span>건</p>
        </h3>
        <!--접힐 수 있는 공간은 fold 안에 들어갑니다-->
<div class="fold">
    <div class="juso_box">
        <div class="pic"></div>
        <div class="textbox">
            <h4>전주식당</h4>
            <p>경상남도 합천군 가야면 치인2길 27</p>
            <p>경상남도 합천군 가야면 치인리 1230대</p>
        </div>
        <div class="btn_wrap btn2">
            <!--disaster_image_pop.html 열어주시면 됩니다 디자인 같습니다-->
                        <button title="실시간영상">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17.01 17.01">
                                <g>
                                    <path class="ls_icon" d="m8.5,17.01c4.7,0,8.5-3.81,8.5-8.5S13.2,0,8.5,0,0,3.81,0,8.5s3.81,8.5,8.5,8.5Zm-1.75-5h1.05v-2.81h-1.05c-.58,0-1.05-.47-1.05-1.05s.47-1.05,1.05-1.05h2.1c.58,0,1.05.47,1.05,1.05v3.86h.35c.58,0,1.05.47,1.05,1.05s-.47,1.05-1.05,1.05h-3.51c-.58,0-1.05-.47-1.05-1.05s.47-1.05,1.05-1.05Zm1.75-9.12c.77,0,1.4.63,1.4,1.4s-.63,1.4-1.4,1.4-1.4-.63-1.4-1.4.63-1.4,1.4-1.4Z"/>
                                </g>
                            </svg>
                        </button>
                        <button class="map_go" title="지도이동">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13.33 13.33">
                                <g>
                                    <path class="ls_icon" d="m6.67,0c-1.93,0-3.5,1.57-3.5,3.5s2.64,5.81,3.5,5.79c.86.02,3.5-3.85,3.5-5.79s-1.57-3.5-3.5-3.5Zm0,5.41c-1.1,0-2-.89-2-2s.89-2,2-2,2,.89,2,2-.89,2-2,2Z"/>
                                    <path class="ls_icon" d="m9.21,7.98h0c-.23.36-.03.84.39.94,1.57.37,2.51.98,2.51,1.43,0,.7-2.17,1.75-5.44,1.75s-5.44-1.05-5.44-1.75c0-.46.94-1.07,2.51-1.43.42-.1.62-.58.39-.94h0c-.14-.22-.41-.32-.66-.27-1.97.45-3.46,1.34-3.46,2.64,0,1.96,3.35,2.98,6.67,2.98s6.67-1.02,6.67-2.98c0-1.3-1.49-2.19-3.46-2.64-.25-.06-.52.05-.66.27Z"/>
                                </g>
                            </svg>
                        </button>
                    </div>
                </div>
                <div class="paging_box">
                    <ul>
                        <li class="first arrow">
                            <a href="#"></a>
                        </li>
                        <li class="prev arrow">
                            <a href="#"></a>
                        </li>
                        <li class="current">
                            <a href="#">1</a>
                        </li>
                        <li>
                            <a href="#">2</a>
                        </li>
                        <li>
                            <a href="#">3</a>
                        </li>
                        <li>
                            <a href="#">4</a>
                        </li>
                        <li>
                            <a href="#">5</a>
                        </li>
                        <li class="next arrow">
                            <a href="#"></a>
                        </li>
                        <li class="last arrow">
                            <a href="#"></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
                        <!--주제도 theme.html-->

          <!--국토 관리 land_manage.html-->

          <!--배경 지도 bg_map.html-->

      </div>
  </div>
  <div class="mini_menu_bar">
      <div class="left">
          <div class="coordinate">
              <div class="degree">경도 : <span class="long" id="vis_ct_pos_lng">128.2829978</span></div>
              <div class="line"></div>
              <div class="degree">위도 : <span class="lat" id="vis_ct_pos_lat">35.919166</span></div>
          </div>
          <button class="cd_mini_btn">좌표이동</button>
      </div>
      <div class="right">
          <!--land_info_pop.html-->
          <button id="map_tool_ppt_land_info" name="map_tools" data-title="필지정보">
              <img src="${pageContext.request.contextPath}/images/map_top/필지정보.png" alt="필지정보" >
          </button>
          <!--building_info_pop.html-->
          <button id="map_tool_ppt_building_info" name="map_tools" data-title="건축물정보">
              <img src="${pageContext.request.contextPath}/images/map_top/건축물정보.png" alt="건축물정보" >
          </button>
          <!--facility_info_pop.html-->
          <button id="map_tool_ppt_facility_info" name="map_tools" data-title="시설물정보" >
              <img src="${pageContext.request.contextPath}/images/map_top/시설물정보.png" alt="시설물정보" >
          </button>
          <button id="map_tool_ppt_roadview" name="map_tools_roadview" data-title="로드뷰">
              <img src="${pageContext.request.contextPath}/images/map_top/로드뷰.png" alt="로드뷰" >
          </button>
          <button id="map_tool_ppt_width" name="map_tools_width" data-title="거리측정" onclick="javascript: toolArea();">
              <img src="${pageContext.request.contextPath}/images/map_top/거리측정.png" alt="거리측정" >
          </button>
          <button id="map_tool_anal_area" name="map_tools_area" data-title="면적측정" onclick="javascript: toolDist();">
              <img src="${pageContext.request.contextPath}/images/map_top/면적측정.png" alt="면적측정" >
          </button>
          <button id="map_tool_clear" name="map_tools_clear" data-title="클리어" onclick="javascript: mapclear();">
              <img src="${pageContext.request.contextPath}/images/map_top/클리어.png" alt="클리어" >
          </button>
          <!--image_pop.html-->
          <button id="map_tool_image" name="map_tools_image" data-title="이미지저장">
              <img src="${pageContext.request.contextPath}/images/map_top/이미지저장.png" alt="이미지저장" >
          </button>
      </div>
  </div>
  <!--지도 들어갈 부분-->
  <div class="mapbox">
      <div class="rt_btn_wrap">
          <button class="disaster_new" type="button" data-title="재난등록">
              <div class="icon_box">
                  <svg height="1em" viewBox="0 0 576 512">
                      <path style="fill:#fff" d="M306.8 6.1c-11.2-8.1-26.4-8.1-37.6 0l-176 128c-11.2 8.2-15.9 22.6-11.6 35.8S98.1 192 112 192h16v73c1.7 1 3.3 2 4.9 3.1 18 12.4 40.1 20.3 59.2 20.3 21.1 0 42-8.5 59.2-20.3 22.1-15.5 51.6-15.5 73.7 0 18.4 12.7 39.6 20.3 59.2 20.3 19 0 41.2-7.9 59.2-20.3 1.5-1 3-2 4.5-2.9l-.3-73.2H464c13.9 0 26.1-8.9 30.4-22.1s-.4-27.6-11.6-35.8l-176-128zm-37.3 303.8C247 325.4 219.5 336 192 336c-26.9 0-55.3-10.8-77.4-26.1-11.9-8.5-28.1-7.8-39.2 1.7-14.4 11.9-32.5 21-50.6 25.2-17.2 4-27.9 21.2-23.9 38.4s21.2 27.9 38.4 23.9c24.5-5.7 44.9-16.5 58.2-25 29 15.6 61.5 25.9 94.5 25.9 31.9 0 60.6-9.9 80.4-18.9 5.8-2.7 11.1-5.3 15.6-7.7 4.5 2.4 9.7 5.1 15.6 7.7 19.8 9 48.5 18.9 80.4 18.9 33 0 65.5-10.3 94.5-25.8 13.4 8.4 33.7 19.3 58.2 25 17.2 4 34.4-6.7 38.4-23.9s-6.7-34.4-23.9-38.4c-18.1-4.2-36.2-13.3-50.6-25.2-11.1-9.5-27.3-10.1-39.2-1.7-22 15.2-50.5 26-77.4 26-27.5 0-55-10.6-77.5-26.1-11.1-7.9-25.9-7.9-37 0zM384 448c-27.5 0-55-10.6-77.5-26.1-11.1-7.9-25.9-7.9-37 0-22.5 15.5-50 26.1-77.5 26.1-26.9 0-55.3-10.8-77.4-26.1-11.9-8.5-28.1-7.8-39.2 1.7-14.4 11.9-32.5 21-50.6 25.2-17.2 4-27.9 21.2-23.9 38.4s21.2 27.9 38.4 23.9c24.5-5.7 44.9-16.5 58.2-25 29 15.6 61.5 25.9 94.5 25.9 31.9 0 60.6-9.9 80.4-18.9 5.8-2.7 11.1-5.3 15.6-7.7 4.5 2.4 9.7 5.1 15.6 7.7 19.8 9 48.5 18.9 80.4 18.9 33 0 65.5-10.3 94.5-25.8 13.4 8.4 33.7 19.3 58.2 25 17.2 4 34.4-6.7 38.4-23.9s-6.7-34.4-23.9-38.4c-18.1-4.2-36.2-13.3-50.6-25.2-11.1-9.4-27.3-10.1-39.2-1.7-22 15.2-50.5 26-77.4 26z"/>
                  </svg>
              </div>
          </button>
          <button class="live" type="button" data-title="실시간영상">
              <div class="icon_box">
                  <svg height="1em" viewBox="0 0 576 512">
                      <path style="fill:#fff;" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128zM559.1 99.8c10.4 5.6 16.9 16.4 16.9 28.2V384c0 11.8-6.5 22.6-16.9 28.2s-23 5-32.9-1.6l-96-64L416 337.1V320 192 174.9l14.2-9.5 96-64c9.8-6.5 22.4-7.2 32.9-1.6z"/>
                  </svg>
              </div>
          </button>
      </div>
      <!--기본 지도가 들어갈 공간-->
      <div class="map" id="map"></div>
      <!--로드뷰 열어서 2분할 경우-->
      <div class="map roadview" style="display:none;">
                        <button class="close_btn" title="로드뷰 닫기">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16.41 16.41">
                                <path class="ls_icon" d="m5.22,8.24L.8,3.82,3.82.8l4.42,4.42L12.75.71l2.96,2.96-4.51,4.51,4.42,4.42-3.02,3.02-4.42-4.42-4.51,4.51-2.96-2.96,4.51-4.51Z"/>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>

</script>
<script src="${pageContext.request.contextPath}/js/map_js.js"></script>
</html>