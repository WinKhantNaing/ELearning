package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import spring.model.CoursesBean;
import spring.model.LoginBean;
import spring.model.PaySubBean;
import spring.model.PaymentDTO;
import spring.model.PriceCardDTO;
import spring.model.RegisterBean;
import spring.model.UserBean;
import spring.repository.CoursesRepository;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

@Controller
public class HomeController {

	@Autowired
	CoursesRepository courserepo;
	/*
	 * @GetMapping(value = "/") public ModelAndView home() { return new
	 * ModelAndView("indexheader"); }
	 */

	@GetMapping(value = "/")
	public String home() {
		return "home";
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
	
//	@ModelAttribute("courseList")
//	public List<CoursesBean> getAllCourses() {
//		List<CoursesBean> courseList = new ArrayList<CoursesBean>();
//		courseList = courserepo.getHomeCourses();
//		return courseList;}
}
