package bl.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.njuTJ.MainApplication;
import org.njuTJ.blservice.user.UserBlService;
import org.njuTJ.model.ResultMessage;
import org.njuTJ.model.User.User;
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
public class UserBlServiceTest {
    User user = new User("0", "0", "0", "0", "0", "0");
    @Autowired
    private UserBlService userBlService;

    @Test
    public void register() throws Exception {
        assertEquals(ResultMessage.Success, userBlService.register(user));
    }

}