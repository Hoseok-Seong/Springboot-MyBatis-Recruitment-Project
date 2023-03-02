package shop.mtcoding.job;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostSkillRespDto;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class RecruitmentControllerTest {

    @Autowired
    private MockMvc mvc;
    private MockHttpSession mockSession;

    @Autowired
    private ObjectMapper om;

    // @BeforeEach
    // public void setUp() {
    // PostRespDto postRespDto = new PostRespDto();
    // postRespDto.setId(1);
    // postRespDto.setTitle("임시제목1");
    // postRespDto.setEnterpriseName("ssar");
    // postRespDto.setEnterpriseLogo("null");
    // postRespDto.setSearchString("1");
    // postRespDto.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));
    // mockSession = new MockHttpSession();
    // mockSession.setAttribute("principal", postRespDto);
    // }

    @Test
    public void detail_skill_test() throws Exception {
        // given
        int id = 1;

        // when
        ResultActions resultActions = mvc.perform(
                get("/recruitment/detail/" + id));
        Map<String, Object> map = resultActions.andReturn().getModelAndView().getModel();
        List<RecruitmentPostSkillRespDto> dtos = (List<RecruitmentPostSkillRespDto>) map
                .get("recruitmentPostSkillDtos");
        String model = om.writeValueAsString(dtos);
        System.out.println("detail_test : " + model);

        // then
    }

    @Test
    public void searchBoard_test() throws Exception {
        // given
        String searchString = "1";

        // when
        ResultActions resultActions = mvc.perform(post("/recruitment/search")
                .content("{\"searchString\": \"" + searchString + "\"}")
                .contentType(MediaType.APPLICATION_JSON_VALUE)
                .session(mockSession));

        // then
        resultActions.andExpect(jsonPath("$..[0].title").value("임시제목1"));
        resultActions.andExpect(jsonPath("$..[0].id").value(1));
    }
}