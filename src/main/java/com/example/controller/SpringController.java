package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpringController {

    @RequestMapping("/spring")
    public String index(Model model){
        model.addAttribute("message", "Spring Boot Application");
        return "start";
    }

}
