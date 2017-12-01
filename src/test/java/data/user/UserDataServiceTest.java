package data.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.njuTJ.MainApplication;
import org.njuTJ.dataservice.user.UserDataService;
import org.njuTJ.vo.ResultMessage;
import org.njuTJ.entity.User.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = MainApplication.class)
@EnableTransactionManagement
@WebAppConfiguration
public class UserDataServiceTest {
    User user = new User("0", "0", "0", "0", "0", "0", "0");
    @Autowired
    private UserDataService userDataService;

    @Test
    public void getUserByNumber() throws Exception {
        assertEquals(null, userDataService.getUserByNumber("0123"));
    }

    @Test
    public void insertUser() throws Exception {
        assertEquals(ResultMessage.Success, userDataService.insertUser(user));
    }

}