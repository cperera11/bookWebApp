/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.wctc.distjava.cpj.bookwebapp.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author CPere
 */
@Stateless
public class AuthorService extends AbstractFacade<Author> {

    @PersistenceContext(unitName = "book_PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AuthorService() {
        super(Author.class);
    }
    public void addAuthor(List<Object> colValues) throws Exception {
        Author author = new Author();
        author.setAuthorName(colValues.get(0).toString());
        author.setDateAdded(getDate(colValues.get(1).toString()));
        this.create(author);
    }
    
    /**
     *
     * @param colValues
     * @param id
     * @throws ParseException
     */
    public void updateAuthorById(List<Object> colValues, String id) throws ParseException{
        int authorId = Integer.parseInt(id);
        Author author = (Author) find(authorId);
        author.setAuthorName(colValues.get(0).toString());
//        author.setDateAdded(getDate(colValues.get(2).toString()));
        edit(author);  
    }
    
    public void removeAuthorById(String id) throws Exception {
        remove(find( new Integer(id)));
    }    


        public final Date getDate(String sDate) throws ParseException{
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
        return date;
    }
    
    public final String currentDate(){
        String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        return date;
    }
}
