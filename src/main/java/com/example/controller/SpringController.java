package com.example.controller;

import com.example.entity.Book;
import com.example.repository.BookMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/register")
    public String registerGet(){
        return "register";
    }

    @PostMapping("/register")
    public String registerPost(Book book){  // 파라미터 수집이 자동으로 된다. //@RequestBody는 JSON일때
        bookMapper.registerBook(book);
        return "redirect:/list";
    }

    @GetMapping("/get/{num}")
    public String get(@PathVariable int num, Model model){
        Book book = bookMapper.get(num);

        model.addAttribute("book", book);

        return "get";

    }

    @GetMapping("/remove/{num}")
    public String remove(@PathVariable int num){
        bookMapper.remove(num);
        return "redirect:/list";
    }

    @GetMapping("/update/{num}")
    public String updateGet(@PathVariable int num, Model model){
        Book book = bookMapper.get(num);
        model.addAttribute("book", book);
        return "update";

    }

    @PostMapping("/update")
    public String updatePost(Book book){
        bookMapper.update(book);

        return "redirect:/get/" + book.getNum();
    }

}
