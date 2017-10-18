package edu.wctc.distjava.cpj.bookwebapp.model;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;


public class AuthorService {
    private IAuthorDao authorDao;
    
    public AuthorService(IAuthorDao authorDao) {
        setAuthorDao(authorDao);
    }

    public final int removeAuthorById(String id) 
            throws ClassNotFoundException, SQLException, 
            NumberFormatException {
        
        if (id == null) {
            throw new IllegalArgumentException("id must be a Integer greater than 0");
        }
        
        Integer value = Integer.parseInt(id);

        return authorDao.removeAuthorById(value);
    }

    public List<Author> getAuthorList()
            throws SQLException, ClassNotFoundException {

        return authorDao.getListOfAuthors();
    }

   
    public int addAuthor(List<Object> colValues) throws SQLException, ClassNotFoundException{
        
        return authorDao.addAuthor(colValues);
    }
    
    public int updateAuthorById(List <Object> colValues, String id) throws SQLException, ClassNotFoundException{   
        return authorDao.updateAuthor(colValues, id);
    }

public Map<String, Object> findAuthor(String authorId) throws ClassNotFoundException, SQLException{
        int id = Integer.parseInt(authorId);   
        return (Map<String, Object>) authorDao.findAuthorById(id);
    }

    public void setAuthorDao(IAuthorDao authorDao) {
        this.authorDao = authorDao;
    }
 public IAuthorDao getAuthorDao() {
        return authorDao;
    }
 
 public String getCurrentDate(){
 String date = new SimpleDateFormat("yyyy.MM.dd")
         .format(new Date());
 return date;
 }
    
    public static void main(String[] args)
            throws SQLException, ClassNotFoundException {

        IAuthorDao dao = new AuthorDao(
                "com.mysql.jdbc.Driver",
                "jdbc:mysql://localhost:3306/book",
                "root", "admin",
                new MySqlDataAccess()
        );

        AuthorService authorService
                = new AuthorService(dao);
        
//        int recsDeleted = authorService.removeAuthorById("9");
//        System.out.println(" No. of authors deleted: " + recsDeleted);
        
//        int recsAdded = authorService.addAuthor(Arrays.asList("Dan Wilsan", "2017-7-18"));
//        System.out.println(" No. of authors added: " + recsAdded);
//        
        int recsUpdated = authorService.updateAuthorById(Arrays.asList("Charlet Power", "2017-01-14"), "3");
        System.out.println("No of authors updated: " + recsUpdated );
       
        
        List<Author> list = authorService.getAuthorList();

        for (Author a : list) {
            System.out.println(a.getAuthorId() + ", "
                    + a.getAuthorName() + ", " + a.getDateAdded() + "\n");
        }
        
        
        
        
        
        
    }
}
