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
</head>
<body>
	<p id="header">쿠키정책 내용이 담길 파일입니다.</p>
	<button onclick="goBack();">뒤로가기</button>
	<script>
		function goBack(){
			history.back();
		}

		
	</script>
	<div style="position: fixed; bottom: 10px; right: 10px;">
		<a href="#header"><h1>위로가기</h1></a>
	</div>

	<pre>
	MySNS::너나들이에서는 쿠키를 비롯해 픽셀 및 로컬 저장소 등의 유사 기술을 통해 사용자에게 보다 우수하고 빠르면서도 안전한 환경을 제공합니다. 
	쿠키는 웹사이트, 애플리케이션, API, 픽셀, 임베드 및 이메일 알림 등 트위터 서비스를 운영하는 데도 사용됩니다. 
	구체적으로, 다음 용도로 이런 기술을 사용하고 있습니다.

		<ul>
		<li>로그인 상태 유지</li>
		<li>서비스 기능 제공</li>
		<li>기본 설정 관리 및 제공</li>
		<li>표시되는 콘텐츠 맞춤 설정</li>
		<li>스팸 및 사이버 폭력으로부터 사용자 보호</li>
		<li>사용자의 서비스 활용 방식 및 개선점 파악</li>
		<li>비즈니스 운영을 위해 사용되는 데이터 수집</li>
		</ul>
	</pre>
</body>
</html>