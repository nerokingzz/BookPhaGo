package org.team.bpg.member.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/master
@Component("MemberVO")
public class MemberVO {

	private String bno;
	private String userId;
	private String userId1;
	private String userPass;
	private String userPass1;
	private String userName;
	private String userEmail;
	private String userTel;
	private String userAge;
	private String userGender;
	private String userTaste1;
	private String userTaste2;
	private String userTaste3;
<<<<<<< HEAD
	private String userBadcnt;
=======
	private String badcnt;
>>>>>>> refs/remotes/origin/master
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
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getUserPass1() {
		return userPass1;
	}
	public void setUserPass1(String userPass1) {
		this.userPass1 = userPass1;
	}
	public String getUserId1() {
		return userId1;
	}
	public void setUserId1(String userId1) {
		this.userId1 = userId1;
	}
	public String getUserBadcnt() {
		return userBadcnt;
	}
	public void setUserBadcnt(String userBadcnt) {
		this.userBadcnt = userBadcnt;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public String getBadcnt() {
		return badcnt;
	}
	public void setBadcnt(String badcnt) {
		this.badcnt = badcnt;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", regDate="
				+ regDate + "]";
	}


	


	
}
