package org.njuTJ;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@SpringBootApplication
public class MainApplication {

    @RequestMapping("/")

    @ResponseBody
    String home(){
        return "hello world";
    }

    public static void main(String[] args) {
        SpringApplication.run(MainApplication.class, args);
    }
}
