/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.wctc.distjava.cpj.bookwebapp.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author CPerera
 */
@Stateless
public class BookService extends AbstractFacade<Book> {

    @PersistenceContext(unitName = "book_PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BookService() {
        super(Book.class);
    }
    
     public void addOrUpdateBook(String bookId, String title, String isbn, String authorId) {

        Book book;
        if (bookId == null || bookId.isEmpty()) {
            //for a new record
            book = new Book();
            
        } else {
            //for a record to be updated
            book = new Book(new Integer(bookId));
        }

        book.setTitle(title);
        book.setIsbn(isbn);
        Author author = getEntityManager().find(Author.class, new Integer(authorId));
        book.setAuthor(author);

        getEntityManager().merge(book);
    }
    
    public void deleteById(String bookId){
          Book book = getEntityManager().find(Book.class, new Integer(bookId));
          remove(book);
    }
    
    public Book findBook(String bookId){
        int id = new Integer(bookId);
        return getEntityManager().find(Book.class, id);
    }
    
    
}
