package com.teamcommit.kickoff.Common;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketBrokerConfig implements WebSocketMessageBrokerConfigurer {
	private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketBrokerConfig.class);
	
	@Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        
        //for subscribe prefix(1:N일땐 "/topic", 특정 대상만 보낼 땐 "/queue"를 사용하는데, 여기선 왜 user인지 나중에 분석해보기)
		// queue 쓰는게 맞는거 같은데.. 뭘까 이건..
        registry.enableSimpleBroker("/user");
        //for publish prefix
        registry.setApplicationDestinationPrefixes("/app");
    }
 
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        
        registry.addEndpoint("/broadcast")
            .withSockJS()
            .setHeartbeatTime(60_000);
    }
}
