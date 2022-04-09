package com.WPF.service.impl;

import com.WPF.dao.DragDao;
import com.WPF.dao.MessageDao;
import com.WPF.domain.Drag;
import com.WPF.domain.Message;
import com.WPF.service.MessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
	@Resource
	private MessageDao messageDao;

	@Resource
	private DragDao dragDao;

	@Override
	public List<Message> getMessageBym_mark(String m_mark) {
		return messageDao.selectMessageBym_mark(m_mark);
	}

	@Override
	public List<Drag> getDrag(String key, String value) {
		if ("1".equals(key))
			return dragDao.selectDragByTradeName("%" + value + "%");
		else if ("2".equals(key))
			return dragDao.selectDragByGenericName("%" + value + "%");
		else
			return dragDao.selectDragByApprovalNumber("%" + value + "%");
	}

	@Override
	public List<Drag> getDragListByApprove() {
		return dragDao.selectDragByApprove();
	}

	@Override
	public List<Message> getMessageList() {
		return messageDao.selectMessage();
	}

	@Override
	public int changeMessageMMark(String m_id, int trg) {
		return messageDao.changeMessageMMark(m_id,trg);
	}
}
