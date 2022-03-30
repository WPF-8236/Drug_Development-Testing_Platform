package com.WPF.dao;

import com.WPF.domain.Recruit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecruitDao {
	List<Recruit> selectAllRecruits();

	List<Recruit> selectRecruitsByREId(@Param("r_e_id") String r_e_id);

	int insertRecruit(Recruit recruit);

	int updateARrecruit(Recruit recruit);

	int deleteRrecruit(@Param("r_id") String r_id);
}
