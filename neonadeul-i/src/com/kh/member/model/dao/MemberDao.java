package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mno"),
							   rset.getString("username"),
							   rset.getString("email"),
							   rset.getString("userpwd"),
							   rset.getDate("birth"),
							   rset.getString("phone"),
							   rset.getDate("enrolldate"),
							   rset.getDate("leavedate"),
							   rset.getInt("membership"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getEmail());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member selectMember(Connection conn, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mno"),
							   rset.getString("username"),
							   rset.getString("email"),
							   rset.getString("userpwd"),
							   rset.getDate("birth"),
							   rset.getString("phone"),
							   rset.getDate("enrolldate"),
							   rset.getDate("leavedate"),
							   rset.getInt("membership"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int updatePwd(Connection conn, String email, String userPwd, String updatePwd) {
		System.out.println("dao 탔다.");
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, email);
			pstmt.setString(3, userPwd);
			
			/* Dao 타는지 확인했다
			 * System.out.println(updatePwd); System.out.println(email);
			 * System.out.println(userPwd);
			 */
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		// 결과값 확인함
		/* System.out.println(result + "결과(result)값 확인"); */
		return result;
	}
	
	public int deleteMember(Connection conn, String email, String userpwd) {
		/* System.out.println("Dao도 탈래탈래"); */
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, userpwd);
			
//			System.out.println("email : " + email);
//			System.out.println("userpwd : " + userpwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
//		System.out.println("result : " + result);
		return result;
	}
	
	public String findId(String name, String phone) { // 이거 씀
		
		System.out.println("dao 탔나?");
		
		String id = null;
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		ResultSet rset = null;
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			System.out.println("name : " + name);
			System.out.println("phone : " + phone);
			
			System.out.println();
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				id = rset.getString("email");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("dao id = " + id);
		return id;
	}
	
	public String findId(Connection conn, String userName, String phone) { // 이거 안씀
		String id = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				id = rset.getString("email");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close(rset);
			close(pstmt);
		}
		return id;
	}
	
	public int findPwd(Connection conn, String inputPwd, String userName, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, inputPwd);
			pstmt.setString(2, email);
			pstmt.setString(3, userName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

}
