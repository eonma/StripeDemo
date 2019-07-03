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
                        <h1 class="page-title-st">PaymentIntent - auto confirmation</h1>
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
                        <li><a href="/payments">Payments</a></li>
                        <li class="active">PaymentIntent - auto</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->

                <!-- SERVER SIDE PANEL - Create PI-->
                <div class="row" id="server-params">
                    <div class="panel panel-main panel-server panel-tab" id="create-pi-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>/v1/payment_intents</h3></a>
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
                                                            <option value="false" label="false"/>
                                                            <option value="true" label="true"/>
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
                                                    <label class="col-sm-5 control-label">setup_future_usage</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="setup_future_usage" id="setup_future_usage" class="form-control" itemValue="${piReq.setup_future_usage}">
                                                            <option value="" label="----" />
                                                            <option value="on_session" label="on_session"/>
                                                            <option value="off_session" label="off_session" />
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
                                            <div class="project-accordion panel-second">
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
                                                            <label class="col-sm-5 control-label">confirmation_method</label>
                                                            <div class="col-sm-7 dropdown-select">
                                                                <select name="confirmation_method" id="confirmationMethod" class="form-control" itemValue="${piReq.capture_method}">
                                                                    <option value="automatic" label="automatic"/>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">description</label>
                                                            <div class="col-sm-7">
                                                                <input name="description" class="form-control" id="description" value="${piReq.description}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">receipt_email</label>
                                                            <div class="col-sm-7">
                                                                <input name="receipt_email" class="form-control" id="receiptEmail" value="${piReq.receipt_email}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">statement_descriptor</label>
                                                            <div class="col-sm-7">
                                                                <input name="statement_descriptor" class="form-control" id="statementDescriptor" value="${piReq.statement_descriptor}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">return_url</label>
                                                            <div class="col-sm-7">
                                                                <input name="return_url" class="form-control" id="returnURL" value="${piReq.return_url}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">metadata</label>
                                                            <div class="col-sm-3" style="padding-right:5px;">
                                                                <input class="form-control" id="pi-metadatakey-0" data-toggle="0" placeholder="key"/>
                                                            </div>
                                                            <div class="col-sm-4" style="padding-left:5px;">
                                                                <input class="form-control" id="pi-metadatakey-0-value" name="metadata" placeholder="value"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" id="pi-md-1">
                                                            <label class="col-sm-5 control-label"></label>
                                                            <div class="col-sm-3" style="padding-right:5px;">
                                                                <input class="form-control" id="pi-metadatakey-1" data-toggle="1" placeholder="key"/>
                                                            </div>
                                                            <div class="col-sm-4" style="padding-left:5px;">
                                                                <input class="form-control" id="pi-metadatakey-1-value" name="metadata" placeholder="value"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group last-row">
                                                            <a class="col-sm-4 col-sm-offset-6 control-label" id="add-md" style="float: right; cursor: pointer;padding-top:0;">+ add metadata</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END OPTIONAL PARAMS -->

                                        <!-- SHIPPING PARAMS -->
                                        <div class="col-md-4">
                                            <div class="project-accordion panel-second">
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
                                                        <div class="form-group last-row">
                                                            <label class="col-sm-5 control-label">address.postal_code</label>
                                                            <div class="col-sm-7">
                                                                <input name="shipping.address.postal_code" class="form-control" id="postcode" value="${piReq.shipping.address.postal_code}"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END SHIPPING PARAMS -->

                                        <!-- CONNECT PARAMS -->
                                        <div class="col-md-4">
                                            <div class="project-accordion panel-second">
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
                                                            <label class="col-sm-5 control-label">Stripe-Account</label>
                                                            <div class="col-sm-7">
                                                                <input name="Stripe-Account" class="form-control" id="stripeAccount" value=""/>
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">application_fee_amt</label>
                                                            <div class="col-sm-7">
                                                                <input name="application_fee_amount" class="form-control" id="applicationFeeAmount" value="${piReq.application_fee_amount}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">on_behalf_of</label>
                                                            <div class="col-sm-7">
                                                                <input name="on_behalf_of" class="form-control" id="onBehalfOf" value="${piReq.on_behalf_of}" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-5 control-label">transfer_group</label>
                                                            <div class="col-sm-7">
                                                                <input name="transfer_group" class="form-control" id="transferGroup" value="${piReq.transfer_group}" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group last-row">
                                                            <label class="col-sm-5 control-label">transfer_data[dest]</label>
                                                            <div class="col-sm-7">
                                                                <input name="transfer_data[destination]" class="form-control" id="transfer_data_destination" value="${piReq.transfer_data.get('destination')}" />
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
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab">
                                <h5>Create PaymentIntent Response</h5>
                                <pre id="piResponse"></pre>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <button class="btn btn-primary-stripe-blue" id="pi-create-btn">Create a Payment Intent</button>
                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Create PI-->

                <!-- CLIENT SIDE PANEL -->
                <div class="row" id="client-params" style="display: none;">
                    <div class="panel panel-main panel-client" id="client-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-green">CLIENT</span>
                            <h3 class="panel-title"><span class="label label-default api-method">JS</span>handleCardPayment()</h3>
                        </div>
                        <!-- client params -->
                        <div class="panel-body form-horizontal">
                            <form id="card-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <!-- card details -->
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Card details</label>
                                            <div class="col-sm-8" id="stripe-card"></div>
                                            <div class="col-sm-8" id="bank-element"></div>
                                            <div class="col-sm-8 col-sm-offset-4" id="card-errors"></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"></label>
                                            <div class="col-sm-8">
                                                <label class="fancy-checkbox custom-bgcolor-stripe">
                                                    <input type="checkbox" id="saveToCustomer" name="save_payment_method" >
                                                    <span>&nbsp; save_payment_method</span>
                                                </label>
                                            </div>
                                        </div>
                                        <!-- Select saved card -->
                                        <div class="form-group" id="saved-card" style="display: none;">
                                            <label class="col-sm-4 control-label">Select saved card</label>
                                            <div class="col-sm-8">
                                                <table id="pm-table">
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
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
                                        </div>
                                        <br>
                                        <div class="project-accordion panel-second">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="#collapse-shipping" data-toggle="collapse" data-parent="#accordion" class="collapsed">
                                                        <span class="milestone-title"> shipping </span>
                                                        <i class="fa fa-plus-circle toggle-icon"></i>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse-shipping" class="panel-collapse collapse">
                                                <div class="panel-body" style="padding-top:10px;padding-bottom: 10px;">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">name</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control" id="shp-name" name="shipping.name" type="text" value=""/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">phone</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control" id="shp-phone" name="shipping.email" type="text" value=""/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-5 control-label">tracking_number</label>
                                                                <div class="col-sm-7">
                                                                    <input class="form-control" id="shp-tracking-number" name="shipping.tracking_number" type="text" value=""/>
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
                                                                                    <input class="form-control" id="shp-addr-line1" name="shipping.address.line1" type="text" value=""/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">line2</label>
                                                                                <div class="col-sm-7">
                                                                                    <input class="form-control" id="shp-addr-line2" name="shipping.address.line2" type="text" value=""/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">city</label>
                                                                                <div class="col-sm-7">
                                                                                    <input class="form-control" id="shp-addr-city" name="shipping.address.city" type="text" value=""/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">state</label>
                                                                                <div class="col-sm-7">
                                                                                    <input class="form-control" id="shp-addr-state" name="shipping.address.state" type="text" value=""/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="col-sm-5 control-label">postal_code</label>
                                                                                <div class="col-sm-7">
                                                                                    <input class="form-control" id="shp-addr-postcode" name="shipping.address.postal_code" type="text" value=""/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group last-row">
                                                                                <label class="col-sm-5 control-label">country</label>
                                                                                <div class="col-sm-7  dropdown-select">
                                                                                    <select name="shipping.address.country" id="shp-addr-country" class="form-control">
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
                                </div>
                            </form>
                        </div>

                        <div class="panel-footer">
                            <button id="pi-button" class="btn btn-primary-stripe-blue" data-toggle=""><span>submit payment</span></button>
                            <div class="alert alert-success payment-method" style="margin-bottom: 0; padding: 5px 10px 5px 15px; float: right; display: none;">
                                payment_intent_id: <a href="#" class="pm-id" id="pm-id"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END CLIENT SIDE PANEL -->

                <!-- SERVER SIDE PANEL - Confirm PI -->
                <div class="row" id="confirm-params" style="display: none;">
                    <div class="panel panel-main panel-server panel-tab" id="confirm-pi-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server">
                                <h3 class="panel-title">
                                    <span class="label label-success api-method">POST</span>
                                </h3>
                            </a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-conf" class="active"><a href="#reqTab-conf" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-conf"><a href="#resTab-conf" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-conf">
                                <div class="form-horizontal" >
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <form id="piConfForm">
                                            <!-- HIDDEN PARAMS -->
                                            <input type="hidden" name="accountName" value=""/>
                                            <!-- END HIDDEN PARAMS -->
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">off_session</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="off_session" id="offSession" class="form-control">
                                                            <option value="" label="----"/>
                                                            <option value="recurring" label="recurring"/>
                                                            <option value="one_off" label="one_off"/>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">save_payment_method</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="save_payment_method" id="savePM" class="form-control">
                                                            <option value="" label="----"/>
                                                            <option value="true" label="true"/>
                                                            <option value="false" label="false"/>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->
                                </div>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-conf">
                                <h5>Confirm PaymentIntent Response</h5>
                                <pre id="piConfResponse"></pre>
                            </div>


                        </div>
                        <div class="panel-footer">
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="pi-confirm-btn">Confirm a Payment Intent</button>
                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Confirm PI -->

                <!-- SERVER SIDE PANEL - Capture PI -->
                <div class="row" id="capture-params" style="display: none;">
                    <div class="panel panel-main panel-server panel-tab" id="capture-pi-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span></h3></a>
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
                                        <form id="piCapForm">
                                            <!-- HIDDEN PARAMS -->
                                            <input type="hidden" name="accountName" value=""/>
                                            <!-- END HIDDEN PARAMS -->
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">amount_to_capture</label>
                                                    <div class="col-sm-7">
                                                        <input name="amount_to_capture" class="form-control" id="amountToCapture"  />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">application_fee_amount</label>
                                                    <div class="col-sm-7">
                                                        <input name="application_fee_amount" class="form-control" id="appFeeAmt"  />
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->

                                </div>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-cap">
                                <h5>Capture PaymentIntent Response</h5>
                                <pre id="piCapResponse"></pre>
                            </div>


                        </div>
                        <div class="panel-footer">
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="pi-capture-btn">Capture a Payment Intent</button>
                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Capture PI -->

                <!-- CLIENT SIDE - HANDLE ACTION -->
                <div class="row" id="client-action" style="display: none;">
                    <div class="panel panel-main panel-client" id="client-action-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-green">CLIENT</span>
                            <h3 class="panel-title"><span class="label label-default api-method">JS</span>handleCardAction()</h3>
                        </div>
                        <!-- client params -->
                        <div class="panel-body form-horizontal">

                            <div class="form-group last-row">
                                <label class="col-sm-2 control-label">client_secret</label>
                                <div class="col-sm-6">
                                    <input class="form-control" id="client-secret" name="client_secret" type="text" value=""/>
                                </div>
                                <div class="col-sm-4">
                                    <button id="action-button" class="btn btn-primary-stripe-blue" style="float: right"><span>Submit Card Action</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SERVER SIDE PANEL - Webhook-->
                <div class="row" id="webhook" style="display: none;">
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
    <!-- END MAIN -->
</div>

<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/scripts/serializeToJSON.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.serializeJSON.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.cookie.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.blockUI.js"/>"></script>

<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>

<script>
    $(function(){

        var user = $.cookie("user");
        console.log(user);

        var stripe;

        // toggle nav active
        $('#navPayment').toggleClass('active');
        $('#navPi').toggleClass('active');
        $('#navCreatePiAuto').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function() {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        // drop down
        $('fieldset [data-toggle="collapse"]').on('click', function() {
            $(this).find('.toggle-icon').toggleClass('fa-caret-up fa-caret-down ');
        });

        // set metadata
        $('#collapse1').on('focusout', "input[id*='-metadatakey-']", function () {

            var key = $(this).val();
            var id = $(this).attr('id');
            $('#'+id+'-value').attr('name', 'metadata['+key+']');
        });

        // add more metadata
        var md_num = 1;
        $('#add-md').on('click', function () {
            var prefix = 'pi-md-';
            addMetaData(prefix, md_num);
            md_num++;
        });

        /**
         * Select a Stripe account to make API calls
         */
        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $( "input[name='accountName']").val(accountName);
            if (accountName !== ""){
                $.ajax({
                    type : "GET",
                    url : "getAccount",
                    data: "acctName="+accountName,
                    success: function(result){
                        stripe = Stripe(result.accountPublishKey);
                    }
                });
            }
        });

        /**
         * Create a PaymentIntent
         */
        $('#pi-create-btn').on('click', function () {
            blockElement('#create-pi-panel');
            $('#toast-container').remove();

            var data = $('#piForm').serializeToJSON();
            //console.log(data);

            $.ajax({
                type : "POST",
                url : "payment-intent",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function(response){
                    //console.log(response.apiResponse);

                    $('#piResponse').html(response.apiResponse);
                    handleActions(response, '#pi-create-btn');

                    let responseObj = JSON.parse(response.apiResponse);
                    $('#pi-create-btn').after('<div class="alert alert-success alert-action" style="margin-right: 20px;"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;payment_intent_id: <b>' + responseObj.id + '</b> </span></li></div>');

                    /*if (response.code !== 'ERROR'){
                        // Show client parameters panel and render Stripe elements
                        renderStripeElements();
                        $('#client-params').show();
                    }*/
                },

                complete: function (response, status) {
                    unBlockElement('#create-pi-panel');
                    //console.log(status);
                    if (status === 'success'){
                        // show customer saved payment methods
                        var customerId = $('#customer').val();
                        if (customerId !== ''){
                            $.ajax({
                                type: "POST",
                                url: "customer/"+customerId+"/payment-method",
                                data: data.accountName,
                                dataType: "json",
                                contentType: "application/json",

                                success: function(response){
                                    var pmList = response.apiResponse.data;
                                    //console.log(pmList);
                                    if (pmList.length > 0){
                                        $('#saved-card').show();
                                    }

                                    pmList.forEach(function (pm, index) {
                                        var id = pm.id;
                                        var brand = pm.card.brand;
                                        var img_source;
                                        switch (brand) {
                                            case 'visa':
                                                img_source = '/resources/img/visa.svg';
                                                break;
                                            case 'mastercard':
                                                img_source = '/resources/img/mastercard.svg';
                                                break;
                                            case 'amex':
                                                img_source = '/resources/img/amex.svg';
                                                break;

                                        }
                                        var last4 = pm.card.last4;
                                        var exp_month = pm.card.exp_month;
                                        var exp_year = pm.card.exp_year;

                                        $('#pm-table').append('<tr><td><label class="fancy-radio"><input type="radio" name="payment_method" value="'+id+'"><span><i></i></span></label></td><td><img src="'+img_source+'"></td><td>.... '+last4+' &nbsp;&nbsp;&nbsp; '+exp_month+' / '+exp_year+'</td></tr>');
                                    });
                                }
                            });
                        }
                        // start listening to webhook
                        //console.log(response.responseJSON.apiResponse);
                        var responseObj = JSON.parse(response.responseJSON.apiResponse);
                        var piId = responseObj.id;
                        receiveWebhook(piId);
                    }
                }
            });
        });

        /**
         * Render Stripe Elements
         * @param account
         */
        function renderStripeElements(){
            $('#card-element').remove();
            $('#stripe-card').append("<div id=\"card-element\"></div>");

            //var stripe = Stripe(account.accountPublishKey);
            //console.log(account.accountPublishKey)
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


            // submit payment intent on client side
            $('#pi-button').on('click', function () {

                blockElement('#client-panel');
                $('#toast-container').remove();

                var data = $('#card-form').serializeToJSON();
                //console.log(data);
                var client_secret = $(this).data('toggle');
                //console.log(data.payment_method);

                if (data.payment_method !== '' && data.payment_method !== null && typeof data.payment_method !== 'undefined'){
                    stripe.handleCardPayment(client_secret, data).then(function(result) {
                        handleResult(result);
                    });
                } else {
                    stripe.handleCardPayment(client_secret, cardElement, data).then(function(result) {
                        handleResult(result);
                    });
                }
            });

            // handle card payment results
            function handleResult(result){
                //console.log(result);
                //$('.pi-btn-spinner').remove();
                unBlockElement('#client-panel');
                if (result.error){
                    //$('#pi-button').prop('disabled', false);
                    showErrorMsg(result.error.code, result.error.message);
                } else {
                    var pi = result.paymentIntent;
                    var status = pi.status;
                    switch (status) {
                        case 'succeeded':
                            $('#pi-button').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Payment completes: payment_intent_id: <b>' + pi.id + '</b> </span></li></div>');
                            break;
                        case 'requires_confirmation':
                            $('#pi-button').after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_CONFIRMATION</b> </span></li></div>');
                            $('#pi-confirm-btn').attr('data-toggle', pi.id);

                            var isShow = $('#confirm-params').css('display');
                            if (isShow === 'none'){
                                $('#confirm-params').find($('.api-method')).after('/v1/payment_intents/' + pi.id + '/confirm');
                                $('#confirm-params').show();
                            } else {
                                $('#pi-confirm-btn').prop('disabled', false);
                                $('#pi-confirm-btn').parent().find($('.alert-action')).remove();
                            }

                            $('html, body').animate({scrollTop: $('#confirm-params').offset().top}, 500);
                            break;
                        case 'requires_capture':
                            $('#pi-button').after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_CAPTURE</b> </span></li></div>');
                            $('#pi-capture-btn').attr('data-toggle', pi.id);
                            $('#capture-params').find($('.api-method')).after('/v1/payment_intents/' + pi.id + '/capture');
                            $('#capture-params').show();
                            $('html, body').animate({scrollTop: $('#capture-params').offset().top}, 500);
                            break;
                    }
                }
            }
        };

        /**
         * Confirm a PaymentIntent
         */
        $('#pi-confirm-btn').on('click', function () {

            blockElement('#confirm-pi-panel');
            $('#toast-container').remove();
            var data = $('#piConfForm').serializeToJSON();

            var id = $(this).data('toggle');
            //console.log(id);

            $.ajax({
                type: "POST",
                url: "payment-intent/"+id+"/confirm",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function (response) {

                    $('.pi-btn-spinner').remove();

                    //console.log(response);
                    $('#piConfResponse').html(response.apiResponse);
                    handleActions(response, '#pi-confirm-btn');

                },

                complete: function () {
                    unBlockElement('#confirm-pi-panel');
                }
            });
        })

        /**
         * Capture a PaymentIntent
         */
        $('#pi-capture-btn').on('click', function () {

            blockElement('#capture-pi-panel');
            $('#toast-container').remove();
            var data = $('#piCapForm').serializeToJSON();

            var id = $(this).data('toggle');
            //console.log(id);

            $.ajax({
                type: "POST",
                url: "payment-intent/"+id+"/capture",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function (response) {

                    $('.pi-btn-spinner').remove();
                    //console.log(response);
                    $('#piCapResponse').html(response.apiResponse);
                    handleActions(response, '#pi-capture-btn');
                },
                complete: function () {
                    unBlockElement('#capture-pi-panel');
                }
            });
        });

        /**
         * Client side action
         */
        $('#action-button').on('click', function () {

            blockElement('#client-action-panel');
            $('#toast-container').remove();

            var clientSecret = $('#client-secret').val();
            stripe.handleCardAction(clientSecret)
                .then(function(result) {
                    //console.log(result);
                    unBlockElement('#client-action-panel');

                    if (result.error){
                        showErrorMsg(result.error.code, result.error.message);
                    } else {
                        var pi = result.paymentIntent;
                        var status = pi.status;
                        switch (status) {
                            case 'requires_confirmation':
                                $('#pi-confirm-btn').attr('data-toggle', pi.id);
                                $('#confirm-params').insertAfter($('#client-action'));

                                var isShow = $('#confirm-params').css('display');
                                if (isShow === 'none'){
                                    $('#confirm-params').find($('.api-method')).after('/v1/payment_intents/' + pi.id + '/confirm');
                                    $('#confirm-params').show();
                                } else {
                                    $('#pi-confirm-btn').prop('disabled', false);
                                    $('#pi-confirm-btn').parent().find($('.alert-action')).remove();
                                }

                                $('html, body').animate({scrollTop: $('#confirm-params').offset().top}, 500);
                                break;
                            case 'requires_capture':
                                $('#capture-params').find($('.api-method')).after('/v1/payment_intents/' + pi.id + '/capture');
                                $('#capture-params').show();
                                $('html, body').animate({scrollTop: $('#capture-params').offset().top}, 500);
                                break;
                        }
                    }
                });
        })

        /**
         * Set PaymentIntent actions
         * @param response
         * @param selector
         */
        function handleActions(response, selector) {
            var responseObj = JSON.parse(response.apiResponse);
            var id = responseObj.id;
            switch (response.code){
                case 'SUCCESS':
                    $(selector).after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Payment completes: payment_intent_id: <b>' + id + '</b> </span></li></div>');
                    break;

                case 'SUCCESS_PROCESSING':
                    // TODO: handle processing status
                    break;

                case 'SUCCESS_CANCELED':
                    // TODO: handle cancle status
                    break;

                case 'ERROR':
                    showErrorMsg(responseObj.code, responseObj.message);
                    $(selector).prop('disabled', false);
                    break;

                case 'REQUIRE_ACTION':
                    var action = response.action;
                    switch (action.code){
                        case 'REDIRECT_TO_URL':
                            //$('#redirect').attr('href', action.body);
                            //$('#pi-redirect').show();
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;<b>REDIRECT_TO_URL: </b><a href="' + action.body + '" target="_blank">STRIPE_3DS_PAGE</a> </span></li></div>');
                            break;

                        case 'USE_STRIPE_SDK':
                            $('#client-secret').val(action.body);
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>USE_STRIPE_SDK</b> </span></li></div>');
                            $('#client-action').insertAfter($(selector).parent().parent().parent());
                            $('#client-action').show();
                            $('html, body').animate({scrollTop: $('#client-action').offset().top}, 500);
                            break;

                        case 'REQUIRES_PAYMENT_METHOD':
                            //$(selector).prop('disabled', false);
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_PAYMENT_METHOD</b> </span></li></div>');
                            $('#pi-button').attr('data-toggle', responseObj.client_secret);
                            renderStripeElements();
                            $('#client-params').show();
                            $('html, body').animate({scrollTop: $('#client-params').offset().top}, 500);
                            break;

                        case 'REQUIRES_CONFIRMATION':
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_CONFIRMATION</b> </span></li></div>');
                            $('#pi-confirm-btn').attr('data-toggle', responseObj.id);
                            $('#confirm-params').find($('.api-method')).after('/v1/payment_intents/' + responseObj.id + '/confirm');
                            $('#confirm-params').show();
                            $('html, body').animate({scrollTop: $('#confirm-params').offset().top}, 500);
                            break;

                        case 'REQUIRES_CAPTURE':
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_CAPTURE</b> </span></li></div>');
                            $('#pi-capture-btn').attr('data-toggle', responseObj.id);
                            $('#capture-params').find($('.api-method')).after('/v1/payment_intents/' + responseObj.id + '/capture');
                            $('#capture-params').show();
                            $('html, body').animate({scrollTop: $('#capture-params').offset().top}, 500);
                            break;
                    }
                    break;
            }
        }

        /**
         * Receive webhook
         */
        function receiveWebhook(piId){
            var source = new EventSource("/payment-intent-auto/webhook");

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
    });

</script>

<style>
    /*.StripeElement{
        border: none;
        box-shadow: none;
        -webkit-box-shadow: none;
    }*/

    td {
        padding-right: 5px;
    }
    td .fancy-radio {
        margin-bottom: 0;
        padding-top: 2px;
    }
    tr {
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }
    tr img {
        width: 28px;
    }
</style>
</body>
</html>