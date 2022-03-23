package com.WPF.controller;

import com.WPF.domain.Enterprise;
import com.WPF.domain.User;
import com.WPF.domain.UserGrade;
import com.WPF.service.EnterpriseService;
import com.WPF.service.LoginService;
import com.WPF.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
public class LoginController {
	@Resource
	private LoginService loginService;

	@Resource
	private UserService userService;

	@Resource
	private EnterpriseService enterpriseService;

	@RequestMapping("/login")
	public String login(HttpServletResponse response, HttpServletRequest request, String id, String password) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println(id + "  " + password);
		UserGrade userGrade = loginService.login(id, password);
		User user = null;
		Enterprise enterprise = null;
		PrintWriter printWriter = response.getWriter();
		if (userGrade == null) {
			printWriter.print("\t\t<script>\n" +
					"\t\t\talert(\"" + "用户不存在！！请注册！！" + "\")\n" +
					"\t\t</script>");
			response.setHeader("refresh", "0.1;url=./Resign.jsp");
			printWriter.close();
			return "";
		} else if (userGrade.getGrade() == 2) {
			user = userService.getUser(id);
			System.out.println(user);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("userGrade", userGrade);
			session.setAttribute("enterprise", enterprise);
			return "index";
		} else if (userGrade.getGrade() == 1) {
			return "Admin";
		} else if (userGrade.getGrade() == 3) {
			enterprise = enterpriseService.getEnterprise(id);
			HttpSession session = request.getSession();
			session.setAttribute("enterprise", enterprise);
			return "Enterprise";
		} else
			return "";
	}
}
