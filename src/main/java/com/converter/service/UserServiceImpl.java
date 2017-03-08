package com.converter.service;

import com.converter.domain.Role;
import com.converter.domain.User;
import com.converter.dao.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * Created by ravtej on 5/3/17.
 */
@Service
public class UserServiceImpl implements UserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    public void saveUser(User user) {
        user.setPassword(user.getPassword());
        user.setRole(Role.USER);
        LOGGER.info("Persisting: "+user);
        userRepository.save(user);
    }

    @Override
    public User findUserById(Long id) {
        return userRepository.findOne(id);
    }

    @Override
    public Optional<User> findUserByEmailId(String emailId) {
        return userRepository.findOneByEmailId(emailId);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }
}
