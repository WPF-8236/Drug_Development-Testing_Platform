package com.WPF.domain;

import java.sql.Date;

public class User {
	private String user_id;
	private String user_name;
	private int user_age;
	private int user_sex;
	private Date birthday;
	private String password;
	private int document_type;
	private String identification_number;
	private String phone_number;
	private String email;
	private String address;
	private String img;

	public User() {
	}

	public User(String user_id, String password) {
		this.user_id = user_id;
		this.password = password;
	}

	public User(String user_id, String user_name, int user_age, int user_sex, Date birthday, String password, int document_type, String identification_number, String phone_number, String email, String address) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_age = user_age;
		this.user_sex = user_sex;
		this.birthday = birthday;
		this.password = password;
		this.document_type = document_type;
		this.identification_number = identification_number;
		this.phone_number = phone_number;
		this.email = email;
		this.address = address;
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

	public int getUser_age() {
		return user_age;
	}

	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}

	public int getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(int user_sex) {
		this.user_sex = user_sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getDocument_type() {
		return document_type;
	}

	public void setDocument_type(int document_type) {
		this.document_type = document_type;
	}

	public String getIdentification_number() {
		return identification_number;
	}

	public void setIdentification_number(String identification_number) {
		this.identification_number = identification_number;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "User{" +
				"user_id='" + user_id + '\'' +
				", user_name='" + user_name + '\'' +
				", user_age=" + user_age +
				", user_sex=" + user_sex +
				", birthday=" + birthday +
				", password='" + password + '\'' +
				", document_type=" + document_type +
				", identification_number='" + identification_number + '\'' +
				", phone_number='" + phone_number + '\'' +
				", email='" + email + '\'' +
				", address='" + address + '\'' +
				", img='" + img + '\'' +
				'}';
	}
}
