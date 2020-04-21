package org.team.bpg.com.act.vo;

public class BoardInfoVO {
	
	private int board_id;
	private int community_id;
	private String board_name;
	private int board_article_count;
	private String board_category;
	private String board_status;
	
	public BoardInfoVO() {
		// TODO Auto-generated constructor stub
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getCommunity_id() {
		return community_id;
	}

	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public int getBoard_article_count() {
		return board_article_count;
	}

	public void setBoard_article_count(int board_article_count) {
		this.board_article_count = board_article_count;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_status() {
		return board_status;
	}

	public void setBoard_status(String board_status) {
		this.board_status = board_status;
	}

	@Override
	public String toString() {
		return "BoardInfoVO [board_id=" + board_id + ", community_id=" + community_id + ", board_name=" + board_name
				+ ", board_article_count=" + board_article_count + ", board_category=" + board_category
				+ ", board_status=" + board_status + "]";
	}




}
