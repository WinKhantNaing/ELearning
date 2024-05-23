package spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.AddUnitDTO;
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
	public String showUntDetail(@PathVariable("unitId") int uid, Model m, HttpSession session) {

		int userId = (int) session.getAttribute("sessionId"); // needed to change the value from session
		int lessonId = (int) session.getAttribute("ssLessonId"); // changes needed

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
	
	@ModelAttribute("add-unit-dto")
	public AddUnitDTO addUnitDTO() {
		return new AddUnitDTO();
	}
	
	@GetMapping(value = "/add-unit")
	public ModelAndView addUnit() {
		
		return new ModelAndView("addunit", "add-unit-dto", new AddUnitDTO());
		
	}
	
	@PostMapping(value = "/create-unit")
	public String createUnit( @ModelAttribute("add-unit-dto") AddUnitDTO auDTO, HttpSession session) {
		
		int lessonId = 2;
//		int lessonId = (int) session.getAttribute("ssLessonId");
		
		System.out.println("auDTO answer"+ auDTO.getAnswer());
		
		int result = unitrepo.insertUnit(auDTO, lessonId);
		
		
		
		if(result>0) {
			
			return "";
			
		}
		
		return "addunit";
		
	}
	
}
