<%-- 
    Document   : addAuthor
    Created on : Oct 17, 2017, 6:45:22 PM
    Author     : CPerera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Author Information</title>
    </head>
    <body>
        <div class="container">
            <h3>Add Author Name</h3>
            <form name="author" method="POST" action="ac?action=SaveCancel&rec=new">
                <div style="border:5px;">                       
                    <table class="tabe table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <td>Author Name : </td>
                            <td class="col-xs-12 col-sm-6 col-md-8"><input type="text" maxlength=46 class="form-control" placeholder="Author Name" name="aName" value="${author.authorName}"></td>
                        </tr>
                        <tr>
                            <td>Date Added  : </td>
                            <td><input type="text" class="form-control" placeholder="Date Added" name="aDateAdded" value="${date}" readonly></td>
                        </tr>
                    </table>                        
                    <p><button name="button_action" type="submit" value="Save">Save</button>
                       <button name="button_action" type="submit" value="Cancel">Cancel</button></p>
                </div>
            </form>
        </div>
    </body>
</html>
