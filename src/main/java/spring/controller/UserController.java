package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.LoginDTO;
import spring.model.PaymentDTO;
import spring.model.UserDTO;
import spring.repository.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	UserRepository userrepo;
	
	@GetMapping(value = "/")
	public String showHome() {
		return "home";
	}
	
	@GetMapping(value = "/about")
	public String showAbout() {
		return "about";
	}
	
	@GetMapping(value = "/course")
	public String showCourse() {
		return "course";
	}
	
	@GetMapping(value = "/login")
	public ModelAndView showLogin() {
		return new ModelAndView("login", "bean", new LoginDTO());
		
	}
	
	@GetMapping(value = "/adduser")
	public String addUser() {
		return "adduser";
	}
	
	@GetMapping(value = "/addcourse")
	public String addCourse() {
		return "addcourse";
	}
	
	@GetMapping(value = "/check-login")
	public String checkLogin(@ModelAttribute("bean") LoginDTO bean, HttpSession session) {
		
		UserDTO user = userrepo.loginUser(bean);		
		
		if(user != null) {
			
			session.setAttribute("user", user);			
			return "redirect:/check-payment";			
		}
		
		return "redirect:/login";
		
	}
	
	@PostMapping(value = "/check-payment")
	public String checkPayment(HttpSession session) {
		
		boolean status = false;
		
		UserDTO user = new UserDTO();
		user = (UserDTO) session.getAttribute("user");
		status = userrepo.checkPayment(user.getUserId());
		if(status) {
			
			return "redirect:/unit";
		}
		else {
			return "redirect:/subscription";
		}
		
	}
	
	@GetMapping(value = "/subscription")
	public String subscribePayment() {
		return "subscription";
	}

}
