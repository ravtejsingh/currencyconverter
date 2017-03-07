package com.converter.web;

import com.converter.ExchangeRate;
import com.converter.SearchHistory;
import com.converter.service.SearchHistoryService;
import com.converter.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * Created by ravtej on 4/3/17.
 */
@Controller
public class CurrencyController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CurrencyController.class);

    private static final String CONVERTER_URL = "http://rate-exchange-1.appspot.com/currency";

    @Autowired
    private SearchHistoryService searchHistoryService;

    @Autowired
    private UserService userService;

    @RequestMapping("/converter")
    public String converter(Model model) {
        return "converter";
    }

    @RequestMapping("/getExchangeRate")
    public String getExchangeRate(@RequestParam("currencyFrom") String currencyFrom, @RequestParam("currencyTo") String currencyTo, Model model) {
        RestTemplate restTemplate = new RestTemplate();
        ExchangeRate exchangeRate = restTemplate.getForObject(CONVERTER_URL +"?from="+currencyFrom+"&to="+currencyTo, ExchangeRate.class);
        exchangeRate.setRate(String.valueOf(BigDecimal.valueOf(Double.valueOf(exchangeRate.getRate())).setScale(3, BigDecimal.ROUND_HALF_UP)));
        model.addAttribute("exchangeRate", exchangeRate);
        //Save User Search History
        SearchHistory history = new SearchHistory();
        history.setSearchDate(LocalDateTime.now());
        history.setCurrencyFrom(exchangeRate.getFrom());
        history.setCurrencyTo(exchangeRate.getTo());
        history.setUser(userService.findUserById(1L));
        searchHistoryService.saveSearchHistory(history);
        return "converter";
    }
}
