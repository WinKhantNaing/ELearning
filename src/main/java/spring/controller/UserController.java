package spring.controller;

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
import spring.model.PhotoDto;
import spring.model.ProfileDto;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserdbRepository userrepo;
	ServletContext context;
	
	@GetMapping(value = "/photoUpload")
	public ModelAndView photoUpload() {
		PhotoDto file = new PhotoDto();
		ModelAndView mv = new ModelAndView("photo", "img", file);
		return mv;
	}
	
	@PostMapping(value="/showphoto")
	public String createUser(@ModelAttribute("img")PhotoDto photo) {
		int result=userrepo.insertPhoto(photo);
		if(result>0) {
			return"redirect:/";
		}else {
			return "redirect:/register";
		}
	}
	
	
	@GetMapping(value="/profile")
	public String checklogin(HttpSession session,Model m) {
		ProfileDto user=new ProfileDto();
		user=userrepo.profileUser();
			session.setAttribute("user",user);
		int i=userrepo.levelCount();
		String level=null;
			if(i>=1 && i<=10) {
				level="Braze";
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
				subscription="Preminum";
			}else {
				subscription="Free";
			}
		m.addAttribute("subscription", subscription);	
			return "/profile";
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
