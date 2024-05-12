package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.LessonUnitBean;
import spring.model.QuizOption;
import spring.model.UniWorkBean;
import spring.repository.UnitRepository;

@Controller
@RequestMapping(value = "/unit")
public class UnitController {

	@Autowired
	UnitRepository unitrepo;

	@GetMapping(value = "/showunit")
	public String unit(Model m) {
		int lessonId = 1;
		ArrayList<LessonUnitBean> lstLessonUnit = (ArrayList<LessonUnitBean>) unitrepo.selectLessonUnit(lessonId);

		m.addAttribute("lstLessonUnit", lstLessonUnit);
		return "unit";
	}

	@GetMapping(value = "unitdetail/{unitId}")
	public String showUntDetail(@PathVariable("unitId") int uid, Model m) {

		int userId = 1; // needed to change the value from session
		int lessonId = 1; // changes needed

		boolean insertResult = unitrepo.insertEnrollment(userId, uid);
		boolean progressResult = unitrepo.changeProgress(userId, uid);

		ArrayList<LessonUnitBean> lstLessonUnit = (ArrayList<LessonUnitBean>) unitrepo.selectLessonUnit(lessonId);
		ArrayList<QuizOption> lstQuiz = (ArrayList<QuizOption>) unitrepo.selectQuiz(uid);
		UniWorkBean uniWorkBean = unitrepo.selectUniWork(uid);

		m.addAttribute("uniWorkBean", uniWorkBean);
		m.addAttribute("lstLessonUnit", lstLessonUnit);
		m.addAttribute("lstQuiz", lstQuiz);

		return "unit";
	}

	@ModelAttribute("quiz")
	public QuizOption quiz() {
		QuizOption bean = new QuizOption();
		return bean;
	}
}