package edu.wctc.distjava.cpj.bookwebapp.model;

import java.sql.SQLException;
import java.util.List;


public interface IAuthorDao {

   public abstract int removeAuthorById(Integer id) throws ClassNotFoundException, SQLException;
   public abstract List<Author> getListOfAuthors() throws SQLException, ClassNotFoundException;
   public int addAuthor(List<String> colName, List<Object> colValues) throws ClassNotFoundException, SQLException;
    
}
