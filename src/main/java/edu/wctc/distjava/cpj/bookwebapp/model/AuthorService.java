package edu.wctc.distjava.cpj.bookwebapp.model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Stateless
public class AuthorService implements Serializable {

    private static final long serialVersionUID = 1L;

    private final String AUTHOR_TBL = "author";
    private final String AUTHOR_PK = "author_id";

    @PersistenceContext(unitName = "book_PU")
    private EntityManager em;

    public AuthorService() {
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    public int removeAuthorById(String id) throws Exception {
        Integer value = Integer.parseInt(id);

        String jpql = "delete from Author a where a.authorId = :id";
        Query q = getEm().createQuery(jpql);
        q.setParameter("id", value);
        return q.executeUpdate();
    }

    public List<Author> getAuthorList()
            throws Exception {

        String jpql = "select a from Author a";
        TypedQuery<Author> q = getEm().createQuery(jpql, Author.class);
        return q.getResultList();

    }

    public void addAuthor(List<Object> colValues) throws Exception {

        Author author = new Author();
        author.setAuthorName(colValues.get(0).toString());
        author.setDateAdded(new Date());
        getEm().persist(author);
    }

    public void updateAuthorById(List<Object> colValues, String id) throws ParseException {
//        String jpql = "UPDATE Author a SET a.authorName = colValues.get(0) WHERE a.id = :id";
//        Query q = getEm().createQuery(jpql);
//        q.setParameter("id", new Integer(id));
//        return  q.executeUpdate();

        Author author = getEm().find(Author.class, new Integer(id));
        author.setAuthorName(colValues.get(0).toString());
//        author.setDateAdded(getFormattedDate(colValues.get(1).toString()));
        getEm().merge(author);

    }

    public final Author findAuthor(String id) throws Exception {
         Author author = getEm().find(Author.class, new Integer(id));
        return author;
    }

    public String getCurrentDate() {
        String date = new SimpleDateFormat("yyyy.MM.dd")
                .format(new Date());
        return date;
    }

    public final Date getFormattedDate(String date) throws ParseException {
        Date fmtDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        return fmtDate;
    }

}
