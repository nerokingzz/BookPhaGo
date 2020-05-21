package org.team.bpg.chat.vo;

import org.springframework.stereotype.Component;

@Component("DialVO")
public class DialVO {
	
	private String dialDate, dialCount;

	public String getDialDate() {
		return dialDate;
	}

	public void setDialDate(String dialDate) {
		this.dialDate = dialDate;
	}

	public String getDialCount() {
		return dialCount;
	}

	public void setDialCount(String dialCount) {
		this.dialCount = dialCount;
	}

}
