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
		System.out.println("여기도?");
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
	
	public Member deleteMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, m);
		Member deleteMem = null;
		
		if(result > 0) {
			commit(conn);
//			deleteMem = "";
		}else {
			rollback(conn);
		}
		close(conn);
		
		return deleteMem;
	}
	
	public String findId(String userName) {
		Connection conn = getConnection();
		
		String findId = new MemberDao().findId(conn, userName);
		
		close(conn);
		return findId;
	}
	
	public Member findPwd(String inputPwd, String userName, String email) {
		Connection conn = getConnection();
		
		int result = new MemberDao().findPwd(conn, inputPwd, userName, email);
		Member updatePwd = null;
		
		if(result > 0) { // 성공
			commit(conn);
			updatePwd = new MemberDao().selectMember(conn, email);
		} else { // 실패
			rollback(conn);
		}
		close(conn);
		return updatePwd;
	}

}
