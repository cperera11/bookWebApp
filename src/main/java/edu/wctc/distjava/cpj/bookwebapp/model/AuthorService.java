package edu.wctc.distjava.cpj.bookwebapp.model;

import java.io.Serializable;
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

    public final int removeAuthorById(String id) throws Exception {
//        String jpql = "delete from Author a where a.authorId = :id";
//        Query q = getEm().createQuery(jpql);
//        q.setParameter("id", new Integer(id));
        return 0;
    }

    public List<Author> getAuthorList()
            throws Exception {

        String jpql = "select a from Author a";
        TypedQuery<Author> q = getEm().createQuery(jpql, Author.class);
        return q.getResultList();

    }

    public int addAuthor(List<Object> colValues) throws Exception {

        return 0;
    }

    public int updateAuthorById(String id) {
//        String jpql = "UPDATE Author a SET a.authorName = (a.authorName) where a.id = :id";
//        Query q = getEm().createQuery(jpql);
//        q.setParameter("id", new Integer(id));
        return 0;

    }

    public final List<Author> findAuthor(String id) throws Exception {
//        String jpql = "select a from Author a where a.authorId = :id";
//        TypedQuery<Author> q = getEm().createQuery(jpql, Author.class);
        return null;
    }

    public String getCurrentDate() {
        String date = new SimpleDateFormat("yyyy.MM.dd")
                .format(new Date());
        return date;
    }

}
