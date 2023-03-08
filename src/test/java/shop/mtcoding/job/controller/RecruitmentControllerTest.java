package shop.mtcoding.job;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
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

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostDetailRespDto;
import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.RecruitmentPostSkillRespDto;
import shop.mtcoding.job.model.enterprise.Enterprise;

@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class RecruitmentControllerTest {

    @Autowired
    private MockMvc mvc;

    private MockHttpSession mockSession;

    @Autowired
    private ObjectMapper om;

    @BeforeEach
    public void setUp() {
        Enterprise enterprise = new Enterprise();
        enterprise.setId(1);
        enterprise.setEnterpriseName("긴트");
        enterprise.setPassword(
                "6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b_{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2");
        enterprise.setSalt("{bcrypt}$2a$10$uLIFxpUFWGOwfwSqYoLrv.kLTV.0QbaNCBcQS6DTOTrVa2eurwRu2");
        enterprise.setAddress("강남구 삼성동 75-6 수당빌딩 4층");
        enterprise.setContact("010-7763-4370");
        enterprise.setEmail("company@nate.com");
        enterprise.setSector("스타트업");
        enterprise.setSize("스타트업");
        enterprise.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));

        mockSession = new MockHttpSession();
        mockSession.setAttribute("principalEnt", enterprise);
    }

    @Test
    public void deleteRecruitment_test() throws Exception {
        // given
        int id = 1;

        // when
        ResultActions resultActions = mvc.perform(
                delete("/recruitment/" + id).session(mockSession));
        String responseBody = resultActions.andReturn().getResponse().getContentAsString();
        System.out.println("delete_test : " + responseBody);

        // then

        resultActions.andExpect(jsonPath("$.code").value(1));
        resultActions.andExpect(status().isOk());
    }

    @Test
    public void detail_test() throws Exception {
        // given
        int id = 5;

        // when
        ResultActions resultActions = mvc.perform(
                get("/recruitment/detail/" + id));
        Map<String, Object> map = resultActions.andReturn().getModelAndView().getModel();

        // 기술스택,마감기한 제외한 테스트
        RecruitmentPostDetailRespDto recruitmentPostDtos = (RecruitmentPostDetailRespDto) map
                .get("recruitmentPostDtos");
        // String recruitmentPostDetailJson =
        // om.writeValueAsString(recruitmentPostDtos);
        // System.out.println("상세보기 테스트 : " + recruitmentPostDetailJson);

        // 마감기한 테스트
        Long diffDays = (Long) map.get("dDay");
        // System.out.println("남은 일 수 : " + diffDays);

        // 기술스택 매핑 테스트
        Map<Integer, String> skillMap = (Map<Integer, String>) map.get("skillMap");

        // 기술스택 테스트
        List<RecruitmentPostSkillRespDto> recruitmentPostSkillDtos = (List<RecruitmentPostSkillRespDto>) map
                .get("recruitmentPostSkillDtos");
        // String RecruitmentPostSkillJson =
        // om.writeValueAsString(recruitmentPostSkillDtos);
        // System.out.println("기술스택 테스트 : " + RecruitmentPostSkillJson);

        // then
        resultActions.andExpect(status().isOk());
        assertThat(recruitmentPostDtos.getTitle()).isEqualTo("풀스택 임베디드 개발자");
        assertThat(recruitmentPostDtos.getCareer()).isEqualTo("무관");
        assertThat(diffDays).isEqualTo(7);
        assertThat(skillMap.get(1)).isEqualTo("Java");
        assertThat(recruitmentPostSkillDtos.get(0).getSkill()).isEqualTo(1);
        assertThat(recruitmentPostSkillDtos.get(1).getSkill()).isEqualTo(4);
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
        resultActions.andExpect(jsonPath("$..[0].title").value("프론트엔드 개발자"));
        resultActions.andExpect(jsonPath("$..[0].id").value(1));
    }
}