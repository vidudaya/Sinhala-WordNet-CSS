package org.sinhala.wordnet.css.web.controller;

import org.sinhala.wordnet.css.model.wordnet.NounSynset;
import org.sinhala.wordnet.css.web.model.CustomUserDetailsService;
import org.sinhala.wordnet.css.web.model.User;
import org.sinhala.wordnet.wordnetDB.core.UserDBHandler;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/SignUp")
public class UserController {
	
	@RequestMapping(method = RequestMethod.GET, params = "action=Register")
    public String showSignUp(ModelMap model) {
		
		User user = new User();
		model.addAttribute("user", user);
		
        return "auth/signup";
    }
	
	@RequestMapping(method = RequestMethod.POST)
	public String SignUp(@ModelAttribute User user,
			ModelMap model) {
		
		
		
		org.sinhala.wordnet.wordnetDB.model.User mongoUser = new org.sinhala.wordnet.wordnetDB.model.User(user.getUsername(), user.getPassword(), user.getFirstName(), user.getLastName());
		System.out.println("fname"+user.getFirstName()+"lname"+user.getLastName()+"uname"+user.getUsername()+"pass"+user.getPassword());
		//UserDBHandler userHandler = new UserDBHandler();
		//userHandler.addUser(mongoUser);
		
		CustomUserDetailsService cuds = new CustomUserDetailsService();
		cuds.addUserDetail(user);
		
        return "home";
    }
	
	

}
