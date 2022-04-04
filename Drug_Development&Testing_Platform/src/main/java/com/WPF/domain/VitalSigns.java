package com.WPF.domain;

public class VitalSigns {
	private String c_id;
	private String c_user_id;
	private String c_ra_id;
	private String c_date;
	private String c_BT;
	private String c_HR;
	private String c_RR;
	private String c_BP;

	public VitalSigns() {
	}

	public VitalSigns(String c_id, String c_user_id, String c_ra_id, String c_date, String c_BT, String c_HR, String c_RR, String c_BP) {
		this.c_id = c_id;
		this.c_user_id = c_user_id;
		this.c_ra_id = c_ra_id;
		this.c_date = c_date;
		this.c_BT = c_BT;
		this.c_HR = c_HR;
		this.c_RR = c_RR;
		this.c_BP = c_BP;
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

	public String getC_BT() {
		return c_BT;
	}

	public void setC_BT(String c_BT) {
		this.c_BT = c_BT;
	}

	public String getC_HR() {
		return c_HR;
	}

	public void setC_HR(String c_HR) {
		this.c_HR = c_HR;
	}

	public String getC_RR() {
		return c_RR;
	}

	public void setC_RR(String c_RR) {
		this.c_RR = c_RR;
	}

	public String getC_BP() {
		return c_BP;
	}

	public void setC_BP(String c_BP) {
		this.c_BP = c_BP;
	}

	@Override
	public String toString() {
		return "VitalSigns{" +
				"c_id='" + c_id + '\'' +
				", c_user_id='" + c_user_id + '\'' +
				", c_ra_id='" + c_ra_id + '\'' +
				", c_date='" + c_date + '\'' +
				", c_BT='" + c_BT + '\'' +
				", c_HR='" + c_HR + '\'' +
				", c_RR='" + c_RR + '\'' +
				", c_BP='" + c_BP + '\'' +
				'}';
	}
}
