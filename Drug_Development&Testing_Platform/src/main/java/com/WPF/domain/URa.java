package com.WPF.domain;

public class URa {
	private String v_user_id;
	private String v_ra_id;

	public URa(String v_user_id, String v_ra_id) {
		this.v_user_id = v_user_id;
		this.v_ra_id = v_ra_id;
	}

	public URa() {
	}

	public String getV_user_id() {
		return v_user_id;
	}

	public void setV_user_id(String v_user_id) {
		this.v_user_id = v_user_id;
	}

	public String getV_ra_id() {
		return v_ra_id;
	}

	public void setV_ra_id(String v_ra_id) {
		this.v_ra_id = v_ra_id;
	}

	@Override
	public String toString() {
		return "URa{" +
				"v_user_id='" + v_user_id + '\'' +
				", v_ra_id='" + v_ra_id + '\'' +
				'}';
	}
}
