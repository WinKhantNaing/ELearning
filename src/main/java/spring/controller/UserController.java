package spring.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.model.UserBean;


import spring.model.LoginBean;
import spring.model.RegisterBean;

import spring.repository.CoursesRepository;
import spring.repository.UserRepository;

import spring.model.UserDTO;
import spring.model.SingleLessonDTO;

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
	public String checkuser(@ModelAttribute("loginbean") LoginBean bean, HttpSession session) {
		boolean isLogin = false;
		UserBean ubean = userrepo.selectUser(bean);
		if (ubean == null) {
			System.out.println("fail");
			return "redirect:/";
		} else {
			session.setAttribute("sessionId", ubean.getUserId());
			isLogin = true;
			session.setAttribute("sessionimg",ubean.getFilePath());
			session.setAttribute("sessionuserRole",ubean.getUserRole());
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

	@PostMapping(value = "/check-login")
	public String checkLogin(HttpSession session) {

		/* UserDTO user = (UserDTO) session.getAttribute("user"); */
//		UserDTO user = userrepo.loginUser(bean);
		boolean isLogin = (boolean) session.getAttribute("isLogin");

		if (isLogin) {

//			System.out.print("Username" + user.getUserName());
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

			return "redirect:../unit/showunit";
		} else {
			return "redirect:../course/subscribe";
		}

	}
	@GetMapping("/show-single-lesson/{id}")
	public String showSingleLesson(@PathVariable("id")int lessonId, Model m) {
		
		SingleLessonDTO slDTO = userrepo.selectOneLesson(lessonId);
		m.addAttribute("slDTO", slDTO);
		
		return "redirect:check-login";
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
	
	@GetMapping(value="logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
		return "/";
		
	}
	
}
