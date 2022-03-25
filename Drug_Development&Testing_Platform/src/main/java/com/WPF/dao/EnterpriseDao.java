package com.WPF.dao;

import com.WPF.domain.Enterprise;

import java.util.List;

public interface EnterpriseDao {
	int insertEnterprise(Enterprise enterprise);

	Enterprise selectAnEnterprise(String e_id);

	List<Enterprise> selectEnterprise();

	int deleteEnterprise(String e_id);

	int updateEnterprise(Enterprise enterprise);
}
