package com.WPF.service.impl;

import com.WPF.dao.MessageDao;
import com.WPF.domain.Message;
import com.WPF.service.MessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
	@Resource
	private MessageDao messageDao;

	@Override
	public List<Message> getMessageBym_mark(String m_mark) {
		return messageDao.selectMessageBym_mark(m_mark);
	}
}
