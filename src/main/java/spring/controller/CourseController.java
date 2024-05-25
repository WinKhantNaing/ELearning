package spring.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import spring.model.CoursesBean;
import spring.model.LoginBean;
import spring.model.PaymentDTO;
import spring.model.PriceCardDTO;
import spring.model.RegisterBean;
import spring.repository.ConnectionClass;
import spring.repository.CoursesRepository;

@Controller
@RequestMapping(value = "/course")
public class CourseController {
	@Autowired
	CoursesRepository courserepo;

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

	@ModelAttribute("courseList")
	public List<CoursesBean> getAllCourses() {
		List<CoursesBean> courseList = new ArrayList<CoursesBean>();
		courseList = courserepo.getCourses();
		return courseList;
	}

	@ModelAttribute("course-bean")
	public CoursesBean courseSearchForm() {
		CoursesBean bean = new CoursesBean();
		return bean;
	}

	/*
	 * @GetMapping(value="/showAllCourses") public String showAllCourses(HttpSession
	 * session) { boolean loginResult = (boolean)
	 * session.getAttribute("sessionLogin"); if(loginResult == true) { return
	 * "redirect:courses"; }else { return "redirect:/"; } }
	 */
	@GetMapping(value = "/courses")
	public String courses() {
		return "courses";
	}



	@GetMapping(value = "/complete")
	public String showComplete(HttpSession session, Model m) {
		List<CoursesBean> completeList = new ArrayList<CoursesBean>();
		int userId = (int) session.getAttribute("sessionId");
		completeList = courserepo.getCompleteCourses(userId);
		m.addAttribute("courseList", completeList);
		return "courses";
	}

	@GetMapping(value = "/progress")
	public String showProgress(HttpSession session, Model m) {
		List<CoursesBean> progressList = new ArrayList<CoursesBean>();
		int userId = (int) session.getAttribute("sessionId");
		progressList = courserepo.getProgressCourses(userId);
		m.addAttribute("courseList", progressList);
		return "courses";
	}

	@GetMapping(value = "/subcription/{subId}")
	public String showPaymentForm(@PathVariable("subId") int cid, Model m) {
		PriceCardDTO priceBean = courserepo.getDuration(cid);
		m.addAttribute("priceBean", priceBean);
		String[] arrayDu = priceBean.getDuration().split("\\s");
		int time = Integer.parseInt(arrayDu[0]);
		LocalDate startDate = LocalDate.now();
		m.addAttribute("startDate", startDate);
		String sTime = arrayDu[1];
		if (sTime.equals("month") || sTime.equals("months")) {
			LocalDate endDate = startDate.plusMonths(time);
			m.addAttribute("endDate", endDate);
		} else if(sTime.equals("year") || sTime.equals("years")) {
			LocalDate endDate = startDate.plusYears(time);
			m.addAttribute("endDate", endDate);
		}else {
			LocalDate endDate = startDate.plusDays(time);
			m.addAttribute("endDate", endDate);
		}
		 m.addAttribute("showModal", true);
		return "subscription";
	}

	
	  @ModelAttribute("paymentbean") 
	  public PaymentDTO getPaymentBean() {
	  PaymentDTO payBean = new PaymentDTO(); 
	  return payBean; 
	  }
	 

	//for subscription methtod
		 @PostMapping(value = "/subscribe")
			public String subscribe(@ModelAttribute("paymentbean") PaymentDTO bean, Model m) {
			    int subscriptionId = bean.getSubId();
			    double subAmount = courserepo.getSubscribeAmount(subscriptionId);
			    m.addAttribute("subAmount",subAmount);
			    String paymentMethod = bean.getPaymentMethod();
			    m.addAttribute("paymentMethod",paymentMethod);
				int result = courserepo.addSubscriptionPlan(bean);
				m.addAttribute("result", result);			
				return "paymentResultForm";
			}
	
	@GetMapping(value = "showcourses")
	public String showall(Model m, HttpSession session) {

		List<CoursesBean> courseLst = new ArrayList<>();
		courseLst = courserepo.getCourses();
		m.addAttribute("courseLst", courseLst);
		return "showallcourses";

	}

	@GetMapping(value = "addcourse")
	public ModelAndView addcourse() {
		return new ModelAndView("addcourse", "coursebean", new CoursesBean());
	}

	@PostMapping(value = "savecourse")
	public String saveCourse(@ModelAttribute("coursebean") CoursesBean coursebean) {
		MultipartFile image = coursebean.getCourseImage();
		String UPLOAD_DIRECTORY = "D:\\JWD51\\ELearningProject\\src\\main\\webapp\\resources\\images\\courses";
		String filename = image.getOriginalFilename();
		System.out.println(UPLOAD_DIRECTORY + " " + filename);

		if (!image.isEmpty()) {
			try {
				// Convert MultipartFile to byte array
				byte[] photoBytes = image.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(UPLOAD_DIRECTORY + File.separator + filename)));
				stream.write(photoBytes);
				stream.flush();
				stream.close();
				String url = UPLOAD_DIRECTORY + File.separator + filename;
				int index = url.indexOf("resources");
				String extractedPath = index >= 0 ? url.substring(index) : "did when it was false.";
				coursebean.setCourseImagePath(extractedPath);
			} catch (IOException e) {
				System.out.println("save courseimage: " + e.getMessage());
				return "errorPage"; // Redirect to an error page
			}
		}

		int result = courserepo.insertcourse(coursebean);

		return "redirect:showcourses";

	}

	@GetMapping(value = "updateCourse")
	public ModelAndView updatecourse(@RequestParam("cid") int courseId, Model m) {
		CoursesBean cbean = courserepo.getOneCourse(courseId);
		m.addAttribute("cbean", cbean);
		return new ModelAndView("updateCourse", "courseUpdateBean", new CoursesBean());

	}

	@PostMapping(value = "saveupdatecourse")
	public String savecourse(@ModelAttribute("courseUpdateBean") CoursesBean coursebean) {

		MultipartFile image = coursebean.getCourseImage();
		String UPLOAD_DIRECTORY = "D:\\PFC online class\\EclipseWorkspace\\ELearningProject\\src\\main\\webapp\\resources\\images\\logoimg";
		String filename = image.getOriginalFilename();
		System.out.println(UPLOAD_DIRECTORY + " " + filename);

		if (!image.isEmpty()) {
			try {
				// Convert MultipartFile to byte array
				byte[] photoBytes = image.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(UPLOAD_DIRECTORY + File.separator + filename)));
				stream.write(photoBytes);
				stream.flush();
				stream.close();
				String url = UPLOAD_DIRECTORY + File.separator + filename;
				int index = url.indexOf("resources");
				String extractedPath = index >= 0 ? url.substring(index) : "did when it was false.";
				coursebean.setCourseImagePath(extractedPath);
			} catch (IOException e) {
				System.out.println("save courseimage: " + e.getMessage());
				return "errorPage"; // Redirect to an error page
			}
		}

		int result = courserepo.updatecourse(coursebean);

		if (result > 0) {
			System.out.println("update success!!");
		} else {
			System.out.println("update fail!!");
		}
		return "redirect:showcourses";

	}

	@GetMapping(value = "deletecourse")
	public String deleteCourse(@RequestParam("cid") int courseId) {
		int result = 0;
		result = courserepo.delete(courseId);

		if (result > 0) {
			System.out.print("delete success!!");
		} else {
			System.out.print("delete fail!!");
		}

		return "redirect:showcourses";

	}
}
