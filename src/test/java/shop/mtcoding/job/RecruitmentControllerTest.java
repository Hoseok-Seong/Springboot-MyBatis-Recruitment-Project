package shop.mtcoding.job;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;

public class RecruitmentControllerTest {
    @Autowired
    private MockMvc mvc;

    @Autowired
    private HttpSession mockSession;

    @Test
    public void searchBoard_test() throws Exception {
        // given
        String searchString = "1";
        MockHttpSession mockSession = new MockHttpSession();
        
        // when
        MockHttpServletRequestBuilder request = post("/recruitment/search")
            .content(searchString)
            .contentType(MediaType.TEXT_PLAIN_VALUE)
            .session(mockSession);
        ResultActions resultActions = mvc.perform(request).andDo(MockMvcResultHandlers.print());

        // then
        resultActions.andExpect(status().isOk())
                .andExpect(jsonPath("$.title").value("임시제목1"))
                .andExpect(jsonPath("$.data[0].id").value(1));
    }
}