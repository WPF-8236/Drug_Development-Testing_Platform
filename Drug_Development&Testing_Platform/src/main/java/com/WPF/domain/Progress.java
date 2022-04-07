package com.WPF.domain;

public class Progress {
	private String dp_id;
	private String dp_d_id;
	private String dp_data;
	private String dp_text;
	private String dp_stage;

	public Progress() {
	}

	public Progress(String dp_id, String dp_d_id, String dp_data, String dp_text, String dp_stage) {
		this.dp_id = dp_id;
		this.dp_d_id = dp_d_id;
		this.dp_data = dp_data;
		this.dp_text = dp_text;
		this.dp_stage = dp_stage;
	}

	public String getDp_id() {
		return dp_id;
	}

	public void setDp_id(String dp_id) {
		this.dp_id = dp_id;
	}

	public String getDp_d_id() {
		return dp_d_id;
	}

	public void setDp_d_id(String dp_d_id) {
		this.dp_d_id = dp_d_id;
	}

	public String getDp_data() {
		return dp_data;
	}

	public void setDp_data(String dp_data) {
		this.dp_data = dp_data;
	}

	public String getDp_text() {
		return dp_text;
	}

	public void setDp_text(String dp_text) {
		this.dp_text = dp_text;
	}

	public String getDp_stage() {
		return dp_stage;
	}

	public void setDp_stage(String dp_stage) {
		this.dp_stage = dp_stage;
	}

	@Override
	public String toString() {
		return "Progress{" +
				"dp_id='" + dp_id + '\'' +
				", dp_d_id='" + dp_d_id + '\'' +
				", dp_data='" + dp_data + '\'' +
				", dp_text='" + dp_text + '\'' +
				", dp_stage='" + dp_stage + '\'' +
				'}';
	}
}
