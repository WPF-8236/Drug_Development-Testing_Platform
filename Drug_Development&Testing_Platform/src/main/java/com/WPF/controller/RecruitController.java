package com.WPF.controller;

import com.WPF.domain.Recruit;
import com.WPF.domain.User;
import com.WPF.domain.UserGrade;
import com.WPF.service.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
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

}
