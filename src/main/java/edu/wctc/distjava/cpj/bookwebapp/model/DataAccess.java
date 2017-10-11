package edu.wctc.distjava.cpj.bookwebapp.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface DataAccess {

     public abstract void closeConnection() throws SQLException;

    
    public int deleteRecordById(String tableName, String pkColName, 
            Object pkValue) throws ClassNotFoundException, 
            SQLException;
    
     public List<Map<String, Object>> getAllRecords(String tableName, int maxRecords) throws SQLException, ClassNotFoundException;

     public abstract void openConnection(String driverClass, 
            String url, String userName, String password) 
            throws ClassNotFoundException, SQLException;
     
      public int createRecord(String tableName, List<String> colNames, 
            List<Object> colValues)throws SQLException;
    
}
