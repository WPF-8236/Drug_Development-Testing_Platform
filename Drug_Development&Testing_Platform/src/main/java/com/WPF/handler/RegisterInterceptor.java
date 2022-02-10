package com.WPF.handler;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegisterInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String regEx = "[ _`[email protected]#$%^&*()+=|{}‘:;‘,\\[\\].<>/?~！@#￥%……&*()——+|{}【】‘；：”“’。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher user_id_M = p.matcher(user_id);
		Matcher password_M = p.matcher(password);
		Boolean pass = (user_id_M.find() || password_M.find());
		if (!pass) {
			return true;
		} else {
			printWriter.print("\t\t<script>\n" +
					"\t\t\talert(\"" + "用户名或密码存在非法字符" + regEx +"\")\n" +
					"\t\t</script>");
			printWriter.close();
			return false;
		}
	}
}
