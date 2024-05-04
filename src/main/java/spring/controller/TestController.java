package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import spring.model.CoursesBean;
import spring.repository.CoursesRepository;

@Controller
public class TestController {
	
	@Autowired
	CoursesRepository courserepo;
	
	@ModelAttribute("courseList")
	public List<CoursesBean> getAllCourses(){
		List<CoursesBean> courseList = new ArrayList<CoursesBean>();
		courseList = courserepo.getCourses();
		return courseList;
	}
	
	@GetMapping(value = "/")
	public String courses() {
		return "courses";
	}
	
	@ModelAttribute("coursesearchform")
	public CoursesBean courseSearchForm() {
		CoursesBean bean  = new  CoursesBean();
		return bean;
	}
	
	@GetMapping(value="/cancel")
	public String courseSearch(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	 @PostMapping(value="/searchcourse") 
	 public String searchCourses(CoursesBean course,HttpSession session, Model m) { 
		 session.setAttribute("searchCourse", course);
		 List<CoursesBean> courseSearchList = new ArrayList<CoursesBean>();	
		 courseSearchList = courserepo.getSearchCourses(course);
		 session.setAttribute("courseSearchList", courseSearchList);
		 if(courseSearchList==null) {
			 m.addAttribute("noCourse", "Course that you search does not found!") ;
		 }
		 return "courseSearch"; 
	 }
	
}
