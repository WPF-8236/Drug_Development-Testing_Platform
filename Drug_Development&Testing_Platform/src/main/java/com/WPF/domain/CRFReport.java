package com.WPF.domain;

public class CRFReport {
	private String d_id;
	private String c_id;
	private String c_user_id;
	private String c_ra_id;
	private String c_date;
	private String user_name;
	private String ra_name;

	public CRFReport() {
	}

	public CRFReport(String d_id, String c_id, String c_user_id, String c_ra_id, String c_date, String user_name, String ra_name) {
		this.d_id = d_id;
		this.c_id = c_id;
		this.c_user_id = c_user_id;
		this.c_ra_id = c_ra_id;
		this.c_date = c_date;
		this.user_name = user_name;
		this.ra_name = ra_name;
	}

	public String getD_id() {
		return d_id;
	}

	public void setD_id(String d_id) {
		this.d_id = d_id;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_user_id() {
		return c_user_id;
	}

	public void setC_user_id(String c_user_id) {
		this.c_user_id = c_user_id;
	}

	public String getC_ra_id() {
		return c_ra_id;
	}

	public void setC_ra_id(String c_ra_id) {
		this.c_ra_id = c_ra_id;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getRa_name() {
		return ra_name;
	}

	public void setRa_name(String ra_name) {
		this.ra_name = ra_name;
	}

	@Override
	public String toString() {
		return "CRFReport{" +
				"d_id='" + d_id + '\'' +
				", c_id='" + c_id + '\'' +
				", c_user_id='" + c_user_id + '\'' +
				", c_ra_id='" + c_ra_id + '\'' +
				", c_date='" + c_date + '\'' +
				", user_name='" + user_name + '\'' +
				", ra_name='" + ra_name + '\'' +
				'}';
	}
}
