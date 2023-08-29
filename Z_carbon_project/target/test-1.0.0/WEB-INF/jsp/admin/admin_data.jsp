<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="margin-bottom: 20px;">
		<select class="pl" name="year">
			<option value="">연도선택</option>
			<option value="2015" selected>2015년</option>
			<option value="2016">2016년</option>
			<option value="2017">2017년</option>
			<option value="2018">2018년</option>
			<option value="2019">2019년</option>
			<option value="2020">2020년</option>
		</select> 
		<select class="pl" name="lev1">
			<option value="">배출방법</option>
			<option value="1" selected>직접배출</option>
			<option value="2">간접배출</option>
		</select> 
		<select class="pl" name="lev2">
			<option value="">카테고리</option>
			<option value="3" selected>에너지</option>
			<option value="4">AFOLU</option>
			<option value="5">전력</option>
			<option value="6">폐기물</option>
		</select>
	</div>

	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h3 class="mb-0">데이터 조회결과</h3>
					<p class="card-description">
						<code>에너지 카테고리</code>
					</p>
					<div class="table-responsive">
					<form>
						<table class="table"> <!-- 데이터 9개정도가 적당 -->
							<thead>
								<tr>
									<th>배출구분</th>
									<th>카테고리</th>
									<th>대분류</th>
									<th>중분류</th>
									<th>소분류</th>
									<th>활동자료</th>
									<th>단위</th>
									<th>사용량</th>
									<th>배출량</th>
								</tr>
							</thead>
							<tbody>
							<style>
							#test{
								width:60%;
								background-color:#191c24;
								color: #6c7293;
								border : 1px solid white;
								box-shadow: none;
							}
							#test input:focus {
								outline: 1px solid red;
							}
							</style>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>도로</td>
									<td>경유</td>
									<td>KL</td>
									<td style="width:10%"><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>도로</td>
									<td>부탄</td>
									<td>KL</td>
									<td><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>상업</td>
									<td>휘발유</td>
									<td>KL</td>
									<td><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>상업</td>
									<td>등유</td>
									<td>KL</td>
									<td><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>상업</td>
									<td>경유</td>
									<td>KL</td>
									<td><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>상업</td>
									<td>벙커A유</td>
									<td>KL</td>
									<td><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>상업</td>
									<td>벙커C유</td>
									<td>KL</td>
									<td><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>상업</td>
									<td>벙커C유</td>
									<td>KL</td>
									<td><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
								<tr>
									<td>직접배출</td>
									<td>에너지</td>
									<td>수송</td>
									<td>에너지</td>
									<td>상업</td>
									<td>벙커C유</td>
									<td>KL</td>
									<td><input id="test" type="text" value="101,159"></td>
									<td>2113,879</td>
								</tr>
							</tbody>
						</table>
							<style>.btn_upd{float : right; margin-right:15px;margin-top:10px;}</style>
							<button type="button" class="btn btn-warning btn_upd">수정</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>