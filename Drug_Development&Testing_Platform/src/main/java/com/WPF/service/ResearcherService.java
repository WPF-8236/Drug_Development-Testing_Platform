package com.WPF.service;

import com.WPF.domain.*;

import java.util.List;

public interface ResearcherService {
	Researcher getResearcher(String ra_id);

	int addPhyExam(PhysicalExam physicalExam);

	List<Volunteer> getVolunteers(String v_ra_id);

	int submitCRF(DC dc, BloodRoutine bloodRoutine, UrineRoutine urineRoutine, BowelRoutine bowelRoutine, BloodChemistry bloodChemistry, ECOG ecog, VitalSigns vitalSigns, PhyExam phyExam);

	List<CRFReport> getCRFListByUserId(String user_id);

	List<CRFReport> getCRFListByRaId(String ra_id);

	List<FeedBack> getFeedBackByRaId(String ra_id);
}
