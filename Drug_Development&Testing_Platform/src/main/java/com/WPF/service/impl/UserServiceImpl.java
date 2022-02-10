package com.WPF.service.impl;

import com.WPF.dao.UserDao;
import com.WPF.domain.User;
import com.WPF.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public User getUser(String user_id) {
		return userDao.selectUserByUid(user_id);
	}
}
