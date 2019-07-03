<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-06-14
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" class="fullscreen-bg">
<head>
    <title>Stripe API playground</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="google-signin-client_id" content="927746323156-6n30vkqvoij4meib86mpcg2388k87t45.apps.googleusercontent.com">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/themify-icons/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/pace/themes/orange/pace-theme-minimal.css"/>">

    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">

</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box register" style="background-clip: padding-box;border: 1px solid rgba(0,0,0,0.2);">
                <div class="content">
                    <div class="header">
                        <div class="logo text-center">
                            <img src="/resources/img/stripe.svg" style="height:40px;">
                        </div>
                        <p class="lead">API Playground</p>
                    </div>

                    <div class="separator-linethrough">
                        <span>Please login use your google account</span>
                    </div>


                   <%-- <div style="display: table-cell">
                        <div class="alert alert-success alert-action">
                            <i class="fa fa-check-circle"></i><span>you have already logged in.</span>
                        </div>
                    </div>--%>

                    <div class="g-signin2"
                         data-onsuccess="onSuccess"
                         data-onfailure="onFailure"
                         data-width="auto"
                         data-height="45px"
                         data-theme="light"
                         data-longtitle="true">
                    </div>

                    <div class="separator-linethrough">
                        <span>OR</span>
                    </div>
                    <form class="form-auth-small" name="f" action="/login"
                          method="POST">
                        <div class="form-group">
                            <label for="signin-email" class="control-label sr-only">Email</label>
                            <input type="email" class="form-control" id="signin-email" name='username' value="chenma@stripe.com" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label for="signin-password" class="control-label sr-only">Password</label>
                            <input type="password" class="form-control" id="signin-password" name='password' value="1234" placeholder="Password">
                        </div>
                        <div class="form-group clearfix">
                            <label class="fancy-checkbox element-left custom-bgcolor-blue">
                                <input type="checkbox">
                                <span class="text-muted">Remember me</span>
                            </label>

                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">LOGIN</button>

                    </form>

                    <%--<a href="#" onclick="signOut()">Sign Out</a>--%>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.cookie.js"/>"></script>
<script>
    /*function onSuccess(googleUser) {
        console.log( googleUser);
        console.log('ID: ' + googleUser.getId());

        console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    }*/
    function onSuccess(){
        console.log("onSuccess");

        gapi.load('auth2', function() {
            auth2 = gapi.auth2.init({
                client_id: '927746323156-6n30vkqvoij4meib86mpcg2388k87t45.apps.googleusercontent.com',
            });
            if (auth2.isSignedIn.get()) {

                var googleUser = auth2.currentUser.get()
                var authResponse = googleUser.getAuthResponse();
                var profile = googleUser.getBasicProfile();

                var data =
                    '{' +
                    '"id":"' + profile.getId() + '",' +
                    '"email":"' + profile.getEmail() + '",' +
                    '"first_name":"' + profile.getGivenName() + '"' +
                    '"last_name":"' + profile.getFamilyName() + '"' +
                    '"img":"' + profile.getImageUrl() + '"' +
                    '"id_token":"' + authResponse.id_token + '"' +
                    '"expires_at":"' + authResponse.expires_at + '"' +
                    '"expires_in":"' + authResponse.expires_in + '"' +
                    '}';
                //console.log(data);
                console.log('Image URL: ' + profile.getImageUrl());
                $.cookie("user", profile.getId());
                returnToPage();


                /*const result = Object.assign({}, authResponse, profile);
                console.log(result);*/

                //console.log(JSON.stringify(googleUser.getAuthResponse()))



                /*var authResponse = auth2.currentUser.get().getAuthResponse();
                console.log(authResponse);

                var exp_at = authResponse.expires_at;
                var exp_in = authResponse.expires_in;
                var id_token = authResponse.id_token;


                var profile = auth2.currentUser.get().getBasicProfile();
                console.log(profile);
                var id = profile.getId();



                console.log('ID: ' + profile.getId());
                console.log('Full Name: ' + profile.getName());
                console.log('Given Name: ' + profile.getGivenName());
                console.log('Family Name: ' + profile.getFamilyName());
                console.log('Image URL: ' + profile.getImageUrl());
                console.log('Email: ' + profile.getEmail());*/

                //$.cookie("user", profile.getId());
                //$.cookie('exp', exp_at);
            } else {
                console.log("NOT SIGNED IN");
            }
        });
    }

    function onFailure(error) {
        console.log(error);
    }

    function onLogout(){
        console.log("log out....");
        gapi.load('auth2', function() {
            auth2 = gapi.auth2.init({
                client_id: '927746323156-6n30vkqvoij4meib86mpcg2388k87t45.apps.googleusercontent.com',
            });
            if (auth2.isSignedIn.get()) {
                auth2.disconnect();
            }
        });
    }
    /*function renderButton() {
        gapi.signin2.render('my-signin2', {
            'scope': 'profile email',
            'width': 'auto',
            'height': 45,
            'longtitle': true,
            'theme': 'dark',
            'onsuccess': onSuccess,
            'onfailure': onFailure
        });
    }*/

    function returnToPage(){
        var origin = window.location.origin;
        var path = window.location.pathname;
        if (path !== '/login'){
            location.reload();
        }
        console.log(origin);
        console.log(path);
    }
</script>
<style>
    .abcRioButtonLightBlue{
        border: 1px solid #00a0f0 !important;
        border-radius: 4px;
        color: #4285f4 !important;
    }
    .abcRioButtonContents{

        font-family: Camphor;
        font-size: 16px !important;
    }
    body{
        background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
    }
    .auth-box{
        box-shadow: 0 0.76875rem 2.4875rem rgba(52,58,64,0.3), 0 1.3375rem 1.70625rem rgba(52,58,64,0.3), 0 0.55rem 0.53125rem rgba(0,0,0,0.05), 0 0.225rem 0.4375rem rgba(52,58,64,0.3) !important;
    }
</style>
</body>

</body>
</html>
