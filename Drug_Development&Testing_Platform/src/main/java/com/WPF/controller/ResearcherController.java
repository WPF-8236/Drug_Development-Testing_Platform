package com.WPF.controller;

import com.WPF.domain.PhysicalExam;
import com.WPF.domain.RecruitList;
import com.WPF.service.RecruitService;
import com.WPF.service.ResearcherService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;

@Controller
@RequestMapping("/researcher")
public class ResearcherController {
	@Resource
	private ResearcherService researcherService;
	@Resource
	private RecruitService recruitService;

	@RequestMapping("/addPhyExam")
	public void addPhyExam(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("PhyExam");
		ObjectMapper mapper = new ObjectMapper();
		PhysicalExam physicalExam = mapper.readValue(json, PhysicalExam.class);
		physicalExam.setPe_id(new Date().toLocaleString());
		int num1 = 0;
		int num2 = 0;
		num1 = researcherService.addPhyExam(physicalExam);
		num2 = recruitService.changeRecruitListispe(physicalExam.getPe_rl_id());
		System.out.println(num1 * num2);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num1 * num2 != 0) {
			json = objectMapper.writeValueAsString("提交成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("提交失败！！");
			printWriter.print(json);
			printWriter.close();
		}
	}
}
