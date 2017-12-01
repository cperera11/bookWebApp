

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
        <div class="container">
            <h3>Book List</h3>
            <input type="button" class="btn" value="Add" onclick="location.href = 'bc?action=Add'">
            <table class="tabe table-striped table-bordered table-hover table-condensed">
                <thead>
                    <tr>
                        <th>Book ID</th>
                        <th>Book Title</th>
                        <th>ISBN</th>
                        <th>Author</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${bookList}">
                        <tr>
                            <td>${b.bookId}</td>
                            <td class="col-xs-12 col-sm-6 col-md-6">${b.title}</td>
                            <td>${b.isbn}</td>
                            <td>${b.author.authorName}</td>
                            <td><input type="button" class="btn-warning" value="Edit" onclick="location.href = 'bc?action=Edit&bId=${b.bookId}'"></td>
                            <td><input type="button" class="btn-danger" value="Delete" onclick="location.href = 'bc?action=Delete&bId=${b.bookId}'"></td>
                        </tr>
                    </c:forEach>
                </tbody>    
            </table>
            <input type="button" class="btn" value="Add" onclick="location.href = 'bc?action=Add'">
        </div>     
    </body>

</html>
