package com.converter.web;

import com.converter.domain.AuthUser;
import com.converter.domain.Role;
import com.converter.domain.User;
import com.converter.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RegistrationController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RegistrationController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private UserDetailsService userDetailsService;

    @RequestMapping("/register")
    public String register(Model model) {
        return "register";
    }

    @RequestMapping(value = "/registerUser", method= RequestMethod.POST)
    public String registerUser(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            return "register";
        }
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        user.setRole(Role.USER);
        userService.saveUser(user);
        autoLogin(user, request);
        return "redirect:/getConverter";
    }

    private void autoLogin(User user, HttpServletRequest request) {
        request.getSession();
        AuthUser authUser = (AuthUser) userDetailsService.loadUserByUsername(user.getEmailId());
        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(authUser, authUser.getPassword(), authUser.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authToken);
    }
}
