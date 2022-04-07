package com.WPF.service;

import com.WPF.domain.Drag;

import java.util.List;

public interface DragService {
	List<Drag> getDragList();

	int changeDragDApprove(String d_id, int trg);

	List<Drag> getDragListByUserId(String user_id);
}
