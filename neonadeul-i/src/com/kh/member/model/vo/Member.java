package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int userNo; // MNO
	private String userName; // USERNAME
	private String email; // EMAIL
	private String userPwd; // USERPWD
	private Date birth; // BIRTH
	private String phone; // PHONE
	private Date enrollDate; // ENROLLDATE
	private Date leaveDate; // LEAVEDATE
	private int membership; // MEMBERSHIP
	
	public Member() {}

	public Member(int userNo, String userName, String email, String userPwd, Date birth, String phone, Date enrollDate,
			Date leaveDate, int membership) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.email = email;
		this.userPwd = userPwd;
		this.birth = birth;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.leaveDate = leaveDate;
		this.membership = membership;
	}
	
	public Member(String userName, String email, String userPwd, String phone) { // ?
		this.userName = userName;
		this.email = email;
		this.userPwd = userPwd;
		this.phone = phone;
	}
	

	public Member(String userName, String email, String userPwd) {
		super();
		this.userName = userName;
		this.email = email;
		this.userPwd = userPwd;
	}
	
	

	

	public Member(String email, String userPwd) {
		super();
		this.email = email;
		this.userPwd = userPwd;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		return "Member [userNo=" + userNo + ", userName=" + userName + ", email=" + email + ", userPwd=" + userPwd
				+ ", birth=" + birth + ", phone=" + phone + ", enrollDate=" + enrollDate + ", leaveDate=" + leaveDate
				+ ", membership=" + membership + "]";
	}

	
	
	

}
