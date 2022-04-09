package com.WPF.dao;

import org.apache.ibatis.annotations.Param;

public interface MEDao {
	int insertME(@Param("m_id") String m_id, @Param("e_id") String e_id);

	int deleteMEByMId(@Param("m_id") String m_id);
}
