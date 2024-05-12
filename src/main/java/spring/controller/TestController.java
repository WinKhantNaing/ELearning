package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import spring.model.UserBean;

@Controller
public class TestController {

	@GetMapping(value = "/")
	public String home() {
		return "adduser";
	}

	@ModelAttribute("userbean")
	public UserBean userBean() {
		return new UserBean();
	}

}
