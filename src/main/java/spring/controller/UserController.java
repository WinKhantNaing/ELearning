package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.LoginDTO;
import spring.model.PaymentDTO;
import spring.model.UserDTO;
import spring.repository.UserRepository;
import user.model.LoginBean;

@Controller
public class UserController {
	
	@Autowired
	UserRepository userrepo;
	
	@GetMapping(value = "/")
	public ModelAndView showLogin() {
		return new ModelAndView("login", "bean", new LoginDTO());
		
	}
	
	@PostMapping(value = "/checkLogin")
	public String checkLogin(@ModelAttribute("bean") LoginDTO bean, HttpSession session) {
		
		UserDTO user = userrepo.loginUser(bean);
		
		if(user != null) {
			
			session.setAttribute("user", user);
			{
				PaymentDTO payment = userrepo.checkPayment(user.getUserId());
				if(payment.getUserId() == user.getUserId()) {
					
					return "unit";
				}
				else {
					return "subscription";
				}
			}
			
		}
		
		return "redirect:/";
		
	}

}
