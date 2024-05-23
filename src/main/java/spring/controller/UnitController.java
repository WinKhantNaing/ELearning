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

import spring.model.CoursesBean;
import spring.model.LessonUnitBean;
import spring.model.LoginBean;
import spring.model.QuizOption;
import spring.model.RegisterBean;
import spring.model.UniWorkBean;
import spring.repository.CoursesRepository;
import spring.repository.UnitRepository;

@Controller
@RequestMapping(value = "/unit")
public class UnitController {

	@Autowired
	UnitRepository unitrepo;
	
	@Autowired
	CoursesRepository courserepo;

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

		boolean changeProgress = unitrepo.changeProgress(userId, uid);

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
		int userId = 1; // needed to change the value from session
		System.out.println(unitId);
		int changeComplete = unitrepo.changeComplete(userId, unitId);

		if (changeComplete > 0) {
			System.out.println("Success");
		} else {
			System.out.println("fail");
		}

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

	@GetMapping(value = "/previousunit/{unitId}")
	public String previousUnit(@PathVariable("unitId") int uId) {
		int lessonId = 1;
		int unitIndex;
		int previousUnitId = 0;
		List<LessonUnitBean> lstUnitId = new ArrayList<LessonUnitBean>();
		lstUnitId = unitrepo.selectUnitId(lessonId);

		for (int i = 0; i < lstUnitId.size(); i++) {
			if (lstUnitId.get(i).getUnitId() == uId) {
				unitIndex = i;
				previousUnitId = lstUnitId.get(unitIndex - 1).getUnitId();
			}
		}

		return "redirect:../../unit/unitdetail/" + previousUnitId;
	}

	@GetMapping(value = "/testing")
	public String testing() {
		int unitId = 5;
		int userId = 1;
		int result = unitrepo.changeComplete(userId, unitId);

		if (result > 0) {
			System.out.println("Success");
		} else {
			System.out.println("fail");
		}
		return null;

	}

	@ModelAttribute("quiz")
	public QuizOption quiz() {
		QuizOption bean = new QuizOption();
		return bean;
	}

	@ModelAttribute("registerbean")
	public RegisterBean getRegisterBean() {
		RegisterBean rbean = new RegisterBean();
		return rbean;
	}

	@ModelAttribute("loginbean")
	public LoginBean getLoginBean() {
		LoginBean lbean = new LoginBean();
		return lbean;
	}

	@ModelAttribute("courseList")
	public List<CoursesBean> getAllCourses() {
		List<CoursesBean> courseList = new ArrayList<CoursesBean>();
		courseList = courserepo.getHomeCourses();
		return courseList;
	}
}
