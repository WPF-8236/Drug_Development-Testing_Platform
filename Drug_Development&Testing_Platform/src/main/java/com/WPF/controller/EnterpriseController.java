package com.WPF.controller;

import com.WPF.domain.*;
import com.WPF.service.EnterpriseService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {
	@Resource
	private EnterpriseService enterpriseService;

	@RequestMapping("/addResearcher")
	public void addResearcher(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("addResearcher");
		ObjectMapper mapper = new ObjectMapper();
		Researcher researcher = mapper.readValue(json, Researcher.class);
		UserGrade userGrade = new UserGrade(researcher.getRa_id(), researcher.getRa_password(), 4);
		int num = 0;
		num = enterpriseService.addResearcher(researcher, userGrade);
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

	@RequestMapping("/addDrag")
	public void addDrag(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("Drag");
		ObjectMapper mapper = new ObjectMapper();
		Drag drag = mapper.readValue(json, Drag.class);
		drag.setD_id(new Date().toLocaleString());
		int num = 0;
		num = enterpriseService.addDrag(drag);
		System.out.println(num);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
			json = objectMapper.writeValueAsString("申请成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("申请失败！！");
			printWriter.print(json);
			printWriter.close();
		}
	}

	@RequestMapping("/addRecruit")
	public void addRecruit(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("Recruit");
		ObjectMapper mapper = new ObjectMapper();
		Recruit recruit = mapper.readValue(json, Recruit.class);
		recruit.setR_id(new Date().toLocaleString());
		int num = 0;
		num = enterpriseService.addRecruit(recruit);
		System.out.println(num);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
			json = objectMapper.writeValueAsString("申请成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("申请失败！！");
			printWriter.print(json);
			printWriter.close();
		}
	}

	@RequestMapping("/getResearcherList")
	@ResponseBody
	public List<Researcher> getResearcherList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Researcher> researchers = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		researchers = enterpriseService.getResearcherList();
		return researchers;
	}

	@RequestMapping("/getDragListWithApprove")
	@ResponseBody
	public List<Drag> getDragListWithApprove(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Drag> drags = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("e_id");
		ObjectMapper mapper = new ObjectMapper();
		String e_id = mapper.readValue(json, String.class);
		drags = enterpriseService.getDragListWithApprove(e_id);
		return drags;
	}

	@RequestMapping("/getDragList")
	@ResponseBody
	public List<Drag> getDragList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Drag> drags = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("e_id");
		ObjectMapper mapper = new ObjectMapper();
		String e_id = mapper.readValue(json, String.class);
		drags = enterpriseService.getDragList(e_id);
		return drags;
	}

	@RequestMapping("/getRecruits")
	@ResponseBody
	public List<Recruit> getRecruits(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Recruit> recruits = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("e_id");
		ObjectMapper mapper = new ObjectMapper();
		String e_id = mapper.readValue(json, String.class);
		recruits = enterpriseService.getRecruits(e_id);
		return recruits;
	}

	@RequestMapping("/getVolunteers")
	@ResponseBody
	public List<Volunteer> getVolunteers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Volunteer> volunteers = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("e_id");
		ObjectMapper mapper = new ObjectMapper();
		String e_id = mapper.readValue(json, String.class);
		volunteers = enterpriseService.getVolunteers(e_id);
		return volunteers;
	}

	@RequestMapping("/updateResearcher")
	public void updateResearcher(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("updateResearcher");
		ObjectMapper mapper = new ObjectMapper();
		Researcher researcher = mapper.readValue(json, Researcher.class);
		UserGrade userGrade = new UserGrade(researcher.getRa_id(), researcher.getRa_password(), 4);
		int num = 0;
		num = enterpriseService.updateResearcher(researcher, userGrade);
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

	@RequestMapping("/updateARrecruit")
	public void updateARrecruit(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("updateRrecruit");
		ObjectMapper mapper = new ObjectMapper();
		Recruit recruit = mapper.readValue(json, Recruit.class);
		int num = 0;
		num = enterpriseService.updateARrecruit(recruit);
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

	@RequestMapping("/addURa")
	public void addURa(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("u_ra");
		ObjectMapper mapper = new ObjectMapper();
		URa uRa = mapper.readValue(json, URa.class);
		System.out.println(uRa);
		int num = 0;
		num = enterpriseService.addURa(uRa);
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

	@RequestMapping("/deleteVolunteer")
	public void deleteVolunteer(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("u_ra");
		ObjectMapper mapper = new ObjectMapper();
		URa uRa = mapper.readValue(json, URa.class);
		System.out.println(uRa);
		int num = 0;
		num = enterpriseService.deleteVolunteer(uRa);
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

	@RequestMapping("/onSubmitProgress")
	public void onSubmitProgress(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("addProgress");
		ObjectMapper mapper = new ObjectMapper();
		Progress progress = mapper.readValue(json, Progress.class);
		progress.setDp_id(new Date().toLocaleString());
		int num = 0;
		num = enterpriseService.addProgress(progress);
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

	@RequestMapping("/getVolunteersByRaId")
	@ResponseBody
	public List<Volunteer> getVolunteersByRaId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Volunteer> volunteers = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("v_ra_id");
		ObjectMapper mapper = new ObjectMapper();
		String v_ra_id = mapper.readValue(json, String.class);
		volunteers = enterpriseService.getVolunteersByRaId(v_ra_id);
		return volunteers;
	}


	@RequestMapping("/deleteResearcher")
	public void deleteResearcher(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("ra_id");
		ObjectMapper mapper = new ObjectMapper();
		String ra_id = mapper.readValue(json, String.class);
		int num = 0;
		num = enterpriseService.deleteResearcher(ra_id);
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

	@RequestMapping("/deleteRrecruit")
	public void deleteRrecruit(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("r_id");
		ObjectMapper mapper = new ObjectMapper();
		String r_id = mapper.readValue(json, String.class);
		int num = 0;
		num = enterpriseService.deleteRrecruit(r_id);
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
}
