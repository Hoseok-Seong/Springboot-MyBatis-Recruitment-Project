package shop.mtcoding.job;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.job.model.user.User;

/*
 * SpringBootTest는 통합테스트 (실제 환경과 동일하게 Bean이 생성됨)
 * AutoConfigureMockMvc는 Mock 환경의 IoC컨테이너에 MockMvc Bean이 생성됨
 */
@Transactional // 메서드 실행 직후 롤백! // auto_increment 초기화 안 됨.
@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class LoginControllerTest {
    @Autowired
    private MockMvc mvc;

    @Autowired
    private HttpSession session;

    String requestBody = "username=ssar&password=6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2=ssar@nate.com";

    @Test
    public void testNotNullOrEmptyString() {
        assertNotNull(requestBody);
        assertFalse(requestBody.isEmpty());
    }

    @Test
    public void login_test() throws Exception {
        // given
        String requestBody2 = "username=ssar&password=6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2&email=ssar@nate.com";
        String requestBody = "username=ssar&password=1234";
        String salt = "{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2";
        assertNotNull(requestBody);
        assertFalse(requestBody.isEmpty());

        // when
        ResultActions resultActions = mvc.perform(post("/user/login").content(requestBody2)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
        HttpSession session = resultActions.andReturn().getRequest().getSession();
        User principal = (User) session.getAttribute("principal");
        System.out.println("테스트 : " + principal.getUsername());

        // then
        assertThat(principal.getUsername()).isEqualTo("ssar");
        resultActions.andExpect(status().is3xxRedirection());
    }
}
