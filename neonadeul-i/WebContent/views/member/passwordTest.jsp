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

	<div class="modal-body" align="center">
							
								<form action="<%=contextPath%>/updatePwd.me" method="post">
									<input type="hidden" name="email" value="<%=email%>">
									<table>
										<%-- <tr align="center">
											<th>이름</th>
											<td><%=loginUser.getUserName()%></td>
										</tr>
										<tr align="center">
											<th>이메일</th>
											<td><%=loginUser.getEmail()%></td>
										</tr> --%>
									
										<tr align="center">
											<th>현재 비밀번호</th>
											<td><input type="password" id="userPwd" name="userPwd" required autoComplete="off"></td>
										</tr>
										<tr align="center">
											<th>변경할 비밀번호</th>
											<td><input type="password" id="updatePwd" name="updatePwd" required autoComplete="off"></td>
										</tr>
										<tr>
											<th>변경할 비밀번호 확인</th>
											<td><input type="password" id="checkPwd" name="checkPwd" required autoComplete="off"></td>
										</tr>
									</table>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" class="btn btn-warning" data-dismiss="modal" onclick="return validatePwd();">
											완료
										</button>
										<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.href='<%=contextPath%>/mypage.me';">취소</button>
									</div>
								</form>
								<script>
								function validatePwd(){
									if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
									alert("비밀번호 변경 실패(불일치)")
									return false;  
									} else{
										alert("비밀번호 변경 성공")
									}
								}
								</script>
							</div>


</body>
</html>