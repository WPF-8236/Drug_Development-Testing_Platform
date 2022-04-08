package com.WPF.dao;

import com.WPF.domain.Progress;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProgressDao {
	int insertProgress(Progress progress);

	List<Progress> selectProgressListByDId(@Param("dp_d_id") String dp_d_id);

	int deleteProgressByDpId(@Param("dp_id") String dp_id);

	int changeProgress(Progress progress);
}
