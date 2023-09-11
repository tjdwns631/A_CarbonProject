<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
	<style>
        @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable-dynamic-subset.css");
        /*css 초기화*/
        html, body, div, span, applet, object, iframe,
        h1, h2, h3, h4, h5, h6, p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, form, label, legend,
        table, caption, tbody, tfoot, thead, tr, th, td,
        article, aside, canvas, details, embed, 
        figure, figcaption, footer, header, hgroup, 
        menu, nav, output, ruby, section, summary,
        time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            vertical-align: baseline;
            box-sizing: border-box;
        }
        /* HTML5 display-role reset for older browsers */
        article, aside, details, figcaption, figure, 
        footer, header, hgroup, menu, nav, section {
            display: block;
        }
        body {
            line-height: 1;
        }
        ol, ul {
            list-style: none;
        }
        blockquote, q {
            quotes: none;
        }
        blockquote:before, blockquote:after,
        q:before, q:after {
            content: '';
            content: none;
        }
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        button {background-color: unset; border: none; color: #fff;} 

        canvas {width: 100% !important;}
        /*디자인 수정 시작*/
        * {font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif; box-sizing: border-box;}
        *::after, *::before {box-sizing: border-box;}

        body {width:100%; height:100vh; background: url(../images/bg.png) 0% 0% / cover; display: flex; align-items: center; justify-content: center;}
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            width: 100%;
        }

        .page_title {margin-bottom: 20px;}
	</style>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
 	<div class="container">
        <h2 class="page_title">김포 탄소중립 대시보드 로그인</h2>
        <form action="login_action.do" method="post">
            <label for="username">아이디:</label>
            <input type="text" id="user_id" name="user_id" required>
            
            <label for="password">비밀번호:</label>
            <input type="password" id="user_pwd" name="user_pwd" required>
            <%-- <c:if test="${error}">
               <p id="valid" class="alert alert-danger" >${exception}</p>
			</c:if> --%>
            <button type="submit">로그인</button>
        </form>
    </div>
<script>
    $(function(){
    	
     	 var alert_msg = ${error}; //alret 띄우는 코드
         if(alert_msg != ""){
        	 msg_ori = "${exception}";
        	 msg = msg_ori.replaceAll("+", " "); //+ 표시 제거
             alert(msg);
         } 
    	
    	$("#login_btn").click(function(){
        	
    		if( $("#user_id").val()=='' ){
    			alert("아이디를 입력해주세요.");
    			return;
    		}
    		if($("#user_pwd").val()==''){
    			alert("비밀번호를 입력해주세요.");
    			return;
    		}else{
    			login_btn_function(); 
    		}

		})
		
	})
	
</script>
</body>
</html>