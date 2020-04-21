package org.team.bpg.com.act.vo;

public class ArticleInfoVO {
	
	private int article_id;
	private int board_id;
	private String article_title;
	private String article_date;
	private String article_content;
	private int article_view_count;
	private int article_good_count;
	private int article_bad_count;
	private int article_reply_count;
	private String article_writer;
	
	public ArticleInfoVO() {
		// TODO Auto-generated constructor stub
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_date() {
		return article_date;
	}

	public void setArticle_date(String article_date) {
		this.article_date = article_date;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public int getArticle_view_count() {
		return article_view_count;
	}

	public void setArticle_view_count(int article_view_count) {
		this.article_view_count = article_view_count;
	}

	public int getArticle_good_count() {
		return article_good_count;
	}

	public void setArticle_good_count(int article_good_count) {
		this.article_good_count = article_good_count;
	}

	public int getArticle_bad_count() {
		return article_bad_count;
	}

	public void setArticle_bad_count(int article_bad_count) {
		this.article_bad_count = article_bad_count;
	}

	public int getArticle_reply_count() {
		return article_reply_count;
	}

	public void setArticle_reply_count(int article_reply_count) {
		this.article_reply_count = article_reply_count;
	}

	public String getArticle_writer() {
		return article_writer;
	}

	public void setArticle_writer(String article_writer) {
		this.article_writer = article_writer;
	}

	@Override
	public String toString() {
		return "ArticleInfoVO [article_id=" + article_id + ", board_id=" + board_id + ", article_title=" + article_title
				+ ", article_date=" + article_date + ", article_content=" + article_content + ", article_view_count="
				+ article_view_count + ", article_good_count=" + article_good_count + ", article_bad_count="
				+ article_bad_count + ", article_reply_count=" + article_reply_count + ", article_writer="
				+ article_writer + "]";
	}
	
	


	
	

}
