-- 시퀀스로 MNO 매기기(INSERT시)
DROP TABLE NOTICE;
DROP TABLE REPORT;
DROP TABLE GOOD;
DROP TABLE REPLY;
DROP TABLE POST;
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_MNO; -- 회원번호 시퀀스
DROP SEQUENCE SEQ_PNO; -- 게시물번호 시퀀스
DROP SEQUENCE SEQ_RPY_NO; -- 댓글번호 시퀀스
DROP SEQUENCE SEQ_RPRT_NO; -- 신고번호 시퀀스
DROP SEQUENCE SEQ_NTC_NO; -- 공지번호 시퀀스

CREATE TABLE MEMBER -- 회원테이블
(
    MNO NUMBER CONSTRAINT MNO_PK PRIMARY KEY,
    USERNAME VARCHAR2(30) CONSTRAINT USERNAME_NN NOT NULL,
    EMAIL VARCHAR2(150) UNIQUE,
    USERPWD VARCHAR2(15) CONSTRAINT USERPWD_NN NOT NULL,
    BIRTH DATE NOT NULL,
	PHONE VARCHAR2(20) UNIQUE,
    ENROLLDATE DATE DEFAULT SYSDATE,
    LEAVEDATE DATE DEFAULT '9999/12/31',
    MEMBERSHIP CHAR(1) DEFAULT '2' NOT NULL CHECK(MEMBERSHIP IN('1','2','3')) 
);

COMMENT ON COLUMN MEMBER.MNO IS '회원번호';
COMMENT ON COLUMN MEMBER.USERNAME IS '회원이름';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.USERPWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.BIRTH IS '생년월일';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.ENROLLDATE IS '가입일';
COMMENT ON COLUMN MEMBER.LEAVEDATE IS '탈퇴일';
COMMENT ON COLUMN MEMBER.MEMBERSHIP IS '회원구분';

CREATE SEQUENCE SEQ_MNO
NOCACHE;

INSERT INTO MEMBER 
VALUES (SEQ_MNO.NEXTVAL, '관리자', 'admin', '1111', '1992/01/15', 01011111111, SYSDATE, DEFAULT, 1);
INSERT INTO MEMBER
VALUES (SEQ_MNO.NEXTVAL, '이종규', 'jk_200@naver.com', '1234', '1991/12/11', 01022222222, SYSDATE, DEFAULT, 2);
INSERT INTO MEMBER
VALUES (SEQ_MNO.NEXTVAL, '이장규', 'leejangkyu@penpal.com', '12345', '1999/12/10', 01033333333, SYSDATE, DEFAULT, 2);
INSERT INTO MEMBER
VALUES (SEQ_MNO.NEXTVAL, '이정규', 'jungkyu77@naver.com', '123456', '1977/10/12', 01044444444, SYSDATE, DEFAULT, 2);
INSERT INTO MEMBER
VALUES (SEQ_MNO.NEXTVAL, '이동규', 'donggu@gmail.com', '1234567', '1993/02/11', 01055555555, SYSDATE, DEFAULT, 2);

CREATE TABLE POST -- 게시물 테이블
(
    PNO NUMBER CONSTRAINT PNO_PK PRIMARY KEY,
    MNO NUMBER,
    USERNAME VARCHAR2(30),
    CONTENT VARCHAR2(300) CONSTRAINT CONTENT_NN NOT NULL,
    C_CDATE DATE DEFAULT SYSDATE NOT NULL,
    M_CDATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) NOT NULL CHECK(STATUS IN('1','2')),
    COUNT NUMBER DEFAULT 0,
    CONSTRAINT MNO_FK FOREIGN KEY(MNO) REFERENCES MEMBER(MNO)
);

CREATE SEQUENCE SEQ_PNO
NOCACHE;

COMMENT ON COLUMN POST.PNO IS '게시물번호';
COMMENT ON COLUMN POST.MNO IS '회원번호';
COMMENT ON COLUMN POST.USERNAME IS '회원이름';
COMMENT ON COLUMN POST.CONTENT IS '게시물내용';
COMMENT ON COLUMN POST.C_CDATE IS '작성일';
COMMENT ON COLUMN POST.M_CDATE IS '수정일';
COMMENT ON COLUMN POST.STATUS IS '상태';
COMMENT ON COLUMN POST.COUNT IS '조회수';

INSERT INTO POST
VALUES (SEQ_PNO.NEXTVAL, 1, '관리자', '테스트 목적의 게시물입니다.', SYSDATE, SYSDATE, 1, DEFAULT );
INSERT INTO POST
VALUES (SEQ_PNO.NEXTVAL, 2, '이종규', '1등! 내가 1등으로 작성했음', SYSDATE, SYSDATE, 1, 4);
INSERT INTO POST
VALUES (SEQ_PNO.NEXTVAL, 3, '이장규', '2등! 아깝다!!!', SYSDATE, '2023/02/06', 1, DEFAULT);
INSERT INTO POST
VALUES (SEQ_PNO.NEXTVAL, 4, '이정규', '숫자놀이 그만하시고, 오늘도 고생많으셨습니다. 얼른 퇴근들!!', SYSDATE, '2023/02/07', 1, DEFAULT);
INSERT INTO POST
VALUES (SEQ_PNO.NEXTVAL, 5, '이동규', '10년만에 이름 써보네요. 반갑습니다. 그나저나 겨울이 겨울같지 않네요.', SYSDATE, SYSDATE, 1, DEFAULT);

CREATE TABLE GOOD -- 좋아요 테이블 
(
    PNO NUMBER,
    MNO NUMBER,
    COUNT NUMBER DEFAULT 0,
    CONSTRAINT PNO_FK_CLIKE FOREIGN KEY(PNO) REFERENCES POST,
    CONSTRAINT MNO_FK_CLIKE FOREIGN KEY(MNO) REFERENCES MEMBER
);

COMMENT ON COLUMN GOOD.PNO IS '게시물번호';
COMMENT ON COLUMN GOOD.MNO IS '회원번호';
COMMENT ON COLUMN GOOD.COUNT IS '좋아요 수';

INSERT INTO GOOD VALUES ('1', '2', 3);
INSERT INTO GOOD VALUES ('1', '3', 4);
INSERT INTO GOOD VALUES ('1', '4', 5);
INSERT INTO GOOD VALUES ('2', '3', 1);
INSERT INTO GOOD VALUES ('5', '5', DEFAULT);

CREATE TABLE REPLY -- 댓글 테이블
(
    RNO NUMBER PRIMARY KEY,
    MNO NUMBER,
    COMMENTS VARCHAR2(3000) NOT NULL,
    C_RDATE DATE DEFAULT SYSDATE NOT NULL,
    M_RDATE DATE DEFAULT SYSDATE,
    PNO NUMBER,
    U_RNO NUMBER,
    CONSTRAINT MNO_FK_REPLY FOREIGN KEY(MNO) REFERENCES MEMBER,
    CONSTRAINT PNO_FK_REPLY FOREIGN KEY(PNO) REFERENCES POST,
    CONSTRAINT U_RNO_FK_REPLY FOREIGN KEY(RNO) REFERENCES REPLY
);

COMMENT ON COLUMN REPLY.RNO IS '댓글번호';
COMMENT ON COLUMN REPLY.MNO IS '회원번호';
COMMENT ON COLUMN REPLY.COMMENTS IS '댓글내용';
COMMENT ON COLUMN REPLY.C_RDATE IS '작성일';
COMMENT ON COLUMN REPLY.M_RDATE IS '수정일';
COMMENT ON COLUMN REPLY.PNO IS '게시물번호';
COMMENT ON COLUMN REPLY.U_RNO IS '상위댓글번호';

CREATE SEQUENCE SEQ_RPY_NO
NOCACHE;

INSERT INTO REPLY 
VALUES (SEQ_RPY_NO.NEXTVAL, '1', '댓글테스트용 댓글입니다. 댓글입니다. 댓글', SYSDATE, NULL, 1, NULL);
INSERT INTO REPLY
VALUES (SEQ_RPY_NO.NEXTVAL, '2', '첫번째 글 첫번째 댓글!', SYSDATE, NULL, 1, 1);
INSERT INTO REPLY
VALUES (SEQ_RPY_NO.NEXTVAL, '3', '벌써 겨울이 다 지나갔네요. 눈 보고싶다.', SYSDATE, NULL, 2, NULL); 
INSERT INTO REPLY
VALUES (SEQ_RPY_NO.NEXTVAL, '4', '엊그제같은데 벌써 15년이 지났네.', SYSDATE, NULL, 3, NULL);
INSERT INTO REPLY
VALUES (SEQ_RPY_NO.NEXTVAL, '5', '시간이 흘러흘러 벌써 2023년', sysdate, null, 5, null);

CREATE TABLE REPORT -- 신고 테이블
(
    RT_NO NUMBER PRIMARY KEY,
    RPRT VARCHAR2(300) NOT NULL,
    PNO NUMBER,
    RNO NUMBER,
    CONSTRAINT PNO_FK_REPORT FOREIGN KEY(PNO) REFERENCES POST,
    CONSTRAINT RNO_FK_REPORT FOREIGN KEY(RNO) REFERENCES REPLY
);

COMMENT ON COLUMN REPORT.RT_NO IS '신고번호';
COMMENT ON COLUMN REPORT.RPRT IS '신고내용'; 
COMMENT ON COLUMN REPORT.PNO IS '게시물번호';
COMMENT ON COLUMN REPORT.RNO IS '댓글번호';

CREATE SEQUENCE SEQ_RPRT_NO
NOCACHE;

INSERT INTO REPORT VALUES (SEQ_RPRT_NO.NEXTVAL, '신고테스트', 1, NULL);
INSERT INTO REPORT VALUES (SEQ_RPRT_NO.NEXTVAL, '신고합니다.', NULL, 1);
INSERT INTO REPORT VALUES (SEQ_RPRT_NO.NEXTVAL, '신고기능', 2, NULL);
INSERT INTO REPORT VALUES (SEQ_RPRT_NO.NEXTVAL, '장난입니다. 고생하세요~', 3, NULL);
INSERT INTO REPORT VALUES (SEQ_RPRT_NO.NEXTVAL, '주제위반', NULL, 4 );

CREATE TABLE NOTICE -- 공지 테이블
(
 NTC_NO NUMBER PRIMARY KEY,
 NTC_CONTENT VARCHAR2(4000) NOT NULL
);

COMMENT ON COLUMN NOTICE.NTC_NO IS '공지사항번호';
COMMENT ON COLUMN NOTICE.NTC_CONTENT IS '공지사항내용';

CREATE SEQUENCE SEQ_NTC_NO
NOCACHE;

INSERT INTO NOTICE VALUES (SEQ_NTC_NO.NEXTVAL, '반갑습니다. 회원분!');
INSERT INTO NOTICE VALUES (SEQ_NTC_NO.NEXTVAL, '공지테스트입니다.');
INSERT INTO NOTICE VALUES (SEQ_NTC_NO.NEXTVAL, '날씨가 춥습니다. 패딩입으세요!');
INSERT INTO NOTICE VALUES (SEQ_NTC_NO.NEXTVAL, '일교차가 크네요. 감기 조심!!');
INSERT INTO NOTICE VALUES (SEQ_NTC_NO.NEXTVAL, '오늘은 입춘!');

COMMIT;
    