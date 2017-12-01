package org.njuTJ.bl.user;

import org.njuTJ.blservice.user.UserBlService;
import org.njuTJ.dataservice.user.UserDataService;
import org.njuTJ.model.ResultMessage;
import org.njuTJ.model.User.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBlServiceImpl implements UserBlService {

    @Autowired
    private UserDataService userDataService;

    /**
     * resgister user
     *
     * @param user the user info to be register
     * @return whether the operation is success or not
     */
    @Override
    public ResultMessage register(User user) {
        if(userDataService.isUserExisted(user.getNumber())){
            return ResultMessage.DataError;
        }else{
            return userDataService.insertUser(user);
        }
    }
}
