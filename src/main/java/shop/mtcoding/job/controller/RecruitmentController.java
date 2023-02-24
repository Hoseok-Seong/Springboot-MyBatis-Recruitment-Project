package shop.mtcoding.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import shop.mtcoding.job.model.recruitmentPost.RecruitmentPostRepository;

@Controller
public class RecruitmentController {

    @Autowired
    private RecruitmentPostRepository recruitmentPostRepository;

    @GetMapping("recruitment/detail/{id}")
    public String recruitmentPostDetail(@PathVariable int id, Model model) {
        model.addAttribute("recruitmentPostDtos", recruitmentPostRepository.findByIdWithEnterpriseId(id));
        return "recruitment/detail";
    }

    @GetMapping("recruitment/RecruitmentInformation")
    public String recruitmentinformaiton() {
        return "recruitment/recruitmentinformaiton";
    }
}