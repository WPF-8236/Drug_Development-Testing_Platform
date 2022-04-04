package com.WPF.domain;

public class BowelRoutine {
	private String c_id;
	private String c_user_id;
	private String c_ra_id;
	private String c_date;
	private String c_ob;
	private int c_ob_n;

	public BowelRoutine() {
	}

	public BowelRoutine(String c_id, String c_user_id, String c_ra_id, String c_date, String c_ob, int c_ob_n) {
		this.c_id = c_id;
		this.c_user_id = c_user_id;
		this.c_ra_id = c_ra_id;
		this.c_date = c_date;
		this.c_ob = c_ob;
		this.c_ob_n = c_ob_n;
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

	public String getC_ob() {
		return c_ob;
	}

	public void setC_ob(String c_ob) {
		this.c_ob = c_ob;
	}

	public int getC_ob_n() {
		return c_ob_n;
	}

	public void setC_ob_n(int c_ob_n) {
		this.c_ob_n = c_ob_n;
	}

	@Override
	public String toString() {
		return "BowelRoutine{" +
				"c_id='" + c_id + '\'' +
				", c_user_id='" + c_user_id + '\'' +
				", c_ra_id='" + c_ra_id + '\'' +
				", c_date='" + c_date + '\'' +
				", c_ob='" + c_ob + '\'' +
				", c_ob_n=" + c_ob_n +
				'}';
	}
}
