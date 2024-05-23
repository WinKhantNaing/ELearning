package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		int userId = 1; // needed to change the value from session
		int lessonId = 1;

		boolean insertResult = unitrepo.insertEnrollment(userId, lessonId);
		ArrayList<LessonUnitBean> lstLessonUnit = (ArrayList<LessonUnitBean>) unitrepo.selectLessonUnit(lessonId);

		m.addAttribute("lstLessonUnit", lstLessonUnit);
		return "unit";
	}

	@GetMapping(value = "unitdetail/{unitId}")
	public String showUntDetail(@PathVariable("unitId") int uid, Model m) {

		int userId = 1; // needed to change the value from session
		int lessonId = 1; // changes needed

		boolean progressResult = unitrepo.changeProgress(userId, uid);

		ArrayList<LessonUnitBean> lstLessonUnit = (ArrayList<LessonUnitBean>) unitrepo.selectLessonUnit(lessonId);
		ArrayList<QuizOption> lstQuiz = (ArrayList<QuizOption>) unitrepo.selectQuiz(uid);
		UniWorkBean uniWorkBean = unitrepo.selectUniWork(uid);

		m.addAttribute("uniWorkBean", uniWorkBean);
		m.addAttribute("lstLessonUnit", lstLessonUnit);
		m.addAttribute("lstQuiz", lstQuiz);
		m.addAttribute("unitId", uid);

		return "unit";
	}

	@PostMapping(value = "/checkquiz")
	public String checkQuiz(@ModelAttribute("quiz") QuizOption bean, RedirectAttributes attribute) {
		int userAnswer = bean.getOptionId();
		int unitId = bean.getUnitId();
		bean.setOptionId(userAnswer);
		attribute.addFlashAttribute("userAnswer", userAnswer);
		return "redirect:unitdetail/" + unitId;
	}

	@GetMapping(value = "/nextunit/{unitId}")
	public String nextUnit(@PathVariable("unitId") int uId) {
		int lessonId = 1; // needed to change the value from session of lesson
		int unitIndex;
		int nextUnitId = 0;
		List<LessonUnitBean> lstUnitId = new ArrayList<LessonUnitBean>();
		lstUnitId = unitrepo.selectUnitId(lessonId);

		for (int i = 0; i < lstUnitId.size(); i++) {
			if (lstUnitId.get(i).getUnitId() == uId) {
				unitIndex = i;
				nextUnitId = lstUnitId.get(unitIndex + 1).getUnitId();
			}
		}

		return "redirect:../../unit/unitdetail/" + nextUnitId;
	}

	@ModelAttribute("quiz")
	public QuizOption quiz() {
		QuizOption bean = new QuizOption();
		return bean;
	}
}
