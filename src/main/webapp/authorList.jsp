

<%@page import="java.util.List"%>
<%@page import="edu.wctc.distjava.cpj.bookwebapp.model.Author"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Author List</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class ="wrapper">
            <div class="page-header">
                <h3>Author List</h3>
            </div>
            <div class="row col-md-5">
                <table  class ="table table-striped table-hover">
                    <thead class="table-active">
                        <tr>
                            
                            <th>Author Name</th>
                            <th>Date Added</th>
                            <th>Book List</th>
                         </tr>
                    </thead>
                    <c:forEach var="a" items="${authorList}">
                        <tr>
                                            
                            <td>${a.authorName}</td>
                            <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${a.dateAdded}" /></td>
                            <td></td>
                            <td><button class="btn btn-danger" type="submit" value="Delete" class="warning"
                                        onclick="location.href = 'authorController?action=Delete&Id=${a.authorId}'"> Delete</button></td>
                                        
                           <td> <button class="btn btn-info" type="submit" value="Edit"
                                        onclick="location.href = 'authorController?action=Edit&Id=${a.authorId}'">Edit</button></td>
                        </tr>

                    </c:forEach>
                </table> 

                <button class="btn btn-default" type="submit" value="Add Author" onclick="location.href = 'authorController?action=Add'">Add Author</button>
                <button class="btn btn-default" type="submit" value="Add Book" onclick="location.href = 'bc?action=Add&id'">Add Book</button>
            </div>
        </div>
    </body>
</html>
