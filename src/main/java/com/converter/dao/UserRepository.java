package com.converter.dao;

import com.converter.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * Created by ravtej on 5/3/17.
 */
public interface UserRepository extends JpaRepository<User,Long> {

    Optional<User> findOneByEmailId(String emailId);
}
