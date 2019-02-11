package stripe.api.playground.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * User: chenma
 * Date: 2019-01-03
 */

@Configuration
@EnableWebSocket
public class MyWebConfig implements WebSocketConfigurer {



    @Bean
    public WebSocketHandler myHandler() {
        return new MyHandler();
    }


    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(new MyHandler(), "/myHandler")
                .setAllowedOrigins("*");
    }
}
