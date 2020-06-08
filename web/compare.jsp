<%-- 
    Document   : compare
    Created on : Apr 2, 2020, 10:35:42 PM
    Author     : varun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-4.4.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compare</title>
    </head>
    <hr size="3" noshade>
    <body style="background-color: #FFEFD5; text-align: center;">
      
     <form action="compareprocess.jsp" name ="RegisterFingure" method="post" action="">
            <fieldset id="fieldsetcss">
                <legend id="legendcss">VERIFY YOUR FINGERPRINT</legend>
                
                 <div class="form-inline">
                    <label>Private  key</label>
                    <input align="center" type="password" name="privatekey" class="form-control" placeholder="scan your qr">
                </div>
                <br>
                    PLACE YOUR FINGER IN THE SCANNER AND CLICK <input type="submit" name="submit" value="VERIFY">
                    <br>
           NOT REGISTERED?  <a href="capture.jsp">Register fingerprint for voting</a>
            </fieldset>
        </form>
    </body>
    <hr size="3" noshade>
    
</html>