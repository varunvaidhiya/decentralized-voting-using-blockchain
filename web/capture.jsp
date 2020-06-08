<%-- 
    Document   : capture
    Created on : Apr 3, 2020, 12:06:38 AM
    Author     : varun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-4.4.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <style>
        div{
         align-content: center; 
        }
        </style>
    <hr>
    <body style="background-color: #DCDCDC; text-align: center;">
        
        <form action="captureprocess.jsp" name ="RegisterFingure" method="post" action="">
            <fieldset id="fieldsetcss">
                <legend id="legendcss">REGISTER YOUR BIOMETRIC DATA</legend>
                <div class="form-inline">
                    <label>VoterName</label>
                    <input type="text" name="username" class="form-control" placeholder="Enter your name" >
                </div>
                <br>
                 <div class="form-inline">
                    <label>Private  key</label>
                    <input type="password" name="privatekey" class="form-control" placeholder="scan your qr">
                </div>
                <br>
                
                    PLACE YOUR FINGER IN THE SCANNER AND CLICK <input type="submit" name="submit" value="Capture">
                    <br>
           ALREADY REGISTERED?  <a href="compare.jsp">verify fingerprint for voting</a>
            </fieldset>
        </form>
        <hr>
    </body>
</html>
