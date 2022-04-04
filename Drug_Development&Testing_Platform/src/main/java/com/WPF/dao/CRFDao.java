package com.WPF.dao;

import com.WPF.domain.*;

public interface CRFDao {
	int submitDC(DC dc);

	int submitBloodRoutine(BloodRoutine bloodRoutine);

	int submitUrineRoutine(UrineRoutine urineRoutine);

	int submitBowelRoutine(BowelRoutine bowelRoutine);

	int submitBloodChemistry(BloodChemistry bloodChemistry);

	int submitECOG(ECOG ecog);

	int submitVitalSigns(VitalSigns vitalSigns);

	int submitPhyExam(PhyExam phyExam);
}
