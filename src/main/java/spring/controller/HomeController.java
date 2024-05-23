package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import spring.model.CoursesBean;
import spring.model.FeedbakBean;
import spring.model.LoginBean;
import spring.model.PaySubBean;
import spring.model.PaymentDTO;
import spring.model.PriceCardDTO;
import spring.model.RegisterBean;

import spring.model.ReviewBean;

import spring.model.SubscriptionDTO;

import spring.model.UserBean;
import spring.repository.AboutRepository;
import spring.repository.CoursesRepository;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;


@Controller
public class HomeController {

	@Autowired
	CoursesRepository courserepo;

	@GetMapping(value = "/")

	public String home(HttpSession session, Model m) {
		return "home";
	}
	
	
	@GetMapping(value = "/about")
	public String about(HttpSession session,Model m) {
		List<ReviewBean> review = new ArrayList<ReviewBean>();
		AboutRepository aboutrepo = new AboutRepository();
		int ccount = aboutrepo.courseAbout();
		int scount = aboutrepo.studentAbout();
		int clcount = aboutrepo.clientAbout();
		review = aboutrepo.showReview();
		m.addAttribute("student", scount);
		m.addAttribute("course", ccount);
		m.addAttribute("client", clcount);
		m.addAttribute("review", review);
		return "about";
	}
	
	@GetMapping(value = "seemore")
	public String seemore(HttpSession session,Model m) { 
		AboutRepository aboutrepo = new AboutRepository();
		List<ReviewBean> review = new ArrayList<ReviewBean>();
		review = aboutrepo.showReview();
		session.setAttribute("review", review);
		if(review==null) {
			System.out.println("fail");
		}else System.out.println("success");
		return "seemore";
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

	
	  @GetMapping(value="/subscription")
		public String showScriptionPlan() {
			return "subscription";
		}
	
	// for  show course subscription plan
			@ModelAttribute("subscriptionplan")
			public List<PriceCardDTO> showPriceSubscription() {
				List<PriceCardDTO> priceList = new ArrayList<PriceCardDTO>();
				priceList = courserepo.getPricePlan();
				return priceList;
			}
			
			@ModelAttribute("subPlanBean")
			public PriceCardDTO getSubscriptionPlan() {
				PriceCardDTO bean = new PriceCardDTO();
				return bean;
			}
			
	@ModelAttribute("paymentbean")
		public PaymentDTO getPaymentBean() {
			PaymentDTO payBean = new PaymentDTO();
			return payBean;
		}
	 


	@ModelAttribute("courseList")
	public List<CoursesBean> getAllCourses() {
		List<CoursesBean> courseList = new ArrayList<CoursesBean>();
		courseList = courserepo.getHomeCourses();
		return courseList;
	}

	@ModelAttribute("give")
	public FeedbakBean getFeedbackBean() {
		FeedbakBean fbean = new FeedbakBean();
		return fbean;
	}
	
	
}
