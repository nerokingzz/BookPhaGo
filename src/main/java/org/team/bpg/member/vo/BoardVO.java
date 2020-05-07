package org.team.bpg.member.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("BoardVO")
public class BoardVO {
	
	private int bno;
	private String userId; //로그인에 사용
	private String userPass; //로그인에 사용
	private String userName;
	private String userEmail;
	private String userTel;
	private String userAge;
	private String userGender;
	private String userTaste1;
	private String userTaste2;
	private String userTaste3;
	private int badcnt;
	private String badsts;
	private String stopstart;
	private String stopend;
	private int applycnt;
	private int borrowcnt;
	private int reservecnt;
	private String userposition;
	private String emailcheck;
	private Date regDate;
	

	
	

	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


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


	public int getBadcnt() {
		return badcnt;
	}


	public void setBadcnt(int badcnt) {
		this.badcnt = badcnt;
	}


	public String getBadsts() {
		return badsts;
	}


	public void setBadsts(String badsts) {
		this.badsts = badsts;
	}


	public String getStopstart() {
		return stopstart;
	}


	public void setStopstart(String stopstart) {
		this.stopstart = stopstart;
	}


	public String getStopend() {
		return stopend;
	}


	public void setStopend(String stopend) {
		this.stopend = stopend;
	}


	public int getApplycnt() {
		return applycnt;
	}


	public void setApplycnt(int applycnt) {
		this.applycnt = applycnt;
	}


	public int getBorrowcnt() {
		return borrowcnt;
	}


	public void setBorrowcnt(int borrowcnt) {
		this.borrowcnt = borrowcnt;
	}


	public int getReservecnt() {
		return reservecnt;
	}


	public void setReservecnt(int reservecnt) {
		this.reservecnt = reservecnt;
	}


	public String getUserposition() {
		return userposition;
	}


	public void setUserposition(String userposition) {
		this.userposition = userposition;
	}


	public String getEmailcheck() {
		return emailcheck;
	}


	public void setEmailcheck(String emailcheck) {
		this.emailcheck = emailcheck;
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

	
}
