package spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import spring.model.FeedbakBean;
import spring.model.LoginBean;
import spring.model.RegisterBean;
import spring.repository.FeedbackRepository;

@Controller
public class FeedbackController {
	
	@Autowired
	FeedbackRepository frepo;

	@PostMapping(value = "Feedback")
	public String giveFeedback(@ModelAttribute("give") FeedbakBean fbean, Model m, HttpSession session) {
			int userId = (int) session.getAttribute("sessionId");
			frepo.insertFeedback(fbean, userId);
			return "indexheader";
		
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

}
