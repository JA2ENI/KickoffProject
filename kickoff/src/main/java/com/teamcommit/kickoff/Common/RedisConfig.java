package com.teamcommit.kickoff.Common;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RedisConfig {

    @Value("${spring.redis.host}")
    private String host;

    @Value("${spring.redis.port}")
    private int port;
    
	@Bean
    public RedisConnectionFactory redisConnectionFactory() {
        return new LettuceConnectionFactory(host, port);
    }
	
	/*
	 * @Bean public RestTemplate getCustomRestTemplate() {
	 * HttpComponentsClientHttpRequestFactory httpRequestFactory = new
	 * HttpComponentsClientHttpRequestFactory();
	 * httpRequestFactory.setConnectTimeout(2000);
	 * httpRequestFactory.setReadTimeout(3000); CloseableHttpClient httpClient =
	 * HttpClientBuilder.create() .setMaxConnTotal(200) .setMaxConnPerRoute(20)
	 * .build(); httpRequestFactory.setHttpClient(httpClient); return new
	 * RestTemplate(httpRequestFactory); }
	 */
}
