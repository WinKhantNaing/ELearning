package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.UserBean;
import spring.repositoty.UserdbRepositoty;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserdbRepositoty userrepo;
	
	@GetMapping(value="/adduser")
	public ModelAndView showuser() {
		
		return new ModelAndView("adduser","userbean",new UserBean());
	}
	
	@PostMapping(value="/createuser")
	public String createUser(@ModelAttribute("userbean")UserBean bean) {
		int result=userrepo.addUser(bean);
		if(result>0) {
			return "/";
		} else {
		return "redirect:/adduser";
		}
	}
}