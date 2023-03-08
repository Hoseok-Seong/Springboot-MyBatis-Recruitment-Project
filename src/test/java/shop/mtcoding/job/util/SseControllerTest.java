package shop.mtcoding.job;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import shop.mtcoding.job.dto.apply.ApplyRespDto.NotifyListRespDto;
import shop.mtcoding.job.model.apply.ApplyRepository;

public class SseControllerTest {

    @Autowired
    private ApplyRepository applyRepository;

    @Test
    public void SseTest() {
        List<NotifyListRespDto> notifies = applyRepository.findNotifyByUserId(1);
        for (NotifyListRespDto notify : notifies) {
            if (notify.getNotify()) {
                System.out.println("테스트 : 서류 전형 발표");
            } else {
                System.out.println("테스트 : 없음");
            }
        }
    }

}
