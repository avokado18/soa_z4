package com.soa.z4.controller;

import com.soa.z4.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/users/list", method = GET)
    public String list(ModelMap modelMap) {
        modelMap.addAttribute("users", userService.getAll());
        return "list";
    }

}
