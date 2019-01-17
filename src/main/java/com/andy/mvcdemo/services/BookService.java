package com.andy.mvcdemo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.andy.mvcdemo.models.Book;

import com.andy.mvcdemo.repositories.BookRepository;


@Service
public class BookService {
    // adding the book repository as a dependency
    private final BookRepository bookRepository;
    
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }
    // returns all the books
    public List<Book> allBooks() {
        return bookRepository.findAll();
    }
    // creates a book
    public Book createBook(Book b) {
        return bookRepository.save(b);	//.save comes with the CrudRepository that we imported.
    }
    // retrieves a book
    public Book findBook(Long id) {
        Optional<Book> optionalBook = bookRepository.findById(id);	//optional object that may or may not contain our book object.
        if(optionalBook.isPresent()) {	//call isPresent to see if the object exists.
            return optionalBook.get();
        } else {
            return null;
        }
    }
    // updates a book
    public Book updateBook(Long id, String title, String description, String language, Integer numberOfPages) {
    	Optional<Book> optionalBook = bookRepository.findById(id);
    	if(optionalBook.isPresent()) {
    		// add logic for update here
    		Book b = optionalBook.get();
    		b.setId(id);
    		b.setTitle(title);;
    		b.setDescription(description);
    		b.setLanguage(language);
    		b.setNumberOfPages(numberOfPages);
    		return bookRepository.save(b);	//.save comes with the CrudRepository. UpdatedAt is changed automatically
    	} else {
    		return null;
    	}
    }
    // deletes a book
    public void deleteBook(Long id) {
    	Optional<Book> optionalBook = bookRepository.findById(id);
    	if(optionalBook.isPresent()) {
    		//add logic for delete here
    		bookRepository.deleteById(id);	//goes to BookRepository and uses method DeleteById;
    	} else {
    		System.out.println("book does not exist");
    	}
    }
}
