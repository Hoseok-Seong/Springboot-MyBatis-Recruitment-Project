package shop.mtcoding.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class RecruitmentController {

    @GetMapping("recruitment/detail/{id}")
    public String recruitmentDetail(@PathVariable int id) {
        return "recruitment/detail";
    }
}