package com.WPF.service;

import com.WPF.domain.Recruit;
import com.WPF.domain.RecruitList;

import java.util.List;

public interface RecruitService {
	List<Recruit> getRecruits();

	int submitRecruitList(RecruitList recruitList);
}
