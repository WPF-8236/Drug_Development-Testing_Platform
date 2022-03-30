package com.WPF.service.impl;

import com.WPF.dao.DragDao;
import com.WPF.domain.Drag;
import com.WPF.service.DragService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DragServiceImpl implements DragService {
	@Resource
	private DragDao dragDao;

	@Override
	public List<Drag> getDragList() {
		return dragDao.selectAllDrags();
	}

	@Override
	public int changeDragDApprove(String d_id, int trg) {
		return dragDao.updateDragDApprove(d_id, trg);
	}
}
