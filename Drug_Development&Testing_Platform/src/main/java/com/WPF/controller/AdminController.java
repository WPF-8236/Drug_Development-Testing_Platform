package com.WPF.controller;

import com.WPF.dao.EnterpriseDao;
import com.WPF.domain.*;
import com.WPF.service.EnterpriseService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	@Resource
	private EnterpriseService enterpriseService;

	@RequestMapping("/addEnterprise")
	public void addEnterprise(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("addEnterprise");
		ObjectMapper mapper = new ObjectMapper();
		Enterprise enterprise = mapper.readValue(json, Enterprise.class);
		UserGrade userGrade = new UserGrade(enterprise.getE_id(), enterprise.getE_password(), 3);
		int num = 0;
		num = enterpriseService.addEnterprise(enterprise, userGrade);
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

	@RequestMapping("/getEnterpriseList")
	@ResponseBody
	public List<Enterprise> getEnterpriseList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Enterprise> enterprises = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		enterprises = enterpriseService.getEnterpriseList();
		return enterprises;
	}

	@RequestMapping("/deleteEnterprise")
	public void deleteEnterprise(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("e_id");
		ObjectMapper mapper = new ObjectMapper();
		String e_id = mapper.readValue(json, String.class);
		int num = 0;
		num = enterpriseService.deleteEnterprise(e_id);
		System.out.println(num);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
			json = objectMapper.writeValueAsString("删除成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("删除失败！！");
			printWriter.print(json);
			printWriter.close();
		}
	}

	@RequestMapping("/updateEnterprise")
	public void updateEnterprise(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("updateEnterprise");
		ObjectMapper mapper = new ObjectMapper();
		Enterprise enterprise = mapper.readValue(json, Enterprise.class);
		UserGrade userGrade = new UserGrade(enterprise.getE_id(), enterprise.getE_password(), 3);
		int num = 0;
		num = enterpriseService.updateEnterprise(enterprise, userGrade);
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
