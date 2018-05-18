package cn.jeeweb.modules.task.task;

import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.utils.DateUtils;
import cn.jeeweb.core.utils.SpringContextHolder;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.oa.entity.OaNotification;
import cn.jeeweb.modules.oa.service.IOaNotificationService;
import cn.jeeweb.modules.sys.entity.*;
import cn.jeeweb.modules.sys.service.*;
import com.baomidou.mybatisplus.mapper.Wrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 每周日晚上22点执行
 * 0 30 22 ? * L
 *
 */
@Slf4j
@Component(value = "courseTask")
public class CourseTask {

    private ICourseRecordService courseRecordService = SpringContextHolder.getBean(ICourseRecordService.class);

    public void run() {
        courseRecordService.generateCourseRecordForNextWholeWeek();
    }
}
