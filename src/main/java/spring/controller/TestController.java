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
import spring.model.UserBean;
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
	
	@ModelAttribute("course-bean")
	public CoursesBean courseSearchForm() {
		CoursesBean bean  = new  CoursesBean();
		return bean;
	}
	
	@GetMapping(value="/seeAllCourses")
	public String courseSearch(HttpSession session) {
		session.removeAttribute("searchCourse");
		return "redirect:/";
	}
	
	 @PostMapping(value="/searchcourse") 
	 public String searchCourses(CoursesBean course,HttpSession session, Model m,RedirectAttributes redirectAttribute) { 
		 session.setAttribute("searchCourse", course);
		 List<CoursesBean> courseSearchList = new ArrayList<CoursesBean>();	
		 courseSearchList = courserepo.getSearchCourses(course);
		
		 if(courseSearchList.isEmpty()) {
			 redirectAttribute.addFlashAttribute("message", "Courses that you search do not found!");
			 return "redirect:/";
		 }
		 m.addAttribute("courseList", courseSearchList);
		 return "courses"; 
	 }
	 

	 @GetMapping(value = "/complete")
		public String showComplete(HttpSession session,Model m) {
		 List<CoursesBean> completeList = new ArrayList<CoursesBean>();
		 UserBean user = (UserBean)session.getAttribute("user");
		 completeList = courserepo.getCompleteCourses();
		 m.addAttribute("courseList", completeList);
			return "courses";
		}
	 
	 @GetMapping(value = "/progress")
		public String showProgress(HttpSession session,Model m) {
		 List<CoursesBean> progressList = new ArrayList<CoursesBean>();
		 UserBean user = (UserBean)session.getAttribute("user");
		 progressList = courserepo.getProgressCourses();
		 m.addAttribute("courseList", progressList);
			return "courses";
		}
	 
}
