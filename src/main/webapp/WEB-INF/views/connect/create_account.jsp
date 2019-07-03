<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-14
  Time: 14:01
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
    <meta name="google-signin-client_id" content="927746323156-6n30vkqvoij4meib86mpcg2388k87t45.apps.googleusercontent.com">

    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/themify-icons/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/pace/themes/orange/pace-theme-minimal.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/switchery/switchery.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/toastr/toastr.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/sweetalert2/sweetalert2.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" />">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="https://stripe.com/favicon.ico" />">

</head>
<body class="layout-topnav">
<div id="dark_cover" style="display: none;">
</div>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <jsp:include page='../navbar.jsp'/>
    <!-- END NAVBAR -->

    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Connect Account</h1>
                    </div>
                    <!-- Account selection -->
                    <div class="account-select">
                        <select id="stripe-account" class="acct-sel" >
                            <option value="" label="Select account"/>
                            <c:forEach items="${viewObj.allAccounts.accountPropertiesList}" var="account">
                                <option value="${account.accountName}" label="Account - ${account.accountName}"/>
                            </c:forEach>
                        </select>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="/"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="/payments">Connect</a></li>
                        <li class="active">Create a connect account</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->

                <!-- ACCOUNT PARAMETERS -->
                <div class="row" id="account-params">
                    <div class="panel panel-tab panel-main panel-client" id="create-account-panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Create a connect account</h3>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabStd" ><a href="#stdTab" data-toggle="tab"></i> Standard Account </a></li>
                                <li id="tabExp" ><a href="#expTab" data-toggle="tab"></i> Express Account </a></li>
                                <li id="tabCustom"><a href="#customTab" data-toggle="tab"></i> Custom Account </a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <div class="tab-content no-padding" id="parameters">
                                <div class="tab-pane active">
                                    <h4>Please select account type</h4>
                                </div>
                                <!-- STANDARD ACCOUNT -->
                                <div class="tab-pane " id="stdTab">
                                    <form class="form-horizontal" id="stdForm">
                                        <!-- BASIC PARAMS -->
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">stripe_user[email]</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" name="stripe_user[email]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">stripe_user[url]</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" name="stripe_user[url]" type="text" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">response_type</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" name="response_type" type="text" value="code"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">client_id</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="std-client_id" name="client_id" type="text" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">redirect_uri</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="std-redirect_uri" name="redirect_uri" type="text" value="http://localhost:8080/account-return"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">state</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" name="state" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">scope</label>
                                                    <div class="col-sm-6 dropdown-select">
                                                        <select name="scope" class="form-control" >
                                                            <option value="read_write" label="read_write"/>
                                                            <option value="read_only" label="read_only"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_landing</label>
                                                    <div class="col-sm-6 dropdown-select">
                                                        <select name="stripe_landing" class="form-control" >
                                                            <option value="register" label="register"/>
                                                            <option value="login" label="login"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">always_prompt</label>
                                                    <div class="col-sm-6 dropdown-select">
                                                        <select name="always_prompt" class="form-control">
                                                            <option value="" label="--------"/>
                                                            <option value="true" label="true"/>
                                                            <option value="false" label="false"/>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- PRE-FILL PARAMS -->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="project-accordion panel-second">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a href="#collapse-std" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                                <span class="milestone-title"> Pre-fill parameters </span>
                                                                <i class="fa fa-plus-circle toggle-icon"></i>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapse-std" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    <div class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-6 control-label">stripe_user[first_name]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[first_name]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-6 control-label">stripe_user[last_name]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[last_name]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-6 control-label">stripe_user[dob_day]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[dob_day]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-6 control-label">stripe_user[dob_month]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[dob_month]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group last-row">
                                                                            <label class="col-sm-6 control-label">stripe_user[dob_year]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[dob_year]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <div class="form-horizontal">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-6 control-label">stripe_user[phone_number]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[phone_number]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-6 control-label">stripe_user[street_address]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[street_address]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-6 control-label">stripe_user[city]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[city]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="col-sm-6 control-label">stripe_user[state]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[state]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group last-row">
                                                                            <label class="col-sm-6 control-label">stripe_user[zip]</label>
                                                                            <div class="col-sm-6">
                                                                                <input class="form-control" name="stripe_user[zip]" type="text" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">stripe_user[country]</label>
                                                                        <div class="col-sm-6  dropdown-select">
                                                                            <select name="stripe_user[country]" class="form-control">
                                                                                <option value="">--------</option>
                                                                                <option value="GB">United Kingdom</option>
                                                                                <option value="US">United States</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">stripe_user[business_type]</label>
                                                                        <div class="col-sm-6  dropdown-select">
                                                                            <select name="stripe_user[business_type]" class="form-control">
                                                                                <option value="">--------</option>
                                                                                <option value="sole_prop">sole_prop</option>
                                                                                <option value="corporation">corporation</option>
                                                                                <option value="non_profit">non_profit</option>
                                                                                <option value="partnership">partnership</option>
                                                                                <option value="llc">llc</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">stripe_user[business_name]</label>
                                                                        <div class="col-sm-6">
                                                                            <input class="form-control" name="stripe_user[business_name]" type="text" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group last-row">
                                                                        <label class="col-sm-6 control-label">stripe_user[currency]</label>
                                                                        <div class="col-sm-6">
                                                                            <input class="form-control" name="stripe_user[currency]" type="text" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="panel-footer btn-hide acct-param-footer">
                                        <button data-toggle="" class="btn btn-primary-stripe-blue" id="tabStd-btn">Create standard account</button>
                                    </div>
                                </div>

                                <!-- EXPRESS ACCOUNT -->
                                <div class="tab-pane " id="expTab">
                                    <form class="form-horizontal" id="expForm">
                                        <!-- BASIC PARAMS -->
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[email]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" name="stripe_user[email]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[first_name]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" name="stripe_user[first_name]" type="text" />
                                                    </div>
                                                </div>
                                                <div class="form-group last-row">
                                                    <label class="col-sm-6 control-label">stripe_user[last_name]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" name="stripe_user[last_name]" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[business_type]</label>
                                                    <div class="col-sm-6  dropdown-select">
                                                        <select name="stripe_user[business_type]" class="form-control">
                                                            <option value="">--------</option>
                                                            <option value="individual">individual</option>
                                                            <option value="company">company</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[business_name]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" name="stripe_user[business_name]" type="text" />
                                                    </div>
                                                </div>
                                                <div class="form-group last-row">
                                                    <label class="col-sm-6 control-label">stripe_user[phone_number]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" name="stripe_user[phone_number]" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">client_id</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="client_id" name="client_id" type="text" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">response_type</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="response_type" name="response_type" type="text" value="code"/>
                                                    </div>
                                                </div>
                                                <div class="form-group last-row">
                                                    <label class="col-sm-4 control-label">state</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" name="state" id="state" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="panel-footer btn-hide acct-param-footer">
                                        <button data-toggle="" class="btn btn-primary-stripe-blue" id="tabExp-btn">Create express account</button>
                                    </div>
                                </div>

                                <!-- CUSTOM ACCOUNT -->
                                <div class="tab-pane" id="customTab">
                                    <form class="form-horizontal" id="customForm">
                                        <input type="hidden" name="accountName" value=""/>
                                        <input type="hidden" name="type" value="custom"/>

                                        <!-- DEFAULT PARAMS -->
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">country</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select id="country" name="country" class="form-control " >
                                                            <c:forEach items="${country}" var="item">
                                                                <option value="${item}">${item}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">def_currency</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control " id="default_currency" name="default_currency" value="gbp" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">tos_acceptance.ip</label>
                                                    <div class="col-sm-7">
                                                        <input name="tos_acceptance.ip" class="form-control " id="tos_acceptance_ip" value="" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">tos_acceptance.date</label>
                                                    <div class="col-sm-7">
                                                        <div class="input-group date" data-date-autoclose="true" data-provide="datepicker" data-date-format="mm/dd/yyyy">
                                                            <input type="text" class="form-control " cssStyle="border-right-color: #e1e3ea !important;" id="tos_acceptance_date" value=""/>
                                                            <span class="input-group-addon "><i class="fa fa-calendar"></i></span>
                                                            <input type="hidden" name="tos_acceptance.date" id="hidden-tos-date" value=""/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">business_type</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="business_type" id="business_type" class="form-control" >
                                                            <option value="" label="--------"/>
                                                            <option value="company" label="company"/>
                                                            <option value="individual" label="individual"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">requested_capabilities</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="requested_capabilities[]" id="requested_capabilities" class="form-control" >
                                                            <option value="" label="--------"/>
                                                            <option value="card_payments" label="card_payments"/>
                                                            <option value="platform_payments" label="platform_payments"/>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <!-- OBJECT PARAMS -->
                                        <div class="row">
                                            <!-- BANK ACCOUNT -->
                                            <div class="col-md-4">
                                                <div class="project-accordion panel-second">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a href="#external-account" data-toggle="collapse" data-parent="#accordion" class="collapsed" id="external-account-collapsed">
                                                                <span class="milestone-title"> external_account </span>
                                                                <i class="fa fa-plus-circle toggle-icon"></i>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="external-account" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">object</label>
                                                                <div class="col-sm-7 dropdown-select">
                                                                    <select name="external_account.object" id="external_account_object" class="form-control" >
                                                                        <option value="" label="--------"/>
                                                                        <option value="bank_account" label="bank_account"/>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">currency</label>
                                                                <div class="col-sm-7 dropdown-select">
                                                                    <select name="external_account.currency" id="external_account_currency" class="form-control" >

                                                                        <option />
                                                                    </select>

                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">country</label>
                                                                <div class="col-sm-7 dropdown-select">
                                                                    <select name="external_account.country" id="external_account_country" class="form-control" >
                                                                        <options items="${null}"/>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">acct_holder_name</label>
                                                                <div class="col-sm-7">
                                                                    <input name="external_account.account_holder_name" class="form-control" id="external_account_account_holder_name" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">acct_holder_type</label>
                                                                <div class="col-sm-7 dropdown-select">
                                                                    <select name="external_account.account_holder_type" id="external_account_account_holder_type" class="form-control" >
                                                                        <option value="" label="--------"/>
                                                                        <option value="company" label="company"/>
                                                                        <option value="individual" label="individual"/>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">routing_number</label>
                                                                <div class="col-sm-7">
                                                                    <input name="external_account.routing_number" class="form-control" id="external_account_routing_number" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group last-row">
                                                                <label class="col-sm-5 control-label">account_number</label>
                                                                <div class="col-sm-7">
                                                                    <input name="external_account.account_number" class="form-control" id="external_account_account_number" value="" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- OPTIONAL PARAMS -->
                                            <div class="col-md-4">
                                                <div class="project-accordion panel-second">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a href="#settings" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                                <span class="milestone-title"> optional parameters </span>
                                                                <i class="fa fa-plus-circle toggle-icon"></i>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="settings" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">email</label>
                                                                <div class="col-sm-7">
                                                                    <input name="email" class="form-control" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">metadata</label>
                                                                <div class="col-sm-3" style="padding-right:5px;">
                                                                    <input class="form-control" id="acct-metadatakey-0" data-toggle="0" placeholder="key"/>
                                                                </div>
                                                                <div class="col-sm-4" style="padding-left:5px;">
                                                                    <input class="form-control" id="acct-metadatakey-0-value" name="metadata" placeholder="value"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group" id="acct-md-1">
                                                                <label class="col-sm-5 control-label"></label>
                                                                <div class="col-sm-3" style="padding-right:5px;">
                                                                    <input class="form-control" id="acct-metadatakey-1" data-toggle="1" placeholder="key"/>
                                                                </div>
                                                                <div class="col-sm-4" style="padding-left:5px;">
                                                                    <input class="form-control" id="acct-metadatakey-1-value" name="metadata" placeholder="value"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <a class="col-sm-4 col-sm-offset-6 control-label" id="add-md" style="float: right; cursor: pointer;padding-top:0;">+ add metadata</a>
                                                            </div>

                                                            <!-- BUSINESS PROFILE -->
                                                            <div class="panel panel-inner">
                                                                <div class="panel-heading">
                                                                    <h3 class="panel-title">business_profile</h3>
                                                                </div>
                                                                <div class="panel-body">
                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">mcc</label>
                                                                                <div class="col-sm-7">
                                                                                    <input name="business_profile.mcc" class="form-control" id="business_profile_mcc" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">name</label>
                                                                                <div class="col-sm-7">
                                                                                    <input name="business_profile.name" class="form-control" id="business_profile_name" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">prod_description</label>
                                                                                <div class="col-sm-7">
                                                                                    <input name="business_profile.product_description" class="form-control" id="business_profile_product_description" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">support_email</label>
                                                                                <div class="col-sm-7">
                                                                                    <input name="business_profile.support_email" class="form-control" id="business_profile_support_email" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">support_phone</label>
                                                                                <div class="col-sm-7">
                                                                                    <input name="business_profile.support_phone" class="form-control" id="business_profile_support_phone" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">support_url</label>
                                                                                <div class="col-sm-7">
                                                                                    <input name="business_profile.support_url" class="form-control" id="business_profile_support_url" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">url</label>
                                                                                <div class="col-sm-7">
                                                                                    <input name="business_profile.url" class="form-control" id="business_profile_url" value="" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- SETTINGS -->
                                                            <div class="panel panel-inner">
                                                                <div class="panel-heading">
                                                                    <h3 class="panel-title">settings</h3>
                                                                </div>
                                                                <div class="panel-body">
                                                                    <!-- setting.branding -->
                                                                    <div class="panel panel-inner">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title"> settings.branding </h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">icon</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input name="settings.branding.icon" class="form-control" id="settings_branding_icon" value="" />
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">logo</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input name="settings.branding.logo" class="form-control" id="settings_branding_logo" value="" />
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">primary_color</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input name="settings.branding.primary_color" class="form-control" id="settings_branding_primary_color" value="" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- setting.card_payments -->
                                                                    <div class="panel panel-inner">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title"> settings.card_payments </h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-6 control-label">stmt_descriptor_prefix</label>
                                                                                        <div class="col-sm-6">
                                                                                            <input name="settings.card_payments.statement_descriptor_prefix" class="form-control" id="settings_card_payments_statement_descriptor_prefix" value="" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <!-- setting.card_payments.decline_on -->
                                                                            <div class="panel panel-inner">
                                                                                <div class="panel-heading">
                                                                                    <h3 class="panel-title"> settings.card_payments.decline_on </h3>
                                                                                </div>
                                                                                <div class="panel-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-5 control-label">avs_failure</label>
                                                                                                <div class="col-sm-7 dropdown-select">
                                                                                                    <select name="settings.card_payments.decline_on.avs_failure" id="settings_card_payments_decline_on.avs_failure" class="form-control" >
                                                                                                        <option value="" label="--------"/>
                                                                                                        <option value="true" label="true"/>
                                                                                                        <option value="false" label="false"/>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-5 control-label">cvc_failure</label>
                                                                                                <div class="col-sm-7 dropdown-select">
                                                                                                    <select name="settings.card_payments.decline_on.cvc_failure" id="settings_card_payments_decline_on.cvc_failure" class="form-control" >
                                                                                                        <option value="" label="--------"/>
                                                                                                        <option value="true" label="true"/>
                                                                                                        <option value="false" label="false"/>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- setting.payments -->
                                                                    <div class="panel panel-inner">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title"> settings.payments </h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">stmt_descriptor</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input name="settings.payments.statement_descriptor" class="form-control" id="settings_payments_statement_descriptor" value="" />
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- setting.payouts -->
                                                                    <div class="panel panel-inner">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title"> settings.payouts </h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-7 control-label">debit_negative_balances</label>
                                                                                        <div class="col-sm-5 dropdown-select">
                                                                                            <select name="settings.payouts.debit_negative_balances" id="settings_payouts_debit_negative_balances" class="form-control" >
                                                                                                <option value="" label="--------"/>
                                                                                                <option value="true" label="true"/>
                                                                                                <option value="false" label="false"/>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <!-- setting.payouts.schedule -->
                                                                            <div class="panel panel-inner">
                                                                                <div class="panel-heading">
                                                                                    <h3 class="panel-title"> settings.payouts.schedule </h3>
                                                                                </div>
                                                                                <div class="panel-body">
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-7 control-label">interval</label>
                                                                                                <div class="col-sm-5 dropdown-select">
                                                                                                    <select name="settings.payouts.schedule.interval" id="settings_payouts_schedule_interval" class="form-control" >
                                                                                                        <option value="" label="--------"/>
                                                                                                        <option value="manual" label="manual"/>
                                                                                                        <option value="daily" label="daily"/>
                                                                                                        <option value="weekly" label="weekly"/>
                                                                                                        <option value="monthly" label="monthly"/>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-7 control-label">delay_days</label>
                                                                                                <div class="col-sm-5">
                                                                                                    <input name="settings.payouts.schedule.delay_days" class="form-control" id="settings_payouts_schedule_delay_days" value="" />
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-7 control-label">monthly_anchor</label>
                                                                                                <div class="col-sm-5">
                                                                                                    <input name="settings.payouts.schedule.monthly_anchor" class="form-control" id="settings_payouts_schedule_monthly_anchor" value="" />
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="form-group">
                                                                                                <label class="col-sm-7 control-label">weekly_anchor</label>
                                                                                                <div class="col-sm-5">
                                                                                                    <input name="settings.payouts.schedule.weekly_anchor" class="form-control" id="settings_payouts_schedule_weekly_anchor" value="" />
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- VERIFICATION -->
                                            <div class="col-md-4">
                                                <!-- COMPANY DETAILS -->
                                                <div id="req-company" class="project-accordion panel-second">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a href="#company" data-toggle="collapse" data-parent="#accordion" class="collapsed" id="company-collapsed">
                                                                <span class="milestone-title"> company </span>
                                                                <i class="fa fa-plus-circle toggle-icon"></i>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="company" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">name</label>
                                                                <div class="col-sm-7">
                                                                    <input name="company.name" class="form-control" id="company_name" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">address[line1]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="company.address.line1" class="form-control" id="company_address_line1" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">address[city]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="company.address.city" class="form-control" id="company_address_city" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">addr[postal_code]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="company.address.postal_code" class="form-control" id="company_address_postal_code" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">tax_id</label>
                                                                <div class="col-sm-7">
                                                                    <input name="company.tax_id" class="form-control" id="company_tax_id" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group last-row">
                                                                <label class="col-sm-5 control-label">phone</label>
                                                                <div class="col-sm-7">
                                                                    <input name="company.phone" class="form-control" id="company_phone" value="" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- INDIVIDUAL DETAILS -->
                                                <div id="req-individual" class="project-accordion panel-second">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a href="#individual" data-toggle="collapse" data-parent="#accordion" class="collapsed" id="individual-collapsed">
                                                                <span class="milestone-title"> individual </span>
                                                                <i class="fa fa-plus-circle toggle-icon"></i>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="individual" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">first_name</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.first_name" class="form-control" id="individual_first_name" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">last_name</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.last_name" class="form-control" id="individual_last_name" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">id_number</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.id_number" class="form-control" id="individual_id_number" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">email</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.email" class="form-control" id="individual_email" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">address[line1]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.address.line1" class="form-control" id="individual_address_line1" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">address[city]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.address.city" class="form-control" id="individual_address_city" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">addr[postal_code]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.address.postal_code" class="form-control" id="individual_address_postal_code" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">dob[day]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.dob.day" class="form-control" id="individual_dob_day" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">dob[month]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.dob.month" class="form-control" id="individual_dob_month" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">dob[year]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.dob.year" class="form-control" id="individual_dob_year" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">veri[doc][front]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.verification.document.front" class="form-control" id="individual_verification_document_front" value="" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group last-row">
                                                                <label class="col-sm-5 control-label">veri[doc][back]</label>
                                                                <div class="col-sm-7">
                                                                    <input name="individual.verification.document.back" class="form-control" id="individual_verification_document_back" value="" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="panel-footer btn-hide acct-param-footer">
                                        <button data-toggle="" class="btn btn-primary-stripe-blue" id="tabCustom-btn">Create custom account</button>
                                        <div id="ho-switch" style="display:none;">
                                            <input type="checkbox" class="js-switch" id="switch-check-change" data-color="blue" data-switchery="true" style="display: none;">
                                            <div class="alert alert-info alert-action" style="float:right;margin-right:10px"><span>Hosted Onboarding</span></div>
                                        </div>
                                        <div id="api-onboarding">
                                            <button data-toggle="" id="btn-update-acct" class="btn btn-primary-stripe-white btn-hide"><span>Update</span></button>
                                            <button data-toggle="" id="btn-add-person" class="btn btn-primary-stripe-white btn-hide"><span>Add person</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END ACCOUNT PARAMETERS -->

                <!-- PERSON PARAMETERS -->
                <div class="row" id="person-params">
                    <div class="panel panel-main" id="person" style="display: none;">
                        <div class="panel-heading">
                            <h3 class="panel-title">Person</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" id="person-form">
                                <input type="hidden" name="accountName" value=""/>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">first_name</label>
                                            <div class="col-sm-7">
                                                <input name="first_name" class="form-control" id="first_name" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">last_name</label>
                                            <div class="col-sm-7">
                                                <input name="last_name" class="form-control" id="last_name" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">id_number</label>
                                            <div class="col-sm-7">
                                                <input name="id_number" class="form-control" id="id_number" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">dob.day</label>
                                            <div class="col-sm-7">
                                                <input name="dob.day" class="form-control" id="dob_day" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">dob.month</label>
                                            <div class="col-sm-7">
                                                <input name="dob.month" class="form-control" id="dob_month" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">dob.year</label>
                                            <div class="col-sm-7">
                                                <input name="dob.year" class="form-control" id="dob_year" value="" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">email</label>
                                            <div class="col-sm-7">
                                                <input name="email" class="form-control" id="email" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">address[line1]</label>
                                            <div class="col-sm-7">
                                                <input name="address.line1" class="form-control" id="address_line1" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">address[city]</label>
                                            <div class="col-sm-7">
                                                <input name="address.city" class="form-control" id="address_city" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">addr[postal_code]</label>
                                            <div class="col-sm-7">
                                                <input name="address.postal_code" class="form-control" id="address_postal_code" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">veri[doc][front]</label>
                                            <div class="col-sm-7">
                                                <input name="verification.document.front" class="form-control" id="verification_document_front" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">veri[doc][back]</label>
                                            <div class="col-sm-7">
                                                <input name="verification.document.back" class="form-control" id="verification_document_back" value="" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-8 control-label">relationship[title]</label>
                                            <div class="col-sm-4 dropdown-select">
                                                <select name="relationship.title" id="relationship_title" class="form-control " >
                                                    <option value="" label="--------"/>
                                                    <option value="Mr" label="Mr"/>
                                                    <option value="Mrs" label="Mrs"/>
                                                    <option value="Miss" label="Miss"/>
                                                    <option value="Ms" label="Ms"/>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-8 control-label">relationship[owner]</label>
                                            <div class="col-sm-4 dropdown-select">
                                                <select name="relationship.owner" id="relationship_owner" class="form-control " >
                                                    <option value="" label="--------"/>
                                                    <option value="true" label="true"/>
                                                    <option value="false" label="false"/>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-8 control-label">relationship[acct_opener]</label>
                                            <div class="col-sm-4 dropdown-select">
                                                <select name="relationship.account_opener" id="relationship_account_opener" class="form-control " >
                                                    <option value="" label="--------"/>
                                                    <option value="true" label="true"/>
                                                    <option value="false" label="false"/>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-8 control-label">relationship[director]</label>
                                            <div class="col-sm-4 dropdown-select">
                                                <select name="relationship.director" id="relationship_director" class="form-control " >
                                                    <option value="" label="--------"/>
                                                    <option value="true" label="true"/>
                                                    <option value="false" label="false"/>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-8 control-label">relationship[percent_ownership]</label>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <input name="relationship.percent_ownership" type="text" class="form-control" id="relationship_percent_ownership" value=""/>
                                                    <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>

                        <div class="panel-footer">
                            <button id="btn-person" class="btn btn-primary-stripe-blue"><span> create person </span></button>
                        </div>
                    </div>
                </div>
                <!-- END PERSON PARAMETERS -->

                <!-- ACCESS TOKEN -->
                <div class="row" id="token-params" style="display: none;">
                    <div class="panel panel-main panel-server panel-tab" id="create-token-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>https://connect.stripe.com/oauth/token</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-token" class="active"><a href="#reqTab-token" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-token"><a href="#resTab-token" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-token">
                                <div class="form-horizontal" >
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <form id="reqTokenForm">
                                            <!-- HIDDEN PARAMS -->
                                            <input type="hidden" id="token-accountName" name="accountName" value=""/>
                                            <!-- END HIDDEN PARAMS -->
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">code</label>
                                                    <div class="col-sm-7">
                                                        <input name="code" class="form-control" id="code" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">grant_type</label>
                                                    <div class="col-sm-7">
                                                        <input name="grant_type" class="form-control" id="grant_type" value="authorization_code" />
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->

                                </div>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-token">
                                <h5>Get Token Response</h5>
                                <pre id="tokenReqResponse"></pre>
                            </div>


                        </div>
                        <div class="panel-footer">
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="token-req-btn">Request Token</button>
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="retrieve-acct-btn" style="margin-right:20px; display:none;">get account details</button>
                        </div>
                    </div>
                </div>
                <!-- END ACCESS TOKEN -->


                <!-- HOSTED ONBOARDING -->
                <div class="row" id="ho-params" style="display: none;">
                    <div class="panel panel-main panel-server panel-tab" id="ho-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>/v1/account_links</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-ho" class="active"><a href="#reqTab-token" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-ho"><a href="#resTab-token" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-ho">
                                <div class="form-horizontal" >
                                    <div class="row">
                                        <form id="hoForm">
                                            <!-- HIDDEN PARAMS -->
                                            <input type="hidden" id="ho-accountName" name="accountName" value=""/>
                                            <!-- END HIDDEN PARAMS -->
                                            <div class="col-md-3">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-3 control-label">account</label>
                                                    <div class="col-sm-9">
                                                        <input name="account" class="form-control" id="account" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="col-sm-3 control-label">type</label>
                                                <div class="col-sm-9 dropdown-select">
                                                    <select name="type" class="form-control">
                                                        <option value="custom_account_verification">custom_account_verification</option>
                                                        <option value="custom_account_update">custom_account_update</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-3 control-label">success_url</label>
                                                    <div class="col-sm-9">
                                                        <input name="success_url" class="form-control" id="success_url" value="" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-3 control-label">failure_url</label>
                                                    <div class="col-sm-9">
                                                        <input name="failure_url" class="form-control" id="failure_url" value="" />
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-ho">
                                <h5>Get Token Response</h5>
                                <pre id="hoReqResponse"></pre>
                            </div>


                        </div>
                        <div class="panel-footer">
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="ho-btn">Create account link</button>
                        </div>
                    </div>
                </div>
                <!-- END HOSTED ONBOARDING -->

                <!-- ACCOUNT DETAILS -->
                <div class="row" id="acct-details" style="display: none;">
                    <div class="panel panel-main panel-server" id="account-details-panel">
                        <div class="panel-heading">
                            <a name="server"><h3 class="panel-title"><span class="label label-primary api-method">GET</span>/v1/accounts/:id</h3></a>
                        </div>
                        <div class="panel-body">
                            <div class="form-horizontal" >
                                <!-- BASIC PARAMETERS -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">id</label>
                                            <label class="col-sm-7 control-label text-left" id="acc-id"></label>
                                        </div>
                                        <div class="form-group last-row">
                                            <label class="col-sm-5 control-label">charges_enabled</label>
                                            <label class="col-sm-7 control-label text-left" id="acc-charges_enabled"></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">type</label>
                                            <label class="col-sm-7 control-label text-left" id="acc-type"></label>
                                        </div>
                                        <div class="form-group last-row">
                                            <label class="col-sm-5 control-label">payouts_enabled</label>
                                            <label class="col-sm-7 control-label text-left" id="acc-payouts_enabled"></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">email</label>
                                            <label class="col-sm-7 control-label text-left" id="acc-email"></label>
                                        </div>
                                        <div class="form-group last-row">
                                            <label class="col-sm-5 control-label">details_submitted</label>
                                            <label class="col-sm-7 control-label text-left" id="acc-details_submitted"></label>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">currently_due</label>
                                            <div class="col-sm-9 control-label ob-req">
                                                <table id="cur-due-table">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">eventually_due</label>
                                            <div class="col-sm-8 control-label ob-req">
                                                <table id="eve-due-table">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">past_due</label>
                                            <div class="col-sm-9 control-label ob-req" >
                                                <table id="pst-due-table">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END BASIC PARAMETERS -->

                            </div>
                        </div>
                        <div class="panel-footer">
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="acct-refresh-btn">refresh</button>
                            <button data-toggle="" class="btn btn-primary-stripe-blue btn-hide" id="acct-link-btn" style="margin-right: 20px;">login link</button>
                        </div>
                    </div>
                </div>
                <!-- END ACCOUNT DETAILS -->

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
<script src="<c:url value="/resources/vendor/switchery/switchery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/scripts/serializeToJSON.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.blockUI.js"/>"></script>

<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script>

    let popup;
    let returnedData;

    $(function() {
        let source;

        // toggle nav active
        $('#navConnect').toggleClass('active');
        $('#navConnectAccount').toggleClass('active');
        $('#navCreateAccount').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        // init global variables
        let currentAccount;
        let currentCountrySpec;
        let bankAccountCurrencies;

        /**
         * Select a Stripe account to make API calls
         */
        $('#stripe-account').on('change', function () {
            let accountName = $(this).children("option:selected").val();

            $("input[name='accountName']").val(accountName);
            if (accountName !== ""){
                $.ajax({
                    type : "GET",
                    url : "getAccount",
                    data: "acctName="+accountName,
                    success: function(result){
                        stripe = Stripe(result.accountPublishKey);
                        currentAccount = result;
                    },
                    complete: function(){
                        $('#toast-container').remove();
                        if (typeof currentAccount !== 'undefined'){
                            // show request buttons
                            //$('.acct-param-footer').toggleClass('btn-hide');
                            $('.acct-param-footer').show();
                            // initialise custom account client_id and country/currency spec
                            $("input[name='client_id']").val(currentAccount.accountClientId);
                            let initCountry = $('#country').children("option:selected").val();
                            setContryCurrency(initCountry, currentAccount);
                        }
                    }
                });
            } else {
                $('.acct-param-footer').hide();
            }
        });

        // set metadata
        $('#settings').on('focusout', "input[id*='-metadatakey-']", function () {

            var key = $(this).val();
            var id = $(this).attr('id');
            $('#'+id+'-value').attr('name', 'metadata['+key+']');
        });

        // add more metadata
        var md_num = 1;
        $('#add-md').on('click', function () {
            var prefix = 'acct-md-';
            addMetaData(prefix, md_num);
            md_num++;
        });

        // show create account button per tab
        $('.nav-tabs li').on('click', function () {
            if (typeof currentAccount === 'undefined'){
                showErrorMsg('Select an account', 'You need to select an account before start creating a connect account!');
            }
        });

        /**
         * Create a standard account
         */
        $('#tabStd-btn').on('click', function () {
            let url = createOAuthURL('#stdForm', 'https://connect.stripe.com/oauth/authorize?');
            triggerPop(url);
            receiveAccountReturn(false);
        });

        /**
         * Create an express account
         */
        $('#tabExp-btn').on('click', function () {
            let url = createOAuthURL('#expForm', 'https://connect.stripe.com/express/oauth/authorize?');
            triggerPop(url);
            receiveAccountReturn(false);
        });

        // create oauth URL
        function createOAuthURL(selector, endpoint){
            let data = $(selector).serializeArray();
            let params = '';
            jQuery.each(data, function (index, item) {
                if (!jQuery.isEmptyObject(item.value)){
                    params = params + item.name + "=" + item.value + "&";
                }
            });
            params = params.substr(0, params.length-1);
            //console.log(params);
            let url = endpoint + params;
            return url;
        };

        // monitoring returned code
        function receiveAccountReturn(isHO){
            source = new EventSource("/account/return");
            source.onmessage = function(response) {
                if (response.data !== 'null'){
                    let data = response.data;
                    if (data !== ''){
                        if (isHO){
                            console.log(data);
                            if (data === 'success'){
                                retrieveCustomerAccountDetailsFromHO();
                            }
                        } else {
                            $('#token-params').show();
                            $('#code').val(data);
                        }
                    }
                }
            }
        };

        // trigger onboarding popup
        function triggerPop(url){
            console.log(url);
            $('#dark_cover').fadeIn(500);
            let width = screen.width / 3;
            let height = screen.height * 0.7;
            let left = (screen.width - width) / 2;
            let top = (screen.height - height) / 2;
            let params = 'scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width='+width+',height='+height+',left='+left+',top='+top+'';
            popup = window.open(url, 'test', params);
            //console.log(popup);
            $('#dark_cover').on('click', function () {
                popup.focus();
            })
            let timer = setInterval(function() {
                if(popup.closed) {
                    $('#dark_cover').fadeOut(200);
                    clearInterval(timer);
                    //source.close();
                }
            }, 1000);
        };


        /**
         * Custom account related JS
         */
        $('#req-company').hide();
        $('#req-company').find($(':input')).attr("disabled", "disabled");
        $('#req-individual').hide();
        $('#req-individual').find($(':input')).attr("disabled", "disabled");

        // set current ip address
        $.getJSON('https://api.ipify.org?format=json', function (data) {
            $('#tos_acceptance_ip').val(data.ip);
        })

        // set today's date
        $('#tos_acceptance_date').val(getToday());

        // show company/individual per business_type value
        $('#business_type').on('change', function () {
            let name = $(this).children("option:selected").val();
            if ("company" == name){
                $('#req-individual').hide();
                $('#req-company').find($(':input')).removeAttr("disabled");
                $('#req-individual').find($(':input')).attr("disabled", "disabled");
                $('#req-company').show();

            } else if ("individual" == name){
                $('#req-company').hide();
                $('#req-individual').find($(':input')).removeAttr("disabled");
                $('#req-company').find($(':input')).attr("disabled", "disabled");
                $('#req-individual').show();
            } else {
                $('#req-company').hide();
                $('#req-company').find($(':input')).attr("disabled", "disabled");
                $('#req-individual').hide();
                $('#req-individual').find($(':input')).attr("disabled", "disabled");
            }
        });

        // populate country specs
        $('#country').on('change', function () {
            let country = $(this).children("option:selected").val();
            //console.log(currentAccount.accountName);
            setContryCurrency(country, currentAccount);

        });

        // load countries and currencies of the bank account associated with the connect account
        function setContryCurrency(country, currentAccount){
            $.ajax({
                type: "GET",
                url: "https://api.stripe.com/v1/country_specs/"+country,

                beforeSend: function (xhr) {
                    /* Authorization header */
                    xhr.setRequestHeader("Authorization", "Bearer " + currentAccount.accountSecretKey);
                    xhr.setRequestHeader("X-Mobile", "false");
                },

                success: function(result){
                    //console.log(result);
                    currentCountrySpec = result;
                    $('#default_currency').val(currentCountrySpec.default_currency);
                    bankAccountCurrencies = currentCountrySpec.supported_bank_account_currencies;

                    let currencyList = [];

                    // clean the currency dropdown list
                    $('#external_account_currency').html('');
                    $('#external_account_country').html('');
                    $('#external_account_currency').append($('<option>', {
                        value: "",
                        text : "--------"
                    }));

                    Object.keys(bankAccountCurrencies).forEach(function(key){
                        currencyList.push(key);

                        // load bank account currencies to external_account object
                        $('#external_account_currency').append($('<option>', {
                            value: key,
                            text : key
                        }));
                    });
                }
            });
        }

        // load countries when the bank account currency is changed
        $('#external_account_currency').on('change', function () {
            let currency = $(this).children("option:selected").val();

            Object.keys(bankAccountCurrencies).forEach(function(key){

                if (currency == key){

                    // clean the currency dropdown list
                    $('#external_account_country').html('');
                    $('#external_account_country').append($('<option>', {
                        value: "",
                        text : "--------"
                    }));

                    let countries = bankAccountCurrencies[key];

                    // load bank account currencies to external_account object
                    $.each(countries, function (i, item) {
                        $('#external_account_country').append($('<option>', {
                            value: item,
                            text : item
                        }));
                    });
                }
            });

        });

        /**
         * Create a custom account
         */
        $('#tabCustom-btn').on('click', function () {

            blockElement('#create-account-panel');
            $('#toast-container').remove();

            let tosDate = $('#tos_acceptance_date').val();
            let timestamp = Date.parse(tosDate)/1000;
            $('#hidden-tos-date').val(timestamp);
            let data = $('#customForm').serializeToJSON();
            let submitted = $('#customForm').serializeArray();
            //console.log(data);

            // submit request
            $.ajax({
                type: "POST",
                url: "create-account",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function(response){
                    handleActions(response, '#tabCustom-btn');

                    if (response.code === 'SUCCESS'){
                        // disable the input fields have already been submitted.
                        submitted.forEach(function (item) {
                            // replace "." from the id name.
                            let name = item.name.replace(/\./g, '_').replace(/\[\]/g, "");
                            if (item.value != ""){
                                $('#'+name).attr("disabled", "disabled");
                            }
                        });
                        let account = JSON.parse(response.apiResponse);
                        let requirements = account.requirements;
                        let currentDue = requirements.currently_due;
                        let isAccountReady = true;

                        currentDue.forEach(function (item) {
                            if ('external_account' == item){
                                $('#external-account-collapsed').toggleClass('collapsed');
                                $('#external-account').toggleClass('in');
                                $('#external-account').css('height', '');
                                $('#external-account-collapsed').find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
                                $('#external_account_object').toggleClass('mandatory');
                                $('#external_account_country').toggleClass('mandatory');
                                $('#external_account_currency').toggleClass('mandatory');
                                $('#external_account_account_number').toggleClass('mandatory');
                            }
                            isAccountReady = false;
                        });

                        let eventuallyDue = requirements.eventually_due;
                        let hasCompany = false;
                        let hasIndividual = false;

                        eventuallyDue.forEach(function (item) {
                            let fieldName = item.replace(/\./g, '_');
                            $('#'+fieldName).toggleClass('mandatory');
                            if (fieldName.includes('company')){
                                hasCompany = true;
                            }
                            if (fieldName.includes('individual')){
                                hasIndividual = true;
                            }
                            isAccountReady = false;
                        });

                        if (hasCompany){
                            $('#company').toggleClass('collapsed');
                            $('#company').toggleClass('in');
                            $('#company').css('height', '');
                            $('#company-collapsed').find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');

                            //$('#btn-add-person').show();
                        }

                        if (hasIndividual){

                            $('#individual').toggleClass('collapsed');
                            $('#individual').toggleClass('in');
                            $('#individual').css('height', '');
                            $('#individual-collapsed').find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
                        }

                        if (!isAccountReady){
                            $('#account').val(account.id);
                            $('#ho-switch').show();
                            let enableHO = $('#switch-check-change').prop('checked');
                            if(enableHO){
                                $('#ho-params').show();
                            } else {
                                $('#btn-update-acct').show();
                                $('#btn-update-acct').attr('data-toggle', account.id);
                                if (hasCompany){
                                    $('#btn-add-person').show();
                                    $('#btn-add-person').attr('data-toggle', account.id);
                                }
                            }

                        }
                    }
                },

                complete: function () {
                    unBlockElement('#create-account-panel');
                }
            });
        });

        function retrieveCustomerAccountDetailsFromHO (){
            let accountName = $('#ho-accountName').val();
            let accountId = $('#account').val();
            retrieveAccountDetails(accountName, accountId);

        }

        // update a custom account
        $('#btn-update-acct').on('click', function () {

            blockElement('#create-account-panel');

            const id = $(this).data('toggle');
            let data = $('#customForm').serializeToJSON();
            let submitted = $('#customForm').serializeArray();

            // submit request
            $.ajax({
                type: "POST",
                url: id+"/update",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function (response) {
                    submitted.forEach(function (item) {
                        // replace "." from the id name.
                        let name = item.name.replace(/\./g, '_');

                        // disable all submitted fields
                        if (item.value != "") {
                            $('#' + name).attr("disabled", "disabled");
                        }
                    });

                    let account = JSON.parse(response.apiResponse);
                    let currentDue = account.requirements.currently_due;
                    let eventuallyDue = account.requirements.eventually_due;

                    if (currentDue.length > 0 && eventuallyDue.length > 0){
                        $('#btn-update-acct').prop('disabled', false);
                    }
                },

                complete: function () {
                    unBlockElement('#create-account-panel');
                }
            });
        });

        // show person panel
        $('#btn-add-person').on('click', function () {
            $('#person').show();
        });

        // request access_token
        $('#token-req-btn').on('click', function () {

            blockElement('#create-token-panel');
            $('#toast-container').remove();

            let data = $('#reqTokenForm').serializeToJSON();

            $.ajax({
                type: "POST",
                url: "/account/request-token",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function (response) {
                    //console.log(response);
                    $('#tokenReqResponse').html(response.apiResponse);
                    handleActions(response, '#token-req-btn');
                },

                complete: function () {
                    unBlockElement('#create-token-panel');
                }
            });
        });

        // retrieve account details
        $('#retrieve-acct-btn').on('click', function () {

            $('#toast-container').remove();
            $('#acct-details').show();
            $('html, body').animate({scrollTop: $('#acct-details').offset().top}, 500);
            blockElement('#account-details-panel');

            let accountId = $('#retrieve-acct-btn').data('toggle');
            //console.log(accountId);

            let accountName = $('#token-accountName').val();
            retrieveAccountDetails(accountName, accountId);

        });

        $('#acct-refresh-btn').on('click', function () {
            blockElement('#account-details-panel');

            const accountId = $('#acc-id').html();
            console.log(accountId);
            let accountName = $('#token-accountName').val();
            retrieveAccountDetails(accountName, accountId);
        })

        function retrieveAccountDetails(accountName, accountId){

            $.ajax({
                type: "POST",
                url: "/account/" + accountId,
                data: accountName,
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },


                success: function (response) {
                    let accountObj = response.apiResponse;

                    $('#acc-id').html(accountId);
                    $('#acc-type').html(accountObj.type);
                    $('#acc-email').html(accountObj.email);

                    let details_submitted = accountObj.details_submitted;
                    if (details_submitted){
                        $('#acc-details_submitted').html('<span class="badge badge-success">'+ details_submitted +'</span>');
                    } else {
                        $('#acc-details_submitted').html('<span class="badge badge-danger">'+ details_submitted +'</span>');
                    }

                    let charges_enabled = accountObj.charges_enabled;
                    if (charges_enabled){
                        $('#acc-charges_enabled').html('<span class="badge badge-success">'+ charges_enabled +'</span>');
                    } else {
                        $('#acc-charges_enabled').html('<span class="badge badge-danger">'+ charges_enabled +'</span>');
                    }

                    let payouts_enabled = accountObj.payouts_enabled;
                    if (payouts_enabled){
                        $('#acc-payouts_enabled').html('<span class="badge badge-success">'+ payouts_enabled +'</span>');
                    } else {
                        $('#acc-payouts_enabled').html('<span class="badge badge-danger">'+ payouts_enabled +'</span>');
                    }

                    let requirements = accountObj.requirements;
                    let currently_due = requirements.currently_due;
                    let eventually_due = requirements.eventually_due;
                    let past_due = requirements.past_due;

                    $('#cur-due-table').html('');
                    $('#eve-due-table').html('');
                    $('#pst-due-table').html('');

                    jQuery.each(currently_due, function (index, item) {
                       $('#cur-due-table').append('<tr><td>' + item + '</td></tr>');
                    });
                    jQuery.each(eventually_due, function (index, item) {
                        $('#eve-due-table').append('<tr><td>' + item + '</td></tr>');
                    });
                    jQuery.each(past_due, function (index, item) {
                        $('#pst-due-table').append('<tr><td>' + item + '</td></tr>');
                    });

                    if (accountObj.type === 'express'){
                        $('#acct-link-btn').attr('data-toggle', accountId);
                        $('#acct-link-btn').show();
                    }

                    $('#acct-details').show();
                    $('html, body').animate({scrollTop: $('#acct-details').offset().top}, 500);
                },

                complete: function () {
                    unBlockElement('#account-details-panel');
                }
            });
        }
        
        // trigger account link popup
        $('#acct-link-btn').on('click', function () {
            let accountId = $('#acct-link-btn').data('toggle');
            //console.log(currentAccount.accountSecretKey);
            blockElement('#ho-panel');
            $.ajax({
                type: "POST",
                url: "https://api.stripe.com/v1/accounts/" + accountId + "/login_links",

                beforeSend: function (xhr) {

                    xhr.setRequestHeader("Authorization", "Bearer " + currentAccount.accountSecretKey);
                    xhr.setRequestHeader("X-Mobile", "false");
                },

                success: function (response) {
                    console.log(response);
                    triggerPop(response.url);
                },

                complete: function () {
                    unBlockElement('#ho-panel');
                }
            });
        })


        /**
         * Set Account actions
         * @param response
         * @param selector
         */
        function handleActions(response, selector) {
            let responseObj = JSON.parse(response.apiResponse);
            //console.log(responseObj);
            let id = responseObj.stripe_user_id;
            if (typeof id === 'undefined'){
                id = responseObj.id;
            }
            switch (response.code){
                case 'SUCCESS':
                    $(selector).after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Account created: account_id: <b>' + id + '</b> </span></li></div>');
                    $('#retrieve-acct-btn').attr('data-toggle', id);
                    $('#retrieve-acct-btn').show();
                    break;

                case 'ERROR':
                    showErrorMsg(responseObj.code, responseObj.message);
                    $(selector).prop('disabled', false);
                    break;
            }
        }

        /**
         * Handle Ajax response error
         * @param response
         * @param selector
         */
        function handleError(response, selector){
            $(selector).prop('disabled', false);
            $(selector).find('.btn-spinner').remove();
            const responseObj = JSON.parse(response.responseJSON.apiResponse);
            console.log(responseObj);
            showErrorMsg(responseObj.code, responseObj.message);
        }

        function buttonClickAction(selector){
            $(selector).append("<i class=\"fa fa-spinner fa-spin btn-spinner\"></i>");
            $(selector).prop('disabled', true);
            $('#toast-container').remove();
        }


        // date picker
        $('.input-group.date').datepicker({
            daysOfWeekDisabled: "0,6",
            autoclose: true,
            todayHighlight: true
        });


        // Show/hide hosted onboarding button
        var switchOptions = {},
            switchColors = {
                'orange': '#f79a59',
                'green': '#3ecf8e',
                'yellow': '#f5be58',
                'red': '#fa755a',
                'blue': '#6772e5'
            };

        $('.js-switch').each(function()
        {
            if ($(this).data("size")) switchOptions.size = $(this).data("size");
            var color = $(this).data("color");
            if (switchColors[color] !== undefined)
            {
                switchOptions.color = switchColors[color];
            }
            else
            {
                switchOptions.color = color;
            }
            var switchery = new Switchery($(this)[0], switchOptions);
            switchOptions = {};
        });

        // display hosted onboarding params
        $('#switch-check-change').on('change', function()
        {
            //$('#label-check-change').text($(this).prop('checked'));
            let useHO = $(this).prop('checked');
            if (useHO){
                $('#ho-params').show();
                $('#api-onboarding').hide();
                let protocol = $(location).attr('protocol');
                let host = $(location).attr('host');
                $('#success_url').val(protocol + "//" + host + "/account-return?status=success");
                $('#failure_url').val(protocol + "//" + host + "/account-return?status=failure");
            } else {
                $('#ho-params').hide();
                $('#api-onboarding').show();
            }
        });

        $('#ho-btn').on('click', function () {

            blockElement('#ho-panel');
            let data = $('#hoForm').serializeToJSON();

            $.ajax({
                type: "POST",
                url: "create-accountlink",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function (response) {
                    const url = JSON.parse(response.apiResponse).url;
                    triggerPop(url);
                    receiveAccountReturn(true);
                },

                complete: function () {
                    unBlockElement('#ho-panel');
                }
            });
        });

    });

    function setData(data) {
        $('#dark_cover').fadeOut(200);
        console.log(data);
        returnedData = data;
        $('#person').show();
    }


</script>

<style>
    .switchery {
        float: right;
        margin-right: 20px;
    }
</style>

</body>
</html>
