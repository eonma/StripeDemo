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
                        <li><i class="fa fa-home active"></i>Home</li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12 ">
                        <!-- METRICS -->
                        <div class="row">
                            <div class="col-md-4 payments">
                                <div class="widget widget-metric_8 widget-main payment-widget">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/payment.svg"/>"></i>
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
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/billing.svg"/>"></i>
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
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/connect.svg"/>"></i>
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
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/issuing.svg"/>"></i>
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
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/terminal.svg"/>"></i>
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
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/integration.svg"/>"></i>
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

        $('#navPayment').on('mouseover',function () {
            //alert("HERE!");
            //$('#navPayment img').attr("src", "/resources/img/payment.svg");
        });

        $('.payment-widget').on('click', function () {
            $('.payments').toggleClass('col-md-4').toggleClass('col-md-12');
        })

        $('.widget').on('click', function () {
            console.log($(this).parent());
            $(this).parent().toggleClass('col-md-4').toggleClass('col-md-12', 1000);
        })


    });
</script>
</body>
</html>
