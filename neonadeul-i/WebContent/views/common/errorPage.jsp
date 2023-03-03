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
<title>Insert title here</title>
</head>
<body>

	<h3 align="center" style="color:red"><%=request.getAttribute("errorMsg") %></h3>
	<br><br>
	<div class="bag" align="center">
		<button type="button" onclick="history.back()"  style="width: 100px; height: 100px;">
			이전페이지로
		</button>
	</div>
</body>
</html>