package com.fund.model.member.vo;

import java.io.Serializable;

public class memberInputVo implements Serializable {
	
	private static final long serialVersionUID = 1807722350335457793L;
	private String email;
	private String pwd;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
