package org.team.bpg.chat.vo;

import org.springframework.stereotype.Component;

@Component("intentVO")
public class IntentVO {

	private String name, count, rank;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}
	
	
}
