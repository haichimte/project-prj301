<%-- 
    Document   : change-forgotpassword
    Created on : Dec 7, 2023, 11:01:13 PM
    Author     : Thanh Hai
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style_1.css"/>
         <link href="path/to/bootstrap/css/bootstrap.min.css" rel="stylesheet">
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
       <section class="vh-100">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6 text-black">

        <div class="px-5 ms-xl-4">
          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
          <span class="h1 fw-bold mb-0">H-Store</span>
        </div>

        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

          <form  action="changepass" method="post"style="width: 23rem;">

            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Change-ForgotPaword</h3>

            <div class="form-outline mb-4">
              <input type="text" id="form2Example18" name="user" class="form-control form-control-lg" />
              <label class="form-label" for="form2Example18">User Name</label>
            </div>

            <div class="form-outline mb-4">
              <input type="password" id="form2Example28" name="newPassword" class="form-control form-control-lg" />
              <label class="form-label" for="form2Example28">Password</label>
            </div>
            <div class="form-outline mb-4">
              <input type="password" id="form2Example28" name="confirmPassword" class="form-control form-control-lg" />
              <label class="form-label" for="form2Example28">Re-Password</label>
            </div>
            <div class="d-block mx-4 mb-3 mb-lg-4  text-danger"><b>${mess}</b></div>
            <div class="pt-1 mb-4">
              <button class="btn btn-info btn-lg btn-block" type="submit">Change Pass</button>
            </div>

            <p>Don't have an account? <a href="signup" class="link-info">Register here</a></p>

          </form>

        </div>

      </div>
      <div class="col-sm-6 px-0 d-none d-sm-block">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img3.webp"
          alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
      </div>
    </div>
  </div>
</section>
    </body>
</html>
