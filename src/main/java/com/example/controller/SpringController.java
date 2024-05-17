package com.example.controller;

import com.example.entity.Book;
import com.example.repository.BookMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class SpringController {

    private final BookMapper bookMapper;


    @RequestMapping("/spring")
    public String index(Model model){
        model.addAttribute("message", "Spring Boot Application");
        return "template";
    }

    @RequestMapping("/list")
    public String list(Model model){

        List<Book> list = bookMapper.bookList();

        model.addAttribute("list", list);

        return "list";
    }

}
