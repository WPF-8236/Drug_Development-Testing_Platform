package com.WPF.controller;

import com.WPF.domain.Message;
import com.WPF.service.MessageService;
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
@RequestMapping("/Message")
public class MessageController {
	@Resource
	private MessageService messageService;


	@RequestMapping("/getMessageBym_mark")
	@ResponseBody
	public List<Message> getMessageBym_mark(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String m_mark = request.getParameter("m_mark");
		List<Message> messages = new ArrayList<>();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println(m_mark);
		messages = messageService.getMessageBym_mark(m_mark);
		System.out.println(messages);
		return messages;
	}

}
