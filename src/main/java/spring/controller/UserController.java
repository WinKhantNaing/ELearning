package spring.controller;


import java.util.List;
import java.util.ArrayList;

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
import spring.model.PaySubBean;
import spring.model.PhotoDto;
import spring.model.ProfileDto;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserdbRepository userrepo;
	ServletContext context;
	
	
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
	
	 // FOR MA MYO LAE OO(show course subscription plan history)
	 @ModelAttribute("payDescription")
	 public List<PaySubBean> getPaymentDescription(){
		 List<PaySubBean> payList = new ArrayList<PaySubBean>();
		 payList = userrepo.getUserHistoryPlan();
		 return payList;
	 
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
	

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HttpSessionMutexListener;

import spring.model.LoginBean;
import spring.model.RegisterBean;
import spring.model.UserBean;
import spring.repository.UserRepository;


@Controller
public class UserController {
	
	@GetMapping(value = "/")
	public ModelAndView home() {
		return new ModelAndView("indexheader");
	}
	@ModelAttribute("regiterbean")
	public RegisterBean getRegisterBean() {
		RegisterBean rbean = new RegisterBean();
		return rbean;
	}
	@ModelAttribute("loginbean")
	public LoginBean getLoginBean() {
		LoginBean lbean = new LoginBean();
		return lbean;
	}
	

	
	
	@PostMapping(value = "register")
	public String Register(@ModelAttribute("registerbean") RegisterBean bean,Model m) {
		UserRepository repo = new UserRepository();
		int result = repo.insertUser(bean);
		if(result < 0) {
			m.addAttribute("success","Register Course Successful");
			return "redirect:/";
		}else {
			m.addAttribute("error","Register course fail");
			return "redirect:/";
		}	
	
}
	@PostMapping(value = "login")
	public String checkuser(@ModelAttribute("loginbean") LoginBean bean, HttpSession session){
		boolean isLogin = false;
		UserRepository userrepo=new UserRepository();
		UserBean ubean = new UserBean();
		ubean = userrepo.selectUser(bean);
		if (ubean == null) {
			System.out.println("fail");
			return "redirect:/";
		} else {
			System.out.println("successful");
			session.setAttribute("session", ubean.getUseremail());
			isLogin = true;
			session.setAttribute("session", isLogin);
			return "indexheader";
			
			
		}
		
	}
}
