package com.WPF.domain;

public class UrineRoutine {
	private String c_id;
	private String c_user_id;
	private String c_ra_id;
	private String c_date;
	private String c_up;
	private int c_up_n;
	private String c_RBC;
	private int c_RBC_n;
	private String c_WBC;
	private int c_WBC_n;
	private String c_up24;
	private int c_up24_n;

	public UrineRoutine(String c_id, String c_user_id, String c_ra_id, String c_date, String c_up, int c_up_n, String c_RBC, int c_RBC_n, String c_WBC, int c_WBC_n, String c_up24, int c_up24_n) {
		this.c_id = c_id;
		this.c_user_id = c_user_id;
		this.c_ra_id = c_ra_id;
		this.c_date = c_date;
		this.c_up = c_up;
		this.c_up_n = c_up_n;
		this.c_RBC = c_RBC;
		this.c_RBC_n = c_RBC_n;
		this.c_WBC = c_WBC;
		this.c_WBC_n = c_WBC_n;
		this.c_up24 = c_up24;
		this.c_up24_n = c_up24_n;
	}

	public UrineRoutine() {
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

	public String getC_up() {
		return c_up;
	}

	public void setC_up(String c_up) {
		this.c_up = c_up;
	}

	public int getC_up_n() {
		return c_up_n;
	}

	public void setC_up_n(int c_up_n) {
		this.c_up_n = c_up_n;
	}

	public String getC_RBC() {
		return c_RBC;
	}

	public void setC_RBC(String c_RBC) {
		this.c_RBC = c_RBC;
	}

	public int getC_RBC_n() {
		return c_RBC_n;
	}

	public void setC_RBC_n(int c_RBC_n) {
		this.c_RBC_n = c_RBC_n;
	}

	public String getC_WBC() {
		return c_WBC;
	}

	public void setC_WBC(String c_WBC) {
		this.c_WBC = c_WBC;
	}

	public int getC_WBC_n() {
		return c_WBC_n;
	}

	public void setC_WBC_n(int c_WBC_n) {
		this.c_WBC_n = c_WBC_n;
	}

	public String getC_up24() {
		return c_up24;
	}

	public void setC_up24(String c_up24) {
		this.c_up24 = c_up24;
	}

	public int getC_up24_n() {
		return c_up24_n;
	}

	public void setC_up24_n(int c_up24_n) {
		this.c_up24_n = c_up24_n;
	}

	@Override
	public String toString() {
		return "UrineRoutine{" +
				"c_id='" + c_id + '\'' +
				", c_user_id='" + c_user_id + '\'' +
				", c_ra_id='" + c_ra_id + '\'' +
				", c_date='" + c_date + '\'' +
				", c_up='" + c_up + '\'' +
				", c_up_n=" + c_up_n +
				", c_RBC='" + c_RBC + '\'' +
				", c_RBC_n=" + c_RBC_n +
				", c_WBC='" + c_WBC + '\'' +
				", c_WBC_n=" + c_WBC_n +
				", c_up24='" + c_up24 + '\'' +
				", c_up24_n=" + c_up24_n +
				'}';
	}
}
