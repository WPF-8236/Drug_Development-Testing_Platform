package com.WPF.service;

import com.WPF.domain.Enterprise;
import com.WPF.domain.UserGrade;

import java.util.List;

public interface EnterpriseService {
	int addEnterprise(Enterprise enterprise, UserGrade userGrade);

	List<Enterprise> getEnterpriseList();

	int deleteEnterprise(String e_id);

	int updateEnterprise(Enterprise enterprise, UserGrade userGrade);

}
