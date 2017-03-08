package com.converter.dao;

import com.converter.domain.SearchHistory;
import com.converter.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by ravtej on 5/3/17.
 */
public interface SearchHistoryRepository extends JpaRepository<SearchHistory,Long> {

    List<SearchHistory> findByUser(User user);
}
