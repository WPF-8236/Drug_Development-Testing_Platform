package com.WPF.dao;

import com.WPF.domain.RecruitList;
import org.apache.ibatis.annotations.Param;

import javax.annotation.Resource;
import java.util.List;

public interface RecruitListDao {
	int insertRecruitList(RecruitList recruitList);

	List<RecruitList> selectAllRecruitListByUserID(@Param("user_id") String user_id);

	List<RecruitList> selectAllRecruitListWithispe1();

	List<RecruitList> selectAllRecruitListWithispe2(@Param("e_id") String e_id);

	int updateRecruitListisv(@Param("rl_id") String rl_id, @Param("trg") int trg);

	int updateRecruitListispe(@Param("rl_id") String rl_id);

}
