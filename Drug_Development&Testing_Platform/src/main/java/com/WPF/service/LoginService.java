package com.WPF.service;

import com.WPF.domain.UserGrade;

public interface LoginService {
	UserGrade login(String id, String password);
}
