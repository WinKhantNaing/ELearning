package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import spring.model.CoursesBean;
import spring.model.PaySubBean;
import spring.model.PaymentDTO;
import spring.model.PriceCardDTO;
import spring.model.UserBean;
import spring.repository.CoursesRepository;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
@Controller
public class TestController {
	
	@Autowired
	CoursesRepository courserepo;
	
	@ModelAttribute("courseList")
	public List<CoursesBean> getAllCourses(){
		List<CoursesBean> courseList = new ArrayList<CoursesBean>();
		courseList = courserepo.getCourses();
		return courseList;
	}
	
	
	@GetMapping(value = "/")
	public String courses() {
		return "subscription";
	}
	
	@ModelAttribute("course-bean")
	public CoursesBean courseSearchForm() {
		CoursesBean bean  = new  CoursesBean();
		return bean;
	}
	
	@GetMapping(value="/seeAllCourses")
	public String courseSearch(HttpSession session) {
		session.removeAttribute("searchCourse");
		return "redirect:/";
	}
	
	 @PostMapping(value="/searchcourse") 
	 public String searchCourses(CoursesBean course,HttpSession session, Model m,RedirectAttributes redirectAttribute) { 
		 session.setAttribute("searchCourse", course);
		 List<CoursesBean> courseSearchList = new ArrayList<CoursesBean>();	
		 courseSearchList = courserepo.getSearchCourses(course);
		
		 if(courseSearchList.isEmpty()) {
			 redirectAttribute.addFlashAttribute("message", "Courses that you search do not found!");
			 return "redirect:/";
		 }
		 m.addAttribute("courseList", courseSearchList);
		 return "courses"; 
	 }
	 

	 @GetMapping(value = "/complete")
		public String showComplete(HttpSession session,Model m) {
		 List<CoursesBean> completeList = new ArrayList<CoursesBean>();
		 UserBean user = (UserBean)session.getAttribute("user");
		 completeList = courserepo.getCompleteCourses();
		 m.addAttribute("courseList", completeList);
			return "courses";
		}
	 
	 @GetMapping(value = "/progress")
		public String showProgress(HttpSession session,Model m) {
		 List<CoursesBean> progressList = new ArrayList<CoursesBean>();
		 UserBean user = (UserBean)session.getAttribute("user");
		 progressList = courserepo.getProgressCourses();
		 m.addAttribute("courseList", progressList);
			return "courses";
		}
	 
	 
	 // FOR MA MYO LAE OO(show course subscription plan history)
	 @ModelAttribute("payDescription")
	 public List<PaySubBean> getPaymentDescription(){
		 List<PaySubBean> payList = new ArrayList<PaySubBean>();
		 payList = courserepo.getUserHistoryPlan();
		 return payList;
	 
	 }
	 
	 //for ma toe yadanarkyaw (show course subscriptionplan)
	 @ModelAttribute("subscriptionplan")
	 public List<PriceCardDTO> showPriceSubscription(){
		 List<PriceCardDTO> priceList = new ArrayList<PriceCardDTO>();
		 priceList = courserepo.getPricePlan();
		 return priceList;
	 }
	 
	 @GetMapping(value="/subcription/{subId}")
	 public String showPaymentForm(@PathVariable("subId")int cid,Model m) {	 
		 PriceCardDTO priceBean = courserepo.getDuration(cid);
		 m.addAttribute("priceBean", priceBean);
		 String[] arrayDu = priceBean.getDuration().split("\\s");
		 int time = Integer.parseInt(arrayDu[0]);
		 LocalDate startDate = LocalDate.now();
		 m.addAttribute("startDate", startDate);
		 String sTime = arrayDu[1];
		 if(sTime.equals("month") || sTime.equals("months")||sTime.equals("Month") || sTime.equals("Months")||sTime.equals("MONTH") || sTime.equals("MONTHS")) {
			 LocalDate endDate = startDate.plusMonths(time);
			 m.addAttribute("endDate", endDate);
		 }else {
			 LocalDate endDate = startDate.plusYears(time);
			 m.addAttribute("endDate", endDate);
		 }		 
		 return "paymentForm";
	 }
	 
	 @ModelAttribute("paymentbean")
	 public PaymentDTO getPaymentBean() {
		 PaymentDTO payBean = new PaymentDTO();
		 return payBean;
	 }
	 
	 @PostMapping(value="/subscribe")
	 public String subscribe(@ModelAttribute("paymentbean")PaymentDTO bean,Model m ) {
		 int result = courserepo.addSubscriptionPlan(bean);
		 if(result > 0) {
			 m.addAttribute("message", "Subscription plan is successful!");
			 return "letGo";
		 }else {
			 m.addAttribute("message", "Subscription plan is fail!");
			 return "paymentForm";
		 }
		 
	 }
	 
	 
}
