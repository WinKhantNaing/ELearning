package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping(value = "/")
	public String home() {
		return "subscription";
	}
	
	@GetMapping(value = "/adduser")
	public String addUser() {
		return "adduser";
	}
	
	@GetMapping(value = "/addcourse")
	public String addCourse() {
		return "addcourse";
	}
}
