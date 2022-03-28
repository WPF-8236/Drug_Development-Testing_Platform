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

	List<Researcher> getResearcherList();

	List<Drag> getDragList(String d_e_id);

	int deleteEnterprise(String e_id);

	int deleteResearcher(String ra_id);

	int updateEnterprise(Enterprise enterprise, UserGrade userGrade);

	int updateResearcher(Researcher researcher, UserGrade userGrade);

}
