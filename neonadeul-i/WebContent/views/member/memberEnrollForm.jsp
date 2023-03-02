<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath  = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        /* div{border: 1px solid red;} */
        /* a{border: 1px solid red;} */

        #wrap-me1{
            border-top: 1px solid lightgray;
            border-bottom: 5px solid lightgray;
            border-left: 2px solid lightgray;
            border-right: 5px solid lightgray;
            width: 500px;
            height: 575px;
            margin: auto;
            margin-top: 100px;
            box-sizing: border-box;
        }

        #mem-top{width: 100%; height: 5%;}
        #mem-bar{width: 100%; height: 3%;}
        #wrap-input{width: 100%; height: 10%;}
        

    </style>
<!-- jquery파일 종합응용에서 복붙함 -->
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- bootstrap -> get started -> copy & paste -->
</head>
<body>

	<div id="wrap-me1">
		<form action="<%=contextPath %>/insert.me" method="post">
			<div id="mem-top"
				style="background-color: aquamarine; height: 37.5px; line-height: 37.5px;"
				align="center">
				<b>회원가입</b>
			</div>
			<div id="mem-bar" align="center" style="height: 25px;">막대기</div>

			<div id="wrap-input" align="center">
				<div align="center" style="height: 75px; line-height: 37px;">
					<img src="../../resources/image/webLogo/google.png" alt="구글"
						width="80px" onclick=""> <img
						src="../../resources/image/webLogo/naver.png" alt="네이버"
						width="80px" style="margin: 0px 15px;" onclick=""> <img
						src="../../resources/image/webLogo/kakao.png" alt="카카오"
						width="80px" onclick="">
				</div>

				<hr>

				<div>
					<input type="text" name="userName" placeholder="이름을 입력하세요(닉네임)"
						style="width: 250px;">
				</div>
				<div style="height: 37.5px;">
					가입가능합니다(확인문구)
					<button type="button">중복확인</button>
				</div>
				<div>
					<input type="text" name="email" placeholder="이메일을 입력하세요"
						style="width: 250px;">
				</div>
				<div style="height: 37.5px;">
					가입가능합니다(확인문구)
					<button type="button">중복확인</button>
				</div>
				<div style="height: 37.5px;">
					<input type="password" name="userPwd" placeholder="비밀번호를 입력하세요"
						style="width: 250px;">
				</div>
				<div>
					<input type="password" placeholder="비밀번호를 다시 입력하세요"
						style="width: 250px;">
				</div>
				<div style="height: 37.5px;">비밀번호가 일치/불일치 합니다(확인문구)</div>
				<!--  
				<div style="height: 37.5px;">
					<b>생년월일</b>
				</div>
				<div style="height: 37.5px;">
					<select name="birth" id="birthYear">
						<option value="">2022</option>
						<option value="">2021</option>
						<option value="">2020</option>
						<option value="">2019</option>
						<option value="">2018</option>
						<option value="">2017</option>
						<option value="">2016</option>
						<option value="">2015</option>
						<option value="">2014</option>
						<option value="">2013</option>
						<option value="">2012</option>
						<option value="">2011</option>
						<option value="">2010</option>

					</select> <select name="birth" id="birthMonth">
						<option value="">1월</option>
						<option value="">2월</option>
						<option value="">3월</option>
						<option value="">4월</option>
						<option value="">5월</option>
						<option value="">6월</option>
						<option value="">7월</option>
						<option value="">8월</option>
						<option value="">9월</option>
						<option value="">10월</option>
						<option value="">11월</option>
						<option value="">12월</option>
					</select> <select name="birth" id="birthDay">
						<option value="">1일</option>
						<option value="">2일</option>
						<option value="">3일</option>
						<option value="">4일</option>
						<option value="">5일</option>
						<option value="">6일</option>
						<option value="">7일</option>
						<option value="">8일</option>
						<option value="">9일</option>
						<option value="">10일</option>
					</select>
				</div>
				-->
				<div style="height: 37.5px;">
					<!-- 체크됐을때 완료버튼 활성화하기 -->
					<input type="checkbox"> <a href="<%=contextPath%>/term.no">이용약관</a> 을 읽었으며,
					동의합니다.
				</div>
				<div align="center">
					<button type="button">취소</button>
					<button type="submit">완료</button>
				</div>
			</div>
		</form>
	</div>
	

</body>
</html>