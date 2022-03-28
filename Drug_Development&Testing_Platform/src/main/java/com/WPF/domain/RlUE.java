package com.WPF.domain;

public class RlUE {
	private String e_id;
	private String user_id;
	private String rl_id;

	public RlUE(String e_id, String user_id, String rl_id) {
		this.e_id = e_id;
		this.user_id = user_id;
		this.rl_id = rl_id;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRl_id() {
		return rl_id;
	}

	public void setRl_id(String rl_id) {
		this.rl_id = rl_id;
	}

	@Override
	public String toString() {
		return "RlUE{" +
				"e_id='" + e_id + '\'' +
				", user_id='" + user_id + '\'' +
				", rl_id='" + rl_id + '\'' +
				'}';
	}
}
