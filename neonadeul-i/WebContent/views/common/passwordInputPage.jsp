<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        div{border: 1px solid black;}
        #wrap_input{
            width: 400px;
            height: 200px;
            border: 1px solid lightgray;
            margin: 150px auto;
            position: relative;
        }
        #input_pwd{width: 100%; height: 35%; box-sizing: border-box; }
        #pwd-null{width: 100%;height: 40%; box-sizing: border-box;}
        #pwd-foot{width: 100%;height: 25%; box-sizing: border-box;}
        .blur::before{
            content: "";
            /* background: url(); */
            background-size: cover;
            opacity: 0.5;
            position: absolute;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
        }
    </style>
</head>
<body>

	<%@include file ="loginPage.jsp" %>
	
	    <div class="blur">
        <div id="wrap_input">
            <div id="input_pwd" align="center">
                <input type="password" id="password" placeholder="비밀번호를 입력하세요">
                <button type="submit" id="password_submit" onclick="return validatePwd()">로그인</button>
            </div>
            <div id="pwd-null">공백입니다.</div>
            <div id="pwd-foot" align="right">
                <button type="button">취소</button>
                <button type="button">비밀번호찾기</button>
            </div>
        </div>
    </div>
	
    <script>
        let login_btn = document.getElementById("login_btn");
        let password_submit = document.getElementById("password_submit");
        let 
        
        function validatePwd(){
        	if($("input[id=password]").val() != $(""))
        		alert("아이디 혹은 비밀번호가 일치하지 않습니다.")
        		return false;
        }

    </script>
	

</body>
</html>