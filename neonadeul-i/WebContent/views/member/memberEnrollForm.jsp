<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        div{border: 1px solid red;}
        a{border: 1px solid red;}
    </style>
</head>
<body>

    <div id="wrap_me1">
        <form action="insert.me">
            <div style="background-color: aquamarine;" align="center">회원가입 1/3</div>
            <div>막대기</div>
            <div id="wrap_input"></div>
            <div align="center">
                <a href="#">네이버</a>
                <a href="#">구글</a>
                <a href="#">카카오</a>
            </div>

            <hr>

            <div>
                <input type="text" placeholder="이름을 입력하세요(닉네임)">
            </div>
            <div>
                가입가능합니다(확인문구) <button type="button">중복확인</button>
            </div>
            <div><input type="text" placeholder="이메일을 입력하세요"></div>
            <div>가입가능합니다(확인문구) <button type="button">중복확인</button></div>
            <div><input type="password" placeholder="비밀번호를 입력하세요"></div>
            <div><input type="password" placeholder="비밀번호를 다시 입력하세요"></div>
            <div>비밀번호가 일치/불일치 합니다(확인문구)</div>
            <div><b>생년월일</b></div>
            <div>
                <select name="" id="">
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

                </select>

                <select name="" id="">
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
                </select>

                <select name="" id="">
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
            <div>
                <input type="checkbox"> <a href="#">이용약관</a> 을 읽었으며, 동의합니다.
            </div>
            <div align="center">
                <button type="button">취소</button>
                <button type="submit">완료</button>
            </div>
        </form>
        
    </div>

</body>
</html>