package com.WPF.service.impl;

import com.WPF.dao.RecruitDao;
import com.WPF.dao.RecruitListDao;
import com.WPF.domain.Recruit;
import com.WPF.domain.RecruitList;
import com.WPF.service.RecruitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RecruitServiceImpl implements RecruitService {
	@Resource
	private RecruitDao recruitDao;

	@Resource
	private RecruitListDao recruitListDao;

	@Override
	public List<Recruit> getRecruits() {
		return recruitDao.selectAllRecruits();
	}

	@Override
	public int submitRecruitList(RecruitList recruitList) {
		return recruitListDao.insertRecruitList(recruitList);
	}

	@Override
	public List<RecruitList> getUserRecruitList(String user_id) {
		return recruitListDao.selectAllRecruitListByUserID(user_id);
	}


}
