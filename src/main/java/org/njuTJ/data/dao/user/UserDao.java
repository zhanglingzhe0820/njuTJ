package org.njuTJ.data.dao.user;

import org.njuTJ.entity.User.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User, String> {
}
