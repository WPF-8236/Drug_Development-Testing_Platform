package com.WPF.service.impl;

import com.WPF.dao.RecruitDao;
import com.WPF.domain.Recruit;
import com.WPF.service.RecruitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RecruitServiceImpl implements RecruitService {
	@Resource
	private RecruitDao recruitDao;

	@Override
	public List<Recruit> getRecruits() {
		return recruitDao.selectAllRecruits();
	}
}
