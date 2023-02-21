<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath  = request.getContextPath();
	
	//Member loginUser = (Member)session.getAttribute("loginUser");
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
    <div class="wrap">
        <div id="mypage">
            <div id="mypage-top">
                <img src="../resource/cat (베리 페리_2022).png" alt="cat" width="50px" height="50px">
                ::마이페이지
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
                기 작성했던 글이 나오는 공간
            </div>

            <div class="term">(빈공간)</div>

            <div id="mypage-outmem" align="right" >
                <button type="button" class="btn btn-sm btn-warning" id="update-mem" data-toggle="modal" data-target="#inputPwdModal">정보수정</button>
                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal">회원탈퇴</button>
            </div>

			<!-- The Modal -->
			<form action="">
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
								<table>
									<tr align="center">
										<th>이름</th>
										<td>이름가져오기 수정가능</td>
									</tr>
									<tr align="center">
										<th>이메일</th>
										<td>이메일 가져오기 수정불가</td>
									</tr>
									<tr align="center">
										<th>현재 비밀번호</th>
										<td>현재 비밀번호 입력</td>
									</tr>
									<tr align="center">
										<th>변경할 비밀번호</th>
										<td>변경할 비밀번호 입력</td>
									</tr>
									<tr>
										<th>변경할 비밀번호 확인</th>
										<td>변경할 비밀번호 확인. 위와 동일한지</td>
									</tr>
									<tr align="center">
										<th>생년월일</th>
										<td><select name="birth" id="">
												<option value="2008">2008년</option>
												<option value="2007">2007년</option>
												<option value="2006">2006년</option>
												<option value="2005">2005년</option>
												<option value="2004">2004년</option>
												<option value="2003">2003년</option>
												<option value="2002">2002년</option>
												<option value="2001">2001년</option>
												<option value="2000">2000년</option>
												<option value="1999">1999년</option>
												<option value="1998">1998년</option>
												<option value="1997">1997년</option>
												<option value="1996">1996년</option>
												<option value="1995">1995년</option>
												<option value="1994">1994년</option>
												<option value="1993">1993년</option>
												<option value="1992">1992년</option>
												<option value="1991">1991년</option>
												<option value="1990">1990년</option>
												<option value="1989">1989년</option>
												<option value="1988">1988년</option>
												<option value="1987">1987년</option>
												<option value="1986">1986년</option>
												<option value="1985">1985년</option>
												<option value="1984">1984년</option>
												<option value="1983">1983년</option>
												<option value="1982">1982년</option>
												<option value="1981">1981년</option>
												<option value="1980">1980년</option>
												<option value="1979">1979년</option>
												<option value="1978">1978년</option>
												<option value="1977">1977년</option>
												<option value="1976">1976년</option>
												<option value="1975">1975년</option>
												<option value="1974">1974년</option>
												<option value="1973">1973년</option>
												<option value="1972">1972년</option>
												<option value="1971">1971년</option>
												<option value="1970">1970년</option>
												<option value="1969">1969년</option>
												<option value="1968">1968년</option>
												<option value="1967">1967년</option>
												<option value="1966">1966년</option>
												<option value="1965">1965년</option>
												<option value="1964">1964년</option>
												<option value="1963">1963년</option>
												<option value="1962">1962년</option>
												<option value="1961">1961년</option>
												<option value="1960">1960년</option>
												<option value="1959">1959년</option>
												<option value="1958">1958년</option>
										</select> <select name="birth" id="">
												<option value="1">1월</option>
												<option value="2">2월</option>
												<option value="3">3월</option>
												<option value="4">4월</option>
												<option value="5">5월</option>
												<option value="6">6월</option>
												<option value="7">7월</option>
												<option value="8">8월</option>
												<option value="9">9월</option>
												<option value="10">10월</option>
												<option value="11">11월</option>
												<option value="12">12월</option>
										</select> <select name="" id="">
												<option value="1">1일</option>
												<option value="2">2일</option>
												<option value="3">3일</option>
												<option value="4">4일</option>
												<option value="5">5일</option>
												<option value="6">6일</option>
												<option value="7">7일</option>
												<option value="8">8일</option>
												<option value="9">9일</option>
												<option value="10">10일</option>
												<option value="11">11일</option>
												<option value="12">12일</option>
												<option value="13">13일</option>
												<option value="14">14일</option>
												<option value="15">15일</option>
												<option value="16">16일</option>
												<option value="17">17일</option>
												<option value="18">18일</option>
												<option value="19">19일</option>
												<option value="20">20일</option>
												<option value="21">21일</option>
												<option value="22">22일</option>
												<option value="23">23일</option>
												<option value="24">24일</option>
												<option value="25">25일</option>
												<option value="26">26일</option>
												<option value="27">27일</option>
												<option value="28">28일</option>
												<option value="29">29일</option>
												<option value="30">30일</option>
												<option value="31">31일</option>
										</select></td>
									</tr>
								</table>




							</div>

							<script>
					            function updateMem(){
					              if($()){
					                /*무엇인가를 적어보자. 비밀번호가 맞지않으면 안된다. 뭐 그런거?*/
				              			}
				            	}
				         	</script>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="ntn btn-warning"
									data-dismiss="modal" onclick="return updateMem();">완료</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
							</div>

						</div>
					</div>
				</div>
			</form>
			
			<!-- 회원탈퇴용 모달 --> <!--  w3school에서 복붙            -->
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
          	<b>탈퇴 후 복구가 불가능합니다. <br>정말로 탈퇴하시겠습니까?</b> <br><br>
  
          	비밀번호 : <input type="password" name="userPwd" required> <br><br>
          	<button type="submit" class="btn btn-sm btn-danger" onclick="return validateMember();">탈퇴하기</button>

			<div id="mypage-foot" align="center" style="padding: 10px;">
                <a href="#">이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">쿠키정책</a>
            </div>
            <div id="mypage-an">
                <p align="center">c 2023 MySNS reserved</p>
            </div>
        </div>
    </div>


</body>
</html>