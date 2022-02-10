package com.WPF.service.impl;

import com.WPF.dao.UserGradeDao;
import com.WPF.domain.UserGrade;
import com.WPF.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LoginServiceImpl implements LoginService {
	@Resource
	private UserGradeDao userGradeDao;

	@Override
	public UserGrade login(String id, String password) {
		return userGradeDao.selectUserGrade(id, password);
	}
}
