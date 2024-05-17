package com.example.controller;

import com.example.entity.Book;
import com.example.repository.BookMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class SpringRestController {

    private final BookMapper bookMapper;

    @RequestMapping("/restList")
    public List<Book> rest() {
        List<Book> list = bookMapper.bookList();
        return list;
    }

    @PostMapping("/restSave")
    public String saveBook(@RequestBody Book book) {

        bookMapper.saveBook(book);

        return "success";
    }

}
