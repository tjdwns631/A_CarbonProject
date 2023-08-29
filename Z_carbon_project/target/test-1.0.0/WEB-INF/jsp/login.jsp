<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>

<div class="login-page">
  <div class="form">
    <form class="login-form" method="post">
      <input type="text" id="member_id" name="member_id" placeholder="username"/>
      <input type="password" id="member_pwd" name="member_pwd" placeholder="password"/>
      <button type= "button" id="login_btn">login</button>
    </form>
    <h1>${msg }</h1>
    <h1>${msg }</h1>
  </div>
</div>
<script>
    $(function(){
/*     	 var alert_msg = "<c:out value="${msg }" />"; //alret 띄우는 코드
         if(alert_msg != ""){
             alert(alert_msg)
         } */
    	
    	$("#login_btn").click(function(){
        	
    		if( $("#member_id").val()=='' ){
    			alert("아이디를 입력해주세요.");
    			return;
    		}
    		if($("#member_pwd").val()==''){
    			alert("비밀번호를 입력해주세요.");
    			return;
    		}else{
    			login_btn_function(); 
    		}

		})
		
	})
	
	function login_btn_function() { //로그인
   		var member_id  = $('#member_id' ).val() ;
        var member_pwd = $('#member_pwd').val() ;
        console.log(member_id +":::"+member_pwd);
        $.post('login_action/member.do', {'member_id': member_id,'member_pwd': member_pwd}, function (json) {
            if (json.result == false) {
                alert("아이디 또는 비밀번호가 틀립니다");
                return false;
            } else {
               window.location.href = "test.do"
            }
        }, "json");
    }
</script>
</body>
</html>