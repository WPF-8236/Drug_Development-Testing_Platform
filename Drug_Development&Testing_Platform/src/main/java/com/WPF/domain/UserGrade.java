package com.WPF.domain;

public class UserGrade {
	private String id;
	private String password;
	private int grade;

	public UserGrade(String user_id, String password, int grade) {
		this.id = user_id;
		this.password = password;
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "UserGrade{" +
				"user_id='" + id + '\'' +
				", password='" + password + '\'' +
				", grade=" + grade +
				'}';
	}
}
