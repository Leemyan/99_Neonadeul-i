<%@page import="src.com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	// board 써라 못 가져다 쓴다.
    Member loginUser = (Member)session.getAttribute("loginUser");
 %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>

    <!-- jQuery Library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>
        /* div{border: 1px solid red;} */

        .wrap-main{
            border-top: 1px solid lightgray;
            border-bottom: 5px solid lightgray;
            border-left: 2px solid lightgray;
            border-right: 5px solid lightgray;
            width: 1000px;
            height: 750px;
            margin: auto;
            margin-top: 50px;
        }

        #main-top{width: 100%; height: 5%; box-sizing: border-box;}
        #main-an{width: 100%; height: 10%; box-sizing: border-box;}
        #main-input{width: 100%; height: 10%;box-sizing: border-box;}
        #wrap-chat{width: 95%; height: 55%; box-sizing: border-box;}
        #main-footer{width: 100%; height: 5%; box-sizing: border-box;}
        #main-root{width: 100%; height: 10%; box-sizing: border-box;}
        
    </style>
</head>
<body id="page-top">
    <div class="wrap-main">
        <div align="right" id="main-top">
            <%if(loginUser.getEmail().equals("admin")) {%>
            <button type="button" onclick="location.href='<%=contextPath%>/admin.op'">관리페이지</button>
            <!-- <a href="<%=contextPath%>/admin.op">관리페이지</a> -->
            <%} %>
        	<button type="button" style="margin-top:10px; margin-right: 5px;" onclick="location.href='<%=contextPath%>/logout.me'">로그아웃</button>
        </div>
        <div>
            <input type="image" src="resources/image/cat/cat_2022.png" width="30px" height="30px" alt="cat" id="main-logo">너나들이::Home
        </div>

        <div id="main-an" align="center"><h2>흥미로운 소식을 전해주세요!</h2></div>

        <div id="main-input" align="center" >
            <div class="dropdown mb-4" style="display: inline-block">
                <button class="btn btn-primary dropdown-toggle" type="button"
                    id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false" >
                    @<%=loginUser.getUserName() %>
                </button>

                <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton" style="z-index: 99;">
                    <a class="dropdown-item" href="<%=contextPath%>/mypage.me">마이페이지 </a>
                    
                </div>
            </div>

            <div style="display: inline-block;">
                <input type="text" style="width: 400px; height: 30px;" id="chat-content">
            </div>

            <button type="submit" style="height: 36px;" id="input-chat">보내기</button>
        </div>
        
        <script>
            function admin(){
            	console.log("123");
                location.href="<%= contextPath %>/admin.op"
            }

            $(function(){
            	$("#input-chat").click(function(){
            		$.ajax({
            			url:"blogin.me",
            			data:{input:("#input-chat").val(),
            			type:"get",
            			success : function(result){
            				$("#board").text(result)
            			},
            			error : function(result){
            				console.log("실패!")
            			},
            			complete(){
            				console.log("무조건 뜨는 확인문구!")
            			}
            			}
            		})
            	})
            })
        </script>
        

        <div id="wrap-chat" align="center" style="margin: auto;">
            <div>
                <button type="button" style="display: inline-block;" onclick="location.reload()">새로고침</button>
                <div style="display: inline-block;"><h4>공지:: 서로간의 예의를 지켜주세요!!</h4></div>
            </div>
            
            <div id="board" style="height: 353px; border: 1px solid black;">작성한 내용이 표시 될 공간</div>
        </div>

        <div id="main-footer" align="center" style="margin-top: 20px ;">
            <a href="<%=contextPath%>/term.no">이용약관</a>
            <a href="<%=contextPath%>/privacy.no">개인정보처리방침</a>
            <a href="<%=contextPath%>/cookie.no">쿠키정책</a>
        </div>
        
        <div id="main-root">
            <p align = "center">c 2023 MySNS reserved</p>
        </div>
        
         <!-- Bootstrap core JavaScript-->
        <script src="resources/vendor/jquery/jquery.min.js"></script>
        <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="resources/js/sb-admin-2.min.js"></script>

    </div>
</body>
</html>