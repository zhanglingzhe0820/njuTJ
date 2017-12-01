package org.njuTJ.springcontroller.user;

import org.njuTJ.blservice.user.UserBlService;
import org.njuTJ.vo.ResultMessage;
import org.njuTJ.entity.User.User;
import org.njuTJ.vo.user.UserVo;
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
    public ResultMessage register(@RequestBody UserVo userVo) {
        return userBlService.register(userVo);
    }
}
