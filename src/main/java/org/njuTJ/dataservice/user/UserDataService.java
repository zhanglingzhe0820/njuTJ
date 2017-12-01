package org.njuTJ.dataservice.user;

import org.njuTJ.model.ResultMessage;
import org.njuTJ.model.User.User;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public interface UserDataService {
    /**
     * judge whether the user exists
     *
     * @param number student number
     * @return exists or not
     */
    @Transactional
    boolean isUserExisted(String number);

    /**
     * get user by number
     *
     * @param number student number
     * @return the user who has the number
     */
    @Transactional
    User getUserByNumber(String number);

    /**
     * insert the user class
     *
     * @param user the input user
     * @return whether the operation is success or not
     */
    @Transactional
    ResultMessage insertUser(User user);
}
