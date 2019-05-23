<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-04-14
  Time: 10:27
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
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.css"/>">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">

</head>

<body class="layout-topnav">
<div id="wrapper">
    <!-- NAVBAR -->
    <jsp:include page='../navbar.jsp'/>
    <!-- END NAVBAR -->

    <!-- MAIN -->
    <div class="main">
        <div class="main-content">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">PaymentIntent - manual confirmation</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="/"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="/payments">Payments</a></li>
                        <li class="active">PaymentIntent</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
<%--

                <div class="row" id="client-params-1">
                    <div class="panel panel-main panel-client">
                        <div class="panel-heading">
                            <span class="client-server stripe-green">CLIENT SIDE</span>
                            <h3 class="panel-title">Stripe.js - stripe.createPaymentMethod()</h3>
                        </div>
                        <!-- client params -->
                        <div class="panel-body form-horizontal">
                            <section class="col-md-4">
                                <h4>Shipping &amp; Billing Information</h4>
                                <fieldset class="with-state">
                                    <label>
                                        <span>Name</span>
                                        <input name="name" class="field" placeholder="Jenny Rosen" required="true" autocomplete="off">
                                    </label>
                                    <label>
                                        <span>Email</span>
                                        <input name="email" type="email" class="field" placeholder="jenny@example.com" required="">
                                    </label>
                                    <label>
                                        <span>save_payment_method</span>
                                        <input name="address" class="field" placeholder="185 Berry Street Suite 550">
                                    </label>
                                    <label>
                                        <span>City</span>
                                        <input name="city" class="field" placeholder="San Francisco">
                                    </label>
                                    <label class="select">
                                        <span>Country</span>
                                        <div id="country" class="field US">
                                            <select name="country">
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
                                                <option value="GB">United Kingdom</option>
                                                <option value="US" selected="selected">United States</option>
                                            </select>
                                        </div>
                                    </label>
                                    <a href="#collapse-test" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                        <label class="collapse-label">
                                            <span>billing_details</span>
                                            <div class="field">
                                                <i class="fa fa-caret-down toggle-icon"></i>
                                            </div>
                                        </label>
                                    </a>

                                    <div id="collapse-test" class="panel-collapse collapse form-collapse">

                                        <label>
                                            <span>City</span>
                                            <input name="city" class="field" placeholder="San Francisco">
                                        </label>
                                        <label class="select">
                                            <span>Country</span>
                                            <div id="country" class="field US">
                                                <select name="country">
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
                                                    <option value="GB">United Kingdom</option>
                                                    <option value="US" selected="selected">United States</option>
                                                </select>
                                            </div>
                                        </label>
                                    </div>

                                    <label class="state">
                                        <span>State</span>
                                        <input name="state" class="field" placeholder="CA">
                                    </label>
                                </fieldset>
                            </section>
                            <section class="col-md-4">

                            </section>
                        </div>
                    </div>
                </div>
--%>

                <!-- CLIENT SIDE PANEL -->
                <div class="row" id="client-params">
                    <div class="panel panel-main panel-client">
                        <div class="panel-heading">
                            <span class="client-server stripe-green">CLIENT SIDE</span>
                            <h3 class="panel-title">Stripe.js - stripe.createPaymentMethod()</h3>
                            <!-- LIST ACCOUNTS -->
                            <div class="account-select right">
                                <select id="stripe-account" class="panel-title acct-sel" >
                                    <option value="" label="Select account"/>
                                    <c:forEach items="${viewObj.allAccounts.accountPropertiesList}" var="account">
                                        <option value="${account.accountName}" label="Account - ${account.accountName}"/>
                                    </c:forEach>
                                </select>
                            </div>
                            <!-- END LIST ACCOUNTS -->
                        </div>
                        <!-- client params -->
                        <div class="panel-body form-horizontal">
                            <div class="col-md-6 col-md-offset-2" id="card-params">
                                <form class="project-info" id="card-form">
                                    <div class="panel panel-group project-accordion panel-second project-milestone">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="#collapse-bd" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                    <span class="milestone-title"> billing_details </span>
                                                    <i class="fa fa-plus-circle toggle-icon"></i>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse-bd" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">name</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" id="bd-name" name="billing_details.name" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">email</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" id="bd-email" name="billing_details.email" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row milestone-section">
                                                    <h5 class="body-title">address</h5>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">line1</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" id="bd-line1" name="billing_details.address.line1" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">line2</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" id="bd-line2" name="billing_details.address.line2" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">city</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" id="bd-city" name="billing_details.address.city" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">state</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" id="bd-state" name="billing_details.address.state" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">postal_code</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" id="bd-postal_code" name="billing_details.address.postal_code" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">country</label>
                                                            <div class="col-sm-8">
                                                                <input class="form-control" id="bd-country" name="billing_details.address.country" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <!-- card details -->
                                <div class="form-group" id="card-details" style="display: none;">
                                    <label class="col-sm-4 control-label">Card details</label>
                                    <div class="col-sm-8" id="stripe-card"></div>
                                    <div class="col-sm-8" id="bank-element"></div>
                                    <div class="col-sm-8 col-sm-offset-4" id="card-errors"></div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-8 col-sm-offset-4">
                                        <button id="pm-button" class="btn btn-primary-stripe-blue" style="width: 100%"><span>Create a Payment Method</span></button>
                                    </div>
                                </div>
                                <div class="form-group" id="pm-display" style="display: none;">
                                    <div class="col-sm-8 col-sm-offset-4">
                                        <div class="alert alert-success source" style="margin-bottom: 0; padding: 5px 10px 5px 15px;">
                                            payment_method_id: <a href="#" class="pm-id" id="pm-id"></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" id="action-params" style="display: none;">

                                <ul class="alert alert-warning source" style="margin-bottom: 0; padding: 5px 10px 5px 15px; list-style: none;">
                                    <li> <i class="fa fa-exclamation-triangle"></i> <span>&nbsp;&nbsp;Action required: <b id="action-title"></b> </span></li>
                                    <li><span id="action-content"></span></li>
                                </ul>
                                <br>
                                <div class="form-group">
                                    <div class="col-md-8 col-md-offset-4">
                                        <button data-toggle="" id="redirect-button" class="btn btn-primary-stripe-blue" style="width: 100%; display: none;"><span>Redirect to url</span></button>
                                        <button data-toggle="" id="sdk-button" class="btn btn-primary-stripe-blue" style="width: 100%;text-transform: none; display: none;"><span>CALL handleCardAction()</span></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- END CLIENT SIDE PANEL -->

                <!-- SERVER SIDE PANEL - Create PI-->
                <div class="row" id="server-params" style="display: block;">
                    <div class="panel panel-main panel-server panel-tab">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER SIDE</span>
                            <a name="server"><h3 class="panel-title">Create a PaymentIntent</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq" class="active"><a href="#reqTab" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes"><a href="#resTab" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab">
                                <form class="form-horizontal" id="piForm">
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <div class="project-info">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><b>amount</b></label>
                                                    <div class="col-sm-7">
                                                        <input name="amount" class="form-control" id="amount" value="${piReq.amount}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><b>currency</b></label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="currency" id="currency" class="form-control" itemValue="${piReq.currency}">
                                                            <option value="gbp" label="gbp"/>
                                                            <option value="usd" label="usd"/>
                                                            <option value="eur" label="eur"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">confirm</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="confirm" id="confirm" class="form-control" itemValue="${piReq.confirm}">
                                                            <option value="true" label="true"/>
                                                            <option value="false" label="false"/>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><b>payment_method_types</b></label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="payment_method_types[]" id="paymentMethodTypes" class="form-control" itemValue="${piReq.payment_method_types}">
                                                            <option value="card" label="card"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">capture_method</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="capture_method" id="captureMethod" class="form-control" itemValue="${piReq.capture_method}">
                                                            <option value="automatic" label="automatic"/>
                                                            <option value="manual" label="manual"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">confirmation_method</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="confirmation_method" id="confirmationMethod" class="form-control" itemValue="${piReq.capture_method}">
                                                            <option value="manual" label="manual"/>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">payment_method</label>
                                                    <div class="col-sm-7">
                                                        <input name="payment_method" class="form-control" id="paymentMethod" value="${piReq.payment_method}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">customer</label>
                                                    <div class="col-sm-7">
                                                        <input name="customer" class="form-control" id="customer" value="${piReq.customer}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">save_payment_method</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="save_payment_method" id="savePaymentMethod" class="form-control" itemValue="${piReq.save_payment_method}">
                                                            <option value="" label="----" />
                                                            <option value="true" label="true"/>
                                                            <option value="false" label="false" />
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->

                                    <div class="row">
                                        <!-- OPTIONAL PARAMS -->
                                        <div class="col-md-4">
                                            <div class="panel panel-group project-accordion project-info panel-second project-milestone">
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
                                                            <label class="col-sm-6 control-label">description</label>
                                                            <div class="col-sm-6">
                                                                <input name="description" class="form-control" id="description" value="${piReq.description}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-6 control-label">receipt_email</label>
                                                            <div class="col-sm-6">
                                                                <input name="receipt_email" class="form-control" id="receiptEmail" value="${piReq.receipt_email}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-6 control-label">statement_descriptor</label>
                                                            <div class="col-sm-6">
                                                                <input name="statement_descriptor" class="form-control" id="statementDescriptor" value="${piReq.statement_descriptor}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-6 control-label">return_url</label>
                                                            <div class="col-sm-6">
                                                                <input name="return_url" class="form-control" id="returnURL" value="${piReq.return_url}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-6 control-label">metadata[0]</label>
                                                            <div class="col-sm-6">
                                                                <input name="metadata[0]" class="form-control" id="metadata0" placeholder="key=value" value="${piReq.metadata[0]}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-6 control-label">metadata[1]</label>
                                                            <div class="col-sm-6">
                                                                <input name="metadata[1]" class="form-control" id="metadata1" placeholder="key=value" value="${piReq.metadata[1]}"/>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END OPTIONAL PARAMS -->

                                        <!-- SHIPPING PARAMS -->
                                        <div class="col-md-4">
                                            <div class="project-info">
                                                <div class="panel panel-group project-accordion panel-second project-milestone">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a href="#collapse2" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                                <span class="milestone-title"> Shipping parameters </span>
                                                                <i class="fa fa-plus-circle toggle-icon"></i>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapse2" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label"><b>name</b></label>
                                                                <div class="col-sm-7">
                                                                    <input name="shipping.name" class="form-control" id="shippingName" value="${piReq.shipping.name}"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label"><b>address.line1</b></label>
                                                                <div class="col-sm-7">
                                                                    <input name="shipping.address.line1" class="form-control" id="line1" value="${piReq.shipping.address.line1}"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">address.line2</label>
                                                                <div class="col-sm-7">
                                                                    <input name="shipping.address.line2" class="form-control" id="line2" value="${piReq.shipping.address.line2}"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">address.city</label>
                                                                <div class="col-sm-7">
                                                                    <input name="shipping.address.city" class="form-control" id="city" value="${piReq.shipping.address.city}"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">address.state</label>
                                                                <div class="col-sm-7">
                                                                    <input name="shipping.address.state" class="form-control" id="state" value="${piReq.shipping.address.state}"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">address.postal_code</label>
                                                                <div class="col-sm-7">
                                                                    <input name="shipping.address.postal_code" class="form-control" id="postcode" value="${piReq.shipping.address.postal_code}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END SHIPPING PARAMS -->

                                        <!-- CONNECT PARAMS -->
                                        <div class="col-md-4">
                                            <div class="project-info">
                                                <div class="panel panel-group project-accordion panel-second project-milestone">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a href="#collapse3" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                                <span class="milestone-title"> Connect parameters </span>
                                                                <i class="fa fa-plus-circle toggle-icon"></i>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapse3" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <label class="col-sm-6 control-label">application_fee_amt</label>
                                                                <div class="col-sm-6">
                                                                    <input name="application_fee_amount" class="form-control" id="applicationFeeAmount" value="${piReq.application_fee_amount}"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-6 control-label">on_behalf_of</label>
                                                                <div class="col-sm-6">
                                                                    <input name="on_behalf_of" class="form-control" id="onBehalfOf" value="${piReq.on_behalf_of}" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-6 control-label">transfer_group</label>
                                                                <div class="col-sm-6">
                                                                    <input name="transfer_group" class="form-control" id="transferGroup" value="${piReq.transfer_group}" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-6 control-label">transfer_data[dest]</label>
                                                                <div class="col-sm-6">
                                                                    <input name="transfer_data[destination]" class="form-control" id="transfer_data_destination" value="${piReq.transfer_data.get('destination')}" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END CONNECT PARAMS -->
                                    </div>

                                    <!-- HIDDEN PARAMS -->
                                    <input type="hidden" id="account-name" name="accountName" value=""/>
                                    <!-- END HIDDEN PARAMS -->
                                </form>
                                <!-- SUBMIT -->
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-8" id="create-btn">
                                        <button class="btn btn-primary-stripe-blue" id="pi-create-btn">Create a PaymentIntent</button>
                                    </div>
                                    <div class="col-md-4" style="display: none;" id="confirm-btn">
                                        <button class="btn btn-primary-stripe-blue" id="pi-confirm-btn">Confirm a PaymentIntent</button>
                                    </div>
                                </div>
                                <!-- END SUBMIT -->
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab">
                                <div class="row">
                                    <div class="form-horizontal">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">id</label>
                                                <div class="col-sm-8">
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">capture_method</label>
                                                <div class="col-sm-8">
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">charges</label>
                                                <div class="col-sm-8">
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">id</label>
                                                <div class="col-sm-8">
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">payment_method_details</label>
                                                <div class="col-sm-8">
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">next_action</label>
                                                <div class="col-sm-8">
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">status</label>
                                                <div class="col-sm-8">
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Create PI-->

                <!-- SERVER SIDE PANEL - Capture PI -->
                <div class="row" id="capture-params" style="display: block;">
                    <div class="panel panel-main panel-server panel-tab">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER SIDE</span>
                            <a name="server"><h3 class="panel-title">Capture a PaymentIntent</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-cap" class="active"><a href="#reqTab-cap" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-cap"><a href="#resTab-cap" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-cap">
                                <div class="form-horizontal" >
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <div class="project-info">
                                            <form id="piCapForm">
                                                <!-- HIDDEN PARAMS -->
                                                <input type="hidden" name="accountName" value=""/>
                                                <input type="hidden" name="pi_id" value=""/>
                                                <!-- END HIDDEN PARAMS -->
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label"><b>amount_to_capture</b></label>
                                                        <div class="col-sm-7">
                                                            <input name="amount_to_capture" class="form-control" id="amountToCapture"  />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label">application_fee_amount</label>
                                                        <div class="col-sm-7">
                                                            <input name="application_fee_amount" class="form-control" id="appFeeAmt"  />
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>

                                            <div class="col-md-4">
                                                <button class="btn btn-primary-stripe-blue" id="pi-capture-btn">Capture a PaymentIntent</button>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->

                                </div>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-cap">

                            </div>


                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Capture PI -->
            </div>
        </div>
    </div>
    <!-- END MAIN -->
</div>

<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/scripts/serializeToJSON.js"/>"></script>
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script src="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.js"/>"></script>


<script>

    $(function(){
        // toggle nav active
        $('#navPayment').toggleClass('active');
        $('#navPi').toggleClass('active');
        $('#navCreatePiManual').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });


        $('fieldset [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-caret-up fa-caret-down ');
        });

        /**
         * Select a Stripe account to make API calls
         */
        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $('#account-name').val(accountName);

            if (accountName !== ""){
                $.ajax({
                    type : "GET",
                    url : "getAccount",
                    data: "acctName="+accountName,
                    success: function(result){
                        renderStripeElements(result);
                        $('#card-details').show();
                    }
                });

            } else {
                $('#card-details').hide();
                $('#card-element').remove();
            }
        });

        /**
         * Render Stripe Elements
         * @param account
         */
        function renderStripeElements(account){
            $('#card-element').remove();
            $('#stripe-card').append("<div id=\"card-element\"></div>");

            var stripe = Stripe(account.accountPublishKey);
            console.log(account.accountPublishKey)
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

            var cardElement = elements.create('card', {
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

            // Bank elements
            /*var options = {
                style: style,
                supportedCountries: ['SEPA'],
                // If you know the country of the customer, you can optionally pass it to
                // the Element as placeholderCountry. The example IBAN that is being used
                // as placeholder reflects the IBAN format of that country.
                placeholderCountry: 'DE',
            };

            var iban = elements.create('iban', options);
            iban.mount('#bank-element');*/


            // create a payment method on client side
            $('#pm-button').on('click', function(){
                $('#pm-button').append("<i class=\"fa fa-spinner fa-spin card-btn-spinner\"></i>");
                $('#pm-button').prop('disabled', true);

                var data = $('#card-form').serializeToJSON();

                stripe.createPaymentMethod('card', cardElement, data).then(function(result) {

                    console.log(result);

                    if (result.error){
                        $('#pm-button').prop('disabled', false);
                        showErrorMsg(result.error.code, result.error.message);
                    } else {
                        // Show payment_method_id result
                        $('.pm-id').append(result.paymentMethod.id);
                        $('.pm-id').attr("id", result.paymentMethod.id);
                        $('#pm-display').show();

                        // add payment_method_id into server params
                        $('#paymentMethod').val(result.paymentMethod.id);

                        // disable account selection
                        $('#stripe-account').attr('disabled', 'disabled');

                        // show and nav to server params
                        $('#server-params').show();
                        $('html, body').animate({scrollTop: $('#server-params').offset().top}, 500);
                    }
                    $('.card-btn-spinner').remove();
                });
            });
        };




        /**
         * Submit createPaymentIntent request to server
         */
        $('#pi-create-btn').on('click', function () {
            var data = $('#piForm').serializeToJSON();
            console.log(data);

            $.ajax({
                type : "POST",
                url : "payment_intent_manual",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                success: function(response){

                    var apiResponse = response.apiResponse;
                    console.log(apiResponse);
                    //loopObject(apiResponse, '');

                    var responseCode = response.code;
                    switch (responseCode){
                        case 'SUCCESS':
                            console.log("SUCCESS");
                            // show success

                            break;

                        case 'SUCCESS_PROCESSING':

                        case 'SUCCESS_CANCELED':

                        case 'ERROR':
                            console.log("HERE-E");

                            break;

                        case 'REQUIRE_ACTION':
                            console.log("REQUIRE_ACTION");
                            var action = response.action;

                            switch (action.code){
                                case 'REDIRECT_TO_URL':
                                    // go to client and show redirect button
                                    $('html, body').animate({scrollTop: $('#client-params').offset().top}, 500);
                                    $('#card-params').toggleClass('col-md-offset-2', 500);
                                    $('#action-text').html('redirect_to_url');
                                    $('#action-params').show();
                                    $('#redirect-button').show();
                                    $('#redirect-button').attr('data-toggle', action.body);

                                case 'USE_STRIPE_SDK':
                                    // go to client and show handleCardAction button
                                    $('html, body').animate({scrollTop: $('#client-params').offset().top}, 500);
                                    $('#card-params').toggleClass('col-md-offset-2', 500);
                                    $('#action-text').html('use_stripe_sdk');
                                    $('#action-params').show();
                                    $('#sdk-button').show();
                                    $('#sdk-button').attr('data-toggle', action.body);

                                case 'REQUIRES_PAYMENT_METHOD':
                                    // this shouldn't happen at all here

                                case 'REQUIRES_CONFIRMATION':
                                    // show confirm PI button
                                    $('#create-btn').toggleClass('col-md-offset-8').toggleClass('col-md-offset-4');
                                    $('#confirm-btn').show();

                                case 'REQUIRES_CAPTURE':
                                    // show capture PI panel
                                    $('#capture-params').show();
                                    $('html, body').animate({scrollTop: $('#capture-params').offset().top}, 500);
                            }

                            break;
                    }

                }
            });
        });


        $('#pi-capture-btn').on('click', function () {

            $('html, body').animate({scrollTop: $('.main').offset().top}, 500);
            $('#card-params').toggleClass('col-md-offset-2', 500);
            $('#action-title').html('redirect_to_url');
            $('#action-content').html('https://hooks.stripe.com/redirect/authenticate/src_1EQDsGGGaTfhElOZBgnychph?client_secret=src_client_secret_Eu1wLZMuH8QMQfu6mkkRAQtF');
            $('#action-params').show();
            $('#sdk-button').show();
            $('#sdk-button').attr('data-toggle', 'client_secret');
        })


        function loopObject(obj, name){
            for (var key in obj) {

                var keyName = key;
                if (name !== ''){
                    keyName = name + "." + key;
                }
                var value = obj[key];

                if (value instanceof Object){
                    console.log(key + " is an OBJECT");
                    loopObject(value, key);

                } else {
                    console.log(keyName + " = " + value);
                }


            };
        };
    });

</script>
</body>
</html>