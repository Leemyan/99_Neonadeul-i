<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");

%>      
<!DOCTYPE html>
<html lang="ko">
  <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>비밀번호 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    #btn-Yes{
        background-color: #6667AB;
        border: none;
    }
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
 
    .card-title{
        margin-left: 30px;
    }


    a{ 
    	color: #6667AB; text-decoration: none; 
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    
    .checks{
    	color : red;
    }
    </style>
  </head>
   
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<% if(alertMsg != null) { %>
		<script>
			alert("<%= alertMsg %>");
		</script>
		<% session.removeAttribute("alertMsg"); %>  <!-- 세션만료시키기 위한것(안하면 회원가입시 home눌러도 회원가입 축하한다고 나옴) -->
		<% } %>
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#6667AB;"><img src="resources/image/cat/cat.png" width="60px"/>비밀번호 찾기</h2>
		</div>
        
		<div class="card-body">

      <form name="pwFindScreen" action="<%=contextPath %>/view.pwd" class="form-signin" method="POST">
        
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required autofocus><BR>
        <input type="text" name="email" id="email" class="form-control" placeholder="이메일" required><br>

        <p class="checks" id="checks">${findpw_checkf}</p><br/>

        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">비 밀 번 호 찾기</button>
      </form>
      
		</div>
        <div class="links">
            <a href="<%=contextPath%>/find.id">아이디 찾기</a> | <a href="<%=contextPath%>">로그인</a> | <a href="<%=contextPath%>/enroll.me">회원가입</a>
        </div>
	</div>
  
  </body>
    <script type="text/javascript">

	
	  	//아이디 정규식
		// var idJ = /^[a-z0-9]{5,20}$/;
		
  		// $("#member_id").focusout(function(){
	    //  if($('#member_id').val() == ""){
	   	// 	$('#checks').text('아이디를 입력해주세요.');
	   	//   	$('#checks').css('color', 'red');
	    //  }
	    //  });
  		
  		// $("#member_id").focusout(function(){
  		// 	if(!idJ.test($(this).val())){
  		// 	$('#checks').text('5~20자의 영문 소문자, 숫자만 사용가능합니다');
  		// 	$('#checks').css('color', 'red');
  		// }
  		//  });
  		
  		$("#name").focusout(function(){
	     if($('#name').val() == ""){
	   		$('#checks').text('이름을 입력해주세요.');
	   	  	$('#checks').css('color', 'red');
	     } else{
			$('#checks').hide();
		 }
	     });
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#checks').text('이메일을 입력해주세요');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  
  </script>
</html>