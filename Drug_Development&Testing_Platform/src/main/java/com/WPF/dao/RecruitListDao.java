package com.WPF.dao;

import com.WPF.domain.RecruitList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecruitListDao {
	int insertRecruitList(RecruitList recruitList);

	List<RecruitList> selectAllRecruitListByUserID(@Param("user_id")String user_id);
}
