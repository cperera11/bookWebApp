

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
            <h3>Author List</h3>
            <input type="button" class="btn" value="Add" onclick="location.href = 'ac?action=Add'">
            <table class="tabe table-striped table-bordered table-hover table-condensed">
                <thead>
                    <tr>
                        <th>Author Name</th>
                        <th>Date Added</th>
                        <th>BookList</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="a" items="${authorList}">
                        <tr>
                            <td class="col-xs-12 col-sm-6 col-md-8">${a.authorName}</td>
                            <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${a.dateAdded}" /></td>
                            <td></td>
                            <td><input type="button" class="btn-warning" value="Edit" onclick="location.href = 'ac?action=Edit&id=${a.authorId}'"></td>
                            <td><input type="button" class="btn-danger" value="Delete" onclick="location.href = 'ac?action=Delete&id=${a.authorId}'"></td>
                        </tr>
                    </c:forEach>
                </tbody>    
            </table>
            <input type="button" class="btn" value="Add" onclick="location.href = 'ac?action=Add'">
            <input type="button" class="btn-danger" value="Add New Book" onclick="location.href = 'bc?action=Add&id'">
        </div>     
    </body>
</html>
