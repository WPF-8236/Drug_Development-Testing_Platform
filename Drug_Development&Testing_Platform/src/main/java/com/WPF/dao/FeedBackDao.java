package com.WPF.dao;

import com.WPF.domain.FeedBack;

import java.util.List;

public interface FeedBackDao {
	int insertFeedBack(FeedBack feedBack);

	List<FeedBack> getFeedBackByRaId(String ra_id);
}
