<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@page import="com.kh.member.model.dao.MemberDao"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String userName = request.getParameter("name");
	String phone = request.getParameter("phone");
	MemberDao dao = new MemberDao();
	String id = dao.findId(userName, phone);
	
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
    <title>아이디 찾기</title>
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
	 .links{
        text-align: center;
        margin-bottom: 10px;
    }

    a{ 
    	color: #000000; text-decoration: none; 
    }
    .text2{
    	color : blue;
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
            
			<h2 class="card-title" style="color:#6667AB;"><img src="resources/image/cat/cat_2022.png" width="60px" >아이디 찾기</h2>
		</div>
        
		<div class="card-body">

      <form action="<%=contextPath%>/find.pwd" class="form-signin" method="POST">
		
      <%if(id != null){ %>
  		 <p class="text2"> ${findid2}</p>
         <span>회원가입시 사용한 이메일은 .. <p><%=id%></p>입니다.</span>
        <!-- <input type="text" name="name" id="name" class="form-control" placeholder="이름" required autofocus><BR> -->
      <%} else { %>
      <span> 등록된 정보가 없습니다.</span>
      <input type="button" id="btnback" value="다시 찾기" onclick="history.back()">
      <%} %>
        	<p class="check" id="check">${check}</p><br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" onclick="findPwd();">비 밀 번 호 찾 기</button>
      
      </form>
        
		</div>
        <div class="links">
            <a href="<%=contextPath%>/find.pwd">비밀번호 찾기</a> | <a href="<%=contextPath%>">로그인</a> | <a href="<%=contextPath%>/enroll.me">회원가입</a>

        </div>
	</div>
   
  </body>
  <script type="text/javascript">
		
  		function findPwd(){
  			location.href='<%=contextPath%>/find.pwd'
		
  		}
  
  		$("#name").focusout(function(){
  			
	     if($('#name').val() == ""){
	   		$('#check').text('이름을 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   
	     }else{
	    	 $('#check').hide();
	     }
	     });
	     
  		
  
  </script>
</html>