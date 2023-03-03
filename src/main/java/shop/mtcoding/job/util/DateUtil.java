package shop.mtcoding.job.util;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class DateUtil {
    public static String format(Timestamp stamp) {
        LocalDateTime nowTime = stamp.toLocalDateTime();
        String nowStr = nowTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        return nowStr;
    }

    public static long deadline(String recruitmentPostDeadLine) {
        LocalDate deadline = LocalDate.parse(recruitmentPostDeadLine,
                DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        LocalDate today = LocalDate.now();
        long diffDays = ChronoUnit.DAYS.between(today, deadline);
        return diffDays;
    }
}