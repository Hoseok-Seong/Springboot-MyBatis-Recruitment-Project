package shop.mtcoding.job.repositoryTest;
import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.job.dto.recruitmentPost.RecruitmentPostRespDto.PostRespDto;
import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;

@MybatisTest
public class RecruitmentPostRepositoryTest {

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @Test
    public void findByTitleOrContent_test() throws Exception {
        // given
        ObjectMapper om = new ObjectMapper();
        String searchString = "4";

        // when
        List<PostRespDto> postListRespDtos = recruitmentPostRepository.findByTitleOrContent(searchString);
        System.out.println("테스트 : size() : " + postListRespDtos.size());
        String responseBody = om.writeValueAsString(postListRespDtos);
        System.out.println("테스트 : " + responseBody);
        // verify
        assertThat(postListRespDtos.get(0).getTitle()).isEqualTo("임시제목1");
    } 
}
