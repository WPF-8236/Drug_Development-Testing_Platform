package com.WPF.domain;

public class FeedBack {
	private String bf_id;
	private String bf_u_id;
	private String bf_d_id;
	private String bf_date;
	private String bf_filed1;
	private String bf_filed2;
	private String bf_filed3;
	private String bf_filed4;
	private String bf_filed5;
	private String bf_filed6;
	private String user_name;
	private String user_age;
	private String user_sex;


	public FeedBack() {
	}

	public FeedBack(String bf_id, String bf_u_id, String bf_d_id, String bf_date, String bf_filed1, String bf_filed2, String bf_filed3, String bf_filed4, String bf_filed5, String bf_filed6, String user_name, String user_age, String user_sex) {
		this.bf_id = bf_id;
		this.bf_u_id = bf_u_id;
		this.bf_d_id = bf_d_id;
		this.bf_date = bf_date;
		this.bf_filed1 = bf_filed1;
		this.bf_filed2 = bf_filed2;
		this.bf_filed3 = bf_filed3;
		this.bf_filed4 = bf_filed4;
		this.bf_filed5 = bf_filed5;
		this.bf_filed6 = bf_filed6;
		this.user_name = user_name;
		this.user_age = user_age;
		this.user_sex = user_sex;
	}

	public String getBf_id() {
		return bf_id;
	}

	public void setBf_id(String bf_id) {
		this.bf_id = bf_id;
	}

	public String getBf_u_id() {
		return bf_u_id;
	}

	public void setBf_u_id(String bf_u_id) {
		this.bf_u_id = bf_u_id;
	}

	public String getBf_d_id() {
		return bf_d_id;
	}

	public void setBf_d_id(String bf_d_id) {
		this.bf_d_id = bf_d_id;
	}

	public String getBf_date() {
		return bf_date;
	}

	public void setBf_date(String bf_date) {
		this.bf_date = bf_date;
	}

	public String getBf_filed1() {
		return bf_filed1;
	}

	public void setBf_filed1(String bf_filed1) {
		this.bf_filed1 = bf_filed1;
	}

	public String getBf_filed2() {
		return bf_filed2;
	}

	public void setBf_filed2(String bf_filed2) {
		this.bf_filed2 = bf_filed2;
	}

	public String getBf_filed3() {
		return bf_filed3;
	}

	public void setBf_filed3(String bf_filed3) {
		this.bf_filed3 = bf_filed3;
	}

	public String getBf_filed4() {
		return bf_filed4;
	}

	public void setBf_filed4(String bf_filed4) {
		this.bf_filed4 = bf_filed4;
	}

	public String getBf_filed5() {
		return bf_filed5;
	}

	public void setBf_filed5(String bf_filed5) {
		this.bf_filed5 = bf_filed5;
	}

	public String getBf_filed6() {
		return bf_filed6;
	}

	public void setBf_filed6(String bf_filed6) {
		this.bf_filed6 = bf_filed6;
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

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	@Override
	public String toString() {
		return "FeedBack{" +
				"bf_id='" + bf_id + '\'' +
				", bf_u_id='" + bf_u_id + '\'' +
				", bf_d_id='" + bf_d_id + '\'' +
				", bf_date='" + bf_date + '\'' +
				", bf_filed1='" + bf_filed1 + '\'' +
				", bf_filed2='" + bf_filed2 + '\'' +
				", bf_filed3='" + bf_filed3 + '\'' +
				", bf_filed4='" + bf_filed4 + '\'' +
				", bf_filed5='" + bf_filed5 + '\'' +
				", bf_filed6='" + bf_filed6 + '\'' +
				", user_name='" + user_name + '\'' +
				", user_age='" + user_age + '\'' +
				", user_sex='" + user_sex + '\'' +
				'}';
	}
}
