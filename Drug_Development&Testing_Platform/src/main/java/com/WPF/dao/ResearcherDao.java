package com.WPF.dao;

import com.WPF.domain.Researcher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResearcherDao {
	int insertResearcher(Researcher researcher);

	List<Researcher> selectResearcher();

	int updateResearcher(Researcher researcher);

	int deleteResearcher(String ra_id);

	Researcher selectAResearcher(@Param("ra_id") String ra_id);
}
