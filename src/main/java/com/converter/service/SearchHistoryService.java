package com.converter.service;

import com.converter.SearchHistory;
import com.converter.User;

import java.util.List;

/**
 * Created by ravtej on 5/3/17.
 */
public interface SearchHistoryService {

    public List<SearchHistory> findByUser(User user);

    public void saveSearchHistory(SearchHistory searchHistory);
}
