package com.WPF.controller;

import com.WPF.domain.*;
import com.WPF.service.DragService;
import com.WPF.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private DragService dragService;

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

	@RequestMapping("/firstForm")
	public void firstForm(HttpServletResponse response, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String user_name = request.getParameter("user[user_name]");
		Integer user_age = Integer.parseInt(request.getParameter("user[user_age]"));
		Integer user_sex = request.getParameter("user[user_sex]").equals("男") ? 0 : 1;
		Date birthday = Date.valueOf(request.getParameter("user[birthday]"));
		Integer document_type = Integer.parseInt(request.getParameter("user[document_type]"));
		String identification_number = request.getParameter("user[identification_number]");
		String phone_number = request.getParameter("user[phone_number]");
		String email = request.getParameter("user[email]");
		String address = request.getParameter("user[address]");
		user.setUser_name(user_name);
		user.setUser_age(user_age);
		user.setUser_sex(user_sex);
		user.setBirthday(birthday);
		user.setDocument_type(document_type);
		user.setIdentification_number(identification_number);
		user.setPhone_number(phone_number);
		user.setEmail(email);
		user.setAddress(address);
		System.out.println(user);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		int num = 0;
		num = userService.update(user);
		System.out.println(num);
		if (num != 0) {
			printWriter.print("完善成功");
			printWriter.close();
		} else {
			printWriter.print("完善失败！！");
			printWriter.close();
		}
	}

	@RequestMapping("/getDragList")
	@ResponseBody
	public List<Drag> getDragList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<Drag> drags = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("user_id");
		ObjectMapper mapper = new ObjectMapper();
		String user_id = mapper.readValue(json, String.class);
		drags = dragService.getDragListByUserId(user_id);
		return drags;
	}

	@RequestMapping("/submitFeedBack")
	public void submitFeedBack(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("feedback");
		ObjectMapper mapper = new ObjectMapper();
		FeedBack feedBack = mapper.readValue(json, FeedBack.class);
		feedBack.setBf_id(new java.util.Date().toLocaleString());
		feedBack.setBf_date(new java.util.Date().toLocaleString());
		int num = 0;
		num = userService.addFeedBack(feedBack);
		System.out.println(num);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
			json = objectMapper.writeValueAsString("添加成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("添加失败！！");
			printWriter.print(json);
			printWriter.close();
		}
	}
}
