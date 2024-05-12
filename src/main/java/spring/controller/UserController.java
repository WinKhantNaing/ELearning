package spring.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.UserBean;
import spring.repository.UserdbRepository;
import spring.model.CoursesBean;
import spring.model.PhotoDto;
import spring.model.ProfileDto;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserdbRepository userrepo;
	ServletContext context;
	
	@GetMapping(value="/star")
	public String showstar() {
		return "index";
	}
	
	@GetMapping(value="/profile")
	public ModelAndView checklogin(HttpSession session,Model m) {
		ProfileDto user=new ProfileDto();
		user=userrepo.profileUser();
			session.setAttribute("user",user);
		int i=userrepo.levelCount();
		String level=null;
			if(i>=1 && i<=10) {
				level="Bronze";
			}else if(i>=11 && i<=20){
				level="Silver";
			}else if(i>=21 && i<=30){
				level="Gold";
			}else if(i>=31 && i<=40){
				level="Platinum";
			}else if(i>=41 && i<=50){
				level="Diamond";
			}
			m.addAttribute("level", level);
		boolean status=userrepo.subscription();
		String subscription=null;
			if(status==true) {
				subscription="PremiumUser";
			}else {
				subscription="FreeUser";
			}
		m.addAttribute("subscription", subscription);
		List<CoursesBean> lstUserCourse=userrepo.getCompleteCourses();
		m.addAttribute("lstUserCourse",lstUserCourse);
		ModelAndView mv = new ModelAndView("profile", "pbean",new PhotoDto() );
			return mv;
	}
	
	
	@PostMapping(value="/profilePhoto")
	public String showphoto(@ModelAttribute("pbean")PhotoDto photo) {
		int result=userrepo.insertPhoto(photo);
		if(result>0) {
			System.out.println("profile photo upload success.");
		}else {
			System.out.println("profile photo upload fail.");
		}
		return "redirect:profile";
	}
	
	
	@GetMapping(value="/adduser")
	public ModelAndView showuser() {
		UserBean user=new UserBean();
		user.setGender("Male");
		return new ModelAndView("adduser","aubean",user);
	}
	
	@PostMapping(value="/createuser")
	public String createUser(@ModelAttribute("aubean")UserBean bean) {
		int result=userrepo.addUser(bean);
		if(result>0) {
			return "/";
		}else {
			return "redirect:/adduser";
		}
	}
	

}
