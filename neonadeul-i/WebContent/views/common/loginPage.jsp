<%@ page import="com.kh.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
      #wrap{
          border: 1px solid red;
          width: 1000px;
          height: 600px;
          margin: auto;
      }
      #wrapDiv{ 
          border-top: 1px solid lightgray;
          border-bottom: 5px solid lightgray;
          border-left: 2px solid lightgray;
          border-right: 5px solid lightgray;
          width: 750px;
          height: 500px; 
          margin: auto;
      }

      #wrapDiv>div{border: 1px solid black;}
      #login_top{width: 100%; height: 30%;box-sizing: border-box;}
      #login_logon{width: 100%;height: 30%;box-sizing: border-box;}
      #login_findid{width: 100%;height: 10%;box-sizing: border-box;}
      #login_enroll{width: 100%;height: 20%;box-sizing: border-box;}
      #login_foot{width: 100%;height: 10%;box-sizing: border-box;}
  </style>
</head>
<body>
    <div id="wrap">
        <div id="wrapDiv">
            <div id="login_top">
                <img src="../resource/cat (베리 페리_2022).png" alt="cat" width="30px" height="30px">
                		  <a href="<%= contextPath %>">너나들이:: 로그인</a>
            </div>
            <div id="login_logon">
                > 새로운 소식을 사람들과 공유하세요
                <input type="text" name="userId" placeholder="아이디를 입력하세요">
                <button type="button" id="login_btn" data-toggle="modal" data-target="#inputPwd">로그인</button>
            </div>
            <div id="login_findid">
                <button type="button"> <a href="#">아이디찾기</a></button>
            </div>
            <div id="login_enroll">
                <button type="button" onclick="enrollPage()">가입하기</button>
                <button type="button"> <a href="#">문의하기</a></button>
            </div>
            
            <script>
            	function enrollPage(){
            		location.href = "<%= contextPath %>"/views/member/memberEnrollForm.jsp
            	}
            </script>
            <div id="login_foot">
                <a href="#">이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">쿠키정책</a>
            </div>

        </div>
        <p align = "center">c 2023 MySNS reserved</p> 
    </div>
</body>
</html>