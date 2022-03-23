package com.WPF.domain;

public class Researcher {
	private String ra_id;
	private String ra_name;
	private String ra_password;
	private String ra_e_id;
	private int ra_d_type;

	public Researcher() {
	}

	public Researcher(String ra_id, String ra_name, String ra_password, String ra_e_id, int ra_d_type) {
		this.ra_id = ra_id;
		this.ra_name = ra_name;
		this.ra_password = ra_password;
		this.ra_e_id = ra_e_id;
		this.ra_d_type = ra_d_type;
	}


	public String getRa_id() {
		return ra_id;
	}

	public void setRa_id(String ra_id) {
		this.ra_id = ra_id;
	}

	public String getRa_name() {
		return ra_name;
	}

	public void setRa_name(String ra_name) {
		this.ra_name = ra_name;
	}

	public String getRa_password() {
		return ra_password;
	}

	public void setRa_password(String ra_password) {
		this.ra_password = ra_password;
	}

	public String getRa_e_id() {
		return ra_e_id;
	}

	public void setRa_e_id(String ra_e_id) {
		this.ra_e_id = ra_e_id;
	}

	public int getRa_d_type() {
		return ra_d_type;
	}

	public void setRa_d_type(int ra_d_type) {
		this.ra_d_type = ra_d_type;
	}

	@Override
	public String toString() {
		return "Researcher{" +
				"ra_id='" + ra_id + '\'' +
				", ra_name='" + ra_name + '\'' +
				", ra_password='" + ra_password + '\'' +
				", ra_e_id='" + ra_e_id + '\'' +
				", ra_d_type=" + ra_d_type +
				'}';
	}
}
