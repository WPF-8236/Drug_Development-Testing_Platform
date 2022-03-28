package com.WPF.service.impl;

import com.WPF.dao.PhysicalExamDao;
import com.WPF.domain.PhysicalExam;
import com.WPF.service.PhysicalExamService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class PhysicalExamServiceImpl implements PhysicalExamService {
	@Resource
	private PhysicalExamDao physicalExamDao;

	@Override
	public PhysicalExam getPhyExam(String pe_rl_id) {
		return physicalExamDao.selectPhysicalExamByPeRlID(pe_rl_id);
	}
}
