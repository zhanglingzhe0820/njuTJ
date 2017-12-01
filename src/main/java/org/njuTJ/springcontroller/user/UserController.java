package org.njuTJ.springcontroller.user;

import org.njuTJ.blservice.user.UserBlService;
import org.njuTJ.model.ResultMessage;
import org.njuTJ.model.User.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @Autowired
    private UserBlService userBlService;


    @RequestMapping("/register")
    @ResponseBody
    public ResultMessage register(@RequestBody User user) {
        return userBlService.register(user);
    }
}
