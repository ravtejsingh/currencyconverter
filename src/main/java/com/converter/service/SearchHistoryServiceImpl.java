package com.converter.service;

import com.converter.domain.SearchHistory;
import com.converter.domain.User;
import com.converter.dao.SearchHistoryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ravtej on 5/3/17.
 */
@Service
public class SearchHistoryServiceImpl implements SearchHistoryService {

    private static final Logger LOGGER = LoggerFactory.getLogger(SearchHistoryServiceImpl.class);

    @Autowired
    private SearchHistoryRepository searchHistoryRepository;

    @Override
    public List<SearchHistory> findByUser(User user) {
        return searchHistoryRepository.findByUser(user);
    }

    @Override
    @Transactional
    public void saveSearchHistory(SearchHistory searchHistory) {
        LOGGER.info("Persisting: "+searchHistory);
        searchHistoryRepository.save(searchHistory);
    }
}
