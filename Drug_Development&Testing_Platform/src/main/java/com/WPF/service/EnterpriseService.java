package com.WPF.service;

import com.WPF.domain.*;

import java.util.List;

public interface EnterpriseService {
	int addEnterprise(Enterprise enterprise, UserGrade userGrade);

	int addDrag(Drag drag);

	int addRecruit(Recruit recruit);

	int addResearcher(Researcher researcher, UserGrade userGrade);

	Enterprise getEnterprise(String e_id);

	List<Enterprise> getEnterpriseList();

	List<Researcher> getResearcherList(String ra_e_id);

	List<Drag> getDragList(String d_e_id);

	List<Recruit> getRecruits(String d_e_id);

	int deleteEnterprise(String e_id);

	int deleteResearcher(String ra_id);

	int deleteRrecruit(String r_id);

	int updateEnterprise(Enterprise enterprise, UserGrade userGrade);

	int updateResearcher(Researcher researcher, UserGrade userGrade);

	int updateARrecruit(Recruit recruit);

	String getEId(String rl_id);

	int updateARlUE(String e_id, String rl_id, String rl_u_id);

	List<Volunteer> getVolunteers(String e_id);

	int addURa(URa uRa);

	List<Volunteer> getVolunteersByRaId(String v_ra_id);

	int deleteVolunteer(URa uRa);

	List<Drag> getDragListWithApprove(String e_id);

	int addProgress(Progress progress);

	List<Progress> getProgressListByDId(String dp_d_id);

	int deleteProgressByDpId(String dp_id);

	int changeProgress(Progress progress);

	int addMessage(Message message, String e_id);

	List<Message> getMessageList(String e_id);

	int deleteMessageByMId(String m_id);

	int changeAMessage(Message message);

	int changeDrag(Drag drag);

	int deleteDragByDId(String d_id);

	List<CRFReport> getCRFListByDId(String d_id);
}
