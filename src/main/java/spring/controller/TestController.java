package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.CourseBean;
import spring.repository.CourseRepository;

@Controller
public class TestController {
	
	@GetMapping(value = "/")
	public String home() {
		return "indexheader";
	}
	
	@GetMapping(value = "showcourses")
	public String showall(Model m) {
		CourseRepository cr = new CourseRepository();
		List<CourseBean> courseLst = new ArrayList<>();
		courseLst = cr.getAllCourse();
		m.addAttribute("courseLst",courseLst);
		return "showallcourses";
		
	}
	
	@GetMapping(value = "addcourse")
	public ModelAndView addcourse() {
		return new ModelAndView("addcourse","coursebean", new CourseBean());
	}
}
