package org.team.bpg.mylib.dec.vo;

import org.springframework.web.multipart.MultipartFile;

public class DeclareInfoVO {

	private int declare_id;
	private String do_user;
	private String be_done_user;
	private String declare_date;
	private String declare_reason;
	private String declare_category;
	private String image_name;
	private MultipartFile declare_image_data;
	private String declare_status;
	
	public DeclareInfoVO() {
		// TODO Auto-generated constructor stub
	}

	public int getDeclare_id() {
		return declare_id;
	}

	public void setDeclare_id(int declare_id) {
		this.declare_id = declare_id;
	}

	public String getDo_user() {
		return do_user;
	}

	public void setDo_user(String do_user) {
		this.do_user = do_user;
	}

	public String getBe_done_user() {
		return be_done_user;
	}

	public void setBe_done_user(String be_done_user) {
		this.be_done_user = be_done_user;
	}

	public String getDeclare_date() {
		return declare_date;
	}

	public void setDeclare_date(String declare_date) {
		this.declare_date = declare_date;
	}

	public String getDeclare_reason() {
		return declare_reason;
	}

	public void setDeclare_reason(String declare_reason) {
		this.declare_reason = declare_reason;
	}

	public String getDeclare_category() {
		return declare_category;
	}

	public void setDeclare_category(String declare_category) {
		this.declare_category = declare_category;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}

	public MultipartFile getDeclare_image_data() {
		return declare_image_data;
	}

	public void setDeclare_image_data(MultipartFile declare_image_data) {
		this.declare_image_data = declare_image_data;
	}

	public String getDeclare_status() {
		return declare_status;
	}

	public void setDeclare_status(String declare_status) {
		this.declare_status = declare_status;
	}

	@Override
	public String toString() {
		return "DeclareInfoVO [declare_id=" + declare_id + ", do_user=" + do_user + ", be_done_user=" + be_done_user
				+ ", declare_date=" + declare_date + ", declare_reason=" + declare_reason + ", declare_category="
				+ declare_category + ", image_name=" + image_name + ", declare_image_data=" + declare_image_data
				+ ", declare_status=" + declare_status + "]";
	}
}
