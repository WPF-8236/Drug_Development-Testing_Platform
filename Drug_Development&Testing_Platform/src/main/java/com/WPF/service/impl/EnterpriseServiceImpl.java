package com.WPF.service.impl;

import com.WPF.dao.*;
import com.WPF.domain.*;
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
	private ResearcherDao researcherDao;
	@Resource
	private UserGradeDao userGradeDao;
	@Resource
	private DragDao dragDao;
	@Resource
	private RecruitDao recruitDao;

	@Override
	@Transactional
	public int addEnterprise(Enterprise enterprise, UserGrade userGrade) {
		int num1 = enterpriseDao.insertEnterprise(enterprise);
		int num2 = userGradeDao.insertUserGrade(userGrade);
		return num1 * num2;
	}

	@Override
	public int addDrag(Drag drag) {
		int num = dragDao.insertADrag(drag);
		return num;
	}

	@Override
	public int addRecruit(Recruit recruit) {
		return recruitDao.insertRecruit(recruit);
	}

	@Override
	public int addResearcher(Researcher researcher, UserGrade userGrade) {
		int num1 = researcherDao.insertResearcher(researcher);
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
	public List<Researcher> getResearcherList() {
		return researcherDao.selectResearcher();
	}

	@Override
	public List<Drag> getDragList(String d_e_id) {
		return dragDao.selectDragByDEID(d_e_id);
	}

	@Override
	@Transactional
	public int deleteEnterprise(String e_id) {
		int num1 = enterpriseDao.deleteEnterprise(e_id);
		int num2 = userGradeDao.deleteUserGrade(e_id);
		return num1 * num2;
	}

	@Override
	public int deleteResearcher(String ra_id) {
		int num1 = researcherDao.deleteResearcher(ra_id);
		int num2 = userGradeDao.deleteUserGrade(ra_id);
		return num1 * num2;
	}

	@Override
	public int updateEnterprise(Enterprise enterprise, UserGrade userGrade) {
		int num1 = enterpriseDao.updateEnterprise(enterprise);
		int num2 = userGradeDao.updatePassword(userGrade);
		return num1 * num2;
	}

	@Override
	public int updateResearcher(Researcher researcher, UserGrade userGrade) {
		int num1 = researcherDao.updateResearcher(researcher);
		int num2 = userGradeDao.updatePassword(userGrade);
		return num1 * num2;
	}
}
