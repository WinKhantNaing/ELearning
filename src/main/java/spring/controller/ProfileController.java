package spring.controller;

import java.util.List;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

import spring.model.CommentDto;
import spring.model.CoursesBean;
import spring.model.CurrentPlanDTO;
import spring.model.LoginBean;
import spring.model.PaySubBean;

import spring.model.ProfileDto;
import spring.model.UserBean;
import spring.repository.CoursesRepository;
import spring.repository.UserRepository;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	UserRepository userrepo;

	// FOR MA MYO LAE OO(show course subscription plan history)

	@GetMapping(value = "/profiledetail")
	public ModelAndView profile(HttpSession session, Model m) {
		int id = (int) session.getAttribute("sessionId");

		List<CoursesBean> lstUserCourse = new ArrayList<CoursesBean>();
		lstUserCourse = userrepo.getCompleteCourses(id);
		m.addAttribute("lstUserCourse", lstUserCourse);

		ProfileDto user = userrepo.profileUser(id);
		m.addAttribute("user", user);
		int i = userrepo.levelCount(id);
		String level = null;
		if (i >= 0 && i <= 10) {
			level = "Bronze";
		} else if (i >= 11 && i <= 20) {
			level = "Silver";
		} else if (i >= 21 && i <= 30) {
			level = "Gold";
		} else if (i >= 31 && i <= 40) {
			level = "Platinum";
		} else if (i >= 41 && i <= 50) {
			level = "Diamond";
		}
		m.addAttribute("level", level);
		boolean status = userrepo.checkPayment(id);
		String subscription = null;
		if (status == true) {
			subscription = "Premium User";
		} else {
			subscription = "Free User";
		}
		m.addAttribute("subscription", subscription);

		ModelAndView mv = new ModelAndView("profile", "pbean", new ProfileDto());
		return mv;
	}

	@ModelAttribute("usercount")
	public Integer userCount() {
		int i = userrepo.userCount();
		return i;

	}

	@ModelAttribute("subusercount")
	public Integer subUserCount() {
		int i = userrepo.subUserCount();
		return i;

	}

	@ModelAttribute("feedbackcount")
	public Integer feedBackCount() {
		int i = userrepo.feedBackCount();
		return i;

	}

	@PostMapping(value = "/changeusername")
	public String changeName(@ModelAttribute("user") UserBean bean, HttpSession session) {
		int userId = (int) session.getAttribute("sessionId");
		userrepo.updateName(userId, bean.getUserName());

		return "redirect:profiledetail";
	}

	@PostMapping(value = "/changeemail")
	public String changeEmail(@ModelAttribute("user") UserBean bean, HttpSession session) {
		int userId = (int) session.getAttribute("sessionId");
		userrepo.updateEmail(userId, bean.getUserEmail());

		return "redirect:profiledetail";
	}

	/*
	 * @PostMapping(value = "/checkcurrentpassword") public String
	 * checkCurrentPassword(@ModelAttribute("user") UserBean user, HttpSession
	 * session, Model m) { int userId = (int) session.getAttribute("sessionId");
	 * boolean result = userrepo.checkCurrentPassword(userId, user.getPassword());
	 * m.addAttribute("result", result); }
	 */

	@ModelAttribute("payDescription")
	public List<PaySubBean> getPaymentDescription(HttpSession session, Model m) {
		int id = (int) session.getAttribute("sessionId");
		List<PaySubBean> payList = new ArrayList<PaySubBean>();
		payList = userrepo.getUserHistoryPlan(id);
		return payList;
	}

	@ModelAttribute("recentcomments")
	public List<CommentDto> getRecentComments() {
		List<CommentDto> commentList = new ArrayList<CommentDto>();
		commentList = userrepo.recentComments();
		return commentList;
	}

	@ModelAttribute("currentsub")
	public List<CurrentPlanDTO> currentSubPlan(HttpSession session, Model m) {
		int id = (int) session.getAttribute("sessionId");
		List<CurrentPlanDTO> currentPayList = new ArrayList<CurrentPlanDTO>();
		currentPayList = userrepo.getCurrentPlan(id);
		return currentPayList;

	}

	@PostMapping(value = "/profilePhoto")
	public String showphoto(@ModelAttribute("pbean") ProfileDto photo, HttpSession session) {
		int id = (int) session.getAttribute("sessionId");
		int result = userrepo.insertPhoto(photo, id);
		if (result > 0) {
			System.out.println("profile photo upload success.");
		} else {
			System.out.println("profile photo upload fail.");
		}
		return "redirect:profiledetail";
	}

	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@ModelAttribute("ufbean")
	public ProfileDto editProfile(HttpSession session) {
		int id = (int) session.getAttribute("sessionId");
		ProfileDto ufbean = userrepo.selectOne(id);
		return ufbean;

	}

	@PostMapping(value = "updateprofile")
	public String profileUpdate(@ModelAttribute("ufbean") ProfileDto pbean, HttpSession session) {
		System.out.println("entered!");
		int result = userrepo.updateProfile(pbean);
		if (result > 0) {
			System.out.println("profile update success.");
		} else {
			System.out.println("profile update fail.");
		}
		return "redirect:profiledetail";
	}
	/*
	 * @GetMapping(value="profileedit") public ModelAndView
	 * editProfile(@ModelAttribute("pbean") PhotoDto pbean) { return new
	 * ModelAndView("profile","pbean", new PhotoDto());
	 * 
	 * }
	 */

	@ModelAttribute("user")
	public UserBean use() {
		return new UserBean();
	}
}
