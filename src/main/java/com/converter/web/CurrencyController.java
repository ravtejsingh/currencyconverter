package com.converter.web;

import com.converter.domain.ExchangeRate;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Optional;

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

    @RequestMapping("/getConverter")
    public String converter(Model model) {
        return "converter";
    }

    @RequestMapping("/getExchangeRate")
    public String getExchangeRate(@RequestParam("currencyFrom") String currencyFrom, @RequestParam("currencyTo") String currencyTo,
                                  @RequestParam("amount") String amount, Model model, Principal principal) {
        RestTemplate restTemplate = new RestTemplate();
        ExchangeRate exchangeRate = restTemplate.getForObject(CONVERTER_URL +"?from="+currencyFrom+"&to="+currencyTo+"&q="+amount, ExchangeRate.class);
        exchangeRate.setRate(String.valueOf(BigDecimal.valueOf(Double.valueOf(exchangeRate.getRate())).setScale(3, BigDecimal.ROUND_HALF_UP)));
        exchangeRate.setV(String.valueOf(BigDecimal.valueOf(Double.valueOf(exchangeRate.getV())).setScale(3, BigDecimal.ROUND_HALF_UP)));
        model.addAttribute("exchangeRate", exchangeRate);
        LOGGER.info("Fetched Exchange Rate: "+exchangeRate);

        String emailId = principal.getName();
        Optional<User> user = userService.findUserByEmailId(emailId);
        //Save User Search History
        SearchHistory history = new SearchHistory();
        history.setSearchDate(LocalDateTime.now());
        history.setCurrencyFrom(exchangeRate.getFrom());
        history.setCurrencyTo(exchangeRate.getTo());
        history.setUser(user.get());
        searchHistoryService.saveSearchHistory(history);
        return "converter";
    }
}
