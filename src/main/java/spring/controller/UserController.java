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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.UserBean;

import spring.model.FeedbakBean;
import spring.model.LoginBean;
import spring.model.RegisterBean;

import spring.repository.CoursesRepository;
import spring.repository.UserRepository;

import spring.model.PaymentDTO;
import spring.model.UserDTO;
import spring.model.PriceCardDTO;

import spring.model.SingleLessonDTO;

import spring.model.UnitNameListDTO;




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
	
	@ModelAttribute("give")
	public FeedbakBean getFeedbackBean() {
		FeedbakBean fbean = new FeedbakBean();
		return fbean;
	}


	@ModelAttribute("paymentbean")
	public PaymentDTO getPaymentBean() {
		PaymentDTO payBean = new PaymentDTO();
		return payBean;
	}

	@GetMapping(value = "/get-login")
	public String getLogin() {
		return "home";
	}

	@PostMapping(value = "/register")
	public String Register(@ModelAttribute("registerbean") RegisterBean bean, Model m) {
		int result = userrepo.insertUser(bean);
		if (result < 0) {
			
			m.addAttribute("success", "Register Course Successful");
			System.out.println("Register successful");
			

		} else {
			m.addAttribute("RegisterError", true);
			m.addAttribute("error", "Register course fail");
			System.out.println("Register fail");

		}
		return "redirect:/";

	}

	
	@PostMapping(value = "/login")

	public String checkuser(@ModelAttribute("loginbean") LoginBean bean, HttpSession session, Model m,
			RedirectAttributes redirectAttribute) {

		boolean isLogin = false;
		UserBean ubean = userrepo.selectUser(bean);

		if (ubean == null) {


			System.out.println("fail");
			redirectAttribute.addFlashAttribute("loginError", true);
			redirectAttribute.addFlashAttribute("loginFail", "Login Fail!! Please Login Again.");
			return "redirect:get-login";


		} else {
			session.setAttribute("sessionEmail", ubean.getUserEmail());//for subscription 
			session.setAttribute("sessionId", ubean.getUserId());
			isLogin = true;
			session.setAttribute("sessionimg",ubean.getFilePath());
			session.setAttribute("sessionuserRole",ubean.getUserRole());
			session.setAttribute("sessionLogin", isLogin);

			session.setAttribute("name", ubean.getUserName());
			

	
			String url = (String) session.getAttribute("sessionUrl");
			System.out.println("Url" + url);
			if (url == null) {
				return "home";
			}
			return "redirect:check-unit-status";

		}
	}
//user crud

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
	
	@GetMapping(value = "/edituser/{sessionId}")
	public String editUser(@PathVariable("sessionId") int userId,Model m) {
		//System.out.println("passed!!"+userId);
	    UserBean user = userrepo.selectOne(userId);
	   System.out.println("after select one" + user.getUserId());
	    m.addAttribute("eubean",user);
	   return "useredit";
	}
	
	
	

	@PostMapping(value= "/updateuser")
	public String updateUser(@ModelAttribute("eubean") UserBean bean, Model m) {
		
		int result = userrepo.updateUser(bean);
		if(result>0) {
		
			return "redirect:/user/showusertb";
		}else {
			m.addAttribute("user", bean);
			return "courseedit";
		}
		
	}
	
    @GetMapping(value = "/deleteuser/{userId}")
    public String deleteUser(@PathVariable("userId") int userId) {
        int result = userrepo.deleteUser(userId);
        if (result > 0) {
            // Successful deletion
            return "redirect:/user/showusertb";
        } else {
            // Failed deletion
            return "redirect:/user/showusertb";
        }
    }

	@GetMapping(value = "/about")
	public String showAbout() {
		return "about";
	}

	// for admin (Add subscription plan)
	@PostMapping(value = "/addsubplan")
	public String addSubscriptionPlan(@ModelAttribute("subscriptionPlan") SubscriptionDTO subBean,
			RedirectAttributes redirectAttribute) {
		int result = userrepo.addSubscriptionPlan(subBean);
		if (result == 1) {
			redirectAttribute.addFlashAttribute("message", "Adding subscription plan is successful");
		} else {
			redirectAttribute.addFlashAttribute("message", "Adding subscription plan is fail!");
		}
		return "redirect:/subscription";
	}

	// for admin to show (subscriptoin plan)
	@GetMapping(value = "/show-subscription-plan")
	public String showSubscriptionTable() {
		return "showSubscriptionPlan";
	}

	@GetMapping(value = "/show-single-lesson/{id}")
	public String showSingleLesson(@PathVariable("id") int lessonId, Model m, HttpSession session,
			HttpServletRequest request) {

		session.removeAttribute("sessionUrl");

		String url = request.getRequestURL().toString();
		System.out.println("Url:" + url);
		m.addAttribute("currentUrl", url);
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

	/*
	 * @GetMapping("/return-lesson-url") public String returnLessonUrl(HttpSession
	 * session) {
	 * 
	 * String lessonUrl = (String) session.getAttribute("ssLessonUrl");
	 * 
	 * if (lessonUrl == null) {
	 * 
	 * return "redirect:/"; }
	 * 
	 * return "redirect:" + lessonUrl; }
	 */

	@GetMapping(value = "/check-login")
	public String checkLogin(HttpSession session, Model m, RedirectAttributes redirectAttribute,
			@RequestParam String url) {

		if (session.getAttribute("sessionLogin") == null) {
//			redirectAttribute.addFlashAttribute("loginAlert", true);
			redirectAttribute.addFlashAttribute("loginError", true);
			session.setAttribute("sessionUrl", url);
			return "redirect:get-login";
		} else {

			return "redirect:check-unit-status";
		}

	}

	@GetMapping(value = "/check-unit-status")
	public String checkUnitStatus(HttpSession session) {

		int lessonId = (int) session.getAttribute("ssLessonId");

		boolean unitStatus = userrepo.getUnitStatus(lessonId);

		if (unitStatus) {

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
			redirectAttribute.addFlashAttribute("purchaseAlert",
					"You need to subscribe first to apply this premium lesson");
//			session.setAttribute("purchaseAlert", "You need to subscribe first to apply this premium lesson");
			return "redirect:../course/get-subscribe";
		}
	}

	@GetMapping("/show-single-lesson/{id}")
	public String showSingleLesson(@PathVariable("id") int lessonId, Model m) {

		SingleLessonDTO slDTO = userrepo.selectOneLesson(lessonId);
		m.addAttribute("slDTO", slDTO);

		return "redirect:check-login";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		return "home";
	}
	
	
	@PostMapping(value = "/Feedback")
	public String giveFeedback(@ModelAttribute("give") FeedbakBean fbean, Model m, HttpSession session) {
		
			int userId = (int) session.getAttribute("sessionId");
			userrepo.insertFeedback(fbean, userId);
			if(userId==0) {
				System.out.println("insert fail");
			}else System.out.println("insert success");
			return "redirect:/";
		
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
	
	
	// for admin to delete subscription plan
	@GetMapping(value="/delete/{subId}")
	public String deleteSubscriptionPlan(@PathVariable("subId")int cid) {
		int result = userrepo.deleteSubscriptionPlan(cid);
		return "redirect:/show-plan-list";
	}
	
	// for admin to active subscription plan
		@GetMapping(value="/active/{subId}")
		public String activeSubscriptionPlan(@PathVariable("subId")int cid) {
			int result = userrepo.activeSubscriptionPlan(cid);
			return "redirect:/show-plan-list";
		}
		
		// for admin to select for update subscription plan
				@GetMapping(value="/update/{subId}")
				public ModelAndView updateSubscriptionPlan(@PathVariable("subId")int cid) {
					PriceCardDTO bean = userrepo.selectSubscriptionPlan(cid);
					return new ModelAndView("subPlanUpdate","planBean",bean);
				}
				
	  //for admin to update subscription plan
				@PostMapping(value="/subscriptionPlan")
				public String updateSubscriptionPlan(@ModelAttribute("planBean")PriceCardDTO bean, RedirectAttributes redirectAttribute) {
					int result = userrepo.updateSubscriptionPlan(bean);
					if(result > 0 ) {
						redirectAttribute.addFlashAttribute("message","Update plan is successful.");
					}else {
						redirectAttribute.addFlashAttribute("message","Update plan is fail!");
					}
					redirectAttribute.addFlashAttribute("plan",true);
					return "redirect:/show-plan-list";
				}
				
		//for admin to add subscription plan
				@PostMapping(value="/sub-plan-add")
				public String addSubscriptionPlan(@ModelAttribute("subPlanBean")PriceCardDTO bean,RedirectAttributes redirectAttribute) {
					int result = userrepo.addSubscriptionPlan(bean);
					if(result > 0) {
						
						redirectAttribute.addFlashAttribute("message","Adding plan is successful.");
					}else {
						
						redirectAttribute.addFlashAttribute("message","Adding plan is fail.");
					}
					redirectAttribute.addFlashAttribute("plan",true);
					return "redirect:/show-plan-list";
				}
}
