package com.converter.web;

import com.converter.domain.SearchHistory;
import com.converter.domain.User;
import com.converter.service.SearchHistoryService;
import com.converter.service.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

/**
 * Created by ravtej on 5/3/17.
 */
@Controller
public class SearchHistoryController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SearchHistoryController.class);

    @Autowired
    private SearchHistoryService searchHistoryService;
    
    @Autowired
    private UserService userService;

    @RequestMapping("/searchHistory")
	public String searchHistory(Model model, Principal principal) {
		String emailId = principal.getName();
    	Optional<User> user = userService.findUserByEmailId(emailId);
    	if(user.isPresent()) {
    		List<SearchHistory> searchHistoryList = searchHistoryService.findByUser(user.get());
    		LOGGER.info("Fetched: " + searchHistoryList);
    		model.addAttribute("searchHistories", searchHistoryList);
    		model.addAttribute("userName", user.get().getFirstName()+" "+user.get().getLastName());
    	}		
		return "history";
	}
}
