package com.WPF.service;

import com.WPF.domain.Drag;
import com.WPF.domain.Enterprise;
import com.WPF.domain.Researcher;
import com.WPF.domain.UserGrade;

import java.util.List;

public interface EnterpriseService {
	int addEnterprise(Enterprise enterprise, UserGrade userGrade);

	int addDrag(Drag drag);

	int addResearcher(Researcher researcher, UserGrade userGrade);

	Enterprise getEnterprise(String e_id);

	List<Enterprise> getEnterpriseList();

	List<Researcher> getResearcherList();

	int deleteEnterprise(String e_id);

	int deleteResearcher(String ra_id);

	int updateEnterprise(Enterprise enterprise, UserGrade userGrade);

	int updateResearcher(Researcher researcher, UserGrade userGrade);

}
