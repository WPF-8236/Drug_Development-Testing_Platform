package com.WPF.service.impl;

import com.WPF.dao.*;
import com.WPF.domain.*;
import com.WPF.service.ResearcherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ResearcherServiceImpl implements ResearcherService {
	@Resource
	private ResearcherDao researcherDao;

	@Resource
	private PhysicalExamDao physicalExamDao;

	@Resource
	private VolunteerDao volunteerDao;

	@Resource
	private CRFDao crfDao;

	@Resource
	private FeedBackDao feedBackDao;

	@Override
	public Researcher getResearcher(String ra_id) {
		return researcherDao.selectAResearcher(ra_id);
	}

	@Override
	public int addPhyExam(PhysicalExam physicalExam) {
		return physicalExamDao.insertPhysicalExam(physicalExam);
	}

	@Override
	public List<Volunteer> getVolunteers(String v_ra_id) {
		return volunteerDao.selectVolunteerByRaId(v_ra_id);
	}

	@Override
	public int submitCRF(DC dc, BloodRoutine bloodRoutine, UrineRoutine urineRoutine, BowelRoutine bowelRoutine, BloodChemistry bloodChemistry, ECOG ecog, VitalSigns vitalSigns, PhyExam phyExam) {
		return crfDao.submitDC(dc) * crfDao.submitBloodRoutine(bloodRoutine) * crfDao.submitUrineRoutine(urineRoutine) * crfDao.submitBowelRoutine(bowelRoutine) * crfDao.submitBloodChemistry(bloodChemistry) * crfDao.submitECOG(ecog) * crfDao.submitVitalSigns(vitalSigns) * crfDao.submitPhyExam(phyExam);
	}

	@Override
	public List<CRFReport> getCRFListByUserId(String user_id) {
		return crfDao.selectCRFReportByUserId(user_id);
	}

	@Override
	public List<CRFReport> getCRFListByRaId(String ra_id) {
		return crfDao.selectCRFListByRaId(ra_id);
	}

	@Override
	public List<FeedBack> getFeedBackByRaId(String ra_id) {
		return feedBackDao.getFeedBackByRaId(ra_id);
	}
}
