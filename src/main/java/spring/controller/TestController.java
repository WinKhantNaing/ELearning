package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.ArrayList;
import java.util.List;
import spring.model.CoursesModel;
import spring.repository.CoursesRepository;

@Controller
public class TestController {
	
	@Autowired
	CoursesRepository courserepo;
	
	@ModelAttribute("courseList")
	public List<CoursesModel> getAllCourses(){
		List<CoursesModel> courseList = new ArrayList<CoursesModel>();
		courseList = courserepo.getCourses();
		return courseList;
	}
	
	@GetMapping(value = "/")
	public String courses() {
		return "courses";
	}
}
