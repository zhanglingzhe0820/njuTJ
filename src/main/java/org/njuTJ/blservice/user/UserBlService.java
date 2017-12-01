package org.njuTJ.blservice.user;

import org.njuTJ.model.ResultMessage;
import org.njuTJ.model.User.User;
import org.springframework.stereotype.Service;

@Service
public interface UserBlService {
    /**
     * resgister user
     * @param user the user info to be register
     * @return whether the operation is success or not
     */
    public ResultMessage register(User user);
}
