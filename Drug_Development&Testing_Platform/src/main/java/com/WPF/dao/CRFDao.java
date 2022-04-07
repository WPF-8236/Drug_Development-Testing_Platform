package com.WPF.dao;

import com.WPF.domain.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CRFDao {
	int submitDC(DC dc);

	int submitBloodRoutine(BloodRoutine bloodRoutine);

	int submitUrineRoutine(UrineRoutine urineRoutine);

	int submitBowelRoutine(BowelRoutine bowelRoutine);

	int submitBloodChemistry(BloodChemistry bloodChemistry);

	int submitECOG(ECOG ecog);

	int submitVitalSigns(VitalSigns vitalSigns);

	int submitPhyExam(PhyExam phyExam);

	List<CRFReport> selectCRFReportByUserId(@Param("user_id") String user_id);

	List<CRFReport> selectCRFListByRaId(@Param("ra_id") String ra_id);
}
