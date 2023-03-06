<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath  = request.getContextPath();
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	//로그인 시도 전 menubar.jsp 로딩시 : null
	// 로그인 성공 후 menubar.jsp 로딩 시 : 로그인 성공한 회원의 정보가 담겨있는 Member 객체

	String alertMsg = (String)session.getAttribute("alertMsg");
	//서비스 요청 전 menubar.jsp 로딩 시 : null
	//서비스 성공 후 menubar.jsp 로딩 시  : alert로 띄워줄 메세지 문구
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			/* div{border: 1px solid red;} */

			.wrap{
				width: 600px;
				height: 550px;
				border-top: 1px solid lightgray;
				border-bottom: 5px solid lightgray;
				border-left: 2px solid lightgray;
				border-right: 5px solid lightgray;
				margin: auto;
				margin-top: 50px;
			}

			#mypage-top{width: 100%; height: 30px; box-sizing: border-box;}
			#mypage-write{width: 100%; height: 30px; box-sizing: border-box;}
			#mypage-filter{width: 100%; height: 30px; box-sizing: border-box;}
			#mypage-space{width: 95%; height: 300px; box-sizing: border-box; margin: auto;}
			.term{width: 100%; height: 30px; box-sizing: border-box;}
			#mypage-outmem{width: 95%; height: 30px; box-sizing: border-box; margin: auto;}
			#mypage-foot{width: 100%; height: 30px; box-sizing: border-box;}
			#mypage-an{width: 100%; height: 70px; box-sizing: border-box;} 

			/* #sp-write, #sp-reply{border: 1px solid black;} */
			#sp-write{width: 98%; height: 48%; margin: 3px auto ;}
			#sp-reply{width: 98%; height: 48%; margin: auto;}
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
		
	
	<%
		String email = loginUser.getEmail();
		String userName = loginUser.getUserName();
		String userPwd = loginUser.getUserPwd();
		String phone = loginUser.getPhone();
	%>
    	<div class="wrap">
   			<% if(alertMsg != null) { %>
				<script>
					alert("<%= alertMsg %>");
				</script>
				<% session.removeAttribute("alertMsg"); %>  <!-- 세션만료시키기 위한것(안하면 회원가입시 home눌러도 회원가입 축하한다고 나옴) -->
			<% } %>
			
        	<div id="mypage">
				<div id="mypage-top">
					<img src="resources/image/cat/cat_2022.png" alt="cat" width="30px" height="30px">
					<p style="display: inline-block;">::마이페이지</p>
				</div>

				<div id="mypage-write">
					<p style="margin: 10px;"><b>*내가 쓴 글/댓글</b></p>
				</div>

				<div id="mypage-filter" align="right" style="width: 580px;">
					<select name="filter" id="">
						<option value="최신순">최신순</option>
						<option value="오래된순">오래된순</option>
					</select>
				</div>

				<div id="mypage-space" style="border: 1px solid gray; opacity: 0.8;" >
					<div id="sp-write">기 작성했던 글이 나오는 공간</div>
					<div id="sp-reply">기 작성했던 댓글이 나오는 공간</div>
					
				</div>

				<div class="term"></div>

				<div id="mypage-outmem" align="right" >
					<button type="button" class="btn btn-sm btn-primary" onclick="history.back();">뒤로가기</button>
					<button type="button" class="btn btn-sm btn-warning" id="update-mem" data-toggle="modal" data-target="#inputPwdModal">정보수정</button>
					<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal">회원탈퇴</button>
				</div>

				<!-- The Modal -->
			
				<div class="modal" id="inputPwdModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">개인정보 수정</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body" align="center">
							
								<form action="<%=contextPath%>/updatePwd.me" method="post">
									<input type="hidden" name="userId" value="<%=email%>">
									<table>
										 <tr align="center">
											<th width="100">이름</th>
											<td width="200"><%=loginUser.getUserName()%></td>
										</tr>
										<tr align="center">
											<th>이메일</th>
											<td><%=loginUser.getEmail()%></td>
										</tr> 
										<tr align="center">
											<th>전화번호</th>
											<td><%=loginUser.getPhone()%></td>
										</tr>
									
									<!-- 
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
										</tr> --> <!--  별도 생성 -->
										
									</table>
								
							

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" class="btn btn-warning" data-dismiss="modal" onclick="location.href='<%=contextPath%>/pUpdate.me'">
											비밀번호 변경
										</button>
										
										<button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
									</div>
								</form>
							</div>
					<!-- <script>
						function updateMem(){
							if($("#updatePwd").val() != $("#checkPwd").val()){
								alert("변경할 비밀번호가 일치하지 않습니다.")
								console.log(updatePwd);
								console.log(checkPwd);
								
								return false;
								
								} else{
									alert("변경할 비밀번호가 일치합니다. 확인!")
									console.log(updatePwd);
									console.log(checkPwd);
								}
						}
					</script> -->
				
						</div>
					</div>
				</div>
				
			
			
			<!-- 회원탈퇴용 모달 --> <!--  w3school에서 복붙  -->
			<div class="modal" id="deleteModal">
    			<div class="modal-dialog">
     				<div class="modal-content">
  
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">비밀번호 변경</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
	
						<!-- Modal body -->
						<div class="modal-body" align="center">
							<form action="<%= contextPath %>/delete.me" method="post">
							<input type="hidden" name="email" value="<%=email%>">
							<input type="hidden" name="userpwd" value="<%=userPwd%>">
							<b>탈퇴 후 복구가 불가능합니다. <br>정말로 탈퇴하시겠습니까?</b> <br><br>
		
							비밀번호 : <input type="password" name="userPwd" required> <br><br>
							<button type="submit" class="btn btn-sm btn-danger" onclick="return validateMember();">탈퇴하기</button>
							</form>
							<div id="mypage-foot" align="center" style="padding: 10px;">
								<a href="<%=contextPath%>/term.no">이용약관</a>
								<a href="<%=contextPath%>/privacy.no">개인정보처리방침</a>
								<a href="<%=contextPath%>/cookie.no">쿠키정책</a>
							</div>
						
								<script>
								function validateMember(){
									if($("input[name=userPwd]").val() != $("input[name=checkPwd]").val()){
									alert("회원탈퇴 실패")
									console.log("회원탈퇴 탔다!")
									console.log(userPwd.val())
									return false;  
									}
								}
								</script>
								
								<div id="mypage-an">
									<p align="center">c 2023 MySNS reserved</p>
								</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
		</div>


	</body>
</html>