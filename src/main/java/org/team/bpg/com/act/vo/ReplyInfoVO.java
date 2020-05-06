package org.team.bpg.com.act.vo;

import org.springframework.stereotype.Component;

@Component
public class ReplyInfoVO {
	
	private int reply_id;
	private int reply_depth;
	private int bundle_id;
	private int bundle_order;
	private int article_id;
	private String reply_date;
	private String reply_content;
	private String reply_writer;
	
	public ReplyInfoVO() {
		// TODO Auto-generated constructor stub
	}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public int getReply_depth() {
		return reply_depth;
	}

	public void setReply_depth(int reply_depth) {
		this.reply_depth = reply_depth;
	}

	public int getBundle_id() {
		return bundle_id;
	}

	public void setBundle_id(int bundle_id) {
		this.bundle_id = bundle_id;
	}

	public int getBundle_order() {
		return bundle_order;
	}

	public void setBundle_order(int bundle_order) {
		this.bundle_order = bundle_order;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	@Override
	public String toString() {
		return "ReplyInfoVO [reply_id=" + reply_id + ", reply_depth=" + reply_depth + ", bundle_id=" + bundle_id
				+ ", bundle_order=" + bundle_order + ", article_id=" + article_id + ", reply_date=" + reply_date
				+ ", reply_content=" + reply_content + ", reply_writer=" + reply_writer + "]";
	}
	
	

}
