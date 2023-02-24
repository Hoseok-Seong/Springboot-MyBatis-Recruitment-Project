package shop.mtcoding.job;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;
import java.util.Map;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.job.model.resume.Resume;

@Transactional // 메서드 실행 직후에 롤백!
@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class ResumeControllerTest {
    
    @Autowired
    private MockMvc mvc;
    @Autowired
    private ObjectMapper om;
    
    @Test
    public void resumeList_test() throws Exception {
        // given
        // when
        ResultActions resultActions = mvc.perform(
                get("/resumeListForm"));
        Map<String, Object> map = resultActions.andReturn().getModelAndView().getModel();
        List<Resume> resumeList = (List<Resume>) map.get("resumeList");
        System.out.println("테스트 : size : " + resumeList.size());
        String model = om.writeValueAsString(resumeList);
        System.out.println("테스트 : size : " + model);


        // then
        resultActions.andExpectAll(status().isOk());
        Assertions.assertThat(status().isOk());
        assertThat(resumeList.size()).isEqualTo(6);
        assertThat(resumeList.get(0).getUserId()).isEqualTo(1);
        assertThat(resumeList.get(0).getTitle()).isEqualTo("제목1");

    }
}
