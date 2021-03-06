<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-16
  Time: 09:14
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
    <jsp:include page='../../src/main/webapp/WEB-INF/views/navbar.jsp'/>
    <!-- END NAVBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Source</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#">Source</a></li>
                        <li class="active">Create a source</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->

                <div class="row">
                    <div class="panel source-client">
                        <div class="panel-heading">
                            <h3 class="panel-title">Create a source - client side</h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-md-6 card-form">
                                <div class="form-horizontal">

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Card details</label>
                                        <div class="col-sm-8">
                                            <div id="card-element"></div>
                                        </div>
                                    </div>

                                    <!-- Create a PaymentIntent-->
                                    <div class="form-group">
                                        <div class="col-sm-8 col-sm-offset-4">
                                            <button id="card-button" class="btn btn-primary-stripe-blue" data-secret="${pi.clientSecret}" style="width: 100%"><span>Complete Payment</span></button>
                                        </div>
                                    </div>
                                    <!-- Retrieve a PaymentIntent-->
                                    <div class="form-group pi-retrieve" style="display: none;">
                                        <div class="col-sm-8 col-sm-offset-4">
                                            <button class="btn btn-primary-stripe-blue pi-retrieve-btn" style="width: 100%"><span>Retrieve ${pi.id}</span></button>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="col-md-6 pi-response">
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <!-- REQUEST PANEL -->
                    <div class="panel panel-tab">
                        <div class="panel-heading">
                            <h3 class="panel-title">Create a source - client side</h3>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq" class="active"><a href="#reqTab" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes"><a href="#resTab" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <div class="tab-content no-padding">
                                <!-- REQUEST TAB -->
                                <div class="tab-pane fade in active" id="reqTab">
                                    <form:form class="form-horizontal" id="piForm" method="post" action="create-paymentintent" modelAttribute="piReq">
                                        <div class="project-info">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-6 control-label"><b>amount</b></label>
                                                        <div class="col-sm-6">
                                                            <form:input path="amount" class="form-control" id="amount" value="${piReq.amount}" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-6 control-label"><b>currency</b></label>
                                                        <div class="col-sm-6">
                                                            <form:select path="currency" id="currency" class="form-control" itemValue="${piReq.currency}">
                                                                <form:option value="gbp" label="gbp"/>
                                                                <form:option value="usd" label="usd"/>
                                                                <form:option value="eur" label="eur"/>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-6 control-label"><b>allowed_source_type</b></label>
                                                        <div class="col-sm-6">
                                                            <form:select path="allowed_source_types" id="allowedSourceTypes" class="form-control" itemValue="${piReq.allowed_source_types}">
                                                                <form:option value="card" label="card"/>
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-6 control-label">capture_method</label>
                                                        <div class="col-sm-6">
                                                            <form:select path="capture_method" id="captureMethod" class="form-control" itemValue="${piReq.capture_method}">
                                                                <form:option value="" label="----"/>
                                                                <form:option value="automatic"/>
                                                                <form:option value="manual" />
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="col-sm-4 control-label">customer</label>
                                                        <div class="col-sm-8">
                                                            <form:input path="customer" class="form-control" id="customer" value="${piReq.customer}"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 control-label">source</label>
                                                        <div class="col-sm-8">
                                                            <form:input path="source" class="form-control" id="source" value="${piReq.source}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- CONNECT PARAMS -->
                                        <c:if test="${pageElement.connect}">
                                            <div class="project-info connect">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">application_fee_amount</label>
                                                            <div class="col-sm-8">
                                                                <form:input path="application_fee_amount" class="form-control" id="applicationFeeAmount" value="${piReq.application_fee_amount}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">on_behalf_of</label>
                                                            <div class="col-sm-8">
                                                                <form:input path="on_behalf_of" class="form-control" id="onBehalfOf" value="${piReq.on_behalf_of}" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">transfer_group</label>
                                                            <div class="col-sm-8">
                                                                <form:input path="transfer_group" class="form-control" id="transferGroup" value="${piReq.transfer_group}" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">transfer_data[destination]</label>
                                                            <div class="col-sm-8">
                                                                <form:input path="transfer_data['destination']" class="form-control" id="transfer_data_destination" value="${piReq.transfer_data.get('destination')}" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <!-- END CONNECT PARAMS -->

                                        <!-- OPTIONAL PARAMS -->
                                        <div class="project-info">
                                            <div class="panel-group project-accordion">
                                                <div class="panel project-milestone">
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
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">description</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="description" class="form-control" id="description" value="${piReq.description}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">receipt_email</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="receipt_email" class="form-control" id="receiptEmail" value="${piReq.receipt_email}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">statement_descriptor</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="statement_descriptor" class="form-control" id="statementDescriptor" value="${piReq.statement_descriptor}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">return_url</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="return_url" class="form-control" id="allowedSourceTypes" value="${piReq.return_url}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">metadata[0]</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="metadata[0]" class="form-control" id="metadata0" placeholder="key=value" value="${piReq.metadata[0]}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">metadata[1]</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="metadata[1]" class="form-control" id="metadata1" placeholder="key=value" value="${piReq.metadata[1]}"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">save_source_to_customer</label>
                                                                        <div class="col-sm-8">
                                                                            <form:select path="save_source_to_customer" id="saveSourceToCustomer" class="form-control" itemValue="${piReq.save_source_to_customer}">
                                                                                <form:option value="" label="----" />
                                                                                <form:option value="true" />
                                                                                <form:option value="false"  />
                                                                            </form:select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">shipping parameters</label>

                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label"><b>name</b></label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="shipping.name" class="form-control" id="shippingName" value="${piReq.shipping.name}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label"><b>address.line1</b></label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="shipping.address.line1" class="form-control" id="line1" value="${piReq.shipping.address.line1}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">address.line2</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="shipping.address.line2" class="form-control" id="line2" value="${piReq.shipping.address.line2}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">address.city</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="shipping.address.city" class="form-control" id="city" value="${piReq.shipping.address.city}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">address.state</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="shipping.address.state" class="form-control" id="state" value="${piReq.shipping.address.state}"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">address.postal_code</label>
                                                                        <div class="col-sm-8">
                                                                            <form:input path="shipping.address.postal_code" class="form-control" id="postcode" value="${piReq.shipping.address.postal_code}"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END CONNECT PARAMS -->

                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-8">
                                                <button type="submit" class="btn btn-primary-stripe-blue">Submit Request</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                                <!-- END RESPONSE TAB -->
                                <!-- RESPONSE TAB -->
                                <div class="tab-pane fade" id="resTab">
                                    <h5>Create Payment Intent Response</h5>
                                    <pre>
                                        ${pi.toJson()}
                                    </pre>
                                </div>
                                <!-- END RESPONSE TAB -->
                            </div>
                        </div>
                    </div>
                    <!-- END REQUEST PANEL -->
                </div>



                <!-- PI DETAILS PANEL -->

                <div class="row retrieve-pi-row" style="display: none;">
                    <div class="panel pi-details" id="piDetails">
                        <div class="panel-heading">
                            <h3 class="panel-title">Retrieve PaymentIntent - "${pi.id}" at server side</h3>
                        </div>
                        <div class="panel-body">
                            <pre class="pi-details-response"></pre>
                        </div>
                    </div>
                </div>
                <!-- END PI DETAILS PANEL -->
            </div>
        </div>
        <!-- END MAIN CONTENT -->

        <!-- RIGHT SIDEBAR -->
        <jsp:include page='sidebar.jsp'/>
        <!-- END RIGHT SIDEBAR -->
    </div>
    <!-- END MAIN -->
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="https://js.stripe.com/v3/"></script>
<script>

    $(function()
    {
        // toggle nav active
        $('#navPayment').toggleClass('active');
        $('#navPi').toggleClass('active');
        $('#navCreatePi').toggleClass('active');

        // remove [] from allow_source_type
        //var allowedSourceType = $('#allowedSourceTypes').val();
        //$('#allowedSourceTypes').val(allowedSourceType.substr(1, allowedSourceType.length-2));

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        // show connect parameters
        if (${pageElement.connect}){
            $('.connect').show();
        }

        // show error
        if (${pageElement.error}){
            showErrorMsg("RequestID: ${error.requestId}", "Error message: ${error.message}");
        } else if (${pageElement.response}) {
            renderStripeElements("${pi.clientSecret}","${pageElement.publishKey}");
        }

        // retrieve a PaymentIntent
        $('.pi-retrieve-btn').on('click', function(){
            $.ajax({
                type : "POST",
                url : "retrieve-paymentintent",
                data : "pi=${pi.id}",
                dataType : "json",
                success: function(result){
                    console.log(result.body);
                    if (result.error){
                        console.log("Error");
                        showErrorMsg(result.body.code, "Request ID: " + result.body.requestId + " Message: " + result.body.message);
                    } else {
                        console.log("Success");
                        $('.retrieve-pi-row').show();
                        $('.pi-details-response').html(JSON.stringify(result.body, undefined, 2));
                    }

                }
            });

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
                color: '#5e6773',
                fontSize: '14px',
                '::placeholder': {
                    color: '#ccc',
                },
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
        var source = "${pi.source}";
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

            if (source){
                stripe.handleCardPayment(
                    clientSecret, cardElement, {
                        source_data: {
                            owner: { name: cardholderName }
                        },

                        save_source_to_customer : saveToCustomer
                    }
                ).then(function (result) {
                    handleResult(result);
                });
            } else {
                stripe.handleCardPayment(
                    clientSecret, {
                        source : source
                    }
                ).then(function (result) {
                    handleResult(result);
                });
            }

        });
    }
    function handleResult(result){
        // keep card form on the left
        var hasResponse = $('.pi-response:visible').length;
        console.log(hasResponse);
        if (hasResponse===0){
            $('.card-form').toggleClass('col-md-offset-3', 500);
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
            //$('#card-button').prop('disabled', false);
            $('.pi-retrieve').show();
        }
    }
    function showErrorMsg(title, msg){

        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-full-width",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "0",
            "extendedTimeOut": "0",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr.error(msg, title);
    }
</script>


</body>
</html>
