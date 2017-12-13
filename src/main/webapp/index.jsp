

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Web Application</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <h3>Pick a Task</h3>
        <ul>
            <li><a href="authorController?action=displayList">View all Authors</a></li>
            <li><a href="bookController?action=displayList">View all Books</a></li>
            
            
        </ul>
         <sec:authorize access ="hasAnyRole('ROLE_MGR')">
        <h1>For managers only</h1>
         </sec:authorize>
        
        <sec:authorize access ="hasAnyRole('ROLE_MGR','ROLE_USER')">
            Log In as: <sec:authentication property="principal.username"></sec:authentication>::
           <a href='<%= this.getServletContext().getContextPath() + "/j_spring_security_logout"%>'>Log Me Out</a>
            </sec:authorize>
    </body>
</html>
