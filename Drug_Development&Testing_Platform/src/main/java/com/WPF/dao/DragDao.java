package com.WPF.dao;

import com.WPF.domain.Drag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DragDao {
	List<Drag> selectDragByTradeName(@Param("d_trade_name") String d_trade_name);

	List<Drag> selectDragByGenericName(@Param("d_generic_name") String d_generic_name);

	List<Drag> selectDragByApprovalNumber(@Param("d_approval_number") String d_approval_number);
}
