package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int userNo; // MNO
	private String userName; // USERNAME
	private String userId; // EMAIL
	private String userPwd; // USERPWD
	private Date birth; // BIRTH
	private Date enrollDate; // ENROLLDATE
	private Date leaveDate; // LEAVEDATE
	private int membership; // MEMBERSHIP
	
	public Member() {}

	public Member(int userNo, String userName, String userId, String userPwd, Date birth, Date enrollDate,
			Date leaveDate, int membership) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.leaveDate = leaveDate;
		this.membership = membership;
	}
	
	public Member(String userName, String userId, String userPwd, Date birth) { // ?
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.birth = birth;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public int getMembership() {
		return membership;
	}

	public void setMembership(int membership) {
		this.membership = membership;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", birth=" + birth + ", enrollDate=" + enrollDate + ", leaveDate=" + leaveDate + ", membership="
				+ membership + "]";
	}
	
	

}
