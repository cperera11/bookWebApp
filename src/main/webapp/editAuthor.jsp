<%-- 
    Document   : editAuthor
    Created on : Oct 17, 2017, 6:41:02 PM
    Author     : CPerera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit author Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="page-header">
        <h3>Edit Author Information</h3>
        </div>
        <form id="edit" name="formType "value="" method = "POST" action ="authorController?action=SaveOrCancel&formType=recUpdate">
            <div class="row col-md-4">
                <table  class ="table table-striped ">
                
                 <tr>
                    <td>
                       <input type ="hidden" name="Id" value="${author.authorId}"> 
                    </td>
                </tr>
                <tr>
                    <td class="col-sm-3" style="background-color:gainsboro;">Author Name: </td>
                    <td class="col-sm-4" style="background-color:beige;"> <input type ="text" name="aName" value="${author.authorName}"></td>
                </tr>
                
                <tr>
                    <td class="col-sm-3" style="background-color:gainsboro;">Date Added: </td>
                    <td class="col-sm-4" style="background-color:beige;"> <input type ="text" name="aDateAdded" value = "<fmt:formatDate pattern = "yyyy-MM-dd" value="${author.dateAdded}"/>"  readonly=""></td>
                </tr>
            </table>
            <button class=btn-info" type ="submit" name ="button_action" value="Save">Save</button>
            <button class=btn-info" type ="submit" name ="button_action" value="Cancel">Cancel</button>
            </div>

            
        </form>
    </body>
</html>
