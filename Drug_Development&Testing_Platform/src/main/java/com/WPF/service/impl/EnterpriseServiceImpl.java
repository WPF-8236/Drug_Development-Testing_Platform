package com.WPF.service.impl;

import com.WPF.dao.EnterpriseDao;
import com.WPF.dao.UserGradeDao;
import com.WPF.domain.Enterprise;
import com.WPF.domain.UserGrade;
import com.WPF.service.EnterpriseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EnterpriseServiceImpl implements EnterpriseService {
	@Resource
	private EnterpriseDao enterpriseDao;
	@Resource
	private UserGradeDao userGradeDao;

	@Override
	@Transactional
	public int addEnterprise(Enterprise enterprise, UserGrade userGrade) {
		int num1 = enterpriseDao.insertEnterprise(enterprise);
		int num2 = userGradeDao.insertUserGrade(userGrade);
		return num1 * num2;
	}

	@Override
	public Enterprise getEnterprise(String e_id) {
		return enterpriseDao.selectAnEnterprise(e_id);
	}

	@Override
	public List<Enterprise> getEnterpriseList() {
		return enterpriseDao.selectEnterprise();
	}

	@Override
	@Transactional
	public int deleteEnterprise(String e_id) {
		int num1 = enterpriseDao.deleteEnterprise(e_id);
		int num2 = userGradeDao.deleteUserGrade(e_id);
		return num1 * num2;
	}

	@Override
	public int updateEnterprise(Enterprise enterprise, UserGrade userGrade) {
		return 0;
	}
}
