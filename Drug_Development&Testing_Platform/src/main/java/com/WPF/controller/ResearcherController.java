package com.WPF.controller;

import com.WPF.domain.*;
import com.WPF.service.RecruitService;
import com.WPF.service.ResearcherService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

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

	@RequestMapping("/getVolunteers")
	@ResponseBody
	public List<Volunteer> getVolunteers(HttpServletResponse response, HttpServletRequest request) throws Exception {
		List<Volunteer> volunteers = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("ra_id");
		ObjectMapper mapper = new ObjectMapper();
		String ra_id = mapper.readValue(json, String.class);
		volunteers = researcherService.getVolunteers(ra_id);
		return volunteers;
	}

	@RequestMapping("/submitCRF")
	public void submitCRF(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("DC");
		String json2 = request.getParameter("crf_blood_routine");
		String json3 = request.getParameter("crf_urine_routine");
		String json4 = request.getParameter("crf_bowel_routine");
		String json5 = request.getParameter("crf_blood_chemistry");
		String json6 = request.getParameter("crf_ecog");
		String json7 = request.getParameter("crf_vital_signs");
		String json8 = request.getParameter("crf_physical_examination");
		ObjectMapper mapper = new ObjectMapper();
		String date = new Date().toLocaleString();
		DC dc = mapper.readValue(json, DC.class);
		BloodRoutine bloodRoutine = mapper.readValue(json2, BloodRoutine.class);
		UrineRoutine urineRoutine = mapper.readValue(json3, UrineRoutine.class);
		BowelRoutine bowelRoutine = mapper.readValue(json4, BowelRoutine.class);
		BloodChemistry bloodChemistry = mapper.readValue(json5, BloodChemistry.class);
		ECOG ecog = mapper.readValue(json6, ECOG.class);
		VitalSigns vitalSigns = mapper.readValue(json7, VitalSigns.class);
		PhyExam phyExam = mapper.readValue(json8, PhyExam.class);
		dc.setC_id(date);
		bloodRoutine.setC_id(date);
		urineRoutine.setC_id(date);
		bowelRoutine.setC_id(date);
		bloodChemistry.setC_id(date);
		ecog.setC_id(date);
		vitalSigns.setC_id(date);
		phyExam.setC_id(date);
		int num = researcherService.submitCRF(dc, bloodRoutine, urineRoutine, bowelRoutine, bloodChemistry, ecog, vitalSigns, phyExam);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
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
