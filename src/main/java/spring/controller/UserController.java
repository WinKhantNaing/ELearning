package spring.controller;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.UserBean;
import spring.model.CoursesBean;
import spring.model.PaySubBean;
import spring.model.PhotoDto;
import spring.model.ProfileDto;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HttpSessionMutexListener;

import spring.model.LoginBean;
import spring.model.RegisterBean;
import spring.model.UserBean;
import spring.repository.CoursesRepository;
import spring.repository.UserRepository;
import org.springframework.web.servlet.view.RedirectView;

import spring.model.LoginDTO;
import spring.model.PaymentDTO;
import spring.model.PriceCardDTO;
import spring.model.UserDTO;
import spring.model.SingleLessonDTO;
import spring.model.UnitNameListDTO;
import spring.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserRepository userrepo;
	CoursesRepository courserepo;
	ServletContext context;

	@GetMapping(value = "/index")
	public ModelAndView home() {
		return new ModelAndView("indexheader");
	}

	@ModelAttribute("registerbean")
	public RegisterBean getRegisterBean() {
		RegisterBean rbean = new RegisterBean();
		return rbean;
	}

	@ModelAttribute("loginbean")
 	public LoginBean getLoginBean() {
		LoginBean lbean = new LoginBean();
		return lbean;
	}
	
	@GetMapping(value = "/get-login")
	public ModelAndView getLogin() {
		
		return new ModelAndView("home", "loginbean", new LoginBean());
	}
	

	@PostMapping(value = "/register")
	public String Register(@ModelAttribute("registerbean") RegisterBean bean, Model m) {
		int result = userrepo.insertUser(bean);
		if (result < 0) {
			m.addAttribute("success", "Register Course Successful");

		} else {
			m.addAttribute("error", "Register course fail");

		}
		return "redirect:/";

	}

	@PostMapping(value = "/login")
	public String checkuser(@ModelAttribute("loginbean") LoginBean bean, HttpSession session, Model m) {
		boolean isLogin = false;
		UserBean ubean = userrepo.selectUser(bean);
		
		if (ubean == null) {
			
			System.out.println("fail");
			m.addAttribute("loginError", true);
			m.addAttribute("loginFail", "Login Fail!!1 Please Login Again.");
			return "home";
			
		} 
		else {
			
			session.setAttribute("sessionId", ubean.getUserId());
			isLogin = true;
			session.setAttribute("sessionLogin", isLogin);
			return "home";

		}
	}

	@GetMapping(value = "/adduser")
	public ModelAndView showuser() {
		return new ModelAndView("adduser", "userbean", new UserBean());
	}

	@PostMapping(value = "/createuser")
	public String createUser(@ModelAttribute("userbean") UserBean bean) {
		int result = userrepo.addUser(bean);
		if (result > 0) {
			// successful
			return "redirect:adduser";
		} else {
			// fail
			return "redirect:adduser";
		}
	}

	@GetMapping(value = "/showusertb")
	public String showUser(Model m) {
		List<UserBean> lstUser = userrepo.selectAllUser();
		m.addAttribute("lstUser", lstUser);
		return "showuser";
	}

	@GetMapping(value = "/about")
	public String showAbout() {
		return "about";
	}
	/*
	 * public void isLogin(@ModelAttribute("bean") LoginDTO bean, HttpSession
	 * session) {
	 * 
	 * boolean isLogin = false; UserDTO user = userrepo.loginUser(bean); if(user !=
	 * null) {
	 * 
	 * isLogin = true; } session.setAttribute("user", isLogin);
	 * session.setAttribute("user", user.getUserId());
	 * 
	 * }
	 */
	
	@GetMapping(value = "/show-single-lesson/{id}")
	public String showSingleLesson(@PathVariable("id")int lessonId, Model m, HttpSession session) {
		
		session.setAttribute("ssLessonId", lessonId);
		
		SingleLessonDTO slDTO = userrepo.selectOneLesson(lessonId);
			m.addAttribute("slDTO", slDTO);
			
			List<UnitNameListDTO> unitNameLst = new ArrayList<UnitNameListDTO>();
			unitNameLst = userrepo.showUnitNameList(lessonId);
			m.addAttribute("unitNameLst", unitNameLst);
			
			int unitCount = userrepo.countUnit(lessonId);
			m.addAttribute("unitCount", unitCount);
			
			return "singleLesson";
	
	}
	
	@GetMapping(value = "/check-login")
	public String checkLogin(HttpSession session, Model m, RedirectAttributes redirectAttribute) {

		/* UserDTO user = (UserDTO) session.getAttribute("user"); */
//		UserDTO user = userrepo.loginUser(bean);
//		boolean isLogin = false;
//		isLogin = (boolean) ;
		if(session.getAttribute("sessionLogin") == null) {
			redirectAttribute.addFlashAttribute("loginAlert", "You need to login first to apply the lessons");
			redirectAttribute.addFlashAttribute("loginError", true);
			return "redirect:get-login";
		}
		else
		{
		
//			System.out.print("Username" + user.getUserName());
//			return new ModelAndView(new RedirectView("check-payment"));
			return "redirect:check-unit-status";
		}	
//		return new ModelAndView(new RedirectView("login"));
	}	

	@GetMapping(value = "/check-unit-status")
	public String checkUnitStatus(HttpSession session) {
		
		int lessonId = (int) session.getAttribute("ssLessonId");
		
		boolean unitStatus = userrepo.getUnitStatus(lessonId);
		if(unitStatus) {
			
			return "redirect:../unit/showunit";
		}
		
		return "redirect:check-payment";	
	}

	@GetMapping(value = "/check-payment")
	public String checkPayment(HttpSession session, RedirectAttributes redirectAttribute) {

		int userId = (int) session.getAttribute("sessionId");
		boolean purStatus = userrepo.checkPayment(userId);
		if (purStatus) {

			return "redirect:../unit/showunit";
			
		} else {
			redirectAttribute.addFlashAttribute("purchaseAlert", "You need to subscribe first to apply this premium lesson");
			return "redirect:../course/get-subscribe";
		}
	}
	
	/*
	 * @GetMapping(value = "/subscription-plan") public String
	 * subscribePayment(Model m) {
	 * 
	 * List<PriceCardDTO> priceCardList = userrepo.showPrice();
	 * m.addAttribute("priceCardList", priceCardList);
	 * 
	 * return "subscriptionPlan"; }
	 * 
	 * @GetMapping(value = "/confirm-payment") public String confirmPayment() {
	 * 
	 * return "paymentConfirmation";
	 * 
	 * }
	 * 
	 * public String showSingleLesson() { return null;
	 * 
	 * }
	 */
}
