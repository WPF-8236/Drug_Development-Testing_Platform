package com.WPF.dao;

import com.WPF.domain.PhysicalExam;
import org.apache.ibatis.annotations.Param;

public interface PhysicalExamDao {
	int insertPhysicalExam(PhysicalExam physicalExam);

	PhysicalExam selectPhysicalExamByPeRlID(@Param("pe_rl_id") String pe_rl_id);
}
