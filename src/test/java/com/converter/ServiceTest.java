package com.converter;

import com.converter.dao.UserRepository;
import com.converter.service.UserService;
import com.converter.service.UserServiceImpl;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Created by ravtej on 10/3/17.
 */
public class ServiceTest {

    private UserService userService;

    private UserRepository userRepository;

    @Before
    public void setUp() {
        userRepository = Mockito.mock(UserRepository.class);
        userService = new UserServiceImpl();
    }

    @Test
    public void saveSuccessfuly() throws Exception {
        assertThat(userRepository.findAll() != null);
    }
}
