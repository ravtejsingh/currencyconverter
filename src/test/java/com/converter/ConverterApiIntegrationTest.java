package com.converter;

import com.converter.domain.ExchangeRate;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Created by ravtej on 10/3/17.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ConverterApiIntegrationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    private static final String CONVERTER_URL = "http://rate-exchange-1.appspot.com/currency?from=EUR&to=USD";

    @Test
    public void getExchangeRate() {

        ExchangeRate response = restTemplate.getForObject(CONVERTER_URL, ExchangeRate.class);
        assertThat(response != null);
        assertThat(response.getFrom().equals("EUR"));
        assertThat(response.getRate() != null);
    }
}
