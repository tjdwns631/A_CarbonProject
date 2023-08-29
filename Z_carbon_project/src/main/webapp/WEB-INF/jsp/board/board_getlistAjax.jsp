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
				<div class="card-body" id="board_h_info">
					<h4 class="card-title" id="board_title">제목</h4>
					<div class="d-flex py-4">
						<div class="preview-list w-100">
							<div class="preview-item p-0">
								<div class="preview-item-content d-flex flex-grow">
									<div class="flex-grow">
										<div class="d-flex d-md-block d-xl-flex justify-content-between">
											<h6 class="preview-subject" id="board_writer">작성자 작성자명</h6>
											<p class="text-muted text-small" id="board_date">날짜</p>
										</div>
										<p class="text-muted" id="board_info"> 조회수 몇명 추천수 0 댓글 0 </p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<i class="far fa-hand-point-right"></i>
					<p class="text-muted" id="board_content">글 내용 내용 내용</p>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style= margin-top:20px;>
		<div class="col-md-8 col-xl-8 grid-margin stretch-card" style="margin: 0 auto;">
			<div class="card">
				<div class="card-body">
					<ul id= "comment_info" style= "list-style:none;">
						<li style="margin-bottom:10px;" id="commet-ul">
							<div><span style="font-weight:bold; color:#777777;">작성자명</span> <span style="color:#777777;">2022.11.11 12:10:12</span></div>
							<div>댓글내용</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style="margin-top: 20px;">
		<div class="col-md-8 col-xl-8 grid-margin stretch-card" style="margin: 0 auto;">
			<div class="card">
				<div class="card-body">

					<form id="commentform" name ="commentform" method="post">
						<p>
							<label>댓글 쓰기</label>
						</p>
						<p>
							<textarea rows="5" cols="50" id="cmt_content" name="cmt_content"></textarea>
						</p>
						<p>
							<button type="button" id="comment" onclick="comment_write()" class="btn btn-inverse-primary btn-fw">댓글 작성</button>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
$(function(){
	board_getlist();
	getCommentList();
	console.log("게시글 idx : "+${board_idx})	
})
function comment_write(){
	console.log($("#member_idx").val());
	console.log($("#board_idx").val());
	console.log($("#cmt_upidx").val());
	console.log($("#cmt_content").val());
	
	$.post('/CommentAction.do', {
		'member_idx': $("#member_idx").val(),'board_idx': $("#board_idx").val(),
		'cmt_upidx': $("#cmt_upidx").val(),	'cmt_content': $("#cmt_content").val(),
	}, function (json) {
		console.log(json)
		if(json.result == 0){
			alert("등록 실패");
		}else{
			$("#comment_info").empty();
			getCommentList();
			$("#cmt_content").val(""); //텍스트 박스 초기화
			
		}
		
		
		
	}, "json"); 
}
function getCommentList(){
	$.post('/getCommentList_Action.do', {'board_idx' : ${board_idx}}, function (json) {
		  console.log(json);
		  /* 댓글 정보 */
		  $("#comment_info").empty();
		  console.log(json.c_list);
		  
		  if(json.c_list == "" || json.c_list == null){
			  $("#comment_info").append("<li style='margin-bottom:10px;'><div><span style='font-weight:bold; color:#777777; margin-right:10px;'>댓글이 없습니다</span></div></li>")
		  }else{
		  
			  for(var i=0; i<json.c_list.length; i++){
				  
				  var timestamp = json.c_list[i].cmt_date
				  var date = new Date(timestamp);
				  
		          if((date.getMonth()+1) <10){
		              now_month = "0"+ (date.getMonth()+1);
		          }else{
		              now_month = (date.getMonth()+1);
		          }
		          if((date.getDate()) <10){
		              now_day = "0"+ (date.getDate());
		          }else{
		              now_day = (date.getDate());
		          }
			  
		      var c_style = '';
		      var replyimg= '';
		      
		      if(json.c_list[i].level > 1){
		    	  replyimg = '<i class="far fa-hand-point-right" style="margin-right:10px;"></i>';
		    	  if(json.c_list[i].level == 2){ c_style = 'margin-left:3%;'}
			      else if(json.c_list[i].level == 3){ c_style ='margin-left:6%;'}
			      else if(json.c_list[i].level == 4){ c_style = 'margin-left:9%;'}
			      else if(json.c_list[i].level == 5){ c_style = 'margin-left:12%;'}  
		      }
		    	
		      let com_html = '';
	
		      com_html += "<li class='cmt_"+ json.c_list[i].cmt_idx+"' style='margin-bottom:10px;"+c_style+"'>";
		      com_html += "<div>" +replyimg;
		      com_html += "<span style='font-weight:bold; color:#777777; margin-right:10px;'>"+json.c_list[i].memberdto.member_name+"</span";
		      com_html += "<span style='color:#777777;'>" + date.getFullYear() +"-"+now_month+"-"+now_day+" "+date.getHours()+":"+date.getMinutes() +"</span>";
		      com_html += "</div>";
			  com_html += "<div>" +json.c_list[i].cmt_content+ "</div>"
			  com_html += "</li>";
			  $("#comment_info").append(com_html)
	    	 /*  $("#comment_info").append("<li class ='cmt_"+json.c_list[i].cmt_idx+"' style='margin-bottom:10px;"+ c_style+"'>" +
					  "<div>"+replyimg+"<span style='font-weight:bold; color:#777777; margin-right:10px;'>" + json.c_list[i].memberdto.member_name +"</span><span style='color:#777777;'>" + date.getFullYear() +"-"+now_month+"-"+now_day+" "+date.getHours()+":"+date.getMinutes() +"</span></div>" +
					  "<div>"+json.c_list[i].cmt_content+"</div>" +"</li>") */
			 
			  }
		  }
		  
    }, "json");
}

function board_getlist(){
	  $.post('/board/board_getlistAjax_action.do', {'board_idx' : ${board_idx}}, function (json) {
		  console.log(json);
		  /* 게시글 정보 */
		  var timestamp = json.list.board_date
		  var date = new Date(timestamp);
		  
          if((date.getMonth()+1) <10){
              now_month = "0"+ (date.getMonth()+1);
          }else{
              now_month = (date.getMonth()+1);
          }
          if((date.getDate()) <10){
              now_day = "0"+ (date.getDate());
          }else{
              now_day = (date.getDate());
          }
		  $("#board_h_info").append('<input type="hidden" id="member_idx" name="member_idx" value="'+json.list.member_idx+'">')
		  $("#board_h_info").append('<input type="hidden" id="board_idx" name="board_idx" value="'+json.list.board_idx+'">')
		  $("#board_h_info").append('<input type="hidden" id="cmt_upidx" name="cmt_upidx" value="0">')
		  $("#board_title").empty();
		  $("#board_title").html(json.list.board_title);
		  $("#board_writer").empty();
		  $("#board_writer").html(json.list.memberdto.member_name);
		  $("#board_date").empty();
		  $("#board_date").html(date.getFullYear() +"-"+now_month+"-"+now_day+" "+date.getHours()+":"+date.getMinutes());
		  $("#board_info").empty();
		  $("#board_info").html("조회수 "+json.list.board_hits+" 추천수 "+"0" +" 댓글 "+json.c_count);
		  $("#board_content").empty();
		  $("#board_content").html(json.list.board_content);
		  
		  /* 댓글 정보 */
		 /*  $("#comment_info").empty();
		  console.log(json.c_list);
		  
		  if(json.c_list == "" || json.c_list == null){
			  $("#comment_info").append("<li style='margin-bottom:10px;'><div><span style='font-weight:bold; color:#777777; margin-right:10px;'>댓글이 없습니다</span></div></li>")
		  }else{
		  
			  for(var i=0; i<json.c_list.length; i++){
				  
				  var timestamp = json.c_list[i].cmt_date
				  var date = new Date(timestamp);
				  
		          if((date.getMonth()+1) <10){
		              now_month = "0"+ (date.getMonth()+1);
		          }else{
		              now_month = (date.getMonth()+1);
		          }
		          if((date.getDate()) <10){
		              now_day = "0"+ (date.getDate());
		          }else{
		              now_day = (date.getDate());
		          }
			  
		      var c_style = '';
		      var replyimg= '';
		      if(json.c_list[i].level > 1){
		    	  replyimg = '<i class="far fa-hand-point-right" style="margin-right:10px;"></i>';
		    	  if(json.c_list[i].level == 2){ c_style = 'margin-left:3%;'}
			      else if(json.c_list[i].level == 3){ c_style ='margin-left:6%;'}
			      else if(json.c_list[i].level == 4){ c_style = 'margin-left:9%;'}
			      else if(json.c_list[i].level == 5){ c_style = 'margin-left:12%;'}  
		      }
		    	 
	    	  $("#comment_info").append("<li style='margin-bottom:10px;"+ c_style+"'>" +
					  "<div>"+replyimg+"<span style='font-weight:bold; color:#777777; margin-right:10px;'>" + json.c_list[i].memberdto.member_name +"</span><span style='color:#777777;'>" + date.getFullYear() +"-"+now_month+"-"+now_day+" "+date.getHours()+":"+date.getMinutes() +"</span></div>" +
					  "<div>"+json.c_list[i].cmt_content+"</div>" +"</li>")
			 
			  }
		  } */
		  
      }, "json");
}
</script>
</body>
</html>


