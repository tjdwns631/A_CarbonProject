<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">글작성 페이지</h4>
				<p class="card-description">글작성</p>
				<form class="forms-sample" method="post" action="write_action.do">
					<input type="hidden" name="member_idx" value= "1" ><!-- 추후 세션값 넣어서 가져오기 -->
					<div class="form-group">
						<label for="exampleInputName1">제목</label> <input name="board_title" type="text" class="form-control" id="exampleInputName1" placeholder="제목">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail3">비밀번호</label> <input name="board_pwd" type="password" class="form-control" id="exampleInputEmail3" placeholder="password">
					</div>
					<div class="form-group">
						<label for="exampleSelectGender">카테고리</label> <select name="cate_idx" class="form-control" id="exampleSelectGender">
							<option value="1">정보</option>
							<option value="2">해외축구</option>
						</select>
					</div>
					<div class="form-group">
						<label>File upload</label> <input type="file" name="img[]" class="file-upload-default">
						<div class="input-group col-xs-12">
							<input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image"> <span class="input-group-append">
								<button class="file-upload-browse btn btn-primary" type="button">Upload</button>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="exampleTextarea1">내용</label>
						<textarea class="form-control" name="board_content" id="exampleTextarea1" rows="4"></textarea>
					</div>
					<button type="submit" class="btn btn-primary me-2">Submit</button>
					<button type="button" onclick="history.back()" class="btn btn-dark">Cancel</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>