package com.WPF.dao;

import org.apache.ibatis.annotations.Param;

public interface RegisterDao {
	int checkRegister(@Param("user_id") String user_id);
}
