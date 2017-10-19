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
        <div class="page-header">
        <h2>Edit Author Information</h2>
        </div>
        <form id="edit" name="formType "value="" method = "POST" action ="authorController?action=update&formType=recEdit">
            <div class="row col-md-4">
                <table  class ="table table-striped ">
                
                 <tr>
                    <td>
                       <input type ="hidden" name="authorId" value="${authorRec.authorId}"> 
                    </td>
                </tr>
                <tr>
                    <td class="col-sm-3" style="background-color:gainsboro;">Author Name: </td>
                    <td class="col-sm-4" style="background-color:beige;"> <input type ="text" name="authorName" value="${authorRec.authorName}"</td>
                </tr>
                
                <tr>
                    <td class="col-sm-3" style="background-color:gainsboro;">Date Added: </td>
                    <td class="col-sm-4" style="background-color:beige;"> <input type ="text" name="dateAdded" value="${authorRec.dateAdded}" readonly=""</td>
                </tr>
            </table>
            </div>

          
               
            <button type ="submit" name ="buttonAction" value="Save">Save</button>
            <button type ="submit" name ="buttonAction" value="Cancel">Cancel</button>
        </form>
    </body>
</html>
