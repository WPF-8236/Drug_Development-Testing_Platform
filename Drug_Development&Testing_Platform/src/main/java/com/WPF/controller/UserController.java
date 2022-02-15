package com.WPF.controller;

import com.WPF.domain.User;
import com.WPF.domain.UserGrade;
import com.WPF.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;

	@RequestMapping("/fileupload")
	public String fileupload(HttpServletResponse response, HttpServletRequest request, MultipartFile upload) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("/img/");
		System.out.println(path);
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		String filename = upload.getOriginalFilename();
		String uuid = UUID.randomUUID().toString().replace("-", "");
		filename = uuid + "-" + filename;
		upload.transferTo(new File(path, filename));
		String img = "img/" + filename;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		user.setImg(img);
		userService.updateImg(user);
		return "Information";
	}

	@RequestMapping("/updatePassword")
	public void updatePassword(HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String password = request.getParameter("pass");
		user.setPassword(password);
		UserGrade userGrade = new UserGrade(user.getUser_id(), password, 2);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		int num = 0;
		num = userService.updateUserPassword(user, userGrade);
		System.out.println(num);
		if (num != 0) {
			printWriter.print("修改成功");
			printWriter.close();
		} else {
			printWriter.print("修改失败！！");
			printWriter.close();
		}
	}

	@RequestMapping("/updateAddress")
	public void updateAddress(HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String address = request.getParameter("address");
		user.setAddress(address);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		int num = 0;
		num = userService.updateAddress(user);
		System.out.println(num);
		if (num != 0) {
			printWriter.print("修改成功");
			printWriter.close();
		} else {
			printWriter.print("修改失败！！");
			printWriter.close();
		}
	}

	@RequestMapping("/updateModifyBasicInformation")
	public void updateModifyBasicInformation(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String json = request.getParameter("user");
		ObjectMapper mapper = new ObjectMapper();
		User user_new = mapper.readValue(json, User.class);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String old_user_id = user.getUser_id();
		user.setUser_id(user_new.getUser_id());
		user.setUser_age(user_new.getUser_age());
		user.setUser_sex(user_new.getUser_sex());
		user.setBirthday(user_new.getBirthday());
		UserGrade userGrade = new UserGrade(user.getUser_id(), user.getPassword(), 2);
		request.setCharacterEncoding("utf-8");
		/*response.setContentType("text/html;charset=utf-8");*/
		response.setContentType("application/json;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		int num = 0;
		num = userService.updateModifyBasicInformation(user, userGrade, old_user_id);
		System.out.println(num);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
			json = objectMapper.writeValueAsString("修改成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("修改失败！！");
			printWriter.print(json);
			printWriter.close();
		}
	}

	@RequestMapping("/updateModifyDetailedInformation")
	public void updateModifyDetailedInformation(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String json = request.getParameter("user");
		ObjectMapper mapper = new ObjectMapper();
		User user_new = mapper.readValue(json, User.class);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		user.setPassword(user_new.getPassword());
		user.setAddress(user_new.getAddress());
		user.setPhone_number(user_new.getPhone_number());
		user.setEmail(user_new.getEmail());
		UserGrade userGrade = new UserGrade(user.getUser_id(), user.getPassword(), 2);
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		int num = 0;
		num = userService.updateModifyDetailedInformation(user, userGrade);
		System.out.println(num);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
			json = objectMapper.writeValueAsString("修改成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("修改失败！！");
			printWriter.print(json);
			printWriter.close();
		}
	}

	@RequestMapping("/updateModifyPrivacyInformation")
	public void updateModifyPrivacyInformation(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String json = request.getParameter("user");
		ObjectMapper mapper = new ObjectMapper();
		User user_new = mapper.readValue(json, User.class);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		user.setDocument_type(user_new.getDocument_type());
		user.setUser_name(user_new.getUser_name());
		user.setIdentification_number(user_new.getIdentification_number());
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		int num = 0;
		num = userService.updateModifyPrivacyInformation(user);
		System.out.println(num);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
			json = objectMapper.writeValueAsString("修改成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("修改失败！！");
			printWriter.print(json);
			printWriter.close();
		}

	}
}
