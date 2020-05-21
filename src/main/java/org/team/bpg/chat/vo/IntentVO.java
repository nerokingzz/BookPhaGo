package org.team.bpg.chat.vo;

import org.springframework.stereotype.Component;

@Component("IntentVO")
public class IntentVO {

	private String intName, intCount;

	public String getIntName() {
		return intName;
	}

	public void setIntName(String intName) {
		this.intName = intName;
	}

	public String getIntCount() {
		return intCount;
	}

	public void setIntCount(String intCount) {
		this.intCount = intCount;
	}
	
	
	
}
