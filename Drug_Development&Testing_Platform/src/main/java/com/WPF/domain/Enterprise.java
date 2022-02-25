package com.WPF.domain;

public class Enterprise {
	private String e_id;
	private String e_name;
	private String e_password;
	private String e_phone;
	private String e_email;
	private String e_address;

	public Enterprise() {
	}

	public Enterprise(String e_id, String e_name, String e_password, String e_phone, String e_email, String e_address) {
		this.e_id = e_id;
		this.e_name = e_name;
		this.e_password = e_password;
		this.e_phone = e_phone;
		this.e_email = e_email;
		this.e_address = e_address;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_password() {
		return e_password;
	}

	public void setE_password(String e_password) {
		this.e_password = e_password;
	}

	public String getE_phone() {
		return e_phone;
	}

	public void setE_phone(String e_phone) {
		this.e_phone = e_phone;
	}

	public String getE_email() {
		return e_email;
	}

	public void setE_email(String e_email) {
		this.e_email = e_email;
	}

	public String getE_address() {
		return e_address;
	}

	public void setE_address(String e_address) {
		this.e_address = e_address;
	}

	@Override
	public String toString() {
		return "Enterprise{" +
				"e_id='" + e_id + '\'' +
				", e_name='" + e_name + '\'' +
				", e_password='" + e_password + '\'' +
				", e_phone='" + e_phone + '\'' +
				", e_email='" + e_email + '\'' +
				", e_address='" + e_address + '\'' +
				'}';
	}
}
