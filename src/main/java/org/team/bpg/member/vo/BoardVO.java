package org.team.bpg.member.vo;

import java.util.Date;

public class BoardVO {

	private String bno;
	private String userId;
	private String userPass;
	private String userName;
	private String userEmail;
	private String userTel;
	private String userAge;
	private String userGender;
	private String userTaste1;
	private String userTaste2;
	private String userTaste3;
	private String pageNum;
	private Date regDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	
	public String getUserTaste1() {
		return userTaste1;
	}
	public void setUserTaste1(String userTaste1) {
		this.userTaste1 = userTaste1;
	}

	public String getUserTaste2() {
		return userTaste2;
	}
	public void setUserTaste2(String userTaste2) {
		this.userTaste2 = userTaste2;
	}
	
	public String getUserTaste3() {
		return userTaste3;
	}
	public void setUserTaste3(String userTaste3) {
		this.userTaste3 = userTaste3;
	}
	
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", regDate="
				+ regDate + "]";
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}


	
}
