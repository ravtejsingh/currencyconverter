package com.converter.web;

import com.converter.AuthUser;
import com.converter.SearchHistory;
import com.converter.service.SearchHistoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by ravtej on 5/3/17.
 */
@Controller
public class SearchHistoryController {

    private static final Logger LOGGER = LoggerFactory.getLogger(SearchHistoryController.class);

    @Autowired
    private SearchHistoryService searchHistoryService;

    @RequestMapping("/searchHistory")
    public String searchHistory(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            AuthUser authUser = (AuthUser) authentication.getPrincipal();
            //System.out.println(userService.findAll());
            List<SearchHistory> searchHistoryList = searchHistoryService.findByUser(authUser.getUser());
            LOGGER.info("Fetched: "+searchHistoryList);
            model.addAttribute("searchHistories", searchHistoryList);
        }
        return "history";
    }
}
