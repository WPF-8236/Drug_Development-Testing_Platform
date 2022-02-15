package com.WPF.dao;

import com.WPF.domain.UserGrade;
import org.apache.ibatis.annotations.Param;

public interface UserGradeDao {
	UserGrade selectUserGrade(@Param("id") String id, @Param("password") String password);

	int insertUserGrade(UserGrade userGrade);

	int updatePassword(UserGrade userGrade);

	int updateModifyBasicInformation(@Param("userGrade") UserGrade userGrade, @Param("old_user_id") String old_user_id);

	int updateModifyDetailedInformation(UserGrade userGrade);

}
