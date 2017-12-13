<%-- 
    Document   : addBook
    Created on : Oct 17, 2017, 6:45:22 PM
    Author     : CPerera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="edu.wctc.distjava.cpj.bookwebapp.model.Book"%>
<%@page import="edu.wctc.distjava.cpj.bookwebapp.model.Author"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Book Information</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <h3>Add Book Information</h3>
        <form id="add" name="bookForm" value="" method = "POST" action ="bookController?action=SaveOrCancel&rec=new">
            <input type="hidden" name="bookId" value="${book.bookId}">
            <table class="table-striped" border="1">
                <tr>
                    <td class="row">Book title : </td>
                    <td> <input type ="text" name="bTitle" value="${book.title}"</td>
                </tr>

                <tr>
                    <td class="row">ISBN :</td>
                    <td> <input type ="text" name="bIsbn" value="${book.isbn}"/></td>
                </tr>

                 <tr>
                            <td>Author : </td>
                            <td>
                                <select name="bAuthorId" size="1" width="30">
                                    <c:forEach var="b" items="${authorList}">
                                        <option value="${b.authorId}" selected="">
                                            ${b.authorName}
                                        </option>
                                    </c:forEach>                                       
                                </select>
                            </td>
                        </tr>
                
            </table>
                <br> 
            <input type ="hidden" name="Id" value="">

            <button class=btn-info" type ="submit" name ="button_action" value="Save">Save</button>
            <button class=btn-info" type ="submit" name ="button_action" value="Cancel">Cancel</button>
            
   </form>
    </body>
</html>
