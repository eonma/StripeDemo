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
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown"> </i><img style="width: 16px;" src="<c:url value="/resources/img/dashboard_grey.png"/>"></i> <span>Other APIs</span> <i class="ti-angle-down icon-submenu"></i></a>
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
                            <i class="ti-settings"></i><span>Settings</span>
                        </a>
                    </li>
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
                        <h1 class="page-title-st">Stripe API playground</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><i class="fa fa-home"></i> Home</li>
                        <li class="active">Dashboard</li>
                    </ul>
                </div>

                <br>
                <div class="row">
                    <div class="col-md-9">
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

                        <div class="panel">
                            <div class="panel-body">
                                <div class="project-info">
                                    <h3 class="info-heading">MILESTONES</h3>
                                    <div class="panel-group project-accordion">
                                        <!-- project milestone -->
                                        <div class="panel project-milestone">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="#collapse1" data-toggle="collapse" data-parent="#accordion">
                                                        <span class="milestone-title"><i class="fa fa-check icon-indicator text-success"></i> Research on eCommerce Trends</span>
                                                        <span class="label label-success label-transparent">PAID</span>
                                                        <i class="fa fa-minus-circle toggle-icon"></i>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse1" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    <div class="milestone-section">
                                                        <h4 class="milestone-heading">DESCRIPTION</h4>
                                                        <p class="milestone-description">Velit elitr dolore eu pri, ut has vero imperdiet dissentiet, sit magna blandit reformidans in. Alia commune disputationi vis no, natum rebum melius in ius.</p>
                                                    </div>
                                                    <div class="milestone-section layout-table project-metrics">
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DATE START</span>
                                                                <span class="value">Jul 23, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DATE END</span>
                                                                <span class="value">Aug 01, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">EST. VALUE</span>
                                                                <span class="value">$1,200</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DELIVERABLE</span>
                                                                <span class="value">
																			<i class="fa fa-file-pdf-o"></i>
																			<a href="#">Research_FINAL.pdf</a>
																		</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="milestone-section">
                                                        <div class="table-responsive">
                                                            <table class="table table-striped table-project-tasks">
                                                                <thead>
                                                                <tr>
                                                                    <th>TASK</th>
                                                                    <th>DEADLINE</th>
                                                                    <th>PROGRESS</th>
                                                                    <th>ACTIONS</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td colspan="4" class="divider">COMPLETED TASK</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator success"></span> Functional Specs</td>
                                                                    <td>Jul 30, 2017</td>
                                                                    <td>100%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator success"></span> Design Specs</td>
                                                                    <td>Aug 01, 2017</td>
                                                                    <td>100%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <a href="#" class="btn btn-default"><i class="fa fa-pencil"></i> EDIT MILESTONE</a>
                                                    <a href="#" class="btn btn-default"><i class="fa fa-cloud-upload"></i> UPLOAD</a>
                                                    <a href="#" class="btn btn-success"><i class="fa fa-file"></i> VIEW INVOICE</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end project milestone -->
                                        <!-- project milestone -->
                                        <div class="panel project-milestone">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="#collapse2" data-toggle="collapse" data-parent="#accordion" class="collapsed" aria-expanded="false">
                                                        <span class="milestone-title"><i class="fa fa-check icon-indicator text-success"></i> Business Requirements</span>
                                                        <span class="label label-danger label-transparent">DUE</span>
                                                        <i class="fa toggle-icon fa-plus-circle"></i>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse2" class="panel-collapse collapse" style="height: 0px;" aria-expanded="false">
                                                <div class="panel-body">
                                                    <div class="milestone-section">
                                                        <h4 class="milestone-heading">DESCRIPTION</h4>
                                                        <p class="milestone-description">Velit elitr dolore eu pri, ut has vero imperdiet dissentiet, sit magna blandit reformidans in. Alia commune disputationi vis no, natum rebum melius in ius.</p>
                                                    </div>
                                                    <div class="milestone-section layout-table project-metrics">
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DATE START</span>
                                                                <span class="value">Aug 01, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DATE END</span>
                                                                <span class="value">Sep 15, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">EST. VALUE</span>
                                                                <span class="value">$15,600</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DELIVERABLE</span>
                                                                <span class="value">
																			<i class="fa fa-file-archive-o"></i>
																			<a href="#">BusinessReqs_FINAL.zip</a>
																		</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="milestone-section">
                                                        <div class="table-responsive">
                                                            <table class="table table-striped table-project-tasks">
                                                                <thead>
                                                                <tr>
                                                                    <th>TASK</th>
                                                                    <th>DEADLINE</th>
                                                                    <th>PROGRESS</th>
                                                                    <th>ACTIONS</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td colspan="4" class="divider">COMPLETED TASK</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator success"></span> Functional Gathering</td>
                                                                    <td>Jul 30, 2017</td>
                                                                    <td>100%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator success"></span> Features and Specs</td>
                                                                    <td>Aug 10, 2017</td>
                                                                    <td>100%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <a href="#" class="btn btn-default"><i class="fa fa-pencil"></i> EDIT MILESTONE</a>
                                                    <a href="#" class="btn btn-default"><i class="fa fa-cloud-upload"></i> UPLOAD</a>
                                                    <a href="#" class="btn btn-success"><i class="fa fa-file"></i> VIEW INVOICE</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end project milestone -->
                                        <!-- project milestone -->
                                        <div class="panel project-milestone">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="#collapse3" data-toggle="collapse" data-parent="#accordion" class="collapsed" aria-expanded="false">
                                                        <span class="milestone-title"><i class="fa fa-spinner icon-indicator custom-text-blue3"></i> Phase 1 Project Delivery</span>
                                                        <span class="note">7 days until deadline</span>
                                                        <i class="fa toggle-icon fa-plus-circle"></i>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse3" class="panel-collapse collapse" style="height: 0px;" aria-expanded="false">
                                                <div class="panel-body">
                                                    <div class="milestone-section">
                                                        <h4 class="milestone-heading">DESCRIPTION</h4>
                                                        <p class="milestone-description">Velit elitr dolore eu pri, ut has vero imperdiet dissentiet, sit magna blandit reformidans in. Alia commune disputationi vis no, natum rebum melius in ius.</p>
                                                    </div>
                                                    <div class="milestone-section layout-table project-metrics">
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DATE START</span>
                                                                <span class="value">Jul 23, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DATE END</span>
                                                                <span class="value">Oct 01, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">EST. VALUE</span>
                                                                <span class="value">$21,847</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DELIVERABLE</span>
                                                                <span class="value">
																			<i class="fa fa-file-archive-o"></i>
																			<a href="#">project_source_main.zip</a>
																		</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <a href="#" class="btn btn-default"><i class="fa fa-pencil"></i> EDIT MILESTONE</a>
                                                    <a href="#" class="btn btn-default"><i class="fa fa-cloud-upload"></i> UPLOAD</a>
                                                    <a href="#" class="btn btn-success"><i class="fa fa-file"></i> CREATE INVOICE</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end project milestone -->
                                        <!-- project milestone -->
                                        <div class="panel project-milestone">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="#collapse4" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                        <span class="milestone-title"><i class="fa fa-spinner icon-indicator custom-text-blue3"></i> UI Design</span> <i class="fa fa-minus-circle toggle-icon"></i>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse4" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    <div class="milestone-section">
                                                        <h4 class="milestone-heading">DESCRIPTION</h4>
                                                        <p class="milestone-description">Velit elitr dolore eu pri, ut has vero imperdiet dissentiet, sit magna blandit reformidans in. Alia commune disputationi vis no, natum rebum melius in ius.</p>
                                                    </div>
                                                    <div class="milestone-section layout-table project-metrics">
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DATE START</span>
                                                                <span class="value">Jul 23, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DATE END</span>
                                                                <span class="value">Oct 01, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">EST. VALUE</span>
                                                                <span class="value">$21,847</span>
                                                            </div>
                                                        </div>
                                                        <div class="cell">
                                                            <div class="main-info-item">
                                                                <span class="title">DELIVERABLE</span>
                                                                <span class="value">
																			<i class="fa fa-file-archive-o"></i>
																			<a href="#">project_source_main.zip</a>
																		</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="milestone-section">
                                                        <div class="table-responsive">
                                                            <table class="table table-striped table-project-tasks">
                                                                <thead>
                                                                <tr>
                                                                    <th>TASK</th>
                                                                    <th>DEADLINE</th>
                                                                    <th>PROGRESS</th>
                                                                    <th>ACTIONS</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator warning"></span> Wireframing</td>
                                                                    <td>Jul 27, 2017
                                                                        <span class="text-muted">(9 days)</span>
                                                                    </td>
                                                                    <td>95%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator warning"></span> Create style guide</td>
                                                                    <td>Jul 23, 2017
                                                                        <span class="text-muted">(2 days)</span>
                                                                    </td>
                                                                    <td>75%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator danger"></span> Design Draft</td>
                                                                    <td>Jul 12, 2017
                                                                        <span class="text-danger">(+5 days)</span>
                                                                    </td>
                                                                    <td>80%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" class="divider">COMPLETED TASK</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator success"></span> Functional Specs</td>
                                                                    <td>Jul 27, 2017</td>
                                                                    <td>100%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator success"></span> Design Specs</td>
                                                                    <td>Jul 27, 2017</td>
                                                                    <td>100%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i class="fa fa-eye"></i></a>
																						<a href="#"><i class="fa fa-pencil"></i></a>
																						<a href="#"><i class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <a href="#" class="btn btn-default"><i class="fa fa-pencil"></i> EDIT MILESTONE</a>
                                                    <a href="#" class="btn btn-default"><i class="fa fa-cloud-upload"></i> UPLOAD</a>
                                                    <a href="#" class="btn btn-success"><i class="fa fa-file"></i> CREATE INVOICE</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end project milestone -->
                                    </div>
                                </div>
                            </div>
                        </div>

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
                                                    <a href="#" class="stripe-connect"><span>Connect with Stripe</span></a>
                                                </div>
                                            </div>
                                            <!--
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
                                            -->
                                            <div class="panel-cols-2">
                                                <div class="widget-metric_9 text-left">
                                                    <form class="form-horizontal">
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">Email</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" class="form-control" id="input-email">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">Country</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" class="form-control" id="input-country" placeholder="GB">
                                                            </div>
                                                        </div>
                                                    </form>
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
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-progressbar/js/bootstrap-progressbar.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/jquery-sparkline/js/jquery.sparkline.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/slick/slick.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/chart-js/Chart.min.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>

<script>
    $(function()
    {
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
        // sparkline chart
        var sparklineParams = {
            width: '100%',
            height: '70px',
            lineWidth: '2',
            lineColor: 'rgba(0,56,255,0.30)',
            fillColor: 'rgba(0,56,255,0.15)',
            spotRadius: '2',
            highlightLineColor: 'rgba(0,56,255,0.30)',
            highlightSpotColor: 'rgba(0,56,255,0.30)',
            spotColor: '',
            minSpotColor: false,
            maxSpotColor: false,
            disableInteraction: false,
            tooltipClassname: 'jqstooltip flotTip',
            normalRangeMin: 0,
            normalRangeMin: 100
        };
        $('.inlinesparkline').sparkline('html', sparklineParams);
        // newsletter opens by location
        $('a[data-toggle="tab"]').on('shown.bs.tab', function(e)
        {
            if ($(e.target).attr('href') === '#tab2')
            {
                var mapData = {
                    "us": "2936",
                    "dz": "2812",
                    "ru": "2735",
                    "fr": "2674",
                    "mx": "2584",
                    "de": "1986",
                    "br": "1921",
                };
                $('#map-email-opens').vectorMap(
                    {
                        map: 'world_en',
                        backgroundColor: 'transparent',
                        color: '#f2f4f6',
                        borderColor: '#D1D4D7',
                        borderOpacity: 0.5,
                        values: mapData,
                        scaleColors: ["#E7F5FF", "#9AA9B4"],
                        normalizeFunction: 'polynomial'
                    });
            }
            else if ($(e.target).attr('href') === '#tab3')
            {
                var data = [
                    {
                        label: "Social",
                        data: 45
                    },
                    {
                        label: "Referral",
                        data: 26
                    },
                    {
                        label: "Organic",
                        data: 14
                    },
                    {
                        label: "Others",
                        data: 15
                    }];
                $.plot('#traffic-sources-chart', data,
                    {
                        series:
                            {
                                pie:
                                    {
                                        show: true,
                                        innerRadius: 0.5,
                                        stroke:
                                            {
                                                width: 4,
                                                color: "#F9F9F9"
                                            },
                                        label:
                                            {
                                                show: true,
                                                radius: 3 / 4,
                                                formatter: donutLabelFormatter,
                                            },
                                    },
                            },
                        legend:
                            {
                                backgroundOpacity: 0
                            },
                        colors: ["#FF4402", "#AB7DF6", "#F3BB23", "#20B2AA"],
                    });
            }
        });
        function donutLabelFormatter(label, series)
        {
            return "<div class=\"flot-donut-label\">" + Math.round(series.percent) + "%</div>";
        }
        // stock carousel
        $('.widget-carousel').slick(
            {
                slidesToShow: 3,
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
        // visit duration
        Chart.defaults.global.defaultFontColor = '#a0aeba';
        var ctxHorizontalBarChart = document.getElementById("horizontalbar-chart").getContext("2d");
        var horizontalBarChart = new Chart(ctxHorizontalBarChart,
            {
                type: 'horizontalBar',
                data:
                    {
                        labels: ['0-10s', '11s-30s', '31s-60s', '1m-2m', '3m-5m', '6m-10m', '> 10m'],
                        datasets: [
                            {
                                data: [4000, 4500, 3700, 2990, 1655, 1423, 1123],
                                backgroundColor: 'rgba(0,184,235,0.2)'
                            }]
                    },
                options:
                    {
                        responsive: true,
                        legend:
                            {
                                display: false
                            },
                        scales:
                            {
                                xAxes: [
                                    {
                                        display: false
                                    }],
                                yAxes: [
                                    {
                                        gridLines:
                                            {
                                                display: false,
                                                drawBorder: false
                                            }
                                    }]
                            }
                    }
            });
        // sales chart
        var ctxBarChart = document.getElementById("sales-chart").getContext("2d");
        var barChart = new Chart(ctxBarChart,
            {
                type: 'bar',
                data:
                    {
                        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                        datasets: [
                            {
                                data: [400, 450, 370, 299, 205, 142, 120],
                                backgroundColor: 'rgba(66,184,1,0.3)'
                            }]
                    },
                options:
                    {
                        responsive: true,
                        legend:
                            {
                                display: false
                            },
                        scales:
                            {
                                xAxes: [
                                    {
                                        display: false
                                    }],
                                yAxes: [
                                    {
                                        display: false
                                    }]
                            }
                    }
            });
        // chat volume
        var ctxLineChart = document.getElementById("chat-volume-chart").getContext("2d");
        var lineChart = new Chart(ctxLineChart,
            {
                type: 'line',
                data:
                    {
                        labels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
                        datasets: [
                            {
                                data: [65, 85, 95, 90, 75, 60, 30],
                                label: 'Volume',
                                fill: false,
                                borderWidth: 2,
                                pointRadius: 3,
                                pointHoverRadius: 5,
                                borderColor: '#FB9D7C',
                                backgroundColor: '#FB9D7C',
                            }, ]
                    },
                options:
                    {
                        responsive: true,
                        legend:
                            {
                                display: false
                            },
                        elements:
                            {
                                line:
                                    {
                                        tension: 0.000001
                                    }
                            },
                        scales:
                            {
                                xAxes: [
                                    {
                                        gridLines:
                                            {
                                                display: false,
                                                drawBorder: false
                                            }
                                    }],
                                yAxes: [
                                    {
                                        gridLines:
                                            {
                                                color: '#eff3f6',
                                                drawBorder: false,
                                            },
                                        ticks:
                                            {
                                                display: false,
                                                min: 20,
                                                max: 100,
                                                stepSize: 20
                                            }
                                    }]
                            },
                    }
            });
    });
</script>
</body>
</html>
