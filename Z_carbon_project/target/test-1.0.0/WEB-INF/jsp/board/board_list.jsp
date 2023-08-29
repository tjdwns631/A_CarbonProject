<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row"> <!-- ajax로 구현 변경 또는 추가 할 예정  -->
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h3 class="mb-0">게시판</h3>
					<p class="card-description">
						<code>테스트 게시판 (total : ${total_cnt } )</code>
						<button id="writeform" type="button" class="btn btn-inverse-primary btn-fw"  style="width: 10%;display: inline-block">글쓰기</button>
					</p>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>탭(카테고리)</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>조회</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty board_list}">
										<tr>
											<td colspan="7" style="text-align:center">데이터가 없습니다</td>
										</tr>
									</c:when>
									<c:when test="${!empty board_list }">
										<c:forEach items="${board_list }" var="list" varStatus="idx">
											<tr>
												<td style="width: 5%;">${total_cnt - ((pagedto.page-1) * getListSize) - idx.index}</td>
												<td style="width: 15%;"><a style="text-decoration: none; color: #6c7293;" href="${pageContext.request.contextPath}/board/board_getlist.do?board_idx=${list.board_idx}">
												${list.tb_categorydto.cate_name}</a>
												</td>
												<td style="width: 30%;"><a style="text-decoration: none; color: #6c7293;" href="${pageContext.request.contextPath}/board/board_getlist.do?board_idx=${list.board_idx}">
												${list.board_title}
												<c:if test="${list.count ne 0 }">
												[${list.count}] 
												</c:if>
												</a>
												</td>
												<td style="width: 15%;"><a style="text-decoration: none; color: #6c7293;" href="${pageContext.request.contextPath}/board/board_getlistAjax.do?board_idx=${list.board_idx}">
												${list.memberdto.member_name}</a>
												</td>
												<td style="width: 15%;">${fn:substring(list.board_date,0,16) }</td>
												<td style="width: 10%;">${list.board_hits}</td>
												<td style="color: blue; width: 10%;">0</td>
											</tr>
										</c:forEach>									
									</c:when>
								</c:choose>
							</tbody>
						</table>
						<div style="margin-top:30px;">
							<form id="searchbox" name="searchbox" method="post">
								<div class="form-group" style="width: 10%; display: inline-block ">
									<select id="type" name = "type" class="form-control form-control-sm" id="exampleFormControlSelect3">
										<option value="board_title">제목</option>
										<option value="member_name">작성자</option>
									</select>
								</div>
								<div class="form-group" style="width: 40%;display: inline-block">
									<input type="text" id="keyword" name="keyword" class="form-control form-control-sm" placeholder="검색어를 입력해 주세요" aria-label="검색어를 입력해 주세요">
								</div>
							  <button type="button" id ="searchbtn" onkeyup="enterkey()" class="btn btn-inverse-primary btn-fw"  style="width: 10%;display: inline-block">검색</button>
							</form>
						</div>
						<!-- <div class="paging_con_a" style="display: flex; justify-content: center; align-items: center; margin-top: 40px;">
							<a style='margin-right: 1rem; color: #fff; font-weight: bold; text-decoration: underline;' href=''>1</a>
							
						</div> -->
							<!-- pagination{s} -->

	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagedto.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagedto.page}', '${pagedto.range}', '${pagedto.rangeSize}', '${pagedto.type}', '${pagedto.keyword}')">Previous</a></li>
			</c:if>
			<c:forEach begin="${pagedto.startPage}" end="${pagedto.endPage}" var="idx">
				<li class="page-item <c:out value="${pagedto.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagedto.range}', '${pagedto.rangeSize}', '${pagedto.type}', '${pagedto.keyword}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pagedto.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagedto.range}', '${pagedto.range}', '${pagedto.rangeSize}', '${pagedto.type}', '${pagedto.keyword}')" >Next</a></li>
			</c:if>
		</ul>
	</div>

	<!-- pagination{e} -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			
			$("#writeform").on("click",function(){
				location.href = "${pageContext.request.contextPath}/board/board_write.do";
			})
			
			$(document).on('click', '#searchbtn', function(e){
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/board/board_list.do";
				url = url + "?type=" + $('#type').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
			});	
		});

		function enterkey() { // 엔터키 기능 활성
			if (window.event.keyCode == 13) {
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/board/board_list.do";
				url = url + "?type=" + $('#type').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
		    }
		}
		
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize, type, keyword) {
				var page = ((range - 2) * rangeSize) + 1;
				var range = range - 1;
				var url = "${pageContext.request.contextPath}/board/board_list.do";

				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&type=" + type;
				url = url + "&keyword=" + keyword;
				location.href = url;
			}

	  	//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, type, keyword) {
			var url = "${pageContext.request.contextPath}/board/board_list.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&type=" + type;
			url = url + "&keyword=" + keyword;
			
			location.href = url;	
		}

		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize, type, keyword) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/board/board_list.do";

			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&type=" + type;
			url = url + "&keyword=" + keyword;
			location.href = url;
		}
		
	</script>
	
</body>
</html>