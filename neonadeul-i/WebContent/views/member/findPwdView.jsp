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
    .checkbox{
        margin-right: 20px;
        text-align: right;
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
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
		
		 <%
		 Object data = session.getAttribute("findid");
		 String finduid = (String)data;
  		 %>
  		 
	<div class="card align-middle" style="width:25rem;">
		<% if(alertMsg != null) { %>
			<script>
				alert("<%= alertMsg %>");
			</script>
			<% session.removeAttribute("alertMsg"); %>  <!-- 세션만료시키기 위한것(안하면 회원가입시 home눌러도 회원가입 축하한다고 나옴) -->
		<% } %>
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#6667AB;"><img src="resources/image/cat/cat_2022.png" width="60px"/>비밀번호 변경</h2>
		</div>
        
		<div class="card-body">
      <form action="<%=contextPath %>/view.pwd" class="form-signin" method="POST">
      <input type="hidden" name="member_id" >
      
        <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호" required ><BR>
        <input type="password" name="pw2" id="pw2" class="form-control" placeholder="비밀번호 재확인" required><br>
        <p class="check" id="check2">${resetpw_check}</p><br/>
        <button type="button"  id="btn-Yes" onclick="regist()" class="btn btn-lg btn-primary btn-block">비밀번호 재설정</button>
      </form>
        
		</div>
        <div class="links">
            <a href="<%=contextPath%>/views/member/findIdForm.jsp">아이디 찾기</a> | <a href="<%=contextPath%>">로그인</a> | <a href="<%=contextPath%>/enroll.me">회원가입</a>

        </div>
	</div>
  
   		
  </body>
  
  <script >
	
  	var check2 = "${findpw_checkt}";
	if(check2 != ""){
	 	alert(check2);
	}
	
	// 비밀번호 정규식
	var pwJ = /^[a-z0-9]{4,20}$/; 
	var pwc = false;
	var pwc2 = false;
	
	$("#pw").focusout(function(){
	     if($('#pw').val() == ""){
	   		$('#check').text('비밀번호를 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   	  	
	     }else if(!pwJ.test($(this).val())){
			$('#check').text('6~20자의 영문 소문자, 숫자만 사용가능합니다');
			$('#check').css('color', 'red');
	     }else{
	    	 pwc2 = true;
	    	 $('#check').hide();
	     }
	  });
	
	$("#pw2").focusout(function(){
	     if($('#pw2').val() == ""){
	   		$('#check').text('필수 정보입니다.')
	   	  	$('#check').css('color', 'red')
	 	}else
   	 	$('#check').hide()
	  });
	
	$("#pw2").keyup(function(){
		   
	    if($(this).val()!=$("#pw").val()){
	        $("#check2").html("비밀번호가 다릅니다");
	        $("#check2").css("color",'red');
	        pwc = false;
	
	    }else{
	        $("#check2").html("비밀번호가 일치합니다");
	        $("#check2").css("color",'blue');
	        pwc = true;
	    }
	});
	
	$("#pw").keyup(function(){
		     
	    if($(this).val()!=$("#pw2").val()){
	        $("#check2").html("비밀번호가 다릅니다");
	        $("#check2").css("color",'red');
	        pwc = false;
	
	    }else{
	        $("#check2").html("비밀번호가 일치합니다");
	        $("#check2").css("color",'blue');
	        pwc = true;
	    }
	});

	function regist(){
		if(pwc2 == false){
		      alert('비밀번호는 6~20자의 영문 소문자, 숫자만 사용가능합니다')
		 }else if(pwc == false ){
			  	alert('비밀번호를 다시 확인해주세요')
		}else{
		 $('form').submit();
		}
		<%session.invalidate();%>
		};
  </script>
</html>