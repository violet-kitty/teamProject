//package edu.howf.controller;
//
//import java.util.List;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.messaging.converter.MessageConverter;
//import org.springframework.messaging.handler.invocation.HandlerMethodArgumentResolver;
//import org.springframework.messaging.handler.invocation.HandlerMethodReturnValueHandler;
//import org.springframework.messaging.simp.config.ChannelRegistration;
//import org.springframework.messaging.simp.config.MessageBrokerRegistry;
//import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
//import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
//import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
//import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;
//
//@Configuration
//@EnableWebSocketMessageBroker
//public class WebsocketBrokerConfig implements WebSocketMessageBrokerConfigurer {
//	
//	private static final Logger LOGGER = LoggerFactory.getLogger(WebsocketBrokerConfig.class);
//	
//	@Override
//    public void configureMessageBroker(MessageBrokerRegistry registry) {
//        
//        //for subscribe prefix
//        registry.enableSimpleBroker("/user");
//        //for publish prefix
//        registry.setApplicationDestinationPrefixes("/app");
//    }
// 
//    @Override
//    public void registerStompEndpoints(StompEndpointRegistry registry) {
//        
//        registry.addEndpoint("/broadcast")
//            .withSockJS()
//            .setHeartbeatTime(60_000);
//    }
//
//
//	
//    
//}
