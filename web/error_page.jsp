<%-- 
    Document   : error_page
    Created on : 5 Apr, 2022, 8:39:35 PM
    Author     : Rishita jain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error !</title>
        
        <!--css-->
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
    </head>
    <body>
        <div class="container text-center">
            <img src="img/warning.png" class="img-fluid" height="400px" width="250px">
            <h3 class="display-4 mt-4"> Sorry ! Something went wrong....</h3>
            <%= exception%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-4"><b> Home</b></a>
        </div>
    </body>
</html>
