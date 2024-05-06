package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import spring.model.CourseStatusTDO;
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
	 public String searchCourses(CoursesBean course,HttpSession session, Model m) { 
		 session.setAttribute("searchCourse", course);
		 List<CoursesBean> courseSearchList = new ArrayList<CoursesBean>();	
		 courseSearchList = courserepo.getSearchCourses(course);
		 m.addAttribute("courseSearchList", courseSearchList);
		 if(courseSearchList==null) {
			 m.addAttribute("noCourse", "Course that you search does not found!") ;
		 }
		 return "courseSearch"; 
	 }
	 

	 @GetMapping(value = "/complete")
		public String showComplete(/* @PathVariable("user")UserBean user, */Model m) {
		 List<CoursesBean> completeList = new ArrayList<CoursesBean>();
		 completeList = courserepo.getCompleteCourses();
		 m.addAttribute("completeList", completeList);
			return "courseComplete";
		}
	 
	 @GetMapping(value = "/progress")
		public String showProgress(/* @PathVariable("user")UserBean user, */Model m) {
		 List<CoursesBean> progressList = new ArrayList<CoursesBean>();
		 progressList = courserepo.getProgressCourses();
		 m.addAttribute("progressList", progressList);
			return "courseProgress";
		}
	 
}
