<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-02
  Time: 15:10
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
                        <h1 class="page-title-st">Create a charge</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
                        <li><a href="#">Payments</a></li>
                        <li class="active">Create a charge</li>
                    </ul>
                </div>
                <div class="row">
                    <!-- API panel -->
                    <div class="panel">
                        <div class="panel-body">

                            <form:form class="form-horizontal" id="create_charge" method="post" action="create_charge" modelAttribute="chargeParam">
                            <div class="project-info">
                                <h3 class="info-heading">REQUEST</h3>

                                <div class="row">

                                    <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">amount</label>
                                                <div class="col-sm-8">
                                                    <form:input path="amount" type="text" class="form-control" id="amount" value="${chargeParam.amount}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">currency</label>
                                                <div class="col-sm-8">
                                                    <form:input path="currency" type="text" class="form-control" id="currency" value="${chargeParam.currency}"/>
                                                </div>
                                            </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">source</label>
                                            <div class="col-sm-8">
                                                <form:input path="source" type="ExternalAccount" class="form-control" id="source" value="${chargeParam.source}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">capture</label>
                                            <div class="col-sm-8">
                                                <form:select path="capture" id="capture" class="form-control">
                                                    <form:option value="true">true</form:option>
                                                    <form:option value="false">false</form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">customer</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="customer" placeholder="GB">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-6 control-label">statement_descriptor</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="statement_descriptor" placeholder="GB">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-6 control-label">description</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="description">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-6 control-label">receipt_email</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="receipt_email"
                                                       placeholder="GB">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-6 control-label">shipping</label>
                                            <div class="col-sm-6">
                                                <form:input path="shipping['address']" type="text" class="form-control" id="name" value="${chargeParam.shipping[address['line1']]}"/>
                                            </div>
                                        </div>
                                    </div>

                                </div>







                                <div class="panel-group project-accordion">
                                    <!-- project milestone -->
                                    <div class="panel project-milestone">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="#collapse1" data-toggle="collapse" data-parent="#accordion">
                                                    <span class="milestone-title"><i
                                                            class="fa fa-check icon-indicator text-success"></i> Research on eCommerce Trends</span>

                                                    <i class="fa fa-minus-circle toggle-icon"></i>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse1" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <div class="milestone-section">
                                                    <h4 class="milestone-heading">DESCRIPTION</h4>
                                                    <p class="milestone-description">Velit elitr dolore eu pri, ut has
                                                        vero imperdiet dissentiet, sit magna blandit reformidans in.
                                                        Alia commune disputationi vis no, natum rebum melius in ius.</p>
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
                                                                    <span class="task-indicator success"></span>
                                                                    Functional Specs
                                                                </td>
                                                                <td>Jul 30, 2017</td>
                                                                <td>100%</td>
                                                                <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <span class="task-indicator success"></span> Design
                                                                    Specs
                                                                </td>
                                                                <td>Aug 01, 2017</td>
                                                                <td>100%</td>
                                                                <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel-footer">
                                                <a href="#" class="btn btn-default"><i class="fa fa-pencil"></i> EDIT
                                                    MILESTONE</a>
                                                <a href="#" class="btn btn-default"><i class="fa fa-cloud-upload"></i>
                                                    UPLOAD</a>
                                                <a href="#" class="btn btn-success"><i class="fa fa-file"></i> VIEW
                                                    INVOICE</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end project milestone -->
                                    <!-- project milestone -->
                                    <div class="panel project-milestone">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="#collapse2" data-toggle="collapse" data-parent="#accordion"
                                                   class="collapsed" aria-expanded="false">
                                                    <span class="milestone-title"><i
                                                            class="fa fa-check icon-indicator text-success"></i> Business Requirements</span>
                                                    <span class="label label-danger label-transparent">DUE</span>
                                                    <i class="fa toggle-icon fa-plus-circle"></i>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse2" class="panel-collapse collapse" style="height: 0px;"
                                             aria-expanded="false">
                                            <div class="panel-body">
                                                <div class="milestone-section">
                                                    <h4 class="milestone-heading">DESCRIPTION</h4>
                                                    <p class="milestone-description">Velit elitr dolore eu pri, ut has
                                                        vero imperdiet dissentiet, sit magna blandit reformidans in.
                                                        Alia commune disputationi vis no, natum rebum melius in ius.</p>
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
                                                                    <span class="task-indicator success"></span>
                                                                    Functional Gathering
                                                                </td>
                                                                <td>Jul 30, 2017</td>
                                                                <td>100%</td>
                                                                <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <span class="task-indicator success"></span>
                                                                    Features and Specs
                                                                </td>
                                                                <td>Aug 10, 2017</td>
                                                                <td>100%</td>
                                                                <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel-footer">
                                                <a href="#" class="btn btn-default"><i class="fa fa-pencil"></i> EDIT
                                                    MILESTONE</a>
                                                <a href="#" class="btn btn-default"><i class="fa fa-cloud-upload"></i>
                                                    UPLOAD</a>
                                                <a href="#" class="btn btn-success"><i class="fa fa-file"></i> VIEW
                                                    INVOICE</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end project milestone -->
                                    <!-- project milestone -->
                                    <div class="panel project-milestone">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="#collapse3" data-toggle="collapse" data-parent="#accordion"
                                                   class="collapsed" aria-expanded="false">
                                                    <span class="milestone-title"><i
                                                            class="fa fa-spinner icon-indicator custom-text-blue3"></i> Phase 1 Project Delivery</span>
                                                    <span class="note">7 days until deadline</span>
                                                    <i class="fa toggle-icon fa-plus-circle"></i>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse3" class="panel-collapse collapse" style="height: 0px;"
                                             aria-expanded="false">
                                            <div class="panel-body">
                                                <div class="milestone-section">
                                                    <h4 class="milestone-heading">DESCRIPTION</h4>
                                                    <p class="milestone-description">Velit elitr dolore eu pri, ut has
                                                        vero imperdiet dissentiet, sit magna blandit reformidans in.
                                                        Alia commune disputationi vis no, natum rebum melius in ius.</p>
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
                                                <a href="#" class="btn btn-default"><i class="fa fa-pencil"></i> EDIT
                                                    MILESTONE</a>
                                                <a href="#" class="btn btn-default"><i class="fa fa-cloud-upload"></i>
                                                    UPLOAD</a>
                                                <a href="#" class="btn btn-success"><i class="fa fa-file"></i> CREATE
                                                    INVOICE</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end project milestone -->
                                    <c:if test = "${charge.amount != null}">
                                        <!-- project milestone -->
                                        <div class="panel project-milestone">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="#collapse4" data-toggle="collapse" data-parent="#accordion"
                                                       class="collapsed">
                                                    <span class="milestone-title"><i
                                                            class="fa fa-spinner icon-indicator custom-text-blue3"></i> UI Design</span>
                                                        <i class="fa fa-minus-circle toggle-icon"></i>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse4" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    <div class="milestone-section">
                                                        <h4 class="milestone-heading">DESCRIPTION</h4>
                                                        <p class="milestone-description">Velit elitr dolore eu pri, ut has
                                                            vero imperdiet dissentiet, sit magna blandit reformidans in.
                                                            Alia commune disputationi vis no, natum rebum melius in ius.</p>
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
                                                                        <span class="task-indicator warning"></span>
                                                                        Wireframing
                                                                    </td>
                                                                    <td>Jul 27, 2017
                                                                        <span class="text-muted">(9 days)</span>
                                                                    </td>
                                                                    <td>95%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator warning"></span> Create
                                                                        style guide
                                                                    </td>
                                                                    <td>Jul 23, 2017
                                                                        <span class="text-muted">(2 days)</span>
                                                                    </td>
                                                                    <td>75%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator danger"></span> Design
                                                                        Draft
                                                                    </td>
                                                                    <td>Jul 12, 2017
                                                                        <span class="text-danger">(+5 days)</span>
                                                                    </td>
                                                                    <td>80%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" class="divider">COMPLETED TASK</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator success"></span>
                                                                        Functional Specs
                                                                    </td>
                                                                    <td>Jul 27, 2017</td>
                                                                    <td>100%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="task-indicator success"></span> Design
                                                                        Specs
                                                                    </td>
                                                                    <td>Jul 27, 2017</td>
                                                                    <td>100%</td>
                                                                    <td>
																					<span class="actions">
																						<a href="#"><i
                                                                                                class="fa fa-eye"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-pencil"></i></a>
																						<a href="#"><i
                                                                                                class="fa fa-trash"></i></a>
																					</span>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <a href="#" class="btn btn-default"><i class="fa fa-pencil"></i> EDIT
                                                        MILESTONE</a>
                                                    <a href="#" class="btn btn-default"><i class="fa fa-cloud-upload"></i>
                                                        UPLOAD</a>
                                                    <a href="#" class="btn btn-success"><i class="fa fa-file"></i> CREATE
                                                        INVOICE</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end project milestone -->
                                    </c:if>

                                </div>
                            </div>
                                <button type="submit" class="btn btn-primary">Submit Request</button>
                            </form:form>
                        </div>
                    </div>
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
    });
</script>
</body>
</html>

