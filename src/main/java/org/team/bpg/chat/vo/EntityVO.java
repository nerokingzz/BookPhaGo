package org.team.bpg.chat.vo;

import org.springframework.stereotype.Component;

@Component("EntityVO")
public class EntityVO {
	
	private String entName, entCount;

	public String getEntName() {
		return entName;
	}

	public void setEntName(String entName) {
		this.entName = entName;
	}

	public String getEntCount() {
		return entCount;
	}

	public void setEntCount(String entCount) {
		this.entCount = entCount;
	}

}
