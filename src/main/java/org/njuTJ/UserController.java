package org.njuTJ;

import org.njuTJ.model.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @RequestMapping("/user")
    public User getUser(@RequestParam(value = "number", defaultValue = "000000000") String number) {
        return new User(0, "123", "123", number, "活动部", "小明", "部员");
    }
}
