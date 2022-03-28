package com.WPF.service;

import com.WPF.domain.PhysicalExam;
import com.WPF.domain.Researcher;

public interface ResearcherService {
	Researcher getResearcher(String ra_id);

	int addPhyExam(PhysicalExam physicalExam);
}
