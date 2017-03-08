package com.converter.service;

import com.converter.domain.User;

import java.util.List;
import java.util.Optional;

/**
 * Created by ravtej on 5/3/17.
 */
public interface UserService {

    public void saveUser(User user);

    public User findUserById(Long id);

    public Optional<User> findUserByEmailId(String emailId);

    public List<User> findAll();
}
