

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
            <div class ="wrapper">
        <h2>Author List</h2>
        <div class="row col-md-6">
        <table  class ="table table-bordered table-condensed">
            <c:forEach var="a" items="${authorList}">
                <tr>
                    <td class="span2">${a.authorId}</td>                   
                    <td class="span6">${a.authorName}</td>
                    <td class="span2"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${a.dateAdded}" /></td>
                    <td><button class="btn btn-danger" type="submit" value="Delete" class="btn-info"
                                     onclick="location.href = 'authorController?action=delete&authorId=${a.authorId}'"> Delete</button></td>
                    <td class="span1"><button type="submit" value="Edit" class="btn-primary"
                                     onclick="location.href = 'authorController?action=edit&authorId=${a.authorId}'">Edit</button></td>
                </tr>

            </c:forEach>
        </table> 
        
        <button class="btn-primary" type="submit" value="Add" onclick="location.href = 'authorController?action=add'">Add</button>

        </div>
    </div>
    </body>
</html>
