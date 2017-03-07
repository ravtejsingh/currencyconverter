package com.converter.web;

import com.converter.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Optional;

/**
 * Created by ravtej on 4/3/17.
 */
@Controller
public class LoginController {

    @RequestMapping("/")
    public String home() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam Optional<String> error) {
        return new ModelAndView("login", "error", error);
    }

    @RequestMapping(value = "/checkLogin", method= RequestMethod.POST)
    public String checkLogin(@ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()) {
            return "login";
        }
        return "forward:searchHistory";
    }
}
