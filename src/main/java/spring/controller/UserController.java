package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HttpSessionMutexListener;

import spring.model.FeedbakBean;
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

	@ModelAttribute("give")
	public FeedbakBean getFeedbackBean() {
		FeedbakBean fbean = new FeedbakBean();
		return fbean;
	}

	@PostMapping(value = "register")
	public String Register(@ModelAttribute("registerbean") RegisterBean bean, Model m) {
		UserRepository repo = new UserRepository();
		int result = repo.insertUser(bean);
		if (result < 0) {
			m.addAttribute("success", "Register Course Successful");
			return "redirect:/";
		} else {
			m.addAttribute("error", "Register course fail");
			return "redirect:/";
		}

	}

	@PostMapping(value = "login")
	public String checkuser(@ModelAttribute("loginbean") LoginBean bean, HttpSession session, Model m) {
		boolean isLogin = false;
		int userId=0;
		UserRepository userrepo = new UserRepository();
		UserBean ubean=new UserBean();
		ubean = userrepo.selectUser(bean);
		if (ubean == null) {
			System.out.println("fail");
			return "redirect:/";
		} else {
			System.out.println("Succesful");
			userId = ubean.getUserId();
			
			session.setAttribute("sessionId", userId);
			isLogin = true;
			
			session.setAttribute("sessionLogin", isLogin);
			return "indexheader";

		}
		
		
	}
}
