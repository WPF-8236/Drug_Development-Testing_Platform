package com.WPF.controller;

import com.WPF.domain.User;
import com.WPF.domain.UserGrade;
import com.WPF.exception.RegisterException;
import com.WPF.service.RegisterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Controller
public class RegisterController {

	@Resource
	private RegisterService registerService;

	@RequestMapping("resign")
	public String registerUser(HttpServletResponse response, HttpServletRequest request, String user_id, String password) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		System.out.println(user_id + "  " + password);
		int num = 0;
		num = registerService.checkRegister(user_id);
		if (num == 1) {
			printWriter.print(new RegisterException("用户已存在，注册失败！！"));
			response.setHeader("refresh", "0.1;url=./Resign.jsp");
			printWriter.close();
			return "";
		}
		User user = new User(user_id, password);
		UserGrade userGrade = new UserGrade(user_id, password, 2);
		num = registerService.registerUser(user, userGrade);
		if (num != 0) {
			printWriter.print("\t\t<script>\n" +
					"\t\t\talert(\"" + "注册成功！！请登录！！" + "\")\n" +
					"\t\t</script>");
			response.setHeader("refresh", "0.1;url=./Login.jsp");
			printWriter.close();
			return "";
		} else {
			printWriter.print(new RegisterException("注册失败！！"));
			response.setHeader("refresh", "0.1;url=./Resign.jsp");
			printWriter.close();
			return "";
		}
	}

}
