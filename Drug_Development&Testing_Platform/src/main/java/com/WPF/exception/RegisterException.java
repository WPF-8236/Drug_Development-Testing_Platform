package com.WPF.exception;

public class RegisterException extends Exception{
	private String msg;

	public RegisterException(String msg) {
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
		return "\t\t<script>\n" +
				"\t\t\talert(\"" + msg + "\")\n" +
				"\t\t</script>";
	}
}
