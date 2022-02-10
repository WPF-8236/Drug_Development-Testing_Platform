package com.WPF.dao;

import com.WPF.domain.UserGrade;
import org.apache.ibatis.annotations.Param;

public interface UserGradeDao {
	UserGrade selectUserGrade(@Param("id") String id, @Param("password") String password);

	int insertUserGrade(UserGrade userGrade);
}
