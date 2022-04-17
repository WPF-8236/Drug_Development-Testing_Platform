package com.WPF.domain;

public class RecruitList {
	private String rl_id;
	private String r_id;
	private String rl_u_id;
	private String rl_title;
	private String rl_user_name;
	private int rl_user_sex;
	private String rl_user_phone;
	private String rl_user_identification_number;
	private double rl_user_height;
	private double rl_user_weight;
	private String rl_address;
	private int rl_issmoke;
	private String rl_text;
	private int isv;
	private int ispe;

	public RecruitList() {
	}

	public RecruitList(String rl_id, String r_id, String rl_u_id, String rl_title, String rl_user_name, int rl_user_sex, String rl_user_phone, String rl_user_identification_number, double rl_user_height, double rl_user_weight, String rl_address, int rl_issmoke, String rl_text, int isv, int ispe) {
		this.rl_id = rl_id;
		this.r_id = r_id;
		this.rl_u_id = rl_u_id;
		this.rl_title = rl_title;
		this.rl_user_name = rl_user_name;
		this.rl_user_sex = rl_user_sex;
		this.rl_user_phone = rl_user_phone;
		this.rl_user_identification_number = rl_user_identification_number;
		this.rl_user_height = rl_user_height;
		this.rl_user_weight = rl_user_weight;
		this.rl_address = rl_address;
		this.rl_issmoke = rl_issmoke;
		this.rl_text = rl_text;
		this.isv = isv;
		this.ispe = ispe;
	}

	public String getRl_id() {
		return rl_id;
	}

	public void setRl_id(String rl_id) {
		this.rl_id = rl_id;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getRl_u_id() {
		return rl_u_id;
	}

	public void setRl_u_id(String rl_u_id) {
		this.rl_u_id = rl_u_id;
	}

	public String getRl_title() {
		return rl_title;
	}

	public void setRl_title(String rl_title) {
		this.rl_title = rl_title;
	}

	public String getRl_user_name() {
		return rl_user_name;
	}

	public void setRl_user_name(String rl_user_name) {
		this.rl_user_name = rl_user_name;
	}

	public int getRl_user_sex() {
		return rl_user_sex;
	}

	public void setRl_user_sex(int rl_user_sex) {
		this.rl_user_sex = rl_user_sex;
	}

	public String getRl_user_phone() {
		return rl_user_phone;
	}

	public void setRl_user_phone(String rl_user_phone) {
		this.rl_user_phone = rl_user_phone;
	}

	public String getRl_user_identification_number() {
		return rl_user_identification_number;
	}

	public void setRl_user_identification_number(String rl_user_identification_number) {
		this.rl_user_identification_number = rl_user_identification_number;
	}

	public double getRl_user_height() {
		return rl_user_height;
	}

	public void setRl_user_height(double rl_user_height) {
		this.rl_user_height = rl_user_height;
	}

	public double getRl_user_weight() {
		return rl_user_weight;
	}

	public void setRl_user_weight(double rl_user_weight) {
		this.rl_user_weight = rl_user_weight;
	}

	public String getRl_address() {
		return rl_address;
	}

	public void setRl_address(String rl_address) {
		this.rl_address = rl_address;
	}

	public int getRl_issmoke() {
		return rl_issmoke;
	}

	public void setRl_issmoke(int rl_issmoke) {
		this.rl_issmoke = rl_issmoke;
	}

	public String getRl_text() {
		return rl_text;
	}

	public void setRl_text(String rl_text) {
		this.rl_text = rl_text;
	}

	public int getIsv() {
		return isv;
	}

	public void setIsv(int isv) {
		this.isv = isv;
	}

	public int getIspe() {
		return ispe;
	}

	public void setIspe(int ispe) {
		this.ispe = ispe;
	}

	@Override
	public String toString() {
		return "RecruitList{" +
				"rl_id='" + rl_id + '\'' +
				", r_id='" + r_id + '\'' +
				", rl_u_id='" + rl_u_id + '\'' +
				", rl_title='" + rl_title + '\'' +
				", rl_user_name='" + rl_user_name + '\'' +
				", rl_user_sex=" + rl_user_sex +
				", rl_user_phone='" + rl_user_phone + '\'' +
				", rl_user_identification_number='" + rl_user_identification_number + '\'' +
				", rl_user_height=" + rl_user_height +
				", rl_user_weight=" + rl_user_weight +
				", rl_address='" + rl_address + '\'' +
				", rl_issmoke=" + rl_issmoke +
				", rl_text='" + rl_text + '\'' +
				", isv=" + isv +
				", ispe=" + ispe +
				'}';
	}
}
