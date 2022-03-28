package com.WPF.service.impl;

import com.WPF.dao.PhysicalExamDao;
import com.WPF.dao.ResearcherDao;
import com.WPF.domain.PhysicalExam;
import com.WPF.domain.Researcher;
import com.WPF.service.ResearcherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ResearcherServiceImpl implements ResearcherService {
	@Resource
	private ResearcherDao researcherDao;

	@Resource
	private PhysicalExamDao physicalExamDao;

	@Override
	public Researcher getResearcher(String ra_id) {
		return researcherDao.selectAResearcher(ra_id);
	}

	@Override
	public int addPhyExam(PhysicalExam physicalExam) {
		return physicalExamDao.insertPhysicalExam(physicalExam);
	}
}
