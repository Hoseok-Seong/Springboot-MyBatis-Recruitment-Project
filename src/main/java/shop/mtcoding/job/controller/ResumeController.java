package shop.mtcoding.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ResumeController {
    @GetMapping("/resumeForm")
    public String resumeForm() {
        return "resume/resumeForm";
    }
}
