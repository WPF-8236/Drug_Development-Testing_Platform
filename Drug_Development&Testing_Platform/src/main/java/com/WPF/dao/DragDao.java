package com.WPF.dao;

import com.WPF.domain.Drag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DragDao {
	List<Drag> selectDragByTradeName(@Param("d_trade_name") String d_trade_name);

	List<Drag> selectDragByGenericName(@Param("d_generic_name") String d_generic_name);

	List<Drag> selectDragByApprovalNumber(@Param("d_approval_number") String d_approval_number);

	List<Drag> selectDragByUserId(@Param("user_id") String user_id);

	int insertADrag(Drag drag);

	List<Drag> selectDragByDEID(@Param("d_e_id") String d_e_id);

	List<Drag> selectDragWithApprove(@Param("d_e_id") String d_e_id);

	List<Drag> selectAllDrags();

	int updateDragDApprove(@Param("d_id") String d_id, @Param("trg") int trg);

	List<Drag> selectDragByApprove();
}
