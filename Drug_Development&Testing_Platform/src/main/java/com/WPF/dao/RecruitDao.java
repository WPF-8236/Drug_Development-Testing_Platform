package com.WPF.dao;

import com.WPF.domain.Recruit;

import java.util.List;

public interface RecruitDao {
	List<Recruit> selectAllRecruits();

	int insertRecruit(Recruit recruit);
}
