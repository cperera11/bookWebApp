<%-- 
    Document   : header
    Created on : Oct 19, 2017, 6:31:39 PM
    Author     : CPerera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<div class="page-header">
    
    <h2 style="text-align: center; color:blue"> Best Authors: Best Books</h2>
   <button class="btn btn-default" type="submit" value="Home" onclick="location.href = 'authorController?action=home'">Home</button>
    
    
</div>