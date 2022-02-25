package com.WPF.controller;

import com.WPF.domain.Recruit;
import com.WPF.domain.RecruitList;
import com.WPF.service.RecruitService;
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
@RequestMapping("/recruit")
public class RecruitController {
	@Resource
	private RecruitService recruitService;

	@RequestMapping("/getRecruit")
	@ResponseBody
	public List<Recruit> getRecruit(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<Recruit> recruits = recruitService.getRecruits();
		System.out.println(recruits);
		return recruits;
	}

	@RequestMapping("/submitRecruitList")
	public void submitRecruitList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String json = request.getParameter("recruitList");
		ObjectMapper mapper = new ObjectMapper();
		RecruitList recruitList = mapper.readValue(json, RecruitList.class);
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		recruitList.setRl_id(String.valueOf(new Date().getTime()));
		int num = recruitService.submitRecruitList(recruitList);
		ObjectMapper objectMapper = new ObjectMapper();
		if (num != 0) {
			json = objectMapper.writeValueAsString("报名成功");
			printWriter.print(json);
			printWriter.close();
		} else {
			json = objectMapper.writeValueAsString("报名失败！！");
			printWriter.print(json);
			printWriter.close();
		}
	}

}
