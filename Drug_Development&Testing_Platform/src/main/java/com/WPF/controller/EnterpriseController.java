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
		String json = request.getParameter("ra_e_id");
		ObjectMapper mapper = new ObjectMapper();
		String ra_e_id = mapper.readValue(json, String.class);
		researchers = enterpriseService.getResearcherList(ra_e_id);
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

	@RequestMapping("/deleteProgressByDpId")
	public void deleteProgressByDpId(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("dp_id");
		ObjectMapper mapper = new ObjectMapper();
		String dp_id = mapper.readValue(json, String.class);
		int num = 0;
		num = enterpriseService.deleteProgressByDpId(dp_id);
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

	@RequestMapping("/changeProgress")
	public void changeProgress(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("changeProgress");
		ObjectMapper mapper = new ObjectMapper();
		Progress progress = mapper.readValue(json, Progress.class);
		int num = 0;
		num = enterpriseService.changeProgress(progress);
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

	@RequestMapping("/addMessage")
	public void addMessage(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("Message");
		String json1 = request.getParameter("e_id");
		ObjectMapper mapper = new ObjectMapper();
		Message message = mapper.readValue(json, Message.class);
		String e_id = mapper.readValue(json1, String.class);
		message.setM_id(new Date().toLocaleString());
		message.setM_time(new Date().toLocaleString());
		int num = 0;
		num = enterpriseService.addMessage(message, e_id);
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

	@RequestMapping("/changeAMessage")
	public void changeAMessage(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("Message");
		ObjectMapper mapper = new ObjectMapper();
		Message message = mapper.readValue(json, Message.class);
		int num = 0;
		num = enterpriseService.changeAMessage(message);
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

	@RequestMapping("/changeDrag")
	public void changeDrag(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("changeDrag");
		ObjectMapper mapper = new ObjectMapper();
		Drag drag = mapper.readValue(json, Drag.class);
		int num = 0;
		num = enterpriseService.changeDrag(drag);
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

	@RequestMapping("/deleteMessageByMId")
	public void deleteMessageByMId(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("m_id");
		ObjectMapper mapper = new ObjectMapper();
		String m_id = mapper.readValue(json, String.class);
		int num = 0;
		num = enterpriseService.deleteMessageByMId(m_id);
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

	@RequestMapping("/deleteDragByDId")
	public void deleteDragByDId(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		String json = request.getParameter("d_id");
		ObjectMapper mapper = new ObjectMapper();
		String d_id = mapper.readValue(json, String.class);
		int num = 0;
		num = enterpriseService.deleteDragByDId(d_id);
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

	@RequestMapping("/getCRFListByDId")
	@ResponseBody
	public List<CRFReport> getCRFListByDId(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("d_id");
		ObjectMapper mapper = new ObjectMapper();
		String d_id = mapper.readValue(json, String.class);
		return enterpriseService.getCRFListByDId(d_id);
	}

	@RequestMapping("/getMessageList")
	@ResponseBody
	public List<Message> getMessageList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Message> messages = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("e_id");
		ObjectMapper mapper = new ObjectMapper();
		String e_id = mapper.readValue(json, String.class);
		messages = enterpriseService.getMessageList(e_id);
		return messages;
	}

	@RequestMapping("/getProgressListByDId")
	@ResponseBody
	public List<Progress> getProgressListByDId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Progress> progresses = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String json = request.getParameter("dp_d_id");
		ObjectMapper mapper = new ObjectMapper();
		String dp_d_id = mapper.readValue(json, String.class);
		progresses = enterpriseService.getProgressListByDId(dp_d_id);
		return progresses;
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
