package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.CourseBean;

@Controller
public class TestController {
	
	@GetMapping(value = "/")
	public String home() {
		return "indexheader";
	}
	
	@GetMapping(value = "addcourse")
	public ModelAndView addcourse() {
		return new ModelAndView("addcourse","coursebean", new CourseBean());
	}
}
