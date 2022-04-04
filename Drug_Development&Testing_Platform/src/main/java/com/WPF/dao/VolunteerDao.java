package com.WPF.dao;

import com.WPF.domain.URa;
import com.WPF.domain.Volunteer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VolunteerDao {
	List<Volunteer> selectVolunteerByEid(@Param("e_id") String e_id);

	List<Volunteer> selectVolunteerByRaId(@Param("v_ra_id") String v_ra_id);

	int deleteVolunteer(URa uRa);
}
