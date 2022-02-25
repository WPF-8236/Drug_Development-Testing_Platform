package com.WPF.dao;

import com.WPF.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
	User selectUserByUid(@Param("user_id") String user_id);

	int insertUser(User user);

	int updateImg(User user);

	int updateUserPassword(User user);

	int updateUserAddress(User user);

	int updateModifyBasicInformation(@Param("user") User user, @Param("old_user_id") String old_user_id);

	int updateModifyDetailedInformation(User user);

	int updateModifyPrivacyInformation(User user);

	int updateUser(User user);


}
