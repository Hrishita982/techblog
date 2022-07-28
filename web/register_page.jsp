    <%-- 
    Document   : register_page
    Created on : 3 Apr, 2022, 11:33:23 AM
    Author     : Rishita jain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
         <!--css-->
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        
        <main class="secondary-background jumbotron" style="padding-bottom: 100px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card ">
                         <div class="card-header text-center secondary-background text-white">
                             <span class="fa fa-user-plus fa-3x"></span>
                             <br>
                             <p>Register here</p>
                         </div>
                         <div class="card-body">
                             <form id="reg-form" action="RegisterServlet" method="POST">
                                  <div class="form-group">
                                      <label for="username">Username</label>
                                      <input type="text" name="user_name" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter username">
                                      
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                  <div class="form-group">
                                      <label for="gender">Select Gender</label>
                                      <br>
                                      <input type="radio"  id="gender" name="user_gender" value="male"> Male
                                      <input type="radio"  id="gender" name="user_gender" value="female"> Female
                                    </div>
                                 
                                 <div class="form-group">
                                     <textarea name="user_about" class="form-control" cols="" rows="5" placeholder="Enter something about yourself"></textarea>
                                    </div>
                                 
                                    <div class="form-check">
                                      <input type="checkbox" name="user_check" class="form-check-input" id="exampleCheck1">
                                      <label class="form-check-label" for="exampleCheck1"> agree terms & conditions</label>
                                    </div>
                                    <br>
                                    <div class="container text-center " id="loader" style="display : none;">
                                        <span class="fa fa-circle-o-notch fa-spin fa-3x"></span>
                                    </div>
                                    <button  id="submit-btn" type="submit" class="btn secondary-background text-white">Submit</button>
                              </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
         <!--java script-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="js/myjavascript.js" type="text/javascript"></script>`  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $ (document).ready(function(){
                console.log("loaded...")
                
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    
                    let form=new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    // send register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function(data, textStatus, jqXHR) {
                            console.log(data)
                            
                             $("#submit-btn").show();
                             $("#loader").hide();
                             
                        if(data.trim () === 'done')
                        {
                             swal({
                                 title: " Registeration Successful ! ",
                                 text: " You are redirected to login page !",
                                 icon:"success"
                             } )
                            .then((value) => {
                                
                              window.location="login_page.jsp";
                            });

                        }
                        else
                        {
                            swal(data);
                        }

                        },
                        error: function(jqXHR, textStatus, errorThrown){
                            console.log(jqXHR);
                            
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal(  " Something went wrong ! "  );
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

    </body>
</html>
