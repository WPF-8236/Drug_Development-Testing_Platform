package com.WPF.service;

import com.WPF.domain.User;
import com.WPF.domain.UserGrade;

public interface RegisterService {
	int checkRegister(String user_id);

	int registerUser(User user, UserGrade userGrade);

}
