package com.WPF.handler;

import com.WPF.domain.User;
import com.WPF.service.UserService;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class LoginInterceptor implements HandlerInterceptor {
	@Resource
	private UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String user_id = request.getParameter("user_id");
		User user = userService.getUser(user_id);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		if (user == null) {
			return true;
		} else if (user.getUser_name() == null) {
			printWriter.print("\t\t<script>\n" +
					"\t\t\talert(\"" + "信息不完全请完善信息！！" + "\")\n" +
					"\t\t</script>");
			response.setHeader("refresh", "0.1;url=/FinalPractice/firstform.jsp");
			printWriter.close();
			return true;
		} else
			return true;
	}
}
