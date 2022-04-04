package com.WPF.domain;

public class Volunteer {
	private String user_id;
	private String user_name;
	private String user_age;
	private int user_sex;
	private String rl_id;
	private String rl_title;

	public Volunteer() {
	}

	public Volunteer(String user_id, String user_name, String user_age, int user_sex, String rl_id, String rl_title) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_age = user_age;
		this.user_sex = user_sex;
		this.rl_id = rl_id;
		this.rl_title = rl_title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_age() {
		return user_age;
	}

	public void setUser_age(String user_age) {
		this.user_age = user_age;
	}

	public int getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(int user_sex) {
		this.user_sex = user_sex;
	}

	public String getRl_id() {
		return rl_id;
	}

	public void setRl_id(String rl_id) {
		this.rl_id = rl_id;
	}

	public String getRl_title() {
		return rl_title;
	}

	public void setRl_title(String rl_title) {
		this.rl_title = rl_title;
	}

	@Override
	public String toString() {
		return "Volunteer{" +
				"user_id='" + user_id + '\'' +
				", user_name='" + user_name + '\'' +
				", user_age='" + user_age + '\'' +
				", user_sex='" + user_sex + '\'' +
				", rl_id='" + rl_id + '\'' +
				", rl_title='" + rl_title + '\'' +
				'}';
	}
}
