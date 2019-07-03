<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-06-19
  Time: 14:34
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
    <link rel="stylesheet" href="<c:url value="/resources/vendor/FontAwesome/css/all.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/themify-icons/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/pace/themes/orange/pace-theme-minimal.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables/css-main/jquery.dataTables.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables/css-bootstrap/dataTables.bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables-tabletools/css/dataTables.tableTools.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/toastr/toastr.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/sweetalert2/sweetalert2.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" />">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">

</head>
<body class="layout-topnav" >
<div id="wrapper">
    <!-- NAVBAR -->
    <jsp:include page='../navbar.jsp'/>
    <!-- END NAVBAR -->

    <div class="main">
        <div class="main-content">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Subscription</h1>
                    </div>
                    <!-- Account selection -->
                    <div class="account-select">
                        <select id="stripe-account" class="acct-sel" >
                            <option value="" label="Select account"/>
                            <c:forEach items="${viewObj.allAccounts.accountPropertiesList}" var="account">
                                <option value="${account.accountName}" label="Account - ${account.accountName}" data-toggle="${account.accountPublishKey}"/>
                            </c:forEach>
                        </select>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="/"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="/billing">Billing</a></li>
                        <li class="active">Subscription</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->

                <!-- Sub Param Panel -->
                <div class="row" id="sub-params">
                    <div class="panel panel-main panel-server panel-tab" id="sub-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>/v1/subscriptions</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-prod" class="active"><a href="#reqTab-prod" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-prod"><a href="#resTab-prod" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content row">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-prod" style="margin-top: -30px;">
                                <form class="form-horizontal" id="subForm">
                                    <!-- BASIC PARAMETERS -->
                                    <div class="project-info">
                                        <div class="col-md-4" id="required">

                                            <div class="form-group">
                                                <label class="col-sm-5 control-label"><b>customer</b></label>
                                                <div class="col-sm-7">
                                                    <div class="input-group">
                                                        <input name="customer" class="form-control" id="customer" value="${sub.customer}" />
                                                        <span class="input-group-addon"><i class="far fa-link"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">collection_method</label>
                                                <div class="col-sm-7 dropdown-select">
                                                    <select name="collection_method" id="collection_method" class="form-control" itemValue="${sub.collection_method}">
                                                        <option value="charge_automatically" label="charge_automatically"/>
                                                        <option value="send_invoice" label="send_invoice"/>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">prorate</label>
                                                <div class="col-sm-7 dropdown-select">
                                                    <select name="prorate" id="prorate" class="form-control" itemValue="${sub.prorate}">
                                                        <option value="true" label="true"/>
                                                        <option value="false" label="false"/>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- only show if it's send_invoice -->
                                            <div class="form-group invoice hide">
                                                <label class="col-sm-5 control-label">days_until_due</label>
                                                <div class="col-sm-7">
                                                    <input name="days_until_due" class="form-control" id="days_until_due" value="${sub.days_until_due}" disabled="disabled"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">coupon</label>
                                                <div class="col-sm-7">
                                                    <div class="input-group">
                                                        <input name="coupon" class="form-control" id="coupon" value="${sub.coupon}" />
                                                        <span class="input-group-addon"><i class="far fa-link"></i></span>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- billing_thresholds -->
                                            <div class="panel panel-inner">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">billing_thresholds</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">amount_gte</label>
                                                                <div class="col-sm-7">
                                                                    <input name="billing_thresholds.amount_gte" class="form-control"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">reset_bl_cycle_anchor</label>
                                                                <div class="col-sm-7 dropdown-select">
                                                                    <select name="billing_thresholds.reset_billing_cycle_anchor" id="billing_thresholds_reset_billing_cycle_anchor" class="form-control">
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

                                        <div class="col-md-4" >
                                            <!-- items -->
                                            <div class="panel panel-inner">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">items</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div id="item1">
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">items[0].plan</label>
                                                                    <div class="col-sm-7">
                                                                        <div class="input-group">
                                                                            <input name="items[0].plan" class="form-control" id="plan-0"/>
                                                                            <span class="input-group-addon"><i class="far fa-link"></i></span>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">items[0].quantity</label>
                                                                    <div class="col-sm-7">
                                                                        <input name="items[0].quantity" class="form-control"/>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">items[0].tax_rates</label>
                                                                    <div class="col-sm-7">
                                                                        <div class="input-group">
                                                                            <input name="items[0].tax_rates" class="form-control" id="tax_rates-0"/>
                                                                            <span class="input-group-addon"><i class="far fa-link"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="panel panel-inner">
                                                                    <div class="panel-heading">
                                                                        <h3 class="panel-title sub-title">items[0].billing_thresholds</h3>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label class="col-sm-5 control-label">usage_gte</label>
                                                                                    <div class="col-sm-7">
                                                                                        <input name="items[0].billing_thresholds.usage_gte" class="form-control"/>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group last-row">
                                                                <a class="col-sm-4 col-sm-offset-6 control-label" id="add-items" style="float: right; cursor: pointer;padding-top:0;">+ add items</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">def_payment_method</label>
                                                <div class="col-sm-7">
                                                    <input name="default_payment_method" class="form-control" id="default_payment_method" value="${sub.default_payment_method}" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">billing_cycle_anchor</label>
                                                <div class="col-sm-7">
                                                    <input data-provide="datepicker" data-date-autoclose="true" class="form-control" id="billing_cycle_anchor">
                                                    <input type="hidden" class="date-picker-input" name="billing_cycle_anchor" data-toggle="billing_cycle_anchor">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">trial_from_plan</label>
                                                <div class="col-sm-7 dropdown-select">
                                                    <select name="trial_from_plan" id="trial_from_plan" class="form-control" itemValue="${sub.trial_from_plan}">
                                                        <option value="" label="--------"/>
                                                        <option value="true" label="true"/>
                                                        <option value="false" label="false"/>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">trial_period_days</label>
                                                <div class="col-sm-7">
                                                    <input name="trial_period_days" class="form-control" id="trial_period_days" value="${sub.trial_period_days}" />
                                                </div>
                                            </div>

                                            <div id="metadata">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">metadata</label>
                                                    <div class="col-sm-3" style="padding-right:5px;">
                                                        <input class="form-control" id="sub-metadatakey-0" data-toggle="0" placeholder="key"/>
                                                    </div>
                                                    <div class="col-sm-4" style="padding-left:5px;">
                                                        <input class="form-control" id="sub-metadatakey-0-value" name="metadata" placeholder="value"/>
                                                    </div>
                                                </div>
                                                <div class="form-group" id="sub-md-1">
                                                    <label class="col-sm-5 control-label"></label>
                                                    <div class="col-sm-3" style="padding-right:5px;">
                                                        <input class="form-control" id="sub-metadatakey-1" data-toggle="1" placeholder="key"/>
                                                    </div>
                                                    <div class="col-sm-4" style="padding-left:5px;">
                                                        <input class="form-control" id="sub-metadatakey-1-value" name="metadata" placeholder="value"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <a class="col-sm-4 col-sm-offset-6 control-label" id="add-sub-md" style="float: right; cursor: pointer;padding-top:0;">+ add metadata</a>
                                                </div>
                                            </div>

                                            <!-- optional params -->
                                            <div class="project-accordion panel-second" style="margin-bottom: 10px;">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a href="#collapse1" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                            <span class="milestone-title"> Optional parameters </span>
                                                            <i class="fa fa-plus-circle toggle-icon"></i>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse1" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">default_source</label>
                                                            <div class="col-sm-7">
                                                                <input name="default_source" class="form-control" id="default_source" value="${sub.default_source}" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">default_tax_rates</label>
                                                            <div class="col-sm-7">
                                                                <div class="input-group">
                                                                    <input name="default_tax_rates" class="form-control" id="tax_rates" value="${sub.default_tax_rates}" />
                                                                    <span class="input-group-addon"><i class="far fa-link"></i></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">backdate_start_date</label>
                                                            <div class="col-sm-7">
                                                                <input data-provide="datepicker" data-date-autoclose="true" class="form-control" id="backdate_start_date">
                                                                <input type="hidden" class="date-picker-input" name="backdate_start_date" data-toggle="backdate_start_date">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">cancel_at</label>
                                                            <div class="col-sm-7">
                                                                <input data-provide="datepicker" data-date-autoclose="true" class="form-control" id="cancel_at">
                                                                <input type="hidden" class="date-picker-input" name="cancel_at" data-toggle="cancel_at">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">trial_end</label>
                                                            <div class="col-sm-7">
                                                                <input data-provide="datepicker" data-date-autoclose="true" class="form-control" id="trial_end">
                                                                <input type="hidden" class="date-picker-input" name="trial_end" data-toggle="trial_end">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">cancel_at_period_end</label>
                                                            <div class="col-sm-7 dropdown-select">
                                                                <select name="cancel_at_period_end" id="cancel_at_period_end" class="form-control" itemValue="${sub.cancel_at_period_end}">
                                                                    <option value="" label="--------"/>
                                                                    <option value="true" label="true"/>
                                                                    <option value="false" label="false"/>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">app_fee_percent</label>
                                                            <div class="col-sm-7">
                                                                <input name="application_fee_percent" class="form-control" id="application_fee_percent" value="${sub.application_fee_percent}" />
                                                            </div>
                                                        </div>
                                                        <!-- transfer_data -->
                                                        <div class="panel panel-inner">
                                                            <div class="panel-heading">
                                                                <h3 class="panel-title">transfer_data</h3>
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="row">
                                                                    <div class="col-sm-12">
                                                                        <div class="form-group">
                                                                            <label class="col-sm-5 control-label">destination</label>
                                                                            <div class="col-sm-7">
                                                                                <input name="transfer_data.destination" class="form-control"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END optional params -->
                                        </div>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->

                                    <!-- HIDDEN PARAMS -->
                                    <input type="hidden" name="accountName" id="sub-account-name" value=""/>
                                    <!-- END HIDDEN PARAMS -->
                                </form>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-prod">
                                <h5>Create Subscription Response</h5>
                                <pre id="subResponse"></pre>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <button class="btn btn-primary-stripe-blue" id="sub-create-btn">Create a Subscription</button>
                        </div>
                    </div>
                </div>
                <!-- END Sub Param Panel -->

                <!-- Data panel -->
                <div class="row hide" id="data-panel">
                    <div class="panel panel-main panel-server" id="data-table-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <h3 class="panel-title"><span class="label label-primary api-method" >GET</span><span id="api-name"></span></h3>
                        </div>
                        <!-- client params -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="featured-datatable" class="table table-striped table-hover"></table>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer" id="data-panel-footer">
                        </div>
                    </div>
                </div>
                <!-- END data panel -->

                <!-- CLIENT SIDE PANEL -->
                <div class="row hide" id="client-action">
                    <div class="panel panel-main panel-client" id="client-action-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-green">CLIENT</span>
                            <h3 class="panel-title"><span class="label label-default api-method">JS</span>handleCardPayment()</h3>
                        </div>
                        <!-- client params -->
                        <div class="panel-body form-horizontal">
                            <form id="card-form">
                                <div class="row">
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">client_secret</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="client-secret" name="client_secret" type="text" value=""/>
                                            </div>
                                        </div>
                                        <!-- card details -->
                                        <div class="card-details hide">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">Card details</label>
                                                <div class="col-sm-9" id="stripe-card"></div>
                                                <div class="col-sm-9 col-sm-offset-3" id="card-errors"></div>
                                            </div>
                                            <div class="form-group last-row">
                                                <label class="col-sm-3 control-label"></label>
                                                <div class="col-sm-9">
                                                    <label class="fancy-checkbox custom-bgcolor-stripe">
                                                        <input type="checkbox" id="saveToCustomer" name="save_payment_method" >
                                                        <span>&nbsp; save_payment_method</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-5 card-details hide">
                                        <div class="project-accordion panel-second">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="#collapse-billing" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                        <span class="milestone-title"> payment_method_data </span>
                                                        <i class="fa fa-plus-circle toggle-icon"></i>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse-billing" class="panel-collapse collapse">
                                                <div class="panel-body" style="padding-top:10px;padding-bottom: 10px;">
                                                    <div class="panel panel-inner">
                                                        <div class="panel-heading">
                                                            <h3 class="panel-title"> billing_details </h3>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">name</label>
                                                                        <div class="col-sm-7">
                                                                            <input class="form-control" id="bd-name" name="payment_method_data.billing_details.name" type="text" value=""/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">email</label>
                                                                        <div class="col-sm-7">
                                                                            <input class="form-control" id="bd-email" name="payment_method_data.billing_details.email" type="text" value=""/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">phone</label>
                                                                        <div class="col-sm-7">
                                                                            <input class="form-control" id="bd-phone" name="payment_method_data.billing_details.email" type="text" value=""/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel panel-inner">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title"> address </h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-sm-12">
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">line1</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input class="form-control" id="bd-addr-line1" name="payment_method_data.billing_details.address.line1" type="text" value=""/>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">line2</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input class="form-control" id="bd-addr-line2" name="payment_method_data.billing_details.address.line2" type="text" value=""/>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">city</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input class="form-control" id="bd-addr-city" name="payment_method_data.billing_details.address.city" type="text" value=""/>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">state</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input class="form-control" id="bd-addr-state" name="payment_method_data.billing_details.address.state" type="text" value=""/>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label class="col-sm-5 control-label">postal_code</label>
                                                                                        <div class="col-sm-7">
                                                                                            <input class="form-control" id="bd-addr-postcode" name="payment_method_data.billing_details.address.postal_code" type="text" value=""/>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group last-row">
                                                                                        <label class="col-sm-5 control-label">country</label>
                                                                                        <div class="col-sm-7  dropdown-select">
                                                                                            <select name="payment_method_data.billing_details.address.country" id="bd-addr-country" class="form-control">
                                                                                                <option value="" label="----" />
                                                                                                <option value="GB">United Kingdom</option>
                                                                                                <option value="US">United States</option>
                                                                                                <option value="AU">Australia</option>
                                                                                                <option value="AT">Austria</option>
                                                                                                <option value="BE">Belgium</option>
                                                                                                <option value="BR">Brazil</option>
                                                                                                <option value="CA">Canada</option>
                                                                                                <option value="CN">China</option>
                                                                                                <option value="DK">Denmark</option>
                                                                                                <option value="FI">Finland</option>
                                                                                                <option value="FR">France</option>
                                                                                                <option value="DE">Germany</option>
                                                                                                <option value="HK">Hong Kong</option>
                                                                                                <option value="IE">Ireland</option>
                                                                                                <option value="IT">Italy</option>
                                                                                                <option value="JP">Japan</option>
                                                                                                <option value="LU">Luxembourg</option>
                                                                                                <option value="MX">Mexico</option>
                                                                                                <option value="NL">Netherlands</option>
                                                                                                <option value="NZ">New Zealand</option>
                                                                                                <option value="NO">Norway</option>
                                                                                                <option value="PT">Portugal</option>
                                                                                                <option value="SG">Singapore</option>
                                                                                                <option value="ES">Spain</option>
                                                                                                <option value="SE">Sweden</option>
                                                                                                <option value="CH">Switzerland</option>
                                                                                            </select>
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
    <!-- Spring Boot -->
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
      <version>${spring.boot.version}</version>
    </dependency>

    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-security</artifactId>
      <version>${spring.boot.version}</version>
    </dependency>

    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-thymeleaf</artifactId>
      <version>${spring.boot.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework.security.oauth.boot</groupId>
      <artifactId>spring-security-oauth2-autoconfigure</artifactId>
      <version>${spring.boot.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework.security.oauth</groupId>
      <artifactId>spring-security-oauth2</artifactId>
      <version>${spring.security.oauth.version}</version>
    </dependency>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="panel-footer">
                            <button id="action-button" class="btn btn-primary-stripe-blue" data-toggle=""><span>submit payment</span></button>
                        </div>
                    </div>
                </div>
                <!-- END CLIENT SIDE PANEL -->

                <!-- Modal panel -->
                <div class="modal">
                    <!-- Modal create customer -->
                    <div class="panel-modal hide" id="customer-modal">
                        <span class="close"><i class="far fa-times"></i></span>
                        <div class="panel-body" style="margin-top: -20px;">
                            <div class="row">
                                <form class="form-horizontal" id="customerForm">
                                    <div class="project-info">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">email</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="email" type="text" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">name</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="name" type="text" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">payment_method</label>
                                                <div class="col-sm-7 dropdown-select">
                                                    <select name="payment_method" class="form-control" id="cust-pm">
                                                        <option value="" label="--------"/>
                                                        <option value="tok_gb_debit" label="pm_card_gb_debit"/>
                                                        <option value="tok_gb" label="pm_card_gb"/>
                                                        <option value="tok_threeDSecure2Required" label="pm_card_threeDSecure2Required"/>
                                                        <option value="tok_threeDSecureRequired" label="pm_card_threeDSecureRequired"/>
                                                        <option value="tok_threeDSecureRequiredChargeDeclined" label="pm_card_threeDSecureRequiredChargeDeclined"/>
                                                        <option value="tok_chargeCustomerFail" label="pm_card_chargeCustomerFail"/>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">source</label>
                                                <div class="col-sm-7 dropdown-select">
                                                    <select name="source" class="form-control">
                                                        <option value="" label="--------"/>
                                                        <option value="tok_gb_debit" label="tok_gb_debit"/>
                                                        <option value="tok_gb" label="tok_gb"/>
                                                        <option value="tok_threeDSecure2Required" label="tok_threeDSecure2Required"/>
                                                        <option value="tok_threeDSecureRequired" label="tok_threeDSecureRequired"/>
                                                        <option value="tok_threeDSecureRequiredChargeDeclined" label="tok_threeDSecureRequiredChargeDeclined"/>
                                                        <option value="tok_chargeCustomerFail" label="tok_chargeCustomerFail"/>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">tax_exempt</label>
                                                <div class="col-sm-7 dropdown-select">
                                                    <select name="tax_exempt" class="form-control">
                                                        <option value="" label="--------"/>
                                                        <option value="none" label="none"/>
                                                        <option value="exempt" label="exempt"/>
                                                        <option value="reverse" label="reverse"/>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">invoice_prefix</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="invoice_prefix" type="text" value=""/>
                                                </div>
                                            </div>
                                            <input type="hidden" name="pm.card.token" type="text" value="" id="card-token"/>
                                            <input type="hidden" name="pm.type" type="text" value="card" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <button id="customer-action-button" class="btn btn-primary-stripe-blue modal-btn" style="float: right"><span>create a customer</span></button>
                        </div>
                    </div>
                    <!-- Modal create coupon -->
                    <div class="panel-modal hide" id="coupon-modal">
                        <span class="close"><i class="far fa-times"></i></span>
                        <div class="panel-body" style="margin-top: -20px;">
                            <div class="row">
                                <form class="form-horizontal" id="couponForm">
                                    <div class="project-info">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">id</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="id" type="text" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">name</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="name" type="text" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">max_redemptions</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="max_redemptions" type="text" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">percent_off</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="percent_off" type="text" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">amount_off</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="amount_off" type="text" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">currency</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="currency" type="text" value=""/>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">duration</label>
                                                <div class="col-sm-7 dropdown-select">
                                                    <select name="duration" class="form-control">
                                                        <option value="" label="--------"/>
                                                        <option value="once" label="once"/>
                                                        <option value="repeating" label="repeating"/>
                                                        <option value="forever" label="forever"/>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">duration_in_months</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="duration_in_months" type="text" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">redeem_by</label>
                                                <div class="col-sm-7">
                                                    <input data-provide="datepicker" data-date-autoclose="true" class="form-control" id="redeem_by">
                                                    <input type="hidden" class="date-picker-input" name="redeem_by" data-toggle="redeem_by">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <button id="coupon-action-button" class="btn btn-primary-stripe-blue modal-btn" style="float: right"><span>create a coupon</span></button>
                        </div>
                    </div>
                    <!-- Modal create tax_rate -->
                    <div class="panel-modal hide" id="taxrate-modal">
                        <span class="close"><i class="far fa-times"></i></span>
                        <div class="panel-body" style="margin-top: -20px;">
                            <div class="row">
                                <form class="form-horizontal" id="taxrateForm">
                                    <div class="project-info">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">display_name</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="display_name" type="text" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">inclusive</label>
                                                <div class="col-sm-7  dropdown-select">
                                                    <select name="inclusive" id="inclusive" class="form-control">
                                                        <option value="false">false</option>
                                                        <option value="true">true</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">percentage</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="percentage" type="text" value=""/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">description</label>
                                                <div class="col-sm-7">
                                                    <input class="form-control" name="description" type="text" value=""/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">jurisdiction</label>
                                                <div class="col-sm-7  dropdown-select">
                                                    <select name="jurisdiction" id="jurisdiction" class="form-control">
                                                        <option value="" label="----" />
                                                        <option value="GB">United Kingdom</option>
                                                        <option value="US">United States</option>
                                                        <option value="AU">Australia</option>
                                                        <option value="AT">Austria</option>
                                                        <option value="BE">Belgium</option>
                                                        <option value="BR">Brazil</option>
                                                        <option value="CA">Canada</option>
                                                        <option value="CN">China</option>
                                                        <option value="DK">Denmark</option>
                                                        <option value="FI">Finland</option>
                                                        <option value="FR">France</option>
                                                        <option value="DE">Germany</option>
                                                        <option value="HK">Hong Kong</option>
                                                        <option value="IE">Ireland</option>
                                                        <option value="IT">Italy</option>
                                                        <option value="JP">Japan</option>
                                                        <option value="LU">Luxembourg</option>
                                                        <option value="MX">Mexico</option>
                                                        <option value="NL">Netherlands</option>
                                                        <option value="NZ">New Zealand</option>
                                                        <option value="NO">Norway</option>
                                                        <option value="PT">Portugal</option>
                                                        <option value="SG">Singapore</option>
                                                        <option value="ES">Spain</option>
                                                        <option value="SE">Sweden</option>
                                                        <option value="CH">Switzerland</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <button id="taxrate-action-button" class="btn btn-primary-stripe-blue modal-btn" style="float: right"><span>create a tax rate</span></button>
                        </div>
                    </div>

                    <!-- Modal list customer's payment methods -->
                    <div class="panel-modal hide" id="pm-modal">
                        <span class="close"><i class="far fa-times"></i></span>
                        <div class="panel-body" style="margin-top: -20px;">
                            <div class="row">
                                <form class="form-horizontal" id="pmForm">
                                    <div class="project-info">
                                        <div class="col-md-4">

                                        </div>
                                        <div class="col-md-4">

                                        </div>
                                        <div class="col-md-4">

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SERVER SIDE PANEL - Webhook-->
                <div class="row hide" id="webhook">
                    <div class="panel panel-main panel-webhook">
                        <div class="panel-heading">
                            <span class="client-server stripe-orange">WEBHOOK</span>
                            <a name="server">
                                <h3 class="panel-title">webhook</h3>
                            </a>
                        </div>

                        <div class="panel-body form-horizontal">
                            <div class="panel panel-second project-accordion webhook" id="webhook-item" style="display: none;">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#collapse-webhook" data-toggle="collapse" data-parent="#accordion" class="collapsed" aria-expanded="false">
                                                 <span class="milestone-title">
                                                     <span class="" id="event-type"></span>
                                                     <span id="event-id"></span>
                                                     <span class="event-time" id="event-time"></span>
                                                 </span>
                                            <i class="fa toggle-icon fa-plus-circle"></i>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-webhook" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                    <div class="panel-body">
                                        <div class="milestone-section">
                                            <h4 class="milestone-heading" id="event-type-content"></h4>
                                            <p class="milestone-description">
                                            <pre id="webhook-content"></pre>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Webhook -->
            </div>
        </div>
    </div>
</div>

<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables/js-main/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables/js-bootstrap/dataTables.bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables-colreorder/dataTables.colReorder.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables-tabletools/js/dataTables.tableTools.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/scripts/serializeToJSON.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.cookie.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.blockUI.js"/>"></script>
<script src="<c:url value="/resources/scripts/fa-pro.js"/>"></script>

<%--<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>--%>
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>

<!-- init js -->
<script>
    let stripe;

    $(function(){
        // toggle nav active
        $('#navBilling').toggleClass('active');
        $('#navCreateSub').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function() {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });
        
        setDatePickers(['#billing_cycle_anchor', '#backdate_start_date', '#cancel_at', '#trial_end']);

        /**
         * Select a Stripe account to make API calls
         */
        $('#stripe-account').on('change', function () {
            let accountName = $(this).children("option:selected").val();
            let publishKey = $(this).children("option:selected").data('toggle');
            $( "input[name='accountName']").val(accountName);
            stripe = Stripe(publishKey);
        });

        // set metadata
        $('#metadata').on('focusout', "input[id*='-metadatakey-']", function () {

            var key = $(this).val();
            var id = $(this).attr('id');
            $('#'+id+'-value').attr('name', 'metadata['+key+']');
        });

        // add more metadata
        var md_num = 1;
        $('#add-sub-md').on('click', function () {
            var prefix = 'sub-md-';
            addMetaData(prefix, md_num);
            md_num++;
        });

        // add more items
        var num = 0;
        $('#add-items').on('click', function () {
            num++;
            var item = $('#item'+num).clone();
            item.attr('id', 'item'+(num+1));
            var formGroups = item.find('.form-group');

            formGroups.each(function () {
                replaceText($(this), 'label', num);

                var input = $(this).find('input');
                var input_name = input.attr('name').replace(num-1, num);

                var input_id = input.attr('id');
                if (typeof input_id !== 'undefined'){
                    input_id = input_id.replace(num-1, num)
                }
                input.attr('name', input_name);
                input.attr('id', input_id);
                input.val('');
            });
            replaceText(item, '.sub-title', num);
            $('#item'+num).append('<hr>').after(item);

        });
        // collection_method change
        $('#collection_method').on('change', function () {
            var type = $(this).children("option:selected").val();

            $('.invoice').toggleClass('hide');
            toggleDisable('.invoice', 'input');
        });
    });
</script>

<!-- datatable.js -->
<script>
    let table;

    $('#sub-panel').on('click', '.input-group-addon', function () {
        $('#toast-container').remove();

        let input = $(this).parent().find('input');
        let accountName = $('#sub-account-name').val();
        if (accountName === ''){
            showErrorMsg('Select an account', 'You need to select an account before start creating a connect account!');
        } else {
            // show data panel
            if($('#data-panel').attr('class').includes('hide')){
                $('#data-panel').toggleClass('hide');
            }
            if (typeof table !== 'undefined'){
                table.fnDestroy();
            }
            $('#featured-datatable').html('');

            //$('#featured-datatable').dataTable().fnClearTable();
            $('html, body').animate({scrollTop: $('#data-panel').offset().top}, 500);

            let panel_name = input.attr('id').split('-')[0];
            switch (panel_name) {
                case 'customer':
                    $('#api-name').html('/v1/customers');
                    retrieveCustomers(accountName);
                    break;

                case 'coupon':
                    $('#api-name').html('/v1/coupons');
                    retrieveCoupons(accountName)
                    break;

                case 'plan':
                    $('#api-name').html('/v1/plans');
                    retrievePlans(accountName);
                    break;

                case 'tax_rates':
                    $('#api-name').html('/v1/tax_rates');
                    retrieveTaxRates(accountName)
                    break;
            };

            $('#featured-datatable tbody').on('click', 'tr', function () {
                let data = table.fnGetData(this);
                input.val(data[0]);
                $('html, body').animate({scrollTop: $('#wrapper').offset().top}, 500);
            });
        }
    });

    function retrieveCustomers(accountName){
        table = $('#featured-datatable').dataTable({
            "columns": [
                {"title": "ID"},
                {"title": "EMAIL"},
                {"title": "FEATURES"},
                {"title": "CREATED"},
            ],
        });
        blockElement('#data-table-panel');
        $.ajax({
            type: "POST",
            url: "list-customers",
            data: accountName,
            dataType: "json",
            contentType: "application/json",

            error: function(response){
                const responseObj = JSON.parse(response.responseJSON.apiResponse);
                showErrorMsg(responseObj.code, responseObj.message);
            },

            success: function (response) {
                //console.log(response);
                const customers = response.apiResponse;
                customers.forEach(function (customer) {
                    //console.log(product);

                    /*let id = '<a id="'+product.id+'" class="product-id">'+product.id+'</a>';*/
                    let id = customer.id;
                    let email = '';
                    if (typeof customer.email != "undefined"){
                        email = customer.email;
                    }
                    let status = '';
                    if (typeof customer.invoice_settings.default_payment_method != "undefined"){
                        status = status + '<span class="label label-primary label-transparent">' + customer.invoice_settings.default_payment_method.id + '</span>';
                    }
                    if (customer.sources.totalCount > 0){
                        status = status + '<span class="label label-default label-transparent">source</span>';
                    }
                    if (customer.tax_ids.totalCount > 0){
                        status = status + '<span class="label label-warning label-transparent">tax_id</span>';
                    }
                    if (customer.subscriptions.totalCount > 0){
                        status = status + '<span class="label label-success label-transparent">subscription</span>';
                    }
                    let created = new Date(customer.created * 1000).toISOString().replace('T', ' ').replace('.000Z', '');

                    table.fnAddData([id, email, status, created]);
                });
                $('#data-panel-footer').html('<button class="btn btn-primary-stripe-blue show-modal" id="customer-create-btn"><i class="fas fa-layer-plus"></i> New Customer</button>');
            },

            complete: function () {
                table.fnSort([3, 'desc']);
                unBlockElement('#data-table-panel');
            }
        });
    }

    function retrievePlans(accountName){
        table = $('#featured-datatable').dataTable({
            "columns": [
                {"title": "ID"},
                {"title": "NICKNAME"},
                {"title": "AMOUNT"},
                {"title": "FEATURES"},
                {"title": "CREATED"},
            ]
        });
        blockElement('#data-table-panel');
        $('#data-panel-footer').html('');
        $.ajax({
            type: "POST",
            url: "list-plans",
            data: accountName,
            dataType: "json",
            contentType: "application/json",

            error: function(response){
                const responseObj = JSON.parse(response.responseJSON.apiResponse);
                showErrorMsg(responseObj.code, responseObj.message);
            },

            success: function (response) {
                //console.log(response);
                const plans = response.apiResponse;
                plans.forEach(function (plan) {
                    //console.log(plan);

                    /*let id = '<a id="'+product.id+'" class="product-id">'+product.id+'</a>';*/
                    let id = plan.id;
                    let nickname = '';
                    if (typeof plan.nickname != "undefined"){
                        nickname = plan.nickname;
                    }
                    let amount = '';
                    if (typeof plan.amount != "undefined"){
                        amount = plan.amount;
                    }
                    let currency = '';
                    if (typeof plan.currency != "undefined"){
                        currency = plan.currency;
                        amount = "(" + currency + ")" + amount;
                    }

                    let status = '';

                    status = status
                        + '<span class="label label-default label-transparent">' + plan.usage_type + '</span>'
                        + '<span class="label label-primary label-transparent">' + plan.billing_scheme + '</span>';
                    if (plan.billing_scheme === 'tiered'){
                        status = status + '<span class="label label-primary label-transparent">' + plan.tiers_mode + '</span>';
                    }
                    if (typeof plan.trial_period_days != "undefined"){
                        status = status + '<span class="label label-warning label-transparent">trial</span>';
                    }

                    status = status + '<span class="label label-danger label-transparent">' + plan.interval_count + '-' + plan.interval + '</span>';

                    let created = new Date(plan.created * 1000).toISOString().replace('T', ' ').replace('.000Z', '');

                    table.fnAddData([id, nickname, amount, status, created]);
                });
            },

            complete: function () {
                table.fnSort([4, 'desc']);
                unBlockElement('#data-table-panel');
            }
        });
    };

    function retrieveTaxRates(accountName){
        table = $('#featured-datatable').dataTable({
            "columns": [
                {"title": "ID"},
                {"title": "NAME"},
                {"title": "DESC"},
                {"title": "FEATURES"},
                {"title": "CREATED"},
            ]
        });
        blockElement('#data-table-panel');
        $.ajax({
            type: "POST",
            url: "list-taxrates",
            data: accountName,
            dataType: "json",
            contentType: "application/json",

            error: function(response){
                const responseObj = JSON.parse(response.responseJSON.apiResponse);
                showErrorMsg(responseObj.code, responseObj.message);
            },

            success: function (response) {
                //console.log(response);
                const tax_rates = response.apiResponse;
                tax_rates.forEach(function (tax_rate) {

                    let id = tax_rate.id;
                    let name = '';
                    if (typeof tax_rate.display_name != "undefined"){
                        name = tax_rate.display_name;
                    }
                    let status = '';
                    if (typeof tax_rate.percentage != "undefined"){
                        status = '<span class="label label-default label-transparent">' + tax_rate.percentage + '%' + '</span>';
                    }
                    if (typeof tax_rate.jurisdiction != "undefined"){
                        status = status + '<span class="label label-primary label-transparent">' + tax_rate.jurisdiction + '</span>';
                    }
                    let desc = '';
                    if (typeof tax_rate.description != "undefined"){
                        name = tax_rate.description;
                    }
                    let created = new Date(tax_rate.created * 1000).toISOString().replace('T', ' ').replace('.000Z', '');

                    table.fnAddData([id, name, desc, status, created]);
                });
                $('#data-panel-footer').html('<button class="btn btn-primary-stripe-blue show-modal" id="taxrate-create-btn"><i class="fas fa-layer-plus"></i> New Tax Rate</button>');
            },

            complete: function () {
                table.fnSort([3, 'desc']);
                unBlockElement('#data-table-panel');
            }
        });
    }

    function retrieveCoupons(accountName){
        table = $('#featured-datatable').dataTable({
            "columns": [
                {"title": "ID"},
                {"title": "NAME"},
                {"title": "FEATURES"},
                {"title": "CREATED"},
            ]
        });
        blockElement('#data-table-panel');
        $.ajax({
            type: "POST",
            url: "list-coupons",
            data: accountName,
            dataType: "json",
            contentType: "application/json",

            error: function(response){
                const responseObj = JSON.parse(response.responseJSON.apiResponse);
                showErrorMsg(responseObj.code, responseObj.message);
            },

            success: function (response) {
                //console.log(response);
                const coupons = response.apiResponse;
                coupons.forEach(function (coupon) {
                    //console.log(plan);

                    /*let id = '<a id="'+product.id+'" class="product-id">'+product.id+'</a>';*/
                    let id = coupon.id;
                    let name = '';
                    if (typeof coupon.name != "undefined"){
                        name = coupon.name;
                    }
                    let status = '';
                    if (typeof coupon.amount != "undefined"){
                        status = '<span class="label label-default label-transparent">' + coupon.currency + ' ' + coupon.amount + ' OFF' + '</span>';
                    }
                    if (typeof coupon.percent_off != "undefined"){
                        status = status + '<span class="label label-default label-transparent">' + coupon.percent_off + ' percent OFF' + '</span>';
                    }
                    if (typeof coupon.duration != "undefined"){
                        status = status + '<span class="label label-primary label-transparent">' + coupon.duration + '</span>';
                    }
                    if (typeof coupon.redeem_by != "undefined"){
                        status = status + '<span class="label label-warning label-transparent">' + coupon.redeem_by + '</span>';
                    }

                    let created = new Date(coupon.created * 1000).toISOString().replace('T', ' ').replace('.000Z', '');

                    table.fnAddData([id, name, status, created]);
                });
                $('#data-panel-footer').html('<button class="btn btn-primary-stripe-blue show-modal" id="coupon-create-btn"><i class="fas fa-layer-plus"></i> New Coupon</button>');
            },
            complete: function () {
                table.fnSort([3, 'desc']);
                unBlockElement('#data-table-panel');
            }
        });
    }
</script>

<!-- create subscription -->
<script>
    let hasElement = false;
    let requiresPM = false;
    let cardElement;

    $('#sub-create-btn').on('click', function () {
        $('.date-picker-input').each(function () {
            let target_id = $(this).data('toggle');
            let value = $('#' + target_id).val();
            if (value !== ''){
                let formValue = Date.parse(value)/1000;
                $(this).val(formValue);
            }
        });
        let data = $('#subForm').serializeToJSON()
        console.log(data);
        blockElement('#sub-panel');

        $.ajax({
            type: "POST",
            url: "create-subscription",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",

            error: function(response){
                const responseObj = JSON.parse(response.responseJSON.apiResponse);
                showErrorMsg(responseObj.code, responseObj.message);
            },

            success: function (response) {
                const subscription = JSON.parse(response.apiResponse);
                const  id = subscription.id;
                console.log(subscription);
                $('#subResponse').html(response.apiResponse);

                // hide data panel
                if(!$('#data-panel').attr('class').includes('hide')){
                    $('#data-panel').toggleClass('hide');
                }

                switch (response.code) {
                    case 'SUCCESS':
                        $('#sub-create-btn').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Subscription created: <b>' + id + '</b> </span></li></div>');
                        break;
                    case 'SUCCESS_TRIALING':
                        $('#sub-create-btn').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Subscription starts trialing: <b>' + id + '</b> </span></li></div>');
                        break;
                    case 'REQUIRE_ACTION':
                        var action = response.action;
                        switch (action.code) {
                            case 'REDIRECT_TO_URL':
                                $('#sub-create-btn').after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;<b>REDIRECT_TO_URL: </b><a href="' + action.body + '" target="_blank">STRIPE_3DS_PAGE</a> </span></li></div>');
                                break;

                            case 'USE_STRIPE_SDK':
                                $('#client-secret').val(action.body);
                                $('#sub-create-btn').after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>USE_STRIPE_SDK</b> </span></li></div>');

                                if($('#client-action').attr('class').includes('hide')){
                                    $('#client-action').toggleClass('hide');
                                }
                                $('html, body').animate({scrollTop: $('#client-action').offset().top}, 500);
                                break;

                            case 'REQUIRES_PAYMENT_METHOD':
                                $('#client-secret').val(action.body);
                                $('#sub-create-btn').after('<div class="alert alert-danger alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Payment failed - action required: <b>REQUIRES_PAYMENT_METHOD</b> </span></li></div>');
                                if($('#client-action').attr('class').includes('hide')){
                                    $('#client-action').toggleClass('hide');
                                }
                                requiresPM = true;
                                if (!hasElement) {
                                    renderStripeElements();
                                    $('.card-details').toggleClass('hide');
                                }

                                $('html, body').animate({scrollTop: $('#client-action').offset().top}, 500);
                                break;
                        }
                }
            },

            complete: function (response, status) {
                unBlockElement('#sub-panel');
                var responseObj = JSON.parse(response.responseJSON.apiResponse);
                var subId = responseObj.id;
                receiveWebhook(subId);
            }
        });
    });

    /**
     * Client side action
     */
    $('#action-button').on('click', function () {

        blockElement('#client-action-panel');
        $('#toast-container').remove();

        let clientSecret = $('#client-secret').val();
        console.log(requiresPM);
        let isSuccess = false;
        if (requiresPM){
            let data = $('#card-form').serializeToJSON();
            console.log(data);
            stripe.handleCardPayment(clientSecret, cardElement, data).then(function(result) {
                //console.log(result);
                unBlockElement('#client-action-panel');

                if (result.error){
                    showErrorMsg(result.error.code, result.error.message);
                    requiresPM = true;
                } else {
                    var id = result.paymentIntent.id;
                    console.log(result.paymentIntent.status);
                    $('#action-button').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Payment successful: <b>' + id + '</b> </span></li></div>');
                    isSuccess = true;
                }
            });
        } else {
            stripe.handleCardPayment(clientSecret).then(function(result) {

                unBlockElement('#client-action-panel');

                if (result.error){
                    showErrorMsg(result.error.code, result.error.message);
                    requiresPM = true;
                    if (!hasElement){
                        renderStripeElements();
                        $('.card-details').toggleClass('hide');
                    }
                } else {
                    var id = result.paymentIntent.id;
                    $('#action-button').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Payment successful: <b>' + id + '</b> </span></li></div>');
                    isSuccess = true;
                }
            });
        }

        if (isSuccess){
            // load Sub details
        }

    });

    /**
     * Render Stripe Elements
     * @param account
     */
    function renderStripeElements(){
        console.log("rendering stripe elements");

        $('#card-element').remove();
        $('#stripe-card').append("<div id=\"card-element\"></div>");

        var elements = stripe.elements();

        // Card elements
        var style = {
            base: {
                color: '#5e6773',
                fontSize: '14px',
                '::placeholder': {
                    color: '#ccc'
                },
            },
            invalid: {
                color: '#e5424d',
            },
        };

        cardElement = elements.create('card', {
            hidePostalCode : true,
            style : style
        });
        cardElement.mount('#card-element');

        cardElement.on('change', function (event) {
            if (event.error){
                $('#card-errors').html(event.error.message);
            } else {
                $('#card-errors').html("");
            }
        });
        hasElement = true;
    };


    /**
     * Receive webhook
     */
    function receiveWebhook(subId){
        var source = new EventSource("/subscription/webhook");

        source.onmessage = function(webhook) {

            if (webhook.data != 'null'){

                var webhookCollection = JSON.parse(webhook.data);
                var dataList = webhookCollection.data;

                for (var i=0; i<dataList.length; i++){
                    var event = JSON.parse(dataList[i]);

                    var id = event.id;
                    var created = new Date(event.created*1000).toLocaleString();
                    var type = event.type;
                    var dataId = event.data.object.id;

                    if (dataId === piId){
                        $('#webhook').show();
                        var newWebhook = $('#webhook-item').clone().show();
                        newWebhook.attr("id", id);

                        $('#webhook-item').after(newWebhook);

                        $('#' + id +' #event-type').text(type);
                        $('#' + id +' #event-id').text(id);
                        $('#' + id +' #event-time').text(created);
                        $('#' + id +' #event-type-content').text(type);
                        $('#' + id +' #webhook-content').text(JSON.stringify(event, undefined, 3));

                        $('#' + id +' .collapsed').attr("href", "#col-" + id);
                        $('#' + id +' .panel-collapse').attr("id", "col-" + id);


                        if (type === 'payment_intent.payment_failed'){
                            $('#' + id +' #event-type').attr('class', 'label plan-status label-webhook label-danger');
                        } else {
                            $('#' + id +' #event-type').attr('class', 'label plan-status label-webhook label-success');
                        }
                        showNotification("New webhook received!", type);
                    }
                }
            }
        };
    }

</script>

<!-- modal -->
<script>
    $('#data-panel').on('click', '.show-modal', function () {
        $('.modal').fadeIn(500);
        let prefix = $(this).attr('id').split('-')[0];
        //console.log(prefix);
        $('#' + prefix + '-modal').toggleClass('hide');
    });

    $('.modal-btn').on('click', function () {
        let prefix = $(this).attr('id').split('-')[0];
        //console.log(prefix);
        addFromModal(prefix);
    })

    $('.close').on('click', function () {
        $(this).parent().toggleClass('hide');
        $('.modal').fadeOut(500);
    });

    $('#cust-pm').on('change', function () {
        let pm = $(this).val();
        $('#card-token').val(pm);
    })

    /**
     * Create a new object from modal
     * @param prefix
     */
    function addFromModal(prefix){
        let accountName = $('#sub-account-name').val();
        let data = $('#' + prefix + 'Form').serializeToJSON();
        $('#toast-container').remove();

        $.ajax({
            type: "POST",
            url: "create-" + prefix + "?accountName=" + accountName,
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",

            error: function(response){
                const responseObj = JSON.parse(response.responseJSON.apiResponse);
                showErrorMsg(responseObj.code, responseObj.message);
            },

            success: function (response) {
                const obj = JSON.parse(response.apiResponse);
                const  id = obj.id;
                console.log(obj);
                // close modal
                $('.modal').fadeOut(500);
                $('#' + prefix + '-modal').toggleClass('hide');

                // refresh table
                if (typeof table !== 'undefined'){
                    table.fnDestroy();
                    $('#featured-datatable').html('');
                }
                if (prefix === 'customer'){
                    retrieveCustomers(accountName);
                } else if (prefix === 'coupon'){
                    retrieveCoupons(accountName);
                } else if (prefix === 'taxrate'){
                    retrieveTaxRates(accountName);
                }
            },
        });
    }

</script>

<!-- page specific css -->
<style>
    .label-transparent{
        margin-right: 5px !important;
        padding: 5px !important;
        font-size: 100% !important;
        display: inline-block;
        box-shadow: 0 1px 3px rgba(50, 50, 93, 0.15), 0 1px 0 rgba(0, 0, 0, 0.02);
        border: 1px solid;
    }
    td{
        cursor: pointer;
    }
    div.dataTables_wrapper div.dataTables_length select {
        width: 57px; !important;
    }
    #featured-datatable_length::after{
        content: '';
        position: absolute;
        width: 9px;
        height: 5px;
        margin-top: -2px;
        background-image: url(/resources/img/dropdown.svg);
        pointer-events: none;
        left: 90px;
        top: 15px;
    }
</style>

</body>
</html>
