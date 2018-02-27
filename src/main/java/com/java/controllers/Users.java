package com.java.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.models.Role;
import com.java.models.User;
import com.java.services.UserService;
import com.java.validator.UserValidator;

@Controller
public class Users {
    
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserValidator userValidator;
	
    @RequestMapping("/registration")
    public String registerForm(Principal principal, @Valid @ModelAttribute("user") User user, Model model) {    	
    	model = isLoggedIn(principal, model);
        return "registrationPage";
    }
    
    @PostMapping("/registration")
    public String registration(Principal principal, @Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
    	model = isLoggedIn(principal, model);
    	userValidator.validate(user, result);
        if (result.hasErrors()) {
        	model.addAttribute("hasErrors", "hasErrors");
            return "registrationPage";
        }else {
        	model.addAttribute("hasErrors", "");
			userService.saveWithUserRole(user);
			//userService.saveUserWithAdminRole(user);
			return "redirect:/login";
        }        
      
    }
    
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {      
        model = isLoggedIn(principal, model);
        return "adminPage";
    }
    
    @RequestMapping("/login")
    public String login(Principal principal, @RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        model = isLoggedIn(principal, model);
        return "loginPage";
    }
    
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model) {
    	model = isLoggedIn(principal, model);
        return "homePage";
    }
    
    @RequestMapping("/index")
    public String index(Principal principal, Model model) {
    	model = isLoggedIn(principal, model);
        return "index";
    }
    
	@GetMapping("/shoppingCart")
	public String shoppingCart(Principal principal, Model model) {
    	model = isLoggedIn(principal, model);    	
		return "regular-user/shoppingCart";
	}
	
	public Model isLoggedIn(Principal principal, Model model) {

    	if(principal != null) {
    		String username = principal.getName();
    		User currentUser = userService.findByUsername(username);    
    		if(isAdmin(currentUser)) {
    			model.addAttribute("currentUserRole", "admin");
    		}else {
    			model.addAttribute("currentUserRole", "regular");
    		}
    		model.addAttribute("currentUser", currentUser.getUsername());
    	}else {
    		//System.out.println("Curretn user is null ");
    		model.addAttribute("currentUser", "");
    	}
		return model;
	}
	
	public boolean isAdmin(User currentUser) {
		boolean userIsAdmin = false;
		List<Role> userRoles = currentUser.getRoles();
		for(Role role: userRoles) {			
			if(role.getName().equals("ROLE_ADMIN")) {
				userIsAdmin = true;
			}
		}
		
		return userIsAdmin;
	}
}