package com.WPF.exception;

public class LostException extends Exception {
	private String msg;

	public LostException(String msg) {
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "失败异常{ 失败消息= " + msg + "} ";
	}
}
