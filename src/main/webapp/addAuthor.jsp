<%-- 
    Document   : addAuthor
    Created on : Oct 17, 2017, 6:45:22 PM
    Author     : CPere
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Author Information</title>
    </head>
    <body>
        <h1>Add Author Information</h1>
        <form id="add" name="formType" value="" method = "POST" action ="authorController?action=update&formType=recAdd">
            <table border="1">
                <tr>
                    <td>Author Name</td>
                    <td> <input type ="text" name="authorName" value=""</td>
                </tr>

                <tr>
                    <td>Date Added</td>
                    <td> <input type ="text" name="dateAdded" value="${date_added}"  readonly/></td>
                </tr>

            </table>

            <input type ="hidden" name="Id" value="">

            <button type ="submit" name ="buttonAction" value="Save">Save</button>
            <button type ="submit" name ="buttonAction" value="Cancel">Cancel</button>
        </form>
    </body>
</html>
