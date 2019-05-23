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

    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/themify-icons/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/pace/themes/orange/pace-theme-minimal.css"/>">
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
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#">Connect</a></li>
                        <li class="active">Create a Connect Account</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <!-- REQUEST PANEL -->
                <div class="panel panel-tab panel-main">
                    <div class="panel-heading">
                        <h3 class="panel-title">Create a connect account</h3>

                        <select id="stripe-account" class="panel-title right custom-select" style="position: absolute;left: 60%;">
                            <option value="" label="Select account"/>
                            <c:forEach items="${viewObj.allAccounts.accountPropertiesList}" var="account">
                                <option value="${account.accountName}" label="Account - ${account.accountName}"/>
                            </c:forEach>
                        </select>

                        <ul class="nav nav-tabs pull-right">
                            <li id="tabStandard" ><a href="#standardTab" data-toggle="tab"></i> Standard Account</a></li>
                            <li id="tabCustom" class="active"><a href="#customTab" data-toggle="tab"></i> Custom Account </a></li>
                        </ul>
                    </div>
                    <div class="panel-body">
                        <div class="tab-content no-padding" id="parameters">
                            <!-- STANDARD ACCOUNT -->
                            <div class="tab-pane " id="standardTab">
                                <p><em> OAuth parameters</em></p>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">client_id</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" id="client_id" type="text" value="ca_EBTHAsdydFCt6CBHfBPNQMH9nIxESXpN" disabled="disabled"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">response_type</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" id="response_type" type="text" value="code" disabled="disabled"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">redirect_uri</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" id="redirect_uri" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">scope</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" id="scope" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">state</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" id="state" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">stripe_landing</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" id="stripe_landing" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">always_prompt</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" id="always_prompt" type="text"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label"><b>stripe_user[email]</b></label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[email]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label"><b>stripe_user[url]</b></label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[url]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[country]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[country]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[phone_number]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[phone_number]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[business_name]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[business_name]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[business_type]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[business_type]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[first_name]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[first_name]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[last_name]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[last_name]" type="text"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[dob_day]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[dob_day]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[dob_month]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[dob_month]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[dob_year]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[dob_year]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[street_address]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[street_address]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[city]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[city]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[state]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[state]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[zip]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[zip]" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-6 control-label">stripe_user[currency]</label>
                                                <div class="col-sm-6">
                                                    <input class="form-control" id="stripe_user[currency]" type="text"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- CUSTOM ACCOUNT -->
                            <div class="tab-pane active" id="customTab">
                                <form:form class="form-horizontal" id="acct-form" action="custom-account" method="post" modelAttribute="acctReq">
                                    <input type="hidden" id="account-name" name="accountName" value=""/>
                                    <input type="hidden" id="account-id" name="accountId" value=""/>
                                    <form:hidden path="type"  class="form-control mandatory" id="type" value="custom"  />

                                    <!-- DEFAULT PARAMS -->
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">country</label>
                                                    <div class="col-sm-8">
                                                        <form:select path="country" id="country" class="form-control " >
                                                            <form:options items="${country}"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">def_currency</label>
                                                    <div class="col-sm-8">
                                                        <form:input path="default_currency" class="form-control " id="default_currency" value="gbp" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">tos_accpt[ip]</label>
                                                    <div class="col-sm-8">
                                                        <form:input path="tos_acceptance.ip" class="form-control " id="tos_acceptance_ip" value="" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">tos_accpt[date]</label>
                                                    <div class="col-sm-8">
                                                        <div class="input-group date" data-date-autoclose="true" data-provide="datepicker" data-date-format="mm/dd/yyyy">
                                                            <form:input path="tos_acceptance.date" type="text" class="form-control " cssStyle="border-right-color: #e1e3ea !important;" id="tos_acceptance_date" value=""/>
                                                            <span class="input-group-addon "><i class="fa fa-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">business_type</label>
                                                    <div class="col-sm-8">
                                                        <form:select path="business_type" id="business_type" class="form-control" >
                                                            <form:option value="company" label="company"/>
                                                            <form:option value="individual" label="individual"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">account_token</label>
                                                <div class="col-sm-8">
                                                    <form:input path="account_token" class="form-control" id="account_token" value="" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- OBJECT PARAMS -->
                                    <div class="row">
                                        <!-- BANK ACCOUNT -->
                                        <div class="col-md-4">
                                            <div class="project-info">
                                                <div class="panel-group project-accordion">
                                                    <div class="panel panel-second project-milestone">
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
                                                                    <div class="col-sm-7">
                                                                        <form:select path="external_account.object" id="external_account_object" class="form-control" >
                                                                            <form:option value="" label="--------"/>
                                                                            <form:option value="bank_account" label="bank_account"/>
                                                                        </form:select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">currency</label>
                                                                    <div class="col-sm-7">
                                                                        <form:select path="external_account.currency" id="external_account_currency" class="form-control" >

                                                                            <form:options items="${null}"/>
                                                                        </form:select>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">country</label>
                                                                    <div class="col-sm-7">
                                                                        <form:select path="external_account.country" id="external_account_country" class="form-control" >
                                                                            <form:options items="${null}"/>
                                                                        </form:select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">acct_holder_name</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="external_account.account_holder_name" class="form-control" id="external_account_account_holder_name" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">acct_holder_type</label>
                                                                    <div class="col-sm-7">
                                                                        <form:select path="external_account.account_holder_type" id="external_account_account_holder_type" class="form-control" >
                                                                            <form:option value="" label="--------"/>
                                                                            <form:option value="company" label="company"/>
                                                                            <form:option value="individual" label="individual"/>
                                                                        </form:select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">routing_number</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="external_account.routing_number" class="form-control" id="external_account_routing_number" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">account_number</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="external_account.account_number" class="form-control" id="external_account_account_number" value="" />
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
                                            <div id="req-company" class="project-info">
                                                <div class="panel-group project-accordion">
                                                    <div class="panel panel-second project-milestone">
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
                                                                        <form:input path="company.name" class="form-control" id="company_name" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">address[line1]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="company.address.line1" class="form-control" id="company_address_line1" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">address[city]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="company.address.city" class="form-control" id="company_address_city" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">addr[postal_code]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="company.address.postal_code" class="form-control" id="company_address_postal_code" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">tax_id</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="company.tax_id" class="form-control" id="company_tax_id" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">phone</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="company.phone" class="form-control" id="company_phone" value="" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- INDIVIDUAL DETAILS -->
                                            <div id="req-individual" class="project-info">
                                                <div class="panel-group project-accordion">
                                                    <div class="panel panel-second project-milestone">
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
                                                                        <form:input path="individual.first_name" class="form-control" id="individual_first_name" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">last_name</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.last_name" class="form-control" id="individual_last_name" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">id_number</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.id_number" class="form-control" id="individual_id_number" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">email</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.email" class="form-control" id="individual_email" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">address[line1]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.address.line1" class="form-control" id="individual_address_line1" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">address[city]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.address.city" class="form-control" id="individual_address_city" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">addr[postal_code]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.address.postal_code" class="form-control" id="individual_address_postal_code" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">dob[day]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.dob.day" class="form-control" id="individual_dob_day" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">dob[month]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.dob.month" class="form-control" id="individual_dob_month" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">dob[year]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.dob.year" class="form-control" id="individual_dob_year" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">veri[doc][front]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.verification.document.front" class="form-control" id="individual_verification_document_front" value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">veri[doc][back]</label>
                                                                    <div class="col-sm-7">
                                                                        <form:input path="individual.verification.document.back" class="form-control" id="individual_verification_document_back" value="" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- OPTIONAL PARAMS -->
                                        <div class="col-md-4">
                                            <div class="project-info">
                                                <div class="panel-group project-accordion ">
                                                    <div class="panel panel-second project-milestone">
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
                                                                <div class="milestone-section">
                                                                    <!-- BUSINESS PROFILE -->
                                                                    <h5 class="body-title">business_profile</h5>
                                                                    <ul class="list-unstyled list-widget-vertical" id="bp-params">
                                                                        <li>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">mcc</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="business_profile.mcc" class="form-control" id="business_profile_mcc" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">name</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="business_profile.name" class="form-control" id="business_profile_name" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">prod_description</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="business_profile.product_description" class="form-control" id="business_profile_product_description" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">support_email</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="business_profile.support_email" class="form-control" id="business_profile_support_email" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">support_phone</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="business_profile.support_phone" class="form-control" id="business_profile_support_phone" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">support_url</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="business_profile.support_url" class="form-control" id="business_profile_support_url" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">url</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="business_profile.url" class="form-control" id="business_profile_url" value="" />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </ul>

                                                                    <!-- SETTINGS -->
                                                                    <h5 class="body-title">settings</h5>
                                                                    <ul class="list-unstyled list-widget-vertical" id="settings-params">
                                                                        <li>
                                                                            <p><em> settings.branding </em></p>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">icon</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="settings.branding.icon" class="form-control" id="settings_branding_icon" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">logo</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="settings.branding.logo" class="form-control" id="settings_branding_logo" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">primary_color</label>
                                                                                <div class="col-sm-7">
                                                                                    <form:input path="settings.branding.primary_color" class="form-control" id="settings_branding_primary_color" value="" />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <br>
                                                                        <li>
                                                                            <p><em> settings.card_payments </em></p>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-6 control-label">stmt_descriptor_prefix</label>
                                                                                <div class="col-sm-6">
                                                                                    <form:input path="settings.card_payments.statement_descriptor_prefix" class="form-control" id="settings_card_payments_statement_descriptor_prefix" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-6 control-label">decline_on[avs_failure]</label>
                                                                                <div class="col-sm-6">
                                                                                    <form:select path="settings.card_payments.decline_on.avs_failure" id="settings_card_payments_decline_on.avs_failure" class="form-control" >
                                                                                        <form:option value="" label="--------"/>
                                                                                        <form:option value="true" label="true"/>
                                                                                        <form:option value="false" label="false"/>
                                                                                    </form:select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-6 control-label">decline_on[cvc_failure]</label>
                                                                                <div class="col-sm-6">
                                                                                    <form:select path="settings.card_payments.decline_on.cvc_failure" id="settings_card_payments_decline_on.cvc_failure" class="form-control" >
                                                                                        <form:option value="" label="--------"/>
                                                                                        <form:option value="true" label="true"/>
                                                                                        <form:option value="false" label="false"/>
                                                                                    </form:select>
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <br>
                                                                        <li>
                                                                            <p><em> settings.payments </em></p>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-6 control-label">stmt_descriptor</label>
                                                                                <div class="col-sm-6">
                                                                                    <form:input path="settings.payments.statement_descriptor" class="form-control" id="settings_payments_statement_descriptor" value="" />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <br>
                                                                        <li>
                                                                            <p><em> settings.payouts </em></p>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-7 control-label">debit_negative_balances</label>
                                                                                <div class="col-sm-5">
                                                                                    <form:select path="settings.payouts.debit_negative_balances" id="settings_payouts_debit_negative_balances" class="form-control" >
                                                                                        <form:option value="" label="--------"/>
                                                                                        <form:option value="true" label="true"/>
                                                                                        <form:option value="false" label="false"/>
                                                                                    </form:select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-7 control-label">schedule[interval]</label>
                                                                                <div class="col-sm-5">
                                                                                    <form:select path="settings.payouts.schedule.interval" id="settings_payouts_schedule_interval" class="form-control" >
                                                                                        <form:option value="" label="--------"/>
                                                                                        <form:option value="manual" label="manual"/>
                                                                                        <form:option value="daily" label="daily"/>
                                                                                        <form:option value="weekly" label="weekly"/>
                                                                                        <form:option value="monthly" label="monthly"/>
                                                                                    </form:select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-7 control-label">schedule[delay_days]</label>
                                                                                <div class="col-sm-5">
                                                                                    <form:input path="settings.payouts.schedule.delay_days" class="form-control" id="settings_payouts_schedule_delay_days" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-7 control-label">schedule[monthly_anchor]</label>
                                                                                <div class="col-sm-5">
                                                                                    <form:input path="settings.payouts.schedule.monthly_anchor" class="form-control" id="settings_payouts_schedule_monthly_anchor" value="" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-7 control-label">schedule[weekly_anchor]</label>
                                                                                <div class="col-sm-5">
                                                                                    <form:input path="settings.payouts.schedule.weekly_anchor" class="form-control" id="settings_payouts_schedule_weekly_anchor" value="" />
                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                    </ul>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                                <!-- BUTTON -->
                                <div class="row">

                                        <div class="col-md-3 col-md-offset-3">
                                            <button id="btn-add-person" class="btn btn-primary-stripe-green" style="width: 100%; display: none;"><span> Add person </span></button>
                                        </div>
                                        <div class="col-md-3">
                                            <button id="btn-update-acct" class="btn btn-primary-stripe-slate" style="width: 100%; display: none;"><span>Update account </span></button>
                                        </div>
                                        <div class="col-md-3">
                                            <button id="btn-create-acct" class="btn btn-primary-stripe-blue" style="width: 100%"><span>Create account </span></button>
                                        </div>

                                </div>
                                <br>
                                <div class="row" id="acct-display" style="display: none;">
                                    <div class="col-sm-12">
                                        <div class="alert alert-success source" style="margin-bottom: 0; padding: 5px 10px 5px 15px;">
                                            account_id: <a href="#" class="account-id" id=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END REQUEST PANEL -->

                <!-- Person panel -->
                <div class="panel panel-main" id="person" style="display: none;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Person</h3>
                    </div>
                    <div class="panel-body">
                        <form:form class="form-horizontal" id="acct-form" action="add-person" method="post" modelAttribute="personReq">
                            <input type="hidden" id="account-name-person" name="accountName" value=""/>
                            <input type="hidden" id="account-id-person" name="accountId" value=""/>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">first_name</label>
                                    <div class="col-sm-7">
                                        <form:input path="first_name" class="form-control" id="first_name" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">last_name</label>
                                    <div class="col-sm-7">
                                        <form:input path="last_name" class="form-control" id="last_name" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">id_number</label>
                                    <div class="col-sm-7">
                                        <form:input path="id_number" class="form-control" id="id_number" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">dob[day]</label>
                                    <div class="col-sm-7">
                                        <form:input path="dob.day" class="form-control" id="dob_day" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">dob[month]</label>
                                    <div class="col-sm-7">
                                        <form:input path="dob.month" class="form-control" id="dob_month" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">dob[year]</label>
                                    <div class="col-sm-7">
                                        <form:input path="dob.year" class="form-control" id="dob_year" value="" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">email</label>
                                    <div class="col-sm-7">
                                        <form:input path="email" class="form-control" id="email" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">address[line1]</label>
                                    <div class="col-sm-7">
                                        <form:input path="address.line1" class="form-control" id="address_line1" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">address[city]</label>
                                    <div class="col-sm-7">
                                        <form:input path="address.city" class="form-control" id="address_city" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">addr[postal_code]</label>
                                    <div class="col-sm-7">
                                        <form:input path="address.postal_code" class="form-control" id="address_postal_code" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">veri[doc][front]</label>
                                    <div class="col-sm-7">
                                        <form:input path="verification.document.front" class="form-control" id="verification_document_front" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">veri[doc][back]</label>
                                    <div class="col-sm-7">
                                        <form:input path="verification.document.back" class="form-control" id="verification_document_back" value="" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="col-sm-8 control-label">relationship[title]</label>
                                    <div class="col-sm-4">
                                        <form:select path="relationship.title" id="relationship_title" class="form-control " >
                                            <form:option value="" label="--------"/>
                                            <form:option value="Mr" label="Mr"/>
                                            <form:option value="Mrs" label="Mrs"/>
                                            <form:option value="Miss" label="Miss"/>
                                            <form:option value="Ms" label="Ms"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-8 control-label">relationship[owner]</label>
                                    <div class="col-sm-4">
                                        <form:select path="relationship.owner" id="relationship_owner" class="form-control " >
                                            <form:option value="" label="--------"/>
                                            <form:option value="true" label="true"/>
                                            <form:option value="false" label="false"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-8 control-label">relationship[acct_opener]</label>
                                    <div class="col-sm-4">
                                        <form:select path="relationship.account_opener" id="relationship_account_opener" class="form-control " >
                                            <form:option value="" label="--------"/>
                                            <form:option value="true" label="true"/>
                                            <form:option value="false" label="false"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-8 control-label">relationship[director]</label>
                                    <div class="col-sm-4">
                                        <form:select path="relationship.director" id="relationship_director" class="form-control " >
                                            <form:option value="" label="--------"/>
                                            <form:option value="true" label="true"/>
                                            <form:option value="false" label="false"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-8 control-label">relationship[percent_ownership]</label>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <form:input path="relationship.percent_ownership" type="text" class="form-control" id="relationship_percent_ownership" value=""/>
                                            <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                        <div class="row">
                            <div class="col-md-4 col-md-offset-8">
                                <button id="btn-person" class="btn btn-primary-stripe-blue" style="width: 100%;"><span> create person </span></button>
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
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script>

    $(function()
    {
        init();

        $('#business_type').on('change', function () {
            var name = $(this).children("option:selected").val();
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
                $('#req-individual').hide();
            }
        });

        var currentAccount;
        var currentCountrySpec;
        var bankAccountCurrencies;

        // load account list to form
        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $("input[name='accountName']").val(accountName);

            // get current account
            if (accountName != ""){
                $.ajax({
                    type : "GET",
                    url : "getAccount",
                    data: "acctName="+accountName,
                    success: function(result){
                        currentAccount = result;

                        var initCountry = $('#country'). children("option:selected").val();
                        setContryCurrency(initCountry, currentAccount);

                        $('#parameters').show();
                    }
                });
            } else {
                $('#parameters').hide();
            }

        });

        // populate country specs
        $('#country').on('change', function () {

            var country = $(this). children("option:selected").val();
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

                    var currencyList = [];

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
            var currency = $(this).children("option:selected").val();

            Object.keys(bankAccountCurrencies).forEach(function(key){

                if (currency == key){

                    // clean the currency dropdown list
                    $('#external_account_country').html('');
                    $('#external_account_country').append($('<option>', {
                        value: "",
                        text : "--------"
                    }));

                    var countries = bankAccountCurrencies[key];

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


        // submit form
        $('#btn-create-acct').on('click', function () {
            //$('#acct-form').submit();

            // disable button
            $(this).append("<i class=\"fa fa-spinner fa-spin btn-spinner\"></i>");
            $(this).prop('disabled', true);

            var tosDate = $('#tos_acceptance_date').val();
            var timestamp = Date.parse(tosDate)/1000;
            console.log(timestamp);

            var data = $('#acct-form').serializeArray();

            // convert date to millisecond
            data.forEach(function (item) {
                if (item.name === 'tos_acceptance.date') {
                    item.value = timestamp;
                }
            });


            // submit request
            $.ajax({
                type: "POST",
                url: "custom-account",
                dataType : "json",
                data: data,

                success: function(result){

                    if (result.error){
                        showErrorMsg(result.body.code, "Request ID: " + result.body.requestId + " Message: " + result.body.message);
                        $('#btn-create-acct').prop('disabled', false);

                    } else {
                        // change data.
                        data.forEach(function (item) {
                            // replace "." from the id name.
                            var name = item.name.replace(/\./g, '_');

                            // disable all submitted fields
                            if (item.value != ""){
                                $('#'+name).attr("disabled", "disabled");
                            }
                        });

                        //console.log(result.body);
                        var account = result.body;

                        // show update account / person button
                        $('#btn-create-acct').find('.btn-spinner').remove();

                        // highlight required fields


                        // show account details section
                        $('.account-id').append(account.id);
                        $('.account-id').attr("id", account.id);
                        $("input[name='accountId']").val(account.id);

                        //$('#account-details').text(JSON.stringify(result.body.requirements, null, 3));
                        $('#acct-display').show();


                        var requirements = account.requirements;
                        var currentDue = requirements.currentlyDue;
                        var isAccountReady = true;

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

                        var eventuallyDue = requirements.eventuallyDue;
                        var hasCompany = false;
                        var hasIndividual = false;
                        eventuallyDue.forEach(function (item) {
                            var fieldName = item.replace(/\./g, '_');
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

                            $('#btn-add-person').show();
                        }

                        if (hasIndividual){

                            $('#individual').toggleClass('collapsed');
                            $('#individual').toggleClass('in');
                            $('#individual').css('height', '');
                            $('#individual-collapsed').find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
                        }

                        if (!isAccountReady){
                            $('#btn-update-acct').show();
                        }
                    }
                }
            });
        });


        $('#btn-update-acct').on('click', function () {
            // disable button
            $(this).append("<i class=\"fa fa-spinner fa-spin btn-spinner\"></i>");
            $(this).prop('disabled', true);

            var data = $('#acct-form').serializeArray();

            // submit request
            $.ajax({
                type: "POST",
                url: "update-account",
                dataType: "json",
                data: data,

                success: function (result) {
                    // show update account / person button
                    $('#btn-update-acct').find('.btn-spinner').remove();

                    if (result.error){
                        showErrorMsg(result.body.code, "Request ID: " + result.body.requestId + " Message: " + result.body.message);
                        $('#btn-update-acct').prop('disabled', false);

                    } else {
                        // change data.
                        data.forEach(function (item) {
                            // replace "." from the id name.
                            var name = item.name.replace(/\./g, '_');

                            // disable all submitted fields
                            if (item.value != "") {
                                $('#' + name).attr("disabled", "disabled");
                            }
                        });

                        var account = result.body;
                        var currentDue = account.requirements.currentlyDue;
                        var eventuallyDue = account.requirements.eventuallyDue;

                        if (currentDue.length > 0 && eventuallyDue > 0){
                            $('#btn-update-acct').prop('disabled', false);
                        }
                    }
                }
            });
        });

        // show person panel
        $('#btn-add-person').on('click', function () {
            $('#person').show();
        });

        $('.account-id').on('click', function()
        {
            retrieveDetails("https://api.stripe.com/v1/accounts/" + $(this).get(0).id, currentAccount.accountSecretKey);
        });




        // date picker
        $('.input-group.date').datepicker({
            daysOfWeekDisabled: "0,6",
            autoclose: true,
            todayHighlight: true
        });



        function init(){
            // toggle nav active
            $('#navConnect').toggleClass('active');
            $('#navConnectAccount').toggleClass('active');
            $('#navCreateAccount').toggleClass('active');
            $('#parameters').hide();
            $('#req-individual').hide();
            $('#req-individual').find($(':input')).attr("disabled", "disabled");

            // accordion toggle collapse
            $('.project-accordion [data-toggle="collapse"]').on('click', function()
            {
                $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
            });

            // set current ip address
            $.getJSON('https://api.ipify.org?format=json', function (data) {
                $('#tos_acceptance_ip').val(data.ip);
            })

            // set today's date
            $('#tos_acceptance_date').val(getToday());
        }
    });

</script>

</body>
</html>
