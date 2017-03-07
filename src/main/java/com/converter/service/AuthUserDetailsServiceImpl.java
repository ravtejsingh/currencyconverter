package com.converter.service;

import com.converter.AuthUser;
import com.converter.User;
import com.converter.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created by ravtej on 6/3/17.
 */
@Service("userDetailsService")
public class AuthUserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String emailId) throws UsernameNotFoundException {
        User user = userRepository.findOneByEmailId(emailId)
                        .orElseThrow(() -> new UsernameNotFoundException(String.format("User with email=%s was not found", emailId)));
        AuthUser authUser = new AuthUser();
        authUser.setUser(user);
        return authUser;
    }


}
