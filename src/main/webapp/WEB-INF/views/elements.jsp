<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2018-12-24
  Time: 14:14
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
    <title>Welcome to Klorofil Pro | Klorofil Pro - Bootstrap Admin Dashboard Template</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/themify-icons/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/pace/themes/orange/pace-theme-minimal.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/jqvmap/jqvmap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/slick/slick.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/slick/slick-theme.css"/>">

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
    <nav class="navbar navbar-default navbar-fixed-top">
        <!-- main navigation -->
        <div id="navbar-menu" class="bottom-bar clearfix">
            <div class="navbar-header">
                <div class="brand visible-xs">
                    <a href="index.html">
                        <img src="<c:url value="/resources/img/logo-stripe.png"/>" alt="stripe logo" class="img-responsive logo">
                    </a>
                </div>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav">
                    <i class="ti-menu"></i>
                </button>
            </div>
            <div class="navbar-collapse collapse" id="main-nav">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html" class="active"> <i><img style="width: 16px;" src="<c:url value="/resources/img/dashboard_grey.png"/>"></i> <span>Dashboard</span></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown"><i><img style="width: 16px;" src="<c:url value="/resources/img/payment_grey.png"/>"></i> <span>Payments</span> <i class="ti-angle-down icon-submenu"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="layout-topnav.html">Top Navigation <span class="label label-success">NEW</span></a>
                            </li>
                            <li>
                                <a href="layout-minified.html">Layout Minified</a>
                            </li>
                            <li>
                                <a href="layout-fullwidth.html">Layout Fullwidth</a>
                            </li>
                            <li>
                                <a href="layout-default.html">Layout Default</a>
                            </li>
                            <li>
                                <a href="layout-grid.html">Grid</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown"> <img style="width: 16px;" src="<c:url value="/resources/img/billing_grey.png"/>"></i> <span>Billing</span> <i class="ti-angle-down icon-submenu"></i></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown dropdown-sub">
                                <a href="#" data-toggle="dropdown">Submenu 1 <i class="icon-submenu ti-angle-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Another menu level</a></li>
                                    <li><a href="#">Another menu level</a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-sub">
                                <a href="#" data-toggle="dropdown" class="active">Submenu 2 <i class="icon-submenu ti-angle-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Another menu level</a></li>
                                    <li><a href="#" class="active">Another menu level</a></li>
                                    <li><a href="#">Another menu level</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Submenu 3</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown"><img style="width: 16px;" src="<c:url value="/resources/img/connect_grey.png"/>"></i> <span>Connect</span> <i class="ti-angle-down icon-submenu"></i></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown dropdown-sub">
                                <a href="#" data-toggle="dropdown">Submenu 1 <i class="icon-submenu ti-angle-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Another menu level</a></li>
                                    <li><a href="#">Another menu level</a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-sub">
                                <a href="#" data-toggle="dropdown" class="active">Submenu 2 <i class="icon-submenu ti-angle-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Another menu level</a></li>
                                    <li><a href="#" class="active">Another menu level</a></li>
                                    <li><a href="#">Another menu level</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Submenu 3</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown"><img style="width: 16px;" src="<c:url value="/resources/img/terminal_grey.png"/>"></i> <span>Terminal</span> <i class="ti-angle-down icon-submenu"></i></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown dropdown-sub">
                                <a href="#" data-toggle="dropdown">Submenu 1 <i class="icon-submenu ti-angle-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Another menu level</a></li>
                                    <li><a href="#">Another menu level</a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-sub">
                                <a href="#" data-toggle="dropdown" class="active">Submenu 2 <i class="icon-submenu ti-angle-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Another menu level</a></li>
                                    <li><a href="#" class="active">Another menu level</a></li>
                                    <li><a href="#">Another menu level</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Submenu 3</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown"> </i><img style="width: 16px;" src="<c:url value="/resources/img/issuing_grey.png"/>"></i> <span>Issuing</span> <i class="ti-angle-down icon-submenu"></i></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown dropdown-sub">
                                <a href="#" data-toggle="dropdown">Submenu 1 <i class="icon-submenu ti-angle-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Another menu level</a></li>
                                    <li><a href="#">Another menu level</a></li>
                                </ul>
                            </li>
                            <li class="dropdown dropdown-sub">
                                <a href="#" data-toggle="dropdown" class="active">Submenu 2 <i class="icon-submenu ti-angle-right"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Another menu level</a></li>
                                    <li><a href="#" class="active">Another menu level</a></li>
                                    <li><a href="#">Another menu level</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Submenu 3</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-xs hidden-sm">
                        <a href="#" class="btn-toggle-rightsidebar">
                            <i class="ti-layout-sidebar-right"></i>
                        </a>
                    </li>

                    <!--
                    <li class="dropdown hidden-xs hidden-sm">
                        <a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
                            <i class="ti-bell"></i>
                            <span class="badge bg-danger">5</span>
                        </a>
                        <ul class="dropdown-menu notifications">
                            <li>You have 5 new notifications</li>
                            <li>
                                <a href="#" class="notification-item">
                                    <i class="fa fa-hdd-o custom-bg-red"></i>
                                    <p>
                                        <span class="text">System space is almost full</span>
                                        <span class="timestamp">11 minutes ago</span>
                                    </p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="notification-item">
                                    <i class="fa fa-tasks custom-bg-yellow"></i>
                                    <p>
                                        <span class="text">You have 9 unfinished tasks</span>
                                        <span class="timestamp">20 minutes ago</span>
                                    </p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="notification-item">
                                    <i class="fa fa-book custom-bg-green2"></i>
                                    <p>
                                        <span class="text">Monthly report is available</span>
                                        <span class="timestamp">1 hour ago</span>
                                    </p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="notification-item">
                                    <i class="fa fa-bullhorn custom-bg-purple"></i>
                                    <p>
                                        <span class="text">Weekly meeting in 1 hour</span>
                                        <span class="timestamp">2 hours ago</span>
                                    </p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="notification-item">
                                    <i class="fa fa-check custom-bg-green"></i>
                                    <p>
                                        <span class="text">Your request has been approved</span>
                                        <span class="timestamp">3 days ago</span>
                                    </p>
                                </a>
                            </li>
                            <li><a href="#" class="more">See all notifications</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="assets/img/user.png" alt="Avatar">
                            <span>Samuel</span> <i class="ti-angle-down icon-submenu"></i></a>
                        <ul class="dropdown-menu logged-user-menu">
                            <li><a href="#"><i class="ti-user"></i> <span>My Profile</span></a></li>
                            <li><a href="#"><i class="ti-email"></i> <span>Message</span></a></li>
                            <li><a href="#"><i class="ti-settings"></i> <span>Settings</span></a></li>
                            <li><a href="#"><i class="ti-power-off"></i> <span>Logout</span></a></li>
                        </ul>
                    </li>
                    -->
                </ul>
            </div>
        </div>
        <!-- end main navigation -->
    </nav>
    <!-- END NAVBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container">
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Dashboard</h1>
                        <p class="page-subtitle">Stripe API playground dashboard</p>
                    </div>
                    <ul class="breadcrumb">
                        <li><i class="fa fa-home"></i> Home</li>
                        <li class="active">Dashboard</li>
                    </ul>
                </div>
                <div class="row">
                    <form action="/charge" method="post" id="payment-form">
                        <div class="col-md-9">
                            <div class="form-row" style="float:left;width: 70%;">
                                 <span class="title">
                                    Credit or debit card
                                 </span>
                                <div id="card-element">
                                    <!-- A Stripe Element will be inserted here. -->
                                </div>

                                <!-- Used to display form errors. -->
                                <div id="card-errors" role="alert"></div>
                            </div>
                            <div id="stripe"><button style="float: right; ">Submit Payment</button></div>

                        </div>
                    </form>
                </div>
                <div class="row">
                    <div class="col-md-9">
                        <!-- METRICS -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="widget widget-metric_8">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/payment.png"/>"></i>
                                            <a href="#" class="title-st">PAYMENTINTENTS</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-blue-st1">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                    <p class="info">New way to be ready for SCA.</p>
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
                            <div class="col-md-4">
                                <div class="widget widget-metric_8">
                                    <div class="heading clearfix">
                                        <span class="title">
                                            <i><img style="width: 28px;" src="<c:url value="/resources/img/payment.png"/>"></i>
                                            <a href="#" class="title-st">CHARGES</a>
                                        </span>
                                    </div>
                                    <div class="progress progress-xs progress-transparent custom-color-blue-st1">
                                        <div class="progress-bar" data-transitiongoal="100"></div>
                                    </div>
                                    <p class="info">Create a payment on server side.</p>
                                </div>
                            </div>
                        </div>

                        <div class="row">
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
                        </div>
                        <!-- END METRICS -->
                        <!-- CAMPAIGN RESULT -->
                        <div class="panel panel-tab">
                            <div class="panel-heading">
                                <h3 class="panel-title">Campaign Result</h3>
                                <ul class="nav nav-tabs pull-right">
                                    <li class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-user-circle"></i> Social</a></li>
                                    <li><a href="#tab2" data-toggle="tab"><i class="fa fa-envelope"></i> Newsletter</a></li>
                                    <li><a href="#tab3" data-toggle="tab"><i class="fa fa-pie-chart"></i> Visits</a></li>
                                </ul>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content no-padding">
                                    <!-- tab 1 -->
                                    <div class="tab-pane fade in active" id="tab1">
                                        <div class="top margin-bottom-50">
                                            <div class="row">
                                                <div class="col-sm-10">
                                                    <div class="period font-13">
                                                        <span>Aug 05, 2017 - Aug 11, 2017</span>
                                                        <br>
                                                        <span class="previous text-muted">Jun 29, 2017 - Aug 4, 2017 (previous)</span>
                                                    </div>
                                                    <div class="margin-bottom-30 visible-xs"></div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <select class="form-control">
                                                        <option>7 Days</option>
                                                        <option>1 Month</option>
                                                        <option>3 Months</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-layout dashed-separator">
                                            <div class="panel-cols-2">
                                                <div class="widget-metric_9 text-center">
                                                    <span class="title">Engagement</span>
                                                    <span class="value">23,745</span>
                                                    <span class="percentage text-indicator-green"><i class="fa fa-sort-up icon-up"></i> 14.86%</span>
                                                    <span class="text-muted">vs. 15,443 (previous)</span>
                                                    <div class="inlinesparkline margin-top-50">26,68,35,38,53,95,114,87,114</div>
                                                </div>
                                            </div>
                                            <div class="panel-cols-2">
                                                <div class="widget-metric_9 text-center">
                                                    <span class="title">Page Reach</span>
                                                    <span class="value">793,148</span>
                                                    <span class="percentage text-indicator-red"><i class="fa fa-sort-down icon-down"></i> 8.13%</span>
                                                    <span class="text-muted">vs. 701,954 (previous)</span>
                                                    <div class="inlinesparkline margin-top-50">35,68,55,60,65,87,77,68,55</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end tab 1 -->
                                    <!-- tab 2 -->
                                    <div class="tab-pane fade" id="tab2">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <strong>Top Countries</strong>
                                                <table class="table table-minimal table-no-border">
                                                    <thead>
                                                    <tr>
                                                        <th>COUNTRY</th>
                                                        <th>OPENS</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>United States</td>
                                                        <td>2936</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Algeria</td>
                                                        <td>2812</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Russia</td>
                                                        <td>2735</td>
                                                    </tr>
                                                    <tr>
                                                        <td>France</td>
                                                        <td>2674</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Mexico</td>
                                                        <td>2584</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Germany</td>
                                                        <td>1986</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Brazil</td>
                                                        <td>1921</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-9">
                                                <div id="map-email-opens" style="height: 350px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end tab 2 -->
                                    <!-- tab 3 -->
                                    <div class="tab-pane fade" id="tab3">
                                        <div class="panel-layout dashed-separator">
                                            <div class="panel-cols-2">
                                                <h3 class="panel-content-title">Referrals</h3>
                                                <ul class="list-unstyled list-referrals">
                                                    <li>
                                                        <p>
                                                            <span class="value">3,454</span>
                                                            <span class="text-muted">visits from Facebook</span>
                                                        </p>
                                                        <div class="progress progress-xs progress-transparent custom-color-blue">
                                                            <div class="progress-bar" role="progressbar" aria-valuenow="87" aria-valuemin="0" aria-valuemax="100" style="width:87%"></div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <p>
                                                            <span class="value">2,102</span>
                                                            <span class="text-muted">visits from Twitter</span>
                                                        </p>
                                                        <div class="progress progress-xs progress-transparent custom-color-purple">
                                                            <div class="progress-bar" role="progressbar" aria-valuenow="34" aria-valuemin="0" aria-valuemax="100" style="width:34%"></div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <p>
                                                            <span class="value">2,874</span>
                                                            <span class="text-muted">visits from Affiliates</span>
                                                        </p>
                                                        <div class="progress progress-xs progress-transparent custom-color-green">
                                                            <div class="progress-bar" role="progressbar" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100" style="width:67%"></div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <p>
                                                            <span class="value">2,874</span>
                                                            <span class="text-muted">visits from Search</span>
                                                        </p>
                                                        <div class="progress progress-xs progress-transparent custom-color-yellow">
                                                            <div class="progress-bar" role="progressbar" aria-valuenow="54" aria-valuemin="0" aria-valuemax="100" style="width:54%"></div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="panel-cols-2">
                                                <h3 class="panel-content-title">Traffic Sources</h3>
                                                <div id="traffic-sources-chart"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end tab 3 -->
                                </div>
                            </div>
                        </div>
                        <!-- END CAMPAIGN RESULT -->
                        <!-- STOCK INFO -->
                        <div class="widget widget-carousel">
                            <div class="item">
                                <div class="widget-metric_10">
                                    <span class="title">GOOGL</span>
                                    <span class="value">
												<span class="number">930.50</span>
												<span class="symbol">USD</span>
											</span>
                                    <span class="percentage text-indicator-red"><i class="fa fa-angle-down icon-down"></i> 6.39 (0.68%)</span>
                                </div>
                            </div>
                            <div class="item">
                                <div class="widget-metric_10">
                                    <span class="title">AMZN</span>
                                    <span class="value">
												<span class="number">945.26</span>
												<span class="symbol">USD</span>
											</span>
                                    <span class="percentage text-indicator-green"><i class="fa fa-angle-up icon-up"></i> 7.19 (0.75%)</span>
                                </div>
                            </div>
                            <div class="item">
                                <div class="widget-metric_10">
                                    <span class="title">FB</span>
                                    <span class="value">
												<span class="number">166.32</span>
												<span class="symbol">USD</span>
											</span>
                                    <span class="percentage text-indicator-red"><i class="fa fa-angle-down icon-down"></i> 1.42 (0.75%)</span>
                                </div>
                            </div>
                            <div class="item">
                                <div class="widget-metric_10">
                                    <span class="title">AAPL</span>
                                    <span class="value">
												<span class="number">162.32</span>
												<span class="symbol">USD</span>
											</span>
                                    <span class="percentage text-indicator-green"><i class="fa fa-angle-up icon-up"></i> 0.82 (0.51%)</span>
                                </div>
                            </div>
                            <div class="item">
                                <div class="widget-metric_10">
                                    <span class="title">TWTR</span>
                                    <span class="value">
												<span class="number">16.89</span>
												<span class="symbol">USD</span>
											</span>
                                    <span class="percentage text-indicator-green"><i class="fa fa-angle-up icon-up"></i> 0.12 (0.72%)</span>
                                </div>
                            </div>
                            <div class="item">
                                <div class="widget-metric_10">
                                    <span class="title">BABA</span>
                                    <span class="value">
												<span class="number">168.98</span>
												<span class="symbol">USD</span>
											</span>
                                    <span class="percentage text-indicator-red"><i class="fa fa-angle-down icon-down"></i> 0.70 (0.42%)</span>
                                </div>
                            </div>
                        </div>
                        <!-- END STOCK INFO -->
                    </div>
                    <div class="col-md-3">
                        <!-- VISIT DURATION -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Visit Duration</h3>
                            </div>
                            <div class="panel-body">
                                <canvas id="horizontalbar-chart" height="250"></canvas>
                            </div>
                        </div>
                        <!-- END VISIT DURATION -->
                        <!-- CUSTOMER SATISFACTION -->
                        <div class="widget widget-metric_5">
                            <span class="title text-muted">Customer Satisfaction</span>
                            <ul class="list-inline list-value">
                                <li>
                                    <i class="fa fa-frown-o"></i>
                                    <span class="percentage text-indicator-red">10%</span>
                                </li>
                                <li>
                                    <i class="fa fa-meh-o"></i>
                                    <span class="percentage">13%</span>
                                </li>
                                <li>
                                    <i class="fa fa-smile-o"></i>
                                    <span class="percentage text-indicator-green">77%</span>
                                </li>
                            </ul>
                            <span class="note">See detailed scoring <a href="#">here</a></span>
                        </div>
                        <!-- END CUSTOMER SATISFACTION -->
                        <!-- SALES CHART -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Sales</h3>
                            </div>
                            <div class="panel-body no-padding-bottom">
                                <table class="table table-invisible">
                                    <thead>
                                    <tr>
                                        <th>Period</th>
                                        <th>Revenue</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="text-muted">This Week</td>
                                        <td class="text-right">$1207</td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted">This Month</td>
                                        <td class="text-right">$15821</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <canvas id="sales-chart" height="220"></canvas>
                            </div>
                        </div>
                        <!-- END SALES CHART -->
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT -->

        <!-- RIGHT SIDEBAR -->
        <div id="sidebar-right" class="right-sidebar">
            <div class="sidebar-widget">
                <h4 class="widget-heading"><i class="fa fa-calendar"></i> TODAY</h4>
                <p class="date">Wednesday, 22 December</p>
                <div class="row margin-top-30">
                    <div class="col-xs-4">
                        <a href="#">
                            <div class="icon-transparent-area custom-color-blue first">
                                <i class="fa fa-tasks"></i>
                                <span>Tasks</span>
                                <span class="badge">5</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-4">
                        <a href="#">
                            <div class="icon-transparent-area custom-color-green">
                                <i class="fa fa-envelope"></i>
                                <span>Mail</span>
                                <span class="badge">12</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-4">
                        <a href="#">
                            <div class="icon-transparent-area custom-color-orange last">
                                <i class="fa fa-user-plus"></i>
                                <span>Users</span>
                                <span class="badge">24</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="sidebar-widget">
                <div class="widget-header">
                    <h4 class="widget-heading">YOUR APPS</h4>
                    <a href="#" class="show-all">Show all</a>
                </div>
                <div class="row">
                    <div class="col-xs-3">
                        <a href="#" class="icon-app" title="Dropbox" data-toggle="tooltip" data-placement="top">
                            <i class="fa fa-dropbox dropbox-color"></i>
                        </a>
                    </div>
                    <div class="col-xs-3">
                        <a href="#" class="icon-app" title="WordPress" data-toggle="tooltip" data-placement="top">
                            <i class="fa fa-wordpress wordpress-color"></i>
                        </a>
                    </div>
                    <div class="col-xs-3">
                        <a href="#" class="icon-app" title="Drupal" data-toggle="tooltip" data-placement="top">
                            <i class="fa fa-drupal drupal-color"></i>
                        </a>
                    </div>
                    <div class="col-xs-3">
                        <a href="#" class="icon-app" title="Github" data-toggle="tooltip" data-placement="top">
                            <i class="fa fa-github github-color"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="sidebar-widget">
                <div class="widget-header">
                    <h4 class="widget-heading">MY PROJECTS</h4>
                    <a href="#" class="show-all">Show all</a>
                </div>
                <ul class="list-unstyled list-project-progress">
                    <li>
                        <a href="#" class="project-name">Project XY</a>
                        <div class="progress progress-xs progress-transparent custom-color-orange">
                            <div class="progress-bar" role="progressbar" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100" style="width:67%"></div>
                        </div>
                        <span class="percentage">67%</span>
                    </li>
                    <li>
                        <a href="#" class="project-name">Growth Campaign</a>
                        <div class="progress progress-xs progress-transparent custom-color-blue">
                            <div class="progress-bar" role="progressbar" aria-valuenow="23" aria-valuemin="0" aria-valuemax="100" style="width:23%"></div>
                        </div>
                        <span class="percentage">23%</span>
                    </li>
                    <li>
                        <a href="#" class="project-name">Website Redesign</a>
                        <div class="progress progress-xs progress-transparent custom-color-green">
                            <div class="progress-bar" role="progressbar" aria-valuenow="87" aria-valuemin="0" aria-valuemax="100" style="width:87%"></div>
                        </div>
                        <span class="percentage">87%</span>
                    </li>
                </ul>
            </div>
            <div class="sidebar-widget">
                <div class="widget-header">
                    <h4 class="widget-heading">MY FILES</h4>
                    <a href="#" class="show-all">Show all</a>
                </div>
                <ul class="list-unstyled list-justify list-file-simple">
                    <li><a href="#"><i class="fa fa-file-word-o"></i>Proposal_draft.docx</a>
                        <span>4 MB</span>
                    </li>
                    <li><a href="#"><i class="fa fa-file-pdf-o"></i>Manual_Guide.pdf</a>
                        <span>20 MB</span>
                    </li>
                    <li><a href="#"><i class="fa fa-file-zip-o"></i>all-project-files.zip</a>
                        <span>315 MB</span>
                    </li>
                    <li><a href="#"><i class="fa fa-file-excel-o"></i>budget_estimate.xls</a>
                        <span>1 MB</span>
                    </li>
                </ul>
            </div>
            <p class="text-center"><a href="#" class="btn btn-default btn-xs">More Widgets</a></p>
        </div>
        <!-- END RIGHT SIDEBAR -->
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="<c:url value="https://js.stripe.com/v3/"/>"></script>
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-progressbar/js/bootstrap-progressbar.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/jquery-sparkline/js/jquery.sparkline.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/jqvmap/jquery.vmap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/jqvmap/maps/jquery.vmap.world.js"/>"></script>
<script src="<c:url value="/resources/vendor/Flot/jquery.flot.js"/>"></script>
<script src="<c:url value="/resources/vendor/Flot/jquery.flot.resize.js"/>"></script>
<script src="<c:url value="/resources/vendor/Flot/jquery.flot.pie.js"/>"></script>
<script src="<c:url value="/resources/vendor/flot.tooltip/jquery.flot.tooltip.js"/>"></script>
<script src="<c:url value="/resources/vendor/slick/slick.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/chart-js/Chart.min.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>

<script>
    // Create a Stripe client.
    var stripe = Stripe('pk_test_zKiUvTSQ3Orgh2ht3lC4LXQp');

    // Create an instance of Elements.
    var elements = stripe.elements();

    // Custom styling can be passed to options when creating an Element.
    // (Note that this demo uses a wider set of styles than the guide below.)
    var style = {
        base: {
            color: '#32325d',
            lineHeight: '18px',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            '::placeholder': {
                color: '#aab7c4'
            }
        },
        invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
        }
    };

    // Create an instance of the card Element.
    var card = elements.create('card', {style: style});

    // Add an instance of the card Element into the `card-element` <div>.
    card.mount('#card-element');

    // Handle real-time validation errors from the card Element.
    card.addEventListener('change', function(event) {
        var displayError = document.getElementById('card-errors');
        if (event.error) {
            displayError.textContent = event.error.message;
        } else {
            displayError.textContent = '';
        }
    });

    // Handle form submission.
    var form = document.getElementById('payment-form');
    form.addEventListener('submit', function(event) {
        event.preventDefault();

        stripe.createToken(card).then(function(result) {
            if (result.error) {
                // Inform the user if there was an error.
                var errorElement = document.getElementById('card-errors');
                errorElement.textContent = result.error.message;
            } else {
                // Send the token to your server.
                stripeTokenHandler(result.token);
            }
        });
    });

    // Submit the form with the token ID.
    function stripeTokenHandler(token) {
        // Insert the token ID into the form so it gets submitted to the server
        var form = document.getElementById('payment-form');
        var hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'stripeToken');
        hiddenInput.setAttribute('value', token.id);
        form.appendChild(hiddenInput);

        // Submit the form
        form.submit();
    }
</script>

</body>
</html>

