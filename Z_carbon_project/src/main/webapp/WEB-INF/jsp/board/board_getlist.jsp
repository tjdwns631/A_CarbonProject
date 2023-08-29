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

	<div class="row" >
		<div class="col-md-8 col-xl-8 grid-margin stretch-card" style="margin: 0 auto;">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${board_list.board_title}</h4>
					<div class="d-flex py-4">
						<div class="preview-list w-100">
							<div class="preview-item p-0">
								<div class="preview-item-content d-flex flex-grow">
									<div class="flex-grow">
										<div class="d-flex d-md-block d-xl-flex justify-content-between">
											<h6 class="preview-subject">작성자 ${board_list.memberdto.member_name}</h6>
											<p class="text-muted text-small">${fn:substring(board_list.board_date,0,16) }</p>
										</div>
										<p class="text-muted"> 조회수 ${board_list.board_hits } 추천수 0 댓글 0 </p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<p class="text-muted">${board_list.board_content}</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>