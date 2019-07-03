<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2018-12-20
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <title>Stripe API playground</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="google-signin-client_id"
          content="927746323156-6n30vkqvoij4meib86mpcg2388k87t45.apps.googleusercontent.com">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/themify-icons/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/pace/themes/orange/pace-theme-minimal.css"/>">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">

</head>
<body class="layout-topnav">
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <jsp:include page='/WEB-INF/views/navbar.jsp'/>
    <!-- END NAVBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container">
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Stripe API playground</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><i class="fa fa-home active"></i>Home</li>
                    </ul>
                </div>
               <%-- <div class="row">
                    <div class="col-md-12 ">
                        <!-- METRICS -->
                        <div class="row">
                            &lt;%&ndash;<div class="g-signin2" data-onsuccess="onSignIn"></div>&ndash;%&gt;

                            <div class="col-md-4 payments">
                                <div class="widget widget-metric_8 widget-main payment-widget">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;"
                                                    src="<c:url value="/resources/img/payment.svg"/>"></i>
                                            <a href="#" class="title-st" style="color: #6772e5;">PAYMENTS</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-blue-st1">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 billing">
                                <div class="widget widget-metric_8 widget-main billing-widget">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;"
                                                    src="<c:url value="/resources/img/billing.svg"/>"></i>
                                            <a href="#" class="title-st" style="color: #3ecf8e;">BILLING</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-green-st">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 connect">
                                <div class="widget widget-metric_8 widget-main connect-widget">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;"
                                                    src="<c:url value="/resources/img/connect.svg"/>"></i>
                                            <a href="#" class="title-st" style="color: #45b2e8">CONNECT</a>
                                        </span>
                                    </div>

                                    <div class="progress progress-xs progress-transparent custom-color-cyan">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 issuing">
                                <div class="widget widget-metric_8 widget-main">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;"
                                                    src="<c:url value="/resources/img/issuing.svg"/>"></i>
                                            <a href="#" class="title-st" style="color: #6772e5;">ISSUING</a>
                                        </span>
                                    </div>

                                    <div class="progress progress-xs progress-transparent custom-color-blue-st2">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 terminal">
                                <div class="widget widget-metric_8 widget-main">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;"
                                                    src="<c:url value="/resources/img/terminal.svg"/>"></i>
                                            <a href="#" class="title-st" style="color: #6772e5;">TERMINAL</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-blue-st3">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 other">
                                <div class="widget widget-metric_8 widget-main">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;"
                                                    src="<c:url value="/resources/img/integration.svg"/>"></i>
                                            <a href="#" class="title-st" style="color: #BB5504;">OTHER APIs</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-yellow">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END METRICS -->
                    </div>

                </div>--%>

                <div class="row">
                    <div class="container-lg" style="padding-top: 30px; margin-bottom: 100px;">
                        <div class="NationalPark">
                            <div class="NationalPark__camping">
                                <a href="/gb/payments/checkout" class="Tent">
                                    <div class="Tent__icon" style="border-color: #6772e5;">
                                        <span class="Helm-Icon Helm-Icon--medium Helm-Icon__cart_and_arrow Helm__background--transparent Helm-Icon--full">
                                            <i><img style="" src="<c:url value="/resources/img/payment.svg"/>"></i>
                                        </span>
                                    </div>
                                    <div class="Tent__body" style="border-color: #6772e5;">
                                        <div class="Tent__content">
                                            <h2 class="common-BodyTitle Helm__text--slate1">Stripe Payment</h2>
                                            <p class="common-BodyText Helm__text--slate4">Stripe Checkout, PaymentIntents APIs, Payment Methods, and etc</p>
                                        </div>
                                        <div class="Tent__action">
                                            <span class="common-UppercaseText Helm__text--blue4">Stripe Payment</span>
                                        </div>
                                    </div>
                                </a>

                                <a href="/gb/billing" class="Tent">
                                    <div class="Tent__icon" style="border-color: #24b47e;">
                                        <span class="Helm-Icon Helm-Icon--medium Helm-Icon__subscriptions Helm__background--transparent Helm-Icon--full">
                                            <i><img style="" src="<c:url value="/resources/img/billing.svg"/>"></i>
                                        </span>
                                    </div>
                                    <div class="Tent__body" style="border-color: #24b47e;">
                                        <div class="Tent__content">
                                            <h2 class="common-BodyTitle Helm__text--slate1">Stripe Billing</h2>
                                            <p class="common-BodyText Helm__text--slate4">Pricing models, customers, subscriptions and invoices</p>
                                        </div>
                                        <div class="Tent__action">
                                            <span class="common-UppercaseText Helm__text--green4">Stripe Billing</span>
                                        </div>
                                    </div>
                                </a>

                                <a href="/gb/connect/payouts" class="Tent">
                                    <div class="Tent__icon" style="border-color: #3297d3;">
                                        <span class="Helm-Icon Helm-Icon--medium Helm-Icon__payouts Helm__background--transparent Helm-Icon--full">
                                            <i><img style="" src="<c:url value="/resources/img/connect.svg"/>"></i>
                                        </span>
                                    </div>
                                    <div class="Tent__body" style="border-color: #3297d3;">
                                        <div class="Tent__content">
                                            <h2 class="common-BodyTitle Helm__text--slate1">Stripe Connect</h2>
                                            <p class="common-BodyText Helm__text--slate4">Connected account onboarding, direct/destination charges, payouts, and etc</p>
                                        </div>
                                        <div class="Tent__action">
                                            <span class="common-UppercaseText Helm__text--cyan4">Stripe Connect</span>
                                        </div>
                                    </div>
                                </a>

                                <a href="/gb/issuing" class="Tent">
                                    <div class="Tent__icon" style="border-color: #6772e5;">
                                        <span class="Helm-Icon Helm-Icon--medium Helm-Icon__issuing_cards Helm__background--transparent Helm-Icon--full">
                                            <i><img style="" src="<c:url value="/resources/img/issuing.svg"/>"></i>
                                        </span>
                                    </div>

                                    <div class="Tent__body" style="border-color: #6772e5;">
                                        <div class="Tent__content">
                                            <h2 class="common-BodyTitle Helm__text--slate1">Stripe Issuing</h2>
                                            <p class="common-BodyText Helm__text--slate4">Issuing programmatically controlled cards to
                                                purchase supplies or pay for expenses.</p>
                                        </div>
                                        <div class="Tent__action">
                                            <span class="common-UppercaseText Helm__text--blue4">Stripe Issuing</span>
                                        </div>
                                    </div>
                                </a>

                                <a href="/gb/terminal" class="Tent">
                                    <div class="Tent__icon" style="border-color: #6772e5;">
                                        <span class="Helm-Icon Helm-Icon--medium Helm-Icon__card_reader Helm__background--transparent Helm-Icon--full">
                                            <i><img style="" src="<c:url value="/resources/img/terminal.svg"/>"></i>
                                        </span>
                                    </div>

                                    <div class="Tent__body" style="border-color: #6772e5;">
                                        <div class="Tent__content">
                                            <h2 class="common-BodyTitle Helm__text--slate1">Stripe Terminal</h2>
                                            <p class="common-BodyText Helm__text--slate4">Customized point-of-sale system for in-person and online payments.</p>
                                        </div>
                                        <div class="Tent__action">
                                            <span class="common-UppercaseText Helm__text--blue4">Stripe Terminal</span>
                                        </div>
                                    </div>
                                </a>

                                <a href="/gb/radar" class="Tent">
                                    <div class="Tent__icon" style="border-color: #e39f48;">
                                        <span class="Helm-Icon Helm-Icon--medium Helm-Icon__invoices Helm__background--transparent Helm-Icon--full">
                                            <i><img style="" src="<c:url value="/resources/img/integration.svg"/>"></i>
                                        </span>
                                    </div>
                                    <div class="Tent__body" style="border-color: #e39f48;">
                                        <div class="Tent__content">
                                            <h2 class="common-BodyTitle Helm__text--slate1">Other APIs/Products</h2>
                                            <p class="common-BodyText Helm__text--slate4">All other Stripe APIs and products.</p>
                                        </div>
                                        <div class="Tent__action">
                                            <span class="common-UppercaseText Helm__text--yellow4">Other Products</span>
                                        </div>
                                    </div>
                                </a>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END MAIN -->
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-progressbar/js/bootstrap-progressbar.min.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.cookie.js"/>"></script>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

<script>
    $(function () {


        // toggle nav active
        $('#navHome').toggleClass('active');

        // metric's progress bar
        $('.progress-bar').progressbar(
            {
                display_text: 'fill'
            });
        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function () {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        $('#navPayment').on('mouseover', function () {
            //alert("HERE!");
            //$('#navPayment img').attr("src", "/resources/img/payment.svg");
        });

        $('.payment-widget').on('click', function () {
            $('.payments').toggleClass('col-md-4').toggleClass('col-md-12');
        })

        $('.widget').on('click', function () {
            console.log($(this).parent());
            $(this).parent().toggleClass('col-md-4').toggleClass('col-md-12', 1000);
        });


        $('#std-account-btn').on('click', function () {
            console.log(window.opener);
            window.opener.setData('abcdefg');
            window.close();
        })


    });

</script>

<script type="text/javascript">

    function onLogout() {
        console.log("log out....");
        gapi.load('auth2', function () {
            auth2 = gapi.auth2.init({
                client_id: '927746323156-6n30vkqvoij4meib86mpcg2388k87t45.apps.googleusercontent.com',
            });
            if (auth2.isSignedIn.get()) {
                auth2.disconnect();
            }
        });
    }

    /*function onSuccess(){
        console.log("onSuccess");

        gapi.load('auth2', function() {
            auth2 = gapi.auth2.init({
                client_id: '927746323156-6n30vkqvoij4meib86mpcg2388k87t45.apps.googleusercontent.com',
            });
            if (auth2.isSignedIn.get()) {


                console.log(auth2.currentUser.get().getAuthResponse().expires_in);
                var exp_at = auth2.currentUser.get().getAuthResponse().expires_at;
                console.log(exp_at);


                var profile = auth2.currentUser.get().getBasicProfile();
                var id = profile.getId();
                console.log('ID: ' + profile.getId());
                console.log('Full Name: ' + profile.getName());
                console.log('Given Name: ' + profile.getGivenName());
                console.log('Family Name: ' + profile.getFamilyName());
                console.log('Image URL: ' + profile.getImageUrl());
                console.log('Email: ' + profile.getEmail());

                $.cookie("user", id);
                //$.cookie('exp', exp_at);
            } else {
                console.log("NOT SIGNED IN");
            }
        });
        return true;

    }*/
</script>

<style>
    .NationalPark__camping {
        display: grid;
        grid-gap: 50px 20px;
        grid-template-rows: repeat(2, auto);
        grid-template-columns: repeat(3, 1fr);
    }

    .Tent {
        --border-radius: 8px;
        position: relative;
        background-color: #fff;
        transition: transform .2s cubic-bezier(.215, .61, .355, 1);
        transform: translateY(0);
        display: block;
    }

    .Tent:before {
        box-shadow: 0 6px 12px -2px rgba(50, 50, 93, .25), 0 3px 7px -3px rgba(0, 0, 0, .3);
    }

    .Tent:after, .Tent:before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        transition: opacity .4s cubic-bezier(.215, .61, .355, 1);
        pointer-events: none;
    }

    .Tent, .Tent:after, .Tent:before {
        border-radius: 8px;
    }

    @media (min-width: 670px) {
        .Tent:after {
            box-shadow: 0 50px 100px -20px rgba(50, 50, 93, .25), 0 30px 60px -30px rgba(0, 0, 0, .3), 0 -18px 60px -10px rgba(0, 0, 0, .025);
            opacity: 0;
        }

        .Tent__icon {
            --container-size: 78px;
        }

        .Tent__body {
            padding: 65px 40px 60px;
        }

        .Tent__action {
            transform: translateY(50%);
            opacity: 0;
        }

        .Tent:hover {
            transform: translateY(-2px);
            z-index: 2;
        }

        .Tent:hover:before {
            opacity: 0;
        }

        .Tent:hover:after {
            opacity: 1;
        }

        .Tent:hover .Tent__icon {
            transform: scale(.8) translateY(-10px);
        }

        .Tent:hover .Tent__content {
            transform: translateY(-16px);
        }

        .Tent:hover .Tent__action {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .Tent:after, .Tent:before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        transition: opacity .4s cubic-bezier(.215, .61, .355, 1);
        pointer-events: none;
    }

    .Tent__icon {
        --container-size: 64px;
        position: absolute;
        z-index: 1;
        top: -22px;
        width: var(--container-size);
        height: var(--container-size);
        border-radius: calc(var(--container-size) / 2);
        left: calc(50% - var(--container-size) / 2);
        background-color: #fff;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: transform .4s cubic-bezier(.215, .61, .355, 1);
        transform-origin: 50% 20%;
        box-shadow: 0 2px 5px rgba(50, 50, 93, .1), 0 1px 1.5px rgba(0, 0, 0, .07);
        border: 1px solid;
    }

    .Tent__body {
        position: relative;
        overflow: hidden;
        padding: 50px 30px 55px;
        border-radius: var(--border-radius);
        height: 100%;
        border-top: 2px solid;
    }

    .Tent__icon .Helm-Icon {
        max-width: 60%;
        max-height: 56%;
    }

    .Helm__background--transparent {
        background-color: transparent;
    }

    .Helm-Icon--medium {
        height: 48px;
        width: 48px;
    }

    .Helm-Icon {
        border-radius: 50%;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }

    .Helm-Icon--full svg {
        width: 100%;
        height: 100%;
    }

    .Tent__content {
        transition: transform .4s cubic-bezier(.215, .61, .355, 1);
        transform: translateY(0);
    }

    .Tent__action {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        padding: 8px 10px;
        height: 56px;
        box-shadow: none;
        text-align: center;
        transition: .4s cubic-bezier(.215, .61, .355, 1);
        background: #f6f9fc;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .Helm__text--slate1 {
        color: #32325d;
    }

    .common-BodyTitle {
        font-weight: 500;
        font-size: 19px;
        line-height: 32px;
        color: #32325d;
    }

    .Helm__text--slate4 {
        color: #6b7c93;
    }

    .common-BodyText {
        font-weight: 400;
        font-size: 17px;
        line-height: 28px;
        color: #525f7f;
    }
    .common-UppercaseText {
        font-size: 17px;
        line-height: 28px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: .025em;
    }

    .Tent__action span:last-of-type:after {
        content: "\279C";
        padding-left: 5px;
        font: normal 16px StripeIcons;
        display: inline-block;
        transition: transform .4s cubic-bezier(.215, .61, .355, 1);
    }

    .Tent__action .Helm-Icon {
        width: 28px;
        height: 28px;
        margin: 0 10px 0 0;
    }

    .Tent__action span:last-of-type:after {
        content: "\279C";
        padding-left: 5px;
        font: normal 16px StripeIcons;
        display: inline-block;
        transition: transform .4s cubic-bezier(.215, .61, .355, 1);
    }
    .Helm__text--blue4 {
        color: #6772e5;
    }
    .Helm__text--green4 {
        color: #24b47e;
    }

    .Helm__text--cyan4 {
        color: #3297d3;
    }

    .Helm__text--purple4 {
        color: #b76ac4;
    }

    .Helm__text--yellow4 {
        color: #e39f48;
    }
</style>
</body>
</html>
