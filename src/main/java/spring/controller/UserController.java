package spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import spring.model.LoginDTO;
import spring.model.PaymentDTO;
import spring.model.PriceCardDTO;
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
	public String showCourse(@ModelAttribute("bean") LoginDTO bean, HttpSession session) {
		
//		UserDTO user = userrepo.loginUser(bean);
//		session.setAttribute("user", user);
		
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
	
	
	public void isLogin(@ModelAttribute("bean") LoginDTO bean, HttpSession session) {
		
		boolean isLogin = false;
		UserDTO user = userrepo.loginUser(bean);
		if(user != null) {
			
			isLogin = true;
		}
		session.setAttribute("user", isLogin);
		session.setAttribute("user", user.getUserId());
		
	}

	
	@PostMapping(value = "/check-login")
	public String checkLogin(@ModelAttribute("bean") LoginDTO bean, HttpSession session) {

		/* UserDTO user = (UserDTO) session.getAttribute("user"); */
		UserDTO user = userrepo.loginUser(bean);
		session.setAttribute("user", user);

		if (user != null) {

			System.out.print("Username" + user.getUserName());
//			return new ModelAndView(new RedirectView("check-payment"));
			return "redirect:/check-payment";
		}
//		return new ModelAndView(new RedirectView("login"));
		return "redirect:/login";

	}

	@GetMapping(value = "/check-payment")
	public String checkPayment(HttpSession session) {

//		boolean status = false;

//		user = new UserDTO();
//		UserDTO user = (UserDTO) session.getAttribute("user");
		UserDTO user = (UserDTO) session.getAttribute("user");
		boolean status = userrepo.checkPayment(user.getUserId());
		if (status) {

			return "redirect:/unit";
		} else {
			return "redirect:/subscription-plan";
		}

	}

	@GetMapping(value = "/subscription-plan")
	public String subscribePayment(Model m) {
		
		List<PriceCardDTO>priceCardList = userrepo.showPrice();
		m.addAttribute("priceCardList", priceCardList);
		
		return "subscriptionPlan";
	}

	@GetMapping(value = "/confirm-payment")
	public String confirmPayment() {
		
		
		return "paymentConfirmation";
		
	}
	
	public String showSingleLesson() {
		return null;
		
	}

}
