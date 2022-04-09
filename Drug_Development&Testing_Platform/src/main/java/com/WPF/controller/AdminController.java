package com.WPF.controller;

import com.WPF.domain.*;
import com.WPF.service.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	@Resource
	private EnterpriseService enterpriseService;

	@Resource
	private RecruitService recruitService;

	@Resource
	private PhysicalExamService physicalExamService;

	@Resource
	private DragService dragService;
	@Resource
	private MessageService messageService;

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

	@RequestMapping("/getDragList")
	@ResponseBody
	public List<Drag> getDragList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Drag> drags = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		drags = dragService.getDragList();
		return drags;
	}

	@RequestMapping("/getMessageList")
	@ResponseBody
	public List<Message> getMessageList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Message> messages = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		messages = messageService.getMessageList();
		return messages;
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

	@RequestMapping("/changeRecruitListisv")
	public void changeRecruitListisv(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("rl_id");
		String json2 = request.getParameter("trg");
		ObjectMapper mapper = new ObjectMapper();
		String rl_id = mapper.readValue(json, String.class);
		int trg = mapper.readValue(json2, Integer.class);
		int num = 0;
		num = recruitService.changeRecruitListisv(rl_id, trg);
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

	@RequestMapping("/updateARlUE")
	public void updateARlUE(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("rl_id");
		String json2 = request.getParameter("rl_u_id");
		ObjectMapper mapper = new ObjectMapper();
		String rl_id = mapper.readValue(json, String.class);
		String rl_u_id = mapper.readValue(json2, String.class);
		int num = 0;
		num = enterpriseService.updateARlUE(rl_id, rl_u_id);
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

	@RequestMapping("/changeDragDApprove")
	public void changeDragDApprove(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("d_id");
		String json2 = request.getParameter("trg");
		ObjectMapper mapper = new ObjectMapper();
		String d_id = mapper.readValue(json, String.class);
		int trg = mapper.readValue(json2, Integer.class);
		int num = 0;
		num = dragService.changeDragDApprove(d_id, trg);
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

	@RequestMapping("/changeMessageMMark")
	public void changeMessageMMark(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("m_id");
		String json2 = request.getParameter("trg");
		ObjectMapper mapper = new ObjectMapper();
		String m_id = mapper.readValue(json, String.class);
		int trg = mapper.readValue(json2, Integer.class);
		int num = 0;
		num = messageService.changeMessageMMark(m_id, trg);
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

	@RequestMapping("/getPhyExam")
	@ResponseBody
	public PhysicalExam getPhyExam(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PhysicalExam physicalExam = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("pe_rl_id");
		ObjectMapper mapper = new ObjectMapper();
		String pe_rl_id = mapper.readValue(json, String.class);
		physicalExam = physicalExamService.getPhyExam(pe_rl_id);
		return physicalExam;
	}
}
