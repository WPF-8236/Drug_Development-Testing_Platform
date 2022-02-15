package com.WPF.service;

import com.WPF.domain.Drag;
import com.WPF.domain.Message;

import java.util.List;

public interface MessageService {
	List<Message> getMessageBym_mark(String m_mark);

	List<Drag> getDrag(String key, String value);
}
