package com.converter;

import com.converter.dao.UserRepository;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Created by ravtej on 10/3/17.
 */
public class RepositoryTest {

    private UserRepository userRepository;

    @Before
    public void setUp() {
        userRepository = Mockito.mock(UserRepository.class);
    }

    @Test
    public void testExample() throws Exception {
        assertThat(userRepository.findAll() != null);
    }
}
