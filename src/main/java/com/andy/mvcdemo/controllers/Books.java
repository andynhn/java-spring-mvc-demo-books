package com.andy.mvcdemo.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.andy.mvcdemo.models.Book;
import com.andy.mvcdemo.services.BookService;


@RestController
public class Books {
	private final BookService bookService;	//tells us that we are going to be using a bookService and that it will not be changing. It allows us to call the methods in the Book Repository. Then we use dependency injection to make it available in our controller.
	public Books(BookService bookService) {
		this.bookService = bookService;
	}
	@RequestMapping("/api/books")
	public List<Book> index(){
		return bookService.allBooks();
	}
	@RequestMapping(value="/api/books", method=RequestMethod.POST)
	public Book create(@RequestParam(value="title") String title, @RequestParam(value="description") String description, @RequestParam(value="language") String language, @RequestParam(value="pages") Integer numberOfPages) {
		Book book = new Book(title, description, language, numberOfPages);
		return bookService.createBook(book);
	}
	@RequestMapping("/api/books/{id}")
	public Book show(@PathVariable("id") Long id) {
		Book book = bookService.findBook(id);
		return book;
	}
    @RequestMapping(value="/api/books/{id}", method=RequestMethod.PUT)
    public Book update(@PathVariable("id") Long id, @RequestParam(value="title") String title, @RequestParam(value="description") String description, @RequestParam(value="language") String language, @RequestParam(value="pages") Integer numberOfPages) {
        Book book = bookService.updateBook(id, title, description, language, numberOfPages);
        return book;
    }
    
    @RequestMapping(value="/api/books/{id}", method=RequestMethod.DELETE)
    public void destroy(@PathVariable("id") Long id) {
        bookService.deleteBook(id);
    }
}
