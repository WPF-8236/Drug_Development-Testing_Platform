package com.WPF.service.impl;

import com.WPF.dao.RegisterDao;
import com.WPF.dao.UserDao;
import com.WPF.dao.UserGradeDao;
import com.WPF.domain.User;
import com.WPF.domain.UserGrade;
import com.WPF.service.RegisterService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class RegisterServiceImpl implements RegisterService {
	@Resource
	private RegisterDao registerDao;

	@Resource
	private UserDao userDao;

	@Resource
	private UserGradeDao userGradeDao;

	@Override
	public int checkRegister(String user_id) {
		return registerDao.checkRegister(user_id);
	}

	@Override
	@Transactional
	public int registerUser(User user, UserGrade userGrade) {
		int num1 = userDao.insertUser(user);
		int num2 = userGradeDao.insertUserGrade(userGrade);
		return num1 * num2;
	}
}
