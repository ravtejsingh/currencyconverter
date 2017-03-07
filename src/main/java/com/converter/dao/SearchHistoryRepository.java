package com.converter.dao;

import com.converter.SearchHistory;
import com.converter.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by ravtej on 5/3/17.
 */
public interface SearchHistoryRepository extends JpaRepository<SearchHistory,Long> {

    List<SearchHistory> findByUser(User user);
}
