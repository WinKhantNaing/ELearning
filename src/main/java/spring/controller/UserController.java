package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.UserBean;
import spring.repository.UserdbRepository;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserdbRepository userrepo;
	
	
	
	
	
	
	
	
	
	
	
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
