<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        div{border: 1px solid red;}

        .wrap{
            width: 400px;
            height: 550px;
        }

        #mypage-top{width: 100%; height: 30px; box-sizing: border-box;}
        #mypage-write{width: 100%; height: 30px; box-sizing: border-box;}
        #mypage-filter{width: 100%; height: 30px; box-sizing: border-box;}
        #mypage-space{width: 100%; height: 300px; box-sizing: border-box;}
        .term{width: 100%; height: 30px; box-sizing: border-box;}
        #mypage-outmem{width: 100%; height: 30px; box-sizing: border-box;}
        #mypage-foot{width: 100%; height: 30px; box-sizing: border-box;}
        #mypage-an{width: 100%; height: 70px; box-sizing: border-box;} 
    </style>
</head>
<body>
    <div class="wrap">
        <div id="mypage">
            <div id="mypage-top">
                <img src="../resource/cat (베리 페리_2022).png" alt="cat" width="50px" height="50px">
                ::마이페이지
            </div>
            <div id="mypage-write">
                <button type="button">내가 쓴 글/댓글</button>
            </div>
            <div id="mypage-filter">
                <select name="filter" id="">
                    <option value="최신순">최신순</option>
                    <option value="오래된순">오래된순</option>
                </select>
            </div>
            <div id="mypage-space">쓴 글이 나오는 공간</div>

            <div class="term">빈공간</div>

            <div id="mypage-outmem" align="right" >
                <button type="button">정보수정</button>
                <button type="button">회원탈퇴</button>
            </div>

            <div id="mypage-foot" align="center">
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