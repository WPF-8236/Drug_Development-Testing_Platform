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
	@Resource
	private RecruitListDao recruitListDao;
	@Resource
	private RlUEDao rlUEDao;
	@Resource
	private VolunteerDao volunteerDao;
	@Resource
	private URaDao uRaDao;
	@Resource
	private ProgressDao progressDao;
	@Resource
	private MessageDao messageDao;
	@Resource
	private MEDao meDao;
	@Resource
	private CRFDao crfDao;

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
	public List<Recruit> getRecruits(String d_e_id) {
		return recruitDao.selectRecruitsByREId(d_e_id);
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
	public int deleteRrecruit(String r_id) {
		return recruitDao.deleteRrecruit(r_id);
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

	@Override
	public int updateARrecruit(Recruit recruit) {
		return recruitDao.updateARrecruit(recruit);
	}

	@Override
	public String getEId(String rl_id) {
		return rlUEDao.selectEID(rl_id);
	}

	@Override
	public int updateARlUE(String e_id, String rl_id, String rl_u_id) {
		return rlUEDao.insertRlUEDao(e_id, rl_id, rl_u_id);
	}

	@Override
	public List<Volunteer> getVolunteers(String e_id) {
		return volunteerDao.selectVolunteerByEid(e_id);
	}

	@Override
	public int addURa(URa uRa) {
		return uRaDao.insertAURa(uRa);
	}

	@Override
	public List<Volunteer> getVolunteersByRaId(String v_ra_id) {
		return volunteerDao.selectVolunteerByRaId(v_ra_id);
	}

	@Override
	public int deleteVolunteer(URa uRa) {
		return volunteerDao.deleteVolunteer(uRa);
	}

	@Override
	public List<Drag> getDragListWithApprove(String e_id) {
		return dragDao.selectDragWithApprove(e_id);
	}

	@Override
	public int addProgress(Progress progress) {
		return progressDao.insertProgress(progress);
	}

	@Override
	public List<Progress> getProgressListByDId(String dp_d_id) {
		return progressDao.selectProgressListByDId(dp_d_id);
	}

	@Override
	public int deleteProgressByDpId(String dp_id) {
		return progressDao.deleteProgressByDpId(dp_id);
	}

	@Override
	public int changeProgress(Progress progress) {
		return progressDao.changeProgress(progress);
	}

	@Override
	public int addMessage(Message message, String e_id) {
		int num1 = messageDao.insertMessage(message);
		int num2 = meDao.insertME(message.getM_id(), e_id);
		return num1 * num2;
	}

	@Override
	public List<Message> getMessageList(String e_id) {
		return messageDao.selectMessageByEId(e_id);
	}

	@Override
	public int deleteMessageByMId(String m_id) {
		int num1 = messageDao.deleteMessageByMId(m_id);
		int num2 = meDao.deleteMEByMId(m_id);
		return num1 * num2;
	}

	@Override
	public int changeAMessage(Message message) {
		return messageDao.updateMessage(message);
	}

	@Override
	public int changeDrag(Drag drag) {
		return dragDao.changeDrag(drag);
	}

	@Override
	public int deleteDragByDId(String d_id) {
		return dragDao.deleteDragByDId(d_id);
	}

	@Override
	public List<CRFReport> getCRFListByDId(String d_id) {
		return crfDao.getCRFListByDId(d_id);
	}
}