package com.WPF.domain;

public class Recruit {
	private String r_id;
	private String r_e_id;
	private String r_title;
	private String r_drag_name;
	private String r_drag_attending;
	private String r_institutes;
	private int r_sex;
	private String r_year;
	private String r_bmi;
	private int r_stage;
	private int r_type;
	private String r_address;
	private String r_time;
	private int r_number;
	private String r_money;
	private String r_detial;

	public Recruit() {
	}

	public Recruit(String r_id, String r_e_id, String r_title, String r_drag_name, String r_drag_attending, String r_institutes, int r_sex, String r_year, String r_bmi, int r_stage, int r_type, String r_address, String r_time, int r_number, String r_money, String r_detial) {
		this.r_id = r_id;
		this.r_e_id = r_e_id;
		this.r_title = r_title;
		this.r_drag_name = r_drag_name;
		this.r_drag_attending = r_drag_attending;
		this.r_institutes = r_institutes;
		this.r_sex = r_sex;
		this.r_year = r_year;
		this.r_bmi = r_bmi;
		this.r_stage = r_stage;
		this.r_type = r_type;
		this.r_address = r_address;
		this.r_time = r_time;
		this.r_number = r_number;
		this.r_money = r_money;
		this.r_detial = r_detial;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_e_id() {
		return r_e_id;
	}

	public void setR_e_id(String r_e_id) {
		this.r_e_id = r_e_id;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_drag_name() {
		return r_drag_name;
	}

	public void setR_drag_name(String r_drag_name) {
		this.r_drag_name = r_drag_name;
	}

	public String getR_drag_attending() {
		return r_drag_attending;
	}

	public void setR_drag_attending(String r_drag_attending) {
		this.r_drag_attending = r_drag_attending;
	}

	public String getR_institutes() {
		return r_institutes;
	}

	public void setR_institutes(String r_institutes) {
		this.r_institutes = r_institutes;
	}

	public int getR_sex() {
		return r_sex;
	}

	public void setR_sex(int r_sex) {
		this.r_sex = r_sex;
	}

	public String getR_year() {
		return r_year;
	}

	public void setR_year(String r_year) {
		this.r_year = r_year;
	}

	public String getR_bmi() {
		return r_bmi;
	}

	public void setR_bmi(String r_bmi) {
		this.r_bmi = r_bmi;
	}

	public int getR_stage() {
		return r_stage;
	}

	public void setR_stage(int r_stage) {
		this.r_stage = r_stage;
	}

	public int getR_type() {
		return r_type;
	}

	public void setR_type(int r_type) {
		this.r_type = r_type;
	}

	public String getR_address() {
		return r_address;
	}

	public void setR_address(String r_address) {
		this.r_address = r_address;
	}

	public String getR_time() {
		return r_time;
	}

	public void setR_time(String r_time) {
		this.r_time = r_time;
	}

	public int getR_number() {
		return r_number;
	}

	public void setR_number(int r_number) {
		this.r_number = r_number;
	}

	public String getR_money() {
		return r_money;
	}

	public void setR_money(String r_money) {
		this.r_money = r_money;
	}

	public String getR_detial() {
		return r_detial;
	}

	public void setR_detial(String r_detial) {
		this.r_detial = r_detial;
	}

	@Override
	public String toString() {
		return "Recruit{" +
				"r_id='" + r_id + '\'' +
				", r_e_id='" + r_e_id + '\'' +
				", r_title='" + r_title + '\'' +
				", r_drag_name='" + r_drag_name + '\'' +
				", r_drag_attending='" + r_drag_attending + '\'' +
				", r_institutes='" + r_institutes + '\'' +
				", r_sex=" + r_sex +
				", r_year='" + r_year + '\'' +
				", r_bmi='" + r_bmi + '\'' +
				", r_stage=" + r_stage +
				", r_type=" + r_type +
				", r_address='" + r_address + '\'' +
				", r_time='" + r_time + '\'' +
				", r_number=" + r_number +
				", r_money='" + r_money + '\'' +
				", r_detial='" + r_detial + '\'' +
				'}';
	}
}

