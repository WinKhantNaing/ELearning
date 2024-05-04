package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import spring.model.UserBean;

@Controller
public class UserController {
   
    @GetMapping("/adduser")
    public String showAddUserForm(Model model) {
        
        model.addAttribute("user", new UserBean());
       
        return "addUserForm";
    }
}