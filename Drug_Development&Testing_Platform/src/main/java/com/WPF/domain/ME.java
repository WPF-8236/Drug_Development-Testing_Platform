package com.WPF.domain;

public class ME {
	private String m_id;
	private String e_id;

	public ME() {
	}

	public ME(String m_id, String e_id) {
		this.m_id = m_id;
		this.e_id = e_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	@Override
	public String toString() {
		return "ME{" +
				"m_id='" + m_id + '\'' +
				", e_id='" + e_id + '\'' +
				'}';
	}
}
