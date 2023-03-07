<%@page import="com.kh.member.model.vo.Member"%>
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
<meta name ="google-signin-client_id" content="128229701016-25prktvc9e30aukgln61s228e43f7b64.apps.googleusercontent.com">
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

		#GgCustomLogin:hover{
			opacity: 70%;
			cursor: pointer;
		}
        
		.box.on{color: #999;}

    </style>
<!-- jquery파일 종합응용에서 복붙함 -->
	<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 일단 가져온 것 not a function -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
	<script>
		function idCheck(){
			window.open("/views/member/idCheck.jsp","_blank","width=300px height=100px");
		}

		function checkValue(){
			var form = document.userInfo;

			if(!form.name.value){
				alert("이름을 입력하세요.");
				return false;
			}

			if(form.nameDuplication.value != "nameCheck"){
				alert("이름(닉네임) 중복체크를 해주세요");
				return false;
			}

			if(form.email.value){
				alert("이메일을 입력하세요");
				return false;
			}

			if(form.emalilDuplication.value != "emailCheck"){
				alert("이메일 중복체크를 해주세요");
				return false;
			}

			if(!form.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}

			if(form.password.value != form.passwordcheck.value){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
			
			
		}
		</script>

	<div id="wrap-me1">
		<% if(alertMsg != null) { %>
			<script>
				alert("<%= alertMsg %>");
			</script>
			<% session.removeAttribute("alertMsg"); %>  <!-- 세션만료시키기 위한것(안하면 회원가입시 home눌러도 회원가입 축하한다고 나옴) -->
		<% } %>
		<form action="<%=contextPath %>/insert.me" method="post">
			<div id="mem-top"
				style="background-color: #6667AB; color: beige; height: 37.5px; line-height: 37.5px;"
				align="center">
				<b>회원가입</b>
			</div>
			<div id="mem-bar" align="center" style="height: 25px;">
				<progress value="50" max="100"></progress>
			</div>

			<script> // 구글 연동을 위한 구문

				//처음 실행하는 함수
				function init() {
					gapi.load('auth2', function() {
						gapi.auth2.init();
						options = new gapi.auth2.SigninOptionsBuilder();
						options.setPrompt('select_account');
						// 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
						options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
						// 인스턴스의 함수 호출 - element에 로그인 기능 추가
						// GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
						gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
					})
				}
				
				function onSignIn(googleUser) {
					var access_token = googleUser.getAuthResponse().access_token
					$.ajax({
						// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
						url: 'https://people.googleapis.com/v1/people/me'
						// key에 자신의 API 키를 넣습니다.
						, data: {personFields:'birthdays', key:'AIzaSyBJmSk_gQbVWV33vTUh2GLjjw_prM4aIKs', 'access_token': access_token}
						, method:'GET'
					})
					.done(function(e){
						//프로필을 가져온다.
						var profile = googleUser.getBasicProfile();
						console.log(profile)
					})
					.fail(function(e){
						console.log(e);
					})
				}
				function onSignInFailure(t){		
					console.log(t);
				}
				</script>
				<!-- 구글 api 사용을 위한 스크립트 -->
				<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

			

			<div id="wrap-input" align="center">
				<div align="center" style="height: 75px; line-height: 37px;">
					<img src="../../resources/image/webLogo/google.png" id="GgCustomLogin" alt="구글" width="80px" onclick=""> 
					<img src="../../resources/image/webLogo/naver.png" alt="네이버" width="80px" style="margin: 0px 15px;" onclick=""> 
					<img src="../../resources/image/webLogo/kakao.png" alt="카카오" width="80px" onclick="">
				</div>

				<hr>

				<div>
					<input type="text" id="id" name="userName" class="input_id" placeholder="이름을 입력하세요(닉네임)" onkeydown="inputNameChk();"
					style="width: 250px;">
					<input type="hidden" name="nameDuplication" value="idUncheck">
				</div>
				<div style="height: 37.5px;" align="center">
					<span id="result"></span>
					<button type="button" id="btnCheck" >중복확인</button>
				</div>
				<div>
					<input type="email" name="email" placeholder="이메일을 입력하세요"
						style="width: 250px;">
				</div>
				<div style="height: 37.5px;">
					<span id="checkEmail"> </span>
					<button type="button" onclick="emailCheck();">중복확인</button>
				</div>

				
				<div style="height: 37.5px;">
					<input type="password" class="pw" name="userPwd" id="password1" placeholder="비밀번호를 입력하세요" style="width: 250px;">
				</div>
				<div>
					<input type="password" class="pw" id="password2" placeholder="비밀번호를 다시 입력하세요" style="width: 250px;">
				</div>
				<div style="height: 37.5px;">
					<span id="alert-success" style="display:none;">비밀번호가 일치합니다</span>
					<span id="alert-danger" style="display:none; color: red; font-weight: bold;" >비밀번호가 일치하지않습니다.</span>
				</div>
				<div>
					<input type="text" name="phone" placeholder="전화번호를 입력해주세요('-' 제외)" style="width: 250px;">
				</div>
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
					<br>
					<!-- 체크됐을때 완료버튼 활성화하기 -->
					<input type="checkbox" id="chk"> 
					<a href="<%=contextPath%>/term.no">이용약관</a> 을 읽었으며, 동의합니다.

					<script>

					

						// $('.input_id').focusout(function(){
						// 	let userId = $('.input_id').val(); // input_id에 입력된 값
						

						// 	$.ajax({
						// 		url:"IdCheckService",
						// 		type:"post",
						// 		data:{userId: userId},
						// 		dataType:'json',
						// 		success:function(result){
						// 			if(result == 0){
						// 				$("#checkId").html('사용할 수 없는 아이디입니다.');
						// 				$("#checkId").attr('color','red');
						// 			} else{
						// 				$("#checkId").html('사용할 수 있는 아이디입니다.');
						// 				$("#checkId").attr('color','green');
						// 			}
						// 		},
						// 		error:function(){
						// 			alert("서버요청실패");
						// 		}
						// 	})	
						// })

						// function idCheck(){
						// 	var idStr = $("#id").val();

						// 	$.ajax({
						// 		url : "idCheckServlet?id=" + idStr,
						// 		success : function(data){
						// 			if(data == "success"){
						// 				$("#result").text("사용가능한 아이디입니다.");
						// 			} else if(data == "fail"){
						// 				$("#result").text("중복된 아이디입니다.");
						// 			}
						// 		}
						// 	})
						// }

						$('.pw').focusout(function(){
							let pwd1 = $("#password1").val();
							let pwd2 = $("#password2").val();

							if(pwd1 =="" && pwd2 ==""){
								null;
							} else if(pwd1 !="" && pwd2 !=""){
								if(pwd1 == pwd2){
									$("#alert-success").css('display', 'block');
									$("#alert-danger").css('display','none')
								} else {
									alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요")
									$("#alert-success").css('display','none');
									$("#alert-danger").css('display','block')
									$("#password2").val("")
								}

							}
						})


						$(".box button").attr("disabled", true);
							$("#chk").on('click', function(){
								var chk = $("input:checkbox[id='chk']").is(":checked");
								if(chk==true){
									$(".box button").removeAttr('disabled');
									$(".box").removeClass("on")
								} else {
									$(".box button").attr("disabled", true);
									$(".box").addClass("on")
								}
							});
							
						
					</script>


				</div>
				<div align="center" class="box on">
					<br>
					<a href="<%=contextPath%>" class="btn btn-danger">뒤로가기</a>
					<button type="submit" class="btn btn-warning" disabled>완료</button>
				</div>
			</div>
		</form>
	</div>
	

</body>
</html>