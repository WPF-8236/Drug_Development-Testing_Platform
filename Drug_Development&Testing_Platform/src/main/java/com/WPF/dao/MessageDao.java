package com.WPF.dao;

import com.WPF.domain.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageDao {
	List<Message> selectMessageBym_mark(@Param("m_mark") String m_mark);

	int insertMessage(Message message);

	List<Message> selectMessageByEId(@Param("e_id") String e_id);

	int deleteMessageByMId(@Param("m_id") String m_id);

	int updateMessage(Message message);

	List<Message> selectMessage();

	int changeMessageMMark(@Param("m_id") String m_id, @Param("trg") int trg);
}
