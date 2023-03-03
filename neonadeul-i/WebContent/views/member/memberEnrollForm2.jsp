<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String email = loginUser.getEmail();
	
	String alertMsg = (String)session.getAttribute("alertMsg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        div{border: 1px solid red;}
        /* a{border: 1px solid red;} */

        #wrap-me2{
            border-top: 1px solid lightgray;
            border-bottom: 5px solid lightgray;
            border-left: 2px solid lightgray;
            border-right: 5px solid lightgray;
            width: 500px;
            height: 300px;
            margin: auto;
            margin-top: 100px;
            box-sizing: border-box;
        }

        #mem-top{width: 100%; height: 5%;}
        #mem-bar{width: 100%; height: 3%;}
        #wrap-input{width: 100%; height: 10%;}
        

    </style>
</head>
<body>

    <div id="wrap-me2">
        <form action="insert.me">
            <div id="mem-top" style="background-color: aquamarine; height: 37.5px; line-height: 37.5px; " align="center"  >
                <b>회원가입</b>
            </div>
            <div id="mem-bar" align="center" style="height: 25px;">
                막대기 2/3
            </div>

            <div align="center">
                <b>이메일 인증 대기중입니다.</b>
            </div>

            <div>
                여백
            </div>

            <div style="height: 150px;">
                이메일 수신까지 <b>최대 30분</b>이 소요될 수 있습니다<br>
                    
                30분이 지나도록 메일이 수신되지않는다면
                스팸메일함을 확인해주세요<br>

                <B>24시간 내에 이메일인증이 이루어지지않을 시</B><br> 
                이메일 인증은 취소되고 다시 처음부터 가입해야합니다. 
            </div>

            <div id="wrap-input" align="center"  >
                <div align="center">
                    <button type="submit">완료</button>
                </div>
            </div>
        </form>
        
    </div>

</body>
</html>