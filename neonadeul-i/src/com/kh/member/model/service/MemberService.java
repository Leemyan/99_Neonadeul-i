package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class MemberService {
	
	
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			// 성공
			commit(conn);
		}else {
			// 실패
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		Member updateMem = null;
		
		if(result > 0) { // 성공
			commit(conn);
			// 재조회
			updateMem = new MemberDao().selectMember(conn, m.getEmail());
			
		}else { // 실패
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}
	
	public Member updatePwd(String email, String userPwd, String updatePwd) {
//		System.out.println("여기도?");
		Connection conn = getConnection();
		int result = new MemberDao().updatePwd(conn, email, userPwd, updatePwd);
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, email);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	
	public Member deleteMember(String email, String userpwd) {
//		System.out.println("삭제 서비스도 탐. 끼야호");
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, email, userpwd);
		Member deleteMem = null;
		System.out.println("result값"+result);
		if(result > 0) { // 성공
			commit(conn);
			deleteMem = new MemberDao().selectMember(conn, email);
			
		}else { // 실패
			rollback(conn);
		}
		close(conn);
//		System.out.println(" service단 deleteMem : " + deleteMem);
		return deleteMem;
	}
	
	public String findId(String userName, String phone) {
		System.out.println("service 탓나?");
		Connection conn = getConnection();
		
		String Id = new MemberDao().findId(conn, userName, phone);
		
		System.out.println("서비스 id = " + Id);
		close(conn);
		return Id;
	}
	
//	public Member findPwd2(String inputPwd, String userName, String email) { // 못씀. 이거 쓰고싶었는데,
//		System.out.println("service 탔나? 비밀번호 찾자");
//		Connection conn = getConnection();
//		
//		int result = new MemberDao().findPwd(conn, inputPwd, userName, email);
//		Member updatePwd = null;
//		
//		if(result > 0) { // 성공
//			commit(conn);
//			updatePwd = new MemberDao().selectMember(conn, email);
//		} else { // 실패
//			rollback(conn);
//		}
//		close(conn);
//		System.out.println("updatePwd : " + updatePwd );
//		return updatePwd;
//	}
	
	public String findPwd(String userName, String email) {
		System.out.println("service단 도착 그리고 Dao로 출발");
		Connection conn = getConnection();
		
		String pwd = new MemberDao().findPwd(userName, email);
		
		System.out.println("서비스 pwd : "+ pwd);
		close(conn);
		return pwd;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		
		if(count > 0) {
			
			
		}else {
			
			
		}
		
		close(conn);

		return count;

	}
	

}
