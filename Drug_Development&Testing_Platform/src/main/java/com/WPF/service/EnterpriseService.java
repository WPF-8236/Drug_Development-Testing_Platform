package com.WPF.service;

import com.WPF.domain.Enterprise;
import com.WPF.domain.UserGrade;

import java.util.List;

public interface EnterpriseService {
	int addEnterprise(Enterprise enterprise, UserGrade userGrade);

	Enterprise getEnterprise(String e_id);

	List<Enterprise> getEnterpriseList();

	int deleteEnterprise(String e_id);

	int updateEnterprise(Enterprise enterprise, UserGrade userGrade);

}
