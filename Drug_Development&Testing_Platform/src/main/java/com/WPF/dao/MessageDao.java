package com.WPF.dao;

import com.WPF.domain.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageDao {
	List<Message> selectMessageBym_mark(@Param("m_mark") String m_mark);
}
