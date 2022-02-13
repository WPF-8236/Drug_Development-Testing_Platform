package com.WPF.domain;

import java.sql.Timestamp;

public class Message {
	private String m_id;
	private String m_summary;
	private String m_title;
	private String m_content;
	private int m_mark;
	private int m_type;
	private Timestamp m_time;
	private String m_read;
	private String m_author;

	public Message(String m_id, String m_summary, String m_title, String m_content, int m_mark, int m_type, Timestamp m_time, String m_read, String m_author) {
		this.m_id = m_id;
		this.m_summary = m_summary;
		this.m_title = m_title;
		this.m_content = m_content;
		this.m_mark = m_mark;
		this.m_type = m_type;
		this.m_time = m_time;
		this.m_read = m_read;
		this.m_author = m_author;
	}

	public Message() {
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_summary() {
		return m_summary;
	}

	public void setM_summary(String m_summary) {
		this.m_summary = m_summary;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	public int getM_mark() {
		return m_mark;
	}

	public void setM_mark(int m_mark) {
		this.m_mark = m_mark;
	}

	public int getM_type() {
		return m_type;
	}

	public void setM_type(int m_type) {
		this.m_type = m_type;
	}

	public Timestamp getM_time() {
		return m_time;
	}

	public void setM_time(Timestamp m_time) {
		this.m_time = m_time;
	}

	public String getM_read() {
		return m_read;
	}

	public void setM_read(String m_read) {
		this.m_read = m_read;
	}

	public String getM_author() {
		return m_author;
	}

	public void setM_author(String m_author) {
		this.m_author = m_author;
	}

	@Override
	public String toString() {
		return "Message{" + "m_id='" + m_id + '\'' + ", m_summary='" + m_summary + '\'' + ", m_title='" + m_title + '\'' + ", m_content='" + m_content + '\'' + ", m_mark=" + m_mark + ", m_type=" + m_type + ", m_time=" + m_time + ", m_read='" + m_read + '\'' + ", m_author='" + m_author + '\'' + '}';
	}
}
