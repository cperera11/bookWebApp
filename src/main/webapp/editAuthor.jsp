<%-- 
    Document   : editAuthor
    Created on : Oct 17, 2017, 6:41:02 PM
    Author     : CPerera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit author Page</title>
    </head>
    <body>
        <h1>Edit Author Information</h1>

        <form id="edit" name="formType "value="" method = "POST" action ="authorController?action=update&formType=recEdit">
            <table border="1">
                
                 <tr>
                    <td>
                       <input type ="text" name="authorId" value="${authorRec.get("author_id")}"> 
                    </td>
                </tr>
                <tr>
                    <td>Author Name</td>
                    <td> <input type ="text" name="authorName" value="${authorRec.get("author_name")}"</td>
                </tr>
                
                <tr>
                    <td>Date Added</td>
                    <td> <input type ="text" name="dateAdded" value="${authorRec.get("date_added")}" readonly=""</td>
                </tr>
              
            </table>
            
          
               
            <button type ="submit" name ="buttonAction" value="Save">Save</button>
            <button type ="submit" name ="buttonAction" value="Cancel">Cancel</button>
        </form>
    </body>
</html>
