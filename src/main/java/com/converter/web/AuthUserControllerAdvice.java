package com.converter.web;

import com.converter.AuthUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * Created by ravtej on 7/3/17.
 */
@ControllerAdvice
public class AuthUserControllerAdvice {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthUserControllerAdvice.class);

    @ModelAttribute("authUser")
    public AuthUser getAuthUser(Authentication authentication) {
        return (authentication == null) ? null : (AuthUser) authentication.getPrincipal();
    }
}
