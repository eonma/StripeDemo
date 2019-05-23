<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-02-11
  Time: 14:38
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
                        <h1 class="page-title-st">PaymentIntent</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="/"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="/payments">Payments</a></li>
                        <li class="active">PaymentIntent</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <div class="row">
                    <!-- REQUEST PANEL -->
                    <div class="panel panel-main panel-tab">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER SIDE</span>
                            <h3 class="panel-title">Create a PaymentIntent - server side</h3>

                            <select id="stripe-account" class="panel-title right acct-sel" style="position: absolute;left: 70%;">
                                <option value="" label="Select account"/>
                                <c:forEach items="${viewObj.allAccounts.accountPropertiesList}" var="account">
                                    <option value="${account.accountName}" label="Account - ${account.accountName}"/>
                                </c:forEach>
                            </select>

                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq" class="active"><a href="#reqTab" data-toggle="tab"></i> REQUEST </a></li>
                                <li id="tabRes"><a href="#resTab" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <div class="tab-content no-padding">
                                <!-- REQUEST TAB -->
                                <div class="tab-pane fade in active" id="reqTab">
                                    <form:form class="form-horizontal" id="piForm" method="post" action="paymentintent" modelAttribute="piReq">
                                        <!-- BASIC PARAMETERS -->
                                        <div class="row">
                                            <div class="project-info">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label"><b>amount</b></label>
                                                        <div class="col-sm-7">
                                                            <form:input path="amount" class="form-control" id="amount" value="${piReq.amount}" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label"><b>currency</b></label>
                                                        <div class="col-sm-7 dropdown-select">
                                                            <form:select path="currency" id="currency" class="form-control" itemValue="${piReq.currency}">
                                                                <form:option value="gbp" label="gbp"/>
                                                                <form:option value="usd" label="usd"/>
                                                                <form:option value="eur" label="eur"/>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label">confirm</label>
                                                        <div class="col-sm-7 dropdown-select">
                                                            <form:select path="confirm" id="confirm" class="form-control" itemValue="${piReq.confirm}">
                                                                <form:option value="true"/>
                                                                <form:option value="false"/>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label"><b>payment_method_types</b></label>
                                                        <div class="col-sm-7 dropdown-select">
                                                            <form:select path="payment_method_types" id="paymentMethodTypes" class="form-control" itemValue="${piReq.payment_method_types}">
                                                                <form:option value="card" label="card"/>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label">capture_method</label>
                                                        <div class="col-sm-7 dropdown-select">
                                                            <form:select path="capture_method" id="captureMethod" class="form-control" itemValue="${piReq.capture_method}">
                                                                <form:option value="automatic"/>
                                                                <form:option value="manual" />
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label">confirmation_method</label>
                                                        <div class="col-sm-7 dropdown-select">
                                                            <form:select path="confirmation_method" id="confirmationMethod" class="form-control" itemValue="${piReq.capture_method}">
                                                                <form:option value="automatic" />
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label">payment_method</label>
                                                        <div class="col-sm-7">
                                                            <form:input path="payment_method" class="form-control" id="paymentMethod" value="${piReq.payment_method}"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label">customer</label>
                                                        <div class="col-sm-7">
                                                            <form:input path="customer" class="form-control" id="customer" value="${piReq.customer}"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-5 control-label">save_payment_method</label>
                                                        <div class="col-sm-7 dropdown-select">
                                                            <form:select path="save_payment_method" id="savePaymentMethod" class="form-control" itemValue="${piReq.save_payment_method}">
                                                                <form:option value="" label="----" />
                                                                <form:option value="true" />
                                                                <form:option value="false"  />
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END BASIC PARAMETERS -->

                                        <div class="row">
                                            <!-- OPTIONAL PARAMS -->
                                            <div class="col-md-4">
                                                <div class="project-info">
                                                    <div class="panel-group project-accordion">
                                                        <div class="panel panel-second project-milestone">
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
                                                                            <form:input path="description" class="form-control" id="description" value="${piReq.description}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">receipt_email</label>
                                                                        <div class="col-sm-6">
                                                                            <form:input path="receipt_email" class="form-control" id="receiptEmail" value="${piReq.receipt_email}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">statement_descriptor</label>
                                                                        <div class="col-sm-6">
                                                                            <form:input path="statement_descriptor" class="form-control" id="statementDescriptor" value="${piReq.statement_descriptor}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">return_url</label>
                                                                        <div class="col-sm-6">
                                                                            <form:input path="return_url" class="form-control" id="allowedSourceTypes" value="${piReq.return_url}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">metadata[0]</label>
                                                                        <div class="col-sm-6">
                                                                            <form:input path="metadata[0]" class="form-control" id="metadata0" placeholder="key=value" value="${piReq.metadata[0]}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">metadata[1]</label>
                                                                        <div class="col-sm-6">
                                                                            <form:input path="metadata[1]" class="form-control" id="metadata1" placeholder="key=value" value="${piReq.metadata[1]}"/>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- END CONNECT PARAMS -->
                                            </div>
                                            <!-- END OPTIONAL PARAMS -->

                                            <!-- SHIPPING PARAMS -->
                                            <div class="col-md-4">
                                                <div class="project-info">
                                                    <div class="panel-group project-accordion">
                                                        <div class="panel panel-second project-milestone">
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
                                                                            <form:input path="shipping.name" class="form-control" id="shippingName" value="${piReq.shipping.name}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label"><b>address.line1</b></label>
                                                                        <div class="col-sm-7">
                                                                            <form:input path="shipping.address.line1" class="form-control" id="line1" value="${piReq.shipping.address.line1}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">address.line2</label>
                                                                        <div class="col-sm-7">
                                                                            <form:input path="shipping.address.line2" class="form-control" id="line2" value="${piReq.shipping.address.line2}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">address.city</label>
                                                                        <div class="col-sm-7">
                                                                            <form:input path="shipping.address.city" class="form-control" id="city" value="${piReq.shipping.address.city}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">address.state</label>
                                                                        <div class="col-sm-7">
                                                                            <form:input path="shipping.address.state" class="form-control" id="state" value="${piReq.shipping.address.state}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">address.postal_code</label>
                                                                        <div class="col-sm-7">
                                                                            <form:input path="shipping.address.postal_code" class="form-control" id="postcode" value="${piReq.shipping.address.postal_code}"/>
                                                                        </div>
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
                                                    <div class="panel-group project-accordion">
                                                        <div class="panel panel-second project-milestone">
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
                                                                            <form:input path="application_fee_amount" class="form-control" id="applicationFeeAmount" value="${piReq.application_fee_amount}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">on_behalf_of</label>
                                                                        <div class="col-sm-6">
                                                                            <form:input path="on_behalf_of" class="form-control" id="onBehalfOf" value="${piReq.on_behalf_of}" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">transfer_group</label>
                                                                        <div class="col-sm-6">
                                                                            <form:input path="transfer_group" class="form-control" id="transferGroup" value="${piReq.transfer_group}" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-6 control-label">transfer_data[dest]</label>
                                                                        <div class="col-sm-6">
                                                                            <form:input path="transfer_data['destination']" class="form-control" id="transfer_data_destination" value="${piReq.transfer_data.get('destination')}" />
                                                                        </div>
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

                                        <!-- SUBMIT -->
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-8">
                                                <button type="submit" class="btn btn-primary-stripe-blue">Submit Request</button>
                                            </div>
                                        </div>
                                        <!-- END SUBMIT -->
                                    </form:form>
                                </div>

                                <!-- RESPONSE TAB -->
                                <div class="tab-pane fade" id="resTab">
                                    <h5>Create PaymentIntent Response</h5>
                                    <pre>${viewObj.response.toJson()}</pre>
                                </div>
                                <!-- END RESPONSE TAB -->
                            </div>
                        </div>
                    </div>
                    <!-- END REQUEST PANEL -->
                </div>

                <!-- PI CLIENT PANEL -->
                <c:if test="${viewObj.hasResponse && !viewObj.hasError}">
                    <div class="row">
                        <div class="panel panel-main pi-client panel-client" id="piClient">
                            <div class="panel-heading">
                                <span class="client-server stripe-green">CLIENT SIDE</span>
                                <h3 class="panel-title">PaymentIntent created - "<a href="#" id="${viewObj.response.id}" class="pi-id">${viewObj.response.id}</a>"</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-6 col-md-offset-2 card-form">
                                    <div class="form-horizontal">
                                        <!-- Select saved card -->
                                        <c:if test="${not empty pmRes}">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">Select saved card</label>
                                                <div class="col-sm-8">
                                                    <c:forEach items="${pmRes.card}" var="card">
                                                        <label class="fancy-radio">
                                                            <input type="radio" value="${card.id}" name="card">
                                                            <span>
                                                            <i></i>&nbsp;
                                                            <c:choose>
                                                                <c:when test="${card.brand == 'Visa'}">
                                                                    <img style="width: 28px;" src="/resources/img/visa.svg">
                                                                </c:when>
                                                                <c:when test="${card.brand == 'MasterCard'}">
                                                                    <img style="width: 28px;" src="/resources/img/mastercard.svg">
                                                                </c:when>
                                                                <c:when test="${card.brand == 'American Express'}">
                                                                    <img style="width: 28px;" src="/resources/img/amex.svg">
                                                                </c:when>
                                                            </c:choose>
                                                                &nbsp;&nbsp;&nbsp;
                                                            .... ${card.last4} &nbsp;&nbsp;&nbsp;
                                                                    ${card.expMonth} / ${card.expYear}
                                                        </span>
                                                        </label>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="form-group">
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <div id="payment-request-button" class="payment-request-button" style=" border:0;padding:0;">
                                                <!-- A Stripe Element will be inserted here. -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Name</label>
                                            <div class="col-sm-8">
                                                <c:choose>
                                                    <c:when test="${viewObj.response.status == 'requires_confirmation'}">
                                                        <input class="form-control" id="cardholder-name" type="text" value="John" disabled="disabled"/>
                                                    </c:when>
                                                    <c:when test="${viewObj.response.status == 'requires_payment_method'}">
                                                        <input class="form-control" id="cardholder-name" type="text" />
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <c:if test="${viewObj.response.status == 'requires_confirmation'}">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">source</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" id="pi_source" type="text" value="${viewObj.response.source}" disabled="disabled"/>
                                                </div>
                                            </div>
                                        </c:if>

                                        <c:choose>
                                            <c:when test="${viewObj.response.status == 'requires_confirmation'}">

                                            </c:when>
                                            <c:when test="${viewObj.response.status == 'requires_payment_method'}">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">Card details</label>
                                                    <div class="col-sm-8">
                                                        <div id="card-element"></div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"></label>
                                                    <div class="col-sm-8">
                                                        <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" id="saveToCustomer"/> Save payment method
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                        </c:choose>

                                        <!-- Create a PaymentIntent-->
                                        <div class="form-group">
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <button id="card-button" class="btn btn-primary-stripe-blue" data-secret="${viewObj.response.clientSecret}" style="width: 100%"><span>Complete Payment</span></button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <button id="source-button" class="btn btn-primary-stripe-blue" style="width: 100%"><span>Create a Source</span></button>
                                                <div class="source-id-value"></div>
                                            </div>
                                        </div>
                                        <!-- Retrieve a PaymentIntent-->
                                        <div class="form-group pi-retrieve" style="display: none;">
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <button class="btn btn-primary-stripe-blue pi-retrieve-btn" style="width: 100%"><span>Retrieve ${viewObj.response.id}</span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 pi-response">
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <!-- END PI CLIENT PANEL -->

                <!-- PI DETAILS PANEL -->
                <div class="row retrieve-pi-row" style="display: none;">
                    <div class="panel panel-main pi-details" id="piDetails" style="border-top: 2px solid #556cd6">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER SIDE</span>
                            <h3 class="panel-title">Retrieve PaymentIntent - "${viewObj.response.id}" at server side</h3>
                        </div>
                        <div class="panel-body">
                            <pre class="pi-details-response"></pre>
                        </div>
                    </div>
                </div>
                <!-- END PI DETAILS PANEL -->
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
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script src="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.js"/>"></script>


<script>

    $(function(){
        // toggle nav active
        $('#navPayment').toggleClass('active');
        $('#navPi').toggleClass('active');
        $('#navCreatePi').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        // load account list to form
        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $('#account-name').val(accountName);
        });

        // if current account is returned from server, set the parameter
        if (${viewObj.currentAccount != null}){
            $('#account-name').val("${viewObj.currentAccount.accountName}");
        }

        // preselect account
        var accountName = "${viewObj.currentAccount.accountName}";
        $('#stripe-account option').each(function () {
            var name = $(this).val();
            if (name === accountName){
                $(this).attr("selected", "selected");
            }
        });

        // manage page loading
        if (${viewObj.hasError}){

            // display error message returned from server
            showErrorMsg("${viewObj.error.event}", "${viewObj.error.message}");
        } else if (${viewObj.hasResponse}) {

            // render elements
            renderStripeElements("${viewObj.response.clientSecret}","${viewObj.currentAccount.accountPublishKey}");

            //renderPaymentRequestButton("${viewObj.currentAccount.accountPublishKey}");
        }

        // retrieve a PaymentIntent from server
        $('.pi-retrieve-btn').on('click', function(){
            $.ajax({
                type : "POST",
                url : "retrieve-paymentintent",
                data : "pi=${viewObj.response.id}&acct=${viewObj.currentAccount.accountName}",
                dataType : "json",
                success: function(result){
                    console.log(result.body);
                    if (result.error){
                        showErrorMsg(result.body.code, "Request ID: " + result.body.requestId + " Message: " + result.body.message);
                    } else {
                        $('.retrieve-pi-row').show();
                        $('.pi-details-response').html(JSON.stringify(result.body, undefined, 2));
                    }
                }
            });

        });

        // Stripe elements
        function renderStripeElements(clientSecret, publishKey){
            /* do some toggles*/
            $('.pi-response').hide();

            var stripe = Stripe(publishKey, {
                betas: ['payment_intent_beta_3']
            });

            var elements = stripe.elements();

            var style = {
                base: {
                    color: '#424770',
                    fontSize: '14px',
                    '::placeholder': {
                        color: '#ccc',
                    },
                    fontSmoothing: 'antialiased',
                },
                invalid: {
                    color: '#e5424d',
                    ':focus': {
                        color: '#303238',
                    },
                },
            };

            /**
             * standard card details
             */
            var source = "${viewObj.response.source}";

            // mount card when source is not available
            if (source == ""){
                var cardElement = elements.create('card', {hidePostalCode:true, style:style});
                cardElement.mount('#card-element');
            }


            /**
             * customised card details
             */
            /*
            var cardNumber = elements.create('cardNumber', {placeholder:'123123123'});
            cardNumber.mount('#card-number');
            var cardExpire = elements.create('cardExpiry');
            cardExpire.mount('#card-expire');
            var cardCvc = elements.create('cardCvc');
            cardCvc.mount('#card-cvc');
            */

            $('#card-button').on('click', function(){

                // disable button
                $('#card-button').append("<i class=\"fa fa-spinner fa-spin card-btn-spinner\"></i>");
                $('#card-button').prop('disabled', true);


                var cardholderName = $('#cardholder-name').val();
                var saveToCustomer = $('#saveToCustomer').prop('checked');
                var sourceId = $("input[name='card']:checked").val();
                console.log(sourceId);

                if (source != ""){
                    stripe.handleCardPayment(
                        clientSecret, {
                            source : source
                        }
                    ).then(function (result) {
                        handleResult(result);
                    });
                } else if (typeof sourceId != 'undefined' && sourceId != ""){
                    stripe.handleCardPayment(
                        clientSecret, {
                            source : sourceId
                        }
                    ).then(function (result) {
                        handleResult(result);
                    });
                } else {
                    stripe.handleCardPayment(
                        clientSecret, cardElement, {
                            payment_method_data: {
                                billing_details: {
                                    name: 'Jenny Rosen',
                                    address: {
                                      line1: '123 High Street',
                                      city: 'London',
                                      postal_code: 'N1 1AB',
                                      country: 'GB'
                                    },
                                }
                            },
                            save_payment_method : saveToCustomer
                        }
                    ).then(function (result) {
                        handleResult(result);
                    });
                };

            });

            $('#source-button').on('click', function(){
                stripe.createSource(cardElement, {
                    type: 'card',
                    owner: {
                        name: 'John Smith',
                    }
                }).then(function(result) {
                    console.log(result.source);
                    $('.source-id-value').html(result.source.id);
                });

            });

            // retrieve payment intent details
            $('.pi-id').on('click', function()
            {
                retrieveDetails("https://api.stripe.com/v1/payment_intents/" + $(this).get(0).id, "${viewObj.currentAccount.accountSecretKey}");
            });
        }
        function handleResult(result){
            // keep card form on the left
            var hasResponse = $('.pi-response:visible').length;
            if (hasResponse===0){
                $('.card-form').toggleClass('col-md-offset-2', 500);
            }

            // remove pi-response-log
            $('.pi-response').find('.alert').remove();

            if (result.error) {
                // Display error.message in your UI.
                $('.pi-response').append("<div class=\"alert alert-danger\"><i class=\"fa fa-times-circle\"></i> Error!</div>");
                $('.pi-response').find('.alert').append("<pre class=\"pi-response-log\"></pre>");
                $('.pi-response-log').text(JSON.stringify(result.error, null, 3));
                $('.pi-response').show(500);
                $('#card-button').find('.card-btn-spinner').remove();
                $('#card-button').prop('disabled', false);
            } else {
                $('.pi-response').append("<div class=\"alert alert-success\"><i class=\"fa fa-check-circle\"></i> PaymentIntent completed!</div>");
                $('.pi-response').find('.alert').append("<pre class=\"pi-response-log\"></pre>");
                $('.pi-response-log').text(JSON.stringify(result.paymentIntent, null, 3));
                $('.pi-response').show(500);
                $('#card-button').find('.card-btn-spinner').remove();
                $("input[name='card']").prop('disabled', true);
                //$('#card-button').prop('disabled', false);
                $('.pi-retrieve').show();
            }
        }
    });
</script>


</body>
</html>


