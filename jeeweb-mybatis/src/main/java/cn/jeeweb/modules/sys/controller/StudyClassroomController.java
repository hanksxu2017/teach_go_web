package cn.jeeweb.modules.sys.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.sys.entity.School;
import cn.jeeweb.modules.sys.entity.StudyClassroom;
import cn.jeeweb.modules.sys.entity.StudySchool;
import cn.jeeweb.modules.sys.service.ISchoolService;
import cn.jeeweb.modules.sys.service.IStudyClassroomService;
import cn.jeeweb.modules.sys.service.IStudySchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("${admin.url.prefix}/sys/school/classroom")
@RequiresPathPermission("sys:user")
public class StudyClassroomController extends BaseCRUDController<StudyClassroom, String> {
	@Autowired
	private IStudyClassroomService studyClassroomService;

	@Autowired
	private IStudySchoolService studySchoolService;

	@Override
	public void preList(Model model, HttpServletRequest request, HttpServletResponse response) {
		String studyPlace = request.getParameter("studyPlace");
		StudySchool studySchool = studySchoolService.selectById(studyPlace);
		model.addAttribute("studySchool", studySchool);
	}

	@Override
	public void preAjaxList(Queryable queryable, EntityWrapper<StudyClassroom> entityWrapper, HttpServletRequest request,
							HttpServletResponse response) {
		String studyPlace = request.getParameter("studyPlace");
		if(StringUtils.isNotBlank(studyPlace)) {
			queryable.addCondition("study_place", studyPlace);
		}
	}

	@Override
	public void preEdit(StudyClassroom entity, Model model, HttpServletRequest request, HttpServletResponse response) {
		String studyPlace = request.getParameter("studyPlace");
		model.addAttribute("study_place", studyPlace);
	}
}
