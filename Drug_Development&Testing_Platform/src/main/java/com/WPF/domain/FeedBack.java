package com.WPF.domain;

public class FeedBack {
	private String bf_id;
	private String bf_u_id;
	private String bf_d_id;
	private String bf_text;
	private String bf_date;

	public FeedBack() {
	}

	public FeedBack(String bf_id, String bf_u_id, String bf_d_id, String bf_text, String bf_date) {
		this.bf_id = bf_id;
		this.bf_u_id = bf_u_id;
		this.bf_d_id = bf_d_id;
		this.bf_text = bf_text;
		this.bf_date = bf_date;
	}

	public String getBf_id() {
		return bf_id;
	}

	public void setBf_id(String bf_id) {
		this.bf_id = bf_id;
	}

	public String getBf_u_id() {
		return bf_u_id;
	}

	public void setBf_u_id(String bf_u_id) {
		this.bf_u_id = bf_u_id;
	}

	public String getBf_d_id() {
		return bf_d_id;
	}

	public void setBf_d_id(String bf_d_id) {
		this.bf_d_id = bf_d_id;
	}

	public String getBf_text() {
		return bf_text;
	}

	public void setBf_text(String bf_text) {
		this.bf_text = bf_text;
	}

	public String getBf_date() {
		return bf_date;
	}

	public void setBf_date(String bf_date) {
		this.bf_date = bf_date;
	}

	@Override
	public String toString() {
		return "FeedBack{" +
				"bf_id='" + bf_id + '\'' +
				", bf_u_id='" + bf_u_id + '\'' +
				", bf_d_id='" + bf_d_id + '\'' +
				", bf_text='" + bf_text + '\'' +
				", bf_date='" + bf_date + '\'' +
				'}';
	}
}
