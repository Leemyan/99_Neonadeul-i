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
        margin-top: 100px;
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

    #input-id{width: 400px;}
    
    /* #wrapDiv div {border: 1px solid black;} */
    #login_top{width: 100%; height: 20%;box-sizing: border-box; margin-top: 15px;}

    #login_findid{width: 100%;height: 10%;box-sizing: border-box;}
    #login_enroll{width: 95%;height: 20%;box-sizing: border-box;}
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
  	<% if(alertMsg != null) { %>
	<script>
		alert("<%= alertMsg %>");
	</script>
	<% session.removeAttribute("alertMsg"); %>  <!-- 세션만료시키기 위한것(안하면 회원가입시 home눌러도 회원가입 축하한다고 나옴) -->
	<% } %>
    <div id="wrapDiv">
    
      <div id="login_top">
        <img src="resources/image/cat/cat_2022.png" alt="cat" width="50px" height="50px" >
          <a href="<%= contextPath %>"><b>너나들이:: 로그인</b></a>
      </div>
      
      <form action="<%=contextPath%>/login.me" method="post">
        <div id="login_logon" style="height:200px;">
    
            <br><h3 align="center"> 새로운 소식을 사람들과 공유하세요</h3> <br>

              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="input-id" type="text" name="userId" placeholder="아이디를 입력하세요" required>
            <button type="button" id="login_btn" data-toggle="modal" data-target="#inputPwdModal">로그인</button>
        </div>
        
        <!-- The Modal -->
  
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
              
                <input type="hidden" name="userId" value="userId">
                비밀번호 입력: 
                <input type="password" name="userPwd" required>
                <button type="submit" onclick="return validatePwd();">로그인</button>
              
              </div>
          
              <script>
                function validatePwd(){
                  if(){ // 탈퇴회원 막기. null로 실패, 방법 궁구하자
                    	
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

      <div id="login_findid">
        <button type="button" onclick="location.href='<%=contextPath%>/find.id'" style="margin-left: 50px;" > 아이디찾기</button>
        <button type="button" onclick="location.href='<%=contextPath%>/find.pwd'" style="margin-left: 5px;" > 비밀번호찾기</button>
      </div>
        <div id="login_enroll" align="right">
            <button type="button" onclick="enrollPage()">가입하기</button>
            <button type="button" id="btn-chat" data-toggle="modal" data-target="#customer-chat">문의하기(chat)</button>

              <!-- The Modal -->
          
              <div class="modal" id="customer-chat">
                <div class="modal-dialog">
                  <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">궁금한 점을 물어보세요</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                      <iframe src="https://service.dongledongle.com/MySNS-semi"  width="100%" height="500"></iframe>
                      
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
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
   </div> 
    <!--const userId = document.getElementByName("userId") 안되니 봉인  -->
	</div>
	</div>
    
    
</body>
</html>