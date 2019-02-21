<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2018-12-20
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <title>Stripe API playground</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
                        <li><i class="fa fa-home"></i> Home</li>
                        <li class="active">Dashboard</li>
                    </ul>
                </div>

                <br>
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <!-- METRICS -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="widget widget-metric_8">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/payment.png"/>"></i>
                                            <a href="#" class="title-st">PAYMENTS</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-blue-st1">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                    <p class="info">A complete payment platform.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget widget-metric_8">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/billing.png"/>"></i>
                                            <a href="#" class="title-st">BILLING</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-green-st">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                    <p class="info">Recurring billing engine.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget widget-metric_8">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/connect.png"/>"></i>
                                            <a href="#" class="title-st">CONNECT</a>
                                        </span>
                                    </div>

                                    <div class="progress progress-xs progress-transparent custom-color-cyan">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                    <p class="info">Marketplaces, platforms and payouts.</p>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="widget widget-metric_8">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/issuing.png"/>"></i>
                                            <a href="#" class="title-st">ISSUING</a>
                                        </span>
                                    </div>

                                    <div class="progress progress-xs progress-transparent custom-color-blue-st2">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                    <p class="info">Issue and manage payment cards.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget widget-metric_8">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/terminal.png"/>"></i>
                                            <a href="#" class="title-st">TERMINAL</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-blue-st3">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                    <p class="info">Accepting in-person payment.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget widget-metric_8">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/dashboard.png"/>"></i>
                                            <a href="#" class="title-st">OTHER APIs</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-slate">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                    <p class="info">All other Stripe APIs.</p>
                                </div>
                            </div>
                        </div>
                        <!-- END METRICS -->

                        <!-- API panel -->



                        <!-- CAMPAIGN RESULT -->

                        <!-- END CAMPAIGN RESULT -->
                        <!-- STOCK INFO -->
                        
                        <!-- END STOCK INFO -->
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

<script>
    $(function()
    {

        // toggle nav active
        $('#navHome').toggleClass('active');

        // metric's progress bar
        $('.progress-bar').progressbar(
            {
                display_text: 'fill'
            });
        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });


        // stock carousel
        $('.widget-carousel').slick(
            {
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                draggable: false,
                swipe: false,
                responsive: [
                    {
                        breakpoint: 640,
                        settings:
                            {
                                slidesToShow: 1,
                            }
                    }]
            });

    });
</script>
</body>
</html>
