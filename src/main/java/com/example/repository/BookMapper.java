package com.example.repository;

import com.example.entity.Book;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

    public List<Book> bookList();

    public void saveBook(Book book);

    public void registerBook(Book book);

    public Book get(int num);

    public void remove(int num);

    public void update(Book book);
}
