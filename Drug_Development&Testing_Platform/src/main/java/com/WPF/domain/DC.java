package com.WPF.domain;

public class DC {
	private String d_id;
	private String c_id;
	private String c_user_id;
	private String c_ra_id;
	private String c_date;

	public DC() {
	}

	public DC(String d_id, String c_id, String c_user_id, String c_ra_id, String c_date) {
		this.d_id = d_id;
		this.c_id = c_id;
		this.c_user_id = c_user_id;
		this.c_ra_id = c_ra_id;
		this.c_date = c_date;
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

	@Override
	public String toString() {
		return "DC{" +
				"d_id='" + d_id + '\'' +
				", c_id='" + c_id + '\'' +
				", c_user_id='" + c_user_id + '\'' +
				", c_ra_id='" + c_ra_id + '\'' +
				", c_date='" + c_date + '\'' +
				'}';
	}
}
