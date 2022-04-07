package com.WPF.service.impl;

import com.WPF.dao.FeedBackDao;
import com.WPF.dao.UserDao;
import com.WPF.dao.UserGradeDao;
import com.WPF.domain.FeedBack;
import com.WPF.domain.User;
import com.WPF.domain.UserGrade;
import com.WPF.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Resource
	private UserGradeDao userGradeDao;

	@Resource
	private FeedBackDao feedBackDao;

	@Override
	public User getUser(String user_id) {
		return userDao.selectUserByUid(user_id);
	}

	@Override
	public int updateImg(User user) {
		return userDao.updateImg(user);
	}

	@Override
	@Transactional
	public int updateUserPassword(User user, UserGrade userGrade) {
		int num1 = userGradeDao.updatePassword(userGrade);
		int num2 = userDao.updateUserPassword(user);
		return num1 * num2;
	}

	@Override
	public int updateAddress(User user) {
		return userDao.updateUserAddress(user);
	}

	@Override
	@Transactional
	public int updateModifyBasicInformation(User user, UserGrade userGrade, String oldUserId) {
		int num1 = userGradeDao.updateModifyBasicInformation(userGrade, oldUserId);
		int num2 = userDao.updateModifyBasicInformation(user, oldUserId);
		return num1 * num2;
	}

	@Override
	@Transactional
	public int updateModifyDetailedInformation(User user, UserGrade userGrade) {
		int num1 = userGradeDao.updateModifyDetailedInformation(userGrade);
		int num2 = userDao.updateModifyDetailedInformation(user);
		return num1 * num2;
	}

	@Override
	public int updateModifyPrivacyInformation(User user) {
		return userDao.updateModifyPrivacyInformation(user);
	}

	@Override
	public int update(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public int addFeedBack(FeedBack feedBack) {
		return feedBackDao.insertFeedBack(feedBack);
	}

}
