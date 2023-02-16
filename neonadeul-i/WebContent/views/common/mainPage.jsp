<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
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
            margin-top: 100px;
        }

        #main-top{width: 100%; height: 5%; box-sizing: border-box;}
        #main-an{width: 100%; height: 10%; box-sizing: border-box;}
        #main-input{width: 100%; height: 10%;box-sizing: border-box;}
        #wrap-chat{width: 100%; height: 55%; box-sizing: border-box;}
        #main-footer{width: 100%; height: 5%; box-sizing: border-box;}
        #main-root{width: 100%; height: 10%; box-sizing: border-box;}
        
    </style>
</head>
<body>
    <div class="wrap-main">
        <div align="right" id="main-top">
        	<button type="button" style="margin-top:10px; margin-right: 5px;" onclick="location.href='<%=contextPath%>/logout.me'">로그아웃</button>
        </div>
        <div><input type="image" src="../../resources/image/cat/cat_2022.png" width="30px" height="30px" alt="cat" id="main-logo">너나들이::Home</div>
        <div id="main-an" align="center"><h2>새로운 소식을 전해주세요!</h2></div>

        <div id="main-input" align="center">
            <div style="display: inline-block;">
                <button type="button">@</button>
            </div>
            <div style="display: inline-block;">
                <input type="text">
            </div>
            <button type="submit" onclick="내용넘기기">입력</button>
        </div>
        
        <div id="wrap-chat" align="center">
            <div>
                <button type="button" style="display: inline-block;">새로고침</button>
                <div style="display: inline-block;"><h4>공지:: 서로간의 예의를 지켜주세요!!</h4></div>
            </div>
            <div style="height: 353px; ;">작성한 내용이 표시 될 공간</div>
        </div>

        <div id="main-footer" align="center">
            <a href="#">이용약관</a>
            <a href="#">개인정보처리방침</a>
            <a href="#">쿠키정책</a>
        </div>
        <div id="main-root">
            <p align = "center">c 2023 MySNS reserved</p>
        </div>
    </div>
</body>
</html>