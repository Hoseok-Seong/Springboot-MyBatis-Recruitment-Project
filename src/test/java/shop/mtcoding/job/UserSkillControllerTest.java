package shop.mtcoding.job;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;

public class UserSkillControllerTest {

    @Autowired
    private MockMvc mvc;

    @Autowired
    private HttpSession session;

    @Test
    public void user_skill_test() throws Exception {

        // given
        String requestBody = "userId=1&skill=3&userId=1&skill=4&userId=1&skill=2";
        // when

        assertNotNull(requestBody);
        assertFalse(requestBody.isEmpty());
        System.out.println("테스트: " + requestBody);

        ResultActions resultActions = mvc.perform(post("/join").content(requestBody)
                .contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
        // then
        resultActions.andExpect(status().is3xxRedirection());
    }
}
