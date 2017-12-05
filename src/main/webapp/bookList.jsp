

<%@page import="java.util.List"%>
<%@page import="edu.wctc.distjava.cpj.bookwebapp.model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book List</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class ="wrapper">
            <div class="page-header">
                <h3>Book List</h3>
            </div>
            <div class="row col-md-5">
                <table  class ="table table-striped table-hover">
                    <thead class="table-active">
                        <tr>
                        <th>Book ID</th>
                        <th>Book Title</th>
                        <th>ISBN</th>
                        <th>Author</th>
                        </tr>
                    </thead>
                    <c:forEach var="b" items="${bookList}">
                        <tr>
                                            
                            <td>${b.bookId}</td>
                            <td>${b.title}</td>
                            <td>${b.isbn}</td>
                            <td>${b.author.authorName}</td>
                            <td><button class="btn btn-danger" type="submit" value="Delete" class="warning"
                                        onclick="location.href = 'bookController?action=Delete&bookId=${b.bookId}'"> Delete</button></td>
                                        
                           <td> <button class="btn btn-info" type="submit" value="Edit"
                                        onclick="location.href = 'bookController?action=Edit&bookId=${b.bookId}'">Edit</button></td>
                        </tr>

                    </c:forEach>
                </table> 

                <button class="btn btn-default" type="submit" value="Add Book" onclick="location.href = 'bookController?action=Add'">Add Book</button>
            </div>
        </div>
    </body>
</html>
