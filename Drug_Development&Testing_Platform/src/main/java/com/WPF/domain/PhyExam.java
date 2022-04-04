package com.WPF.domain;

public class PhyExam {
	private String c_id;
	private String c_user_id;
	private String c_ra_id;
	private String c_date;
	private String c_generally;
	private String c_SaMM;
	private String c_head;
	private String c_neck;
	private String c_chest;
	private String c_abdomen;
	private String c_SaE;
	private String c_other;

	public PhyExam() {
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

	public String getC_generally() {
		return c_generally;
	}

	public void setC_generally(String c_generally) {
		this.c_generally = c_generally;
	}

	public String getC_SaMM() {
		return c_SaMM;
	}

	public void setC_SaMM(String c_SaMM) {
		this.c_SaMM = c_SaMM;
	}

	public String getC_head() {
		return c_head;
	}

	public void setC_head(String c_head) {
		this.c_head = c_head;
	}

	public String getC_neck() {
		return c_neck;
	}

	public void setC_neck(String c_neck) {
		this.c_neck = c_neck;
	}

	public String getC_chest() {
		return c_chest;
	}

	public void setC_chest(String c_chest) {
		this.c_chest = c_chest;
	}

	public String getC_abdomen() {
		return c_abdomen;
	}

	public void setC_abdomen(String c_abdomen) {
		this.c_abdomen = c_abdomen;
	}

	public String getC_SaE() {
		return c_SaE;
	}

	public void setC_SaE(String c_SaE) {
		this.c_SaE = c_SaE;
	}

	public String getC_other() {
		return c_other;
	}

	public void setC_other(String c_other) {
		this.c_other = c_other;
	}

	public PhyExam(String c_id, String c_user_id, String c_ra_id, String c_date, String c_generally, String c_SaMM, String c_head, String c_neck, String c_chest, String c_abdomen, String c_SaE, String c_other) {
		this.c_id = c_id;
		this.c_user_id = c_user_id;
		this.c_ra_id = c_ra_id;
		this.c_date = c_date;
		this.c_generally = c_generally;
		this.c_SaMM = c_SaMM;
		this.c_head = c_head;
		this.c_neck = c_neck;
		this.c_chest = c_chest;
		this.c_abdomen = c_abdomen;
		this.c_SaE = c_SaE;
		this.c_other = c_other;
	}

	@Override
	public String toString() {
		return "PhyExam{" +
				"c_id='" + c_id + '\'' +
				", c_user_id='" + c_user_id + '\'' +
				", c_ra_id='" + c_ra_id + '\'' +
				", c_date='" + c_date + '\'' +
				", c_generally='" + c_generally + '\'' +
				", c_SaMM='" + c_SaMM + '\'' +
				", c_head='" + c_head + '\'' +
				", c_neck='" + c_neck + '\'' +
				", c_chest='" + c_chest + '\'' +
				", c_abdomen='" + c_abdomen + '\'' +
				", c_SaE='" + c_SaE + '\'' +
				", c_other='" + c_other + '\'' +
				'}';
	}
}
