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
          /* border: 1px solid red; */
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


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
</head>
<body>
    <div id="wrap">
        <div id="wrapDiv">
            <div id="login_top">
                <img src="../resource/cat (베리 페리_2022).png" alt="cat" width="100px" height="100px">
                		  <a href="<%= contextPath %>">너나들이:: 로그인</a>
            </div>
            <form action="<%=contextPath%>/login.me" method="post">

            <div id="login_logon">

                  > 새로운 소식을 사람들과 공유하세요
                  <input type="text" name="userId" placeholder="아이디를 입력하세요">
                  <!-- 테스트용으로 만듦 추후에 모달 or 페이지넘김으로 비밀번호 입력창 만들기 -->
                  <!-- <input type="password" name="userPwd" placeholder="비밀번호를 입력하세요"> -->
                  <button type="button" id="login_btn" data-toggle="modal" data-target="#inputPwdModal">로그인</button>
                                    
                  <!-- <button type="submit">임시로그인</button> -->
            </div>
          </form>

            <div id="login_findid">
                <button type="button"> <a href="#">아이디찾기</a></button>
            </div>
            <div id="login_enroll">
                <button type="button" onclick="enrollPage()">가입하기</button>
                <button type="button"> <a href="#">문의하기</a></button>
            </div>
            
            <script>
            	function enrollPage(){
            		location.href = "<%= contextPath %>/views/member/memberEnrollForm.jsp"
            	}
            </script>
            <div id="login_foot" align="center">
                <a href="#">이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">쿠키정책</a>
            </div>

        </div>
        <p align = "center">c 2023 MySNS reserved</p> 
    </div>
    

    const userId = document.getElementByName("userId")

    <!-- The Modal -->
  <form action="<%=contextPath%>/login.me" method="post">
      <input type="hidden">
      <div class="modal" id="inputPwdModal">
      <div class="modal-dialog">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body" align="center">
          <form action="<%= contextPath %>/login.me" method="post">
          <input type="hidden" name="userId" value="userId">
          비밀번호 입력: 
          <input type="password" name="userPwd" required>
          <button type="submit" onclick="return validatePwd();">로그인</button>
          </form>
        </div>
        
        <script>
          function validatePwd(){
            if($()){
              /*무엇인가를 적어보자. 비밀번호가 맞지않으면 안된다. 뭐 그런거?*/
            }
          }
        </script>
    
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
      </div>
      </div>
  </form>
    
</body>
</html>