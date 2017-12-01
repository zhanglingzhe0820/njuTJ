package org.njuTJ.blservice.user;

import org.njuTJ.vo.ResultMessage;
import org.njuTJ.vo.user.LoginVo;
import org.njuTJ.vo.user.UserVo;
import org.springframework.stereotype.Service;

@Service
public interface UserBlService {
    /**
     * resgister user
     * @param userVo the user info to be register
     * @return whether the operation is success or not
     */
    ResultMessage register(UserVo userVo);

    /**
     * log in
     * @param loginVo student number and password
     * @return whether the operation is success or not
     */
    ResultMessage login(LoginVo loginVo);

    /**
     * drop the infomation of a user
     * @param number student number
     * @return whether the operation is success or not
     */
    ResultMessage drop(String number);
}
