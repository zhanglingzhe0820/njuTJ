package bl.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.njuTJ.MainApplication;
import org.njuTJ.blservice.user.UserBlService;
import org.njuTJ.vo.ResultMessage;
import org.njuTJ.entity.User.User;
import org.njuTJ.vo.user.LoginVo;
import org.njuTJ.vo.user.UserVo;
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
    UserVo userVo = new UserVo("0", "0", "0", "0", "0", "0", "0");
    LoginVo loginVo = new LoginVo("0", "0");
    @Autowired
    private UserBlService userBlService;

    @Test
    public void register() throws Exception {
        assertEquals(ResultMessage.Success, userBlService.register(userVo));
        userBlService.drop(userVo.getNumber());
    }

    @Test
    public void drop() throws Exception{
        userBlService.register(userVo);
        assertEquals(ResultMessage.Success,userBlService.drop(userVo.getNumber()));
    }

    @Test
    public void login() throws Exception {
        userBlService.register(userVo);
        assertEquals(ResultMessage.Success, userBlService.login(loginVo));
        userBlService.drop(userVo.getNumber());
    }

}