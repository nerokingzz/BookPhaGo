package org.team.bpg.com.act.vo;

public class ComMemberVO {
	
	private String member_nickname;
	private String member_id;
	private int community_id;
	private String member_join_date;
	private String member_position;
	private String member_answer1;
	private String member_answer2;
	private int member_visit_count;
	private int member_article_count;
	private int member_reply_count;
	private String member_join_status;
	
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public String getMember_join_date() {
		return member_join_date;
	}
	public void setMember_join_date(String member_join_date) {
		this.member_join_date = member_join_date;
	}
	public String getMember_position() {
		return member_position;
	}
	public void setMember_position(String member_position) {
		this.member_position = member_position;
	}
	public String getMember_answer1() {
		return member_answer1;
	}
	public void setMember_answer1(String member_answer1) {
		this.member_answer1 = member_answer1;
	}
	public String getMember_answer2() {
		return member_answer2;
	}
	public void setMember_answer2(String member_answer2) {
		this.member_answer2 = member_answer2;
	}
	public int getMember_visit_count() {
		return member_visit_count;
	}
	public void setMember_visit_count(int member_visit_count) {
		this.member_visit_count = member_visit_count;
	}
	public int getMember_article_count() {
		return member_article_count;
	}
	public void setMember_article_count(int member_article_count) {
		this.member_article_count = member_article_count;
	}
	public int getMember_reply_count() {
		return member_reply_count;
	}
	public void setMember_reply_count(int member_reply_count) {
		this.member_reply_count = member_reply_count;
	}
	public String getMember_join_status() {
		return member_join_status;
	}
	public void setMember_join_status(String member_join_status) {
		this.member_join_status = member_join_status;
	}
	
	@Override
	public String toString() {
		return "ComMemberVO [member_nickname=" + member_nickname + ", member_id=" + member_id + ", community_id="
				+ community_id + ", member_join_date=" + member_join_date + ", member_position=" + member_position
				+ ", member_answer1=" + member_answer1 + ", member_answer2=" + member_answer2 + ", member_visit_count="
				+ member_visit_count + ", member_article_count=" + member_article_count + ", member_reply_count="
				+ member_reply_count + ", member_join_status=" + member_join_status + "]";
	}
	
	
	

}
