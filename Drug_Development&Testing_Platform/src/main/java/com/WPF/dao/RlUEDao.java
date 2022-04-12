package com.WPF.dao;

import org.apache.ibatis.annotations.Param;

public interface RlUEDao {
	int insertRlUEDao(@Param("e_id") String e_id, @Param("rl_id") String rl_id, @Param("rl_u_id") String rl_u_id);

	String selectEID(@Param("rl_id") String rl_id);
}
