package com.WPF.service;

import com.WPF.domain.User;
import com.WPF.domain.UserGrade;

public interface UserService {
	User getUser(String user_id);

	int updateImg(User user);

	int updateUserPassword(User user, UserGrade userGrade);

	int updateAddress(User user);

	int updateModifyBasicInformation(User user, UserGrade userGrade, String oldUserId);

	int updateModifyDetailedInformation(User user, UserGrade userGrade);

	int updateModifyPrivacyInformation(User user);

	int update(User user);


}
