package org.njuTJ.util;

import org.njuTJ.entity.User.User;
import org.njuTJ.vo.user.UserVo;

public class Convertor {
    public static User toEntity(UserVo userVo) {
        return new User(userVo.getNumber(), userVo.getQq(), userVo.getPhone(), userVo.getDepartment(), userVo.getName(), userVo.getPosition(), userVo.getPassword());
    }
}
