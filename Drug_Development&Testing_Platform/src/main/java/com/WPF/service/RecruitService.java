package com.WPF.service;

import com.WPF.domain.Recruit;
import com.WPF.domain.RecruitList;

import java.util.List;

public interface RecruitService {
	List<Recruit> getRecruits();

	int submitRecruitList(RecruitList recruitList);

	List<RecruitList> getUserRecruitList(String user_id);

	List<RecruitList> getRecruitList();

	int changeRecruitListisv(String rl_id);
}
