package com.WPF.dao;

import com.WPF.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
	User selectUserByUid(@Param("user_id") String user_id);

	int insertUser(User user);
}
