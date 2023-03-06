package shop.mtcoding.job.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SseController {

    @RequestMapping("/notify")
    public void notify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sessionId = request.getParameter("Id");
        if (sessionId != null) {
            response.setContentType("text/event-stream");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            while (true) {
                // TODO: 알림 내용을 생성하여 response.getWriter().println()으로 보내기
                response.getWriter().println("data: SSE notification\n\n");
                response.flushBuffer();
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                    break;
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Session ID not found");
        }
    }
}
