package org.njuTJ.bl.user;

import org.njuTJ.blservice.user.UserBlService;
import org.njuTJ.dataservice.user.UserDataService;
import org.njuTJ.util.Convertor;
import org.njuTJ.vo.ResultMessage;
import org.njuTJ.entity.User.User;
import org.njuTJ.vo.user.LoginVo;
import org.njuTJ.vo.user.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBlServiceImpl implements UserBlService {

    @Autowired
    private UserDataService userDataService;

    /**
     * resgister user
     *
     * @param userVo the user info to be register
     * @return whether the operation is success or not
     */
    @Override
    public ResultMessage register(UserVo userVo) {
        if (userDataService.isUserExisted(userVo.getNumber())) {
            return ResultMessage.DataError;
        } else {
            return userDataService.insertUser(Convertor.toEntity(userVo));
        }
    }

    /**
     * log in
     *
     * @param loginVo student number and password
     * @return whether the operation is success or not
     */
    @Override
    public ResultMessage login(LoginVo loginVo) {
        User user = userDataService.getUserByNumber(loginVo.getNumber());
        if (user == null) {
            return ResultMessage.DataError;
        } else {
            if (user.getPassword().equals(loginVo.getPassword())) {
                return ResultMessage.Success;
            } else {
                return ResultMessage.DataError;
            }
        }
    }

    /**
     * drop the infomation of a user
     *
     * @param number student number
     * @return whether the operation is success or not
     */
    @Override
    public ResultMessage drop(String number) {
        if (!userDataService.isUserExisted(number)) {
            return ResultMessage.DataError;
        } else {
            return userDataService.deleteUser(number);
        }
    }
}
