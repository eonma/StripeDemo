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
                        <h1 class="page-title-st">SetupIntent</h1>
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
                        <li><a href="/payments">Payments</a></li>
                        <li class="active">SetupIntent</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->

                <!-- SERVER SIDE PANEL - Create SI-->
                <div class="row" id="server-params">
                    <div class="panel panel-main panel-server panel-tab" id="create-si-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>/v1/setup_intents</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq" class="active"><a href="#reqTab" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes"><a href="#resTab" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab">
                                <form class="form-horizontal" id="siForm">
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <div class="project-info">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">usage</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="usage" id="usage" class="form-control">
                                                            <option value="off_session" label="off_session"/>
                                                            <option value="on_session" label="on_session"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">on_behalf_of</label>
                                                    <div class="col-sm-7">
                                                        <input name="on_behalf_of" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">description</label>
                                                    <div class="col-sm-7">
                                                        <input name="description" class="form-control" id="description" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">payment_method_types</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="payment_method_types[]" id="paymentMethodTypes" class="form-control">
                                                            <option value="card" label="card"/>
                                                            <option value="card_present" label="card_present"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">payment_method</label>
                                                    <div class="col-sm-7">
                                                        <input name="payment_method" class="form-control" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">customer</label>
                                                    <div class="col-sm-7">
                                                        <input name="customer" class="form-control" id="customer" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">metadata</label>
                                                    <div class="col-sm-3" style="padding-right:5px;">
                                                        <input class="form-control" id="si-metadatakey-0" data-toggle="0" placeholder="key"/>
                                                    </div>
                                                    <div class="col-sm-4" style="padding-left:5px;">
                                                        <input class="form-control" id="si-metadatakey-0-value" name="metadata" placeholder="value"/>
                                                    </div>
                                                </div>
                                                <div class="form-group" id="si-md-1">
                                                    <label class="col-sm-5 control-label"></label>
                                                    <div class="col-sm-3" style="padding-right:5px;">
                                                        <input class="form-control" id="si-metadatakey-1" data-toggle="1" placeholder="key"/>
                                                    </div>
                                                    <div class="col-sm-4" style="padding-left:5px;">
                                                        <input class="form-control" id="si-metadatakey-1-value" name="metadata" placeholder="value"/>
                                                    </div>
                                                </div>
                                                <div class="form-group last-row">
                                                    <a class="col-sm-4 col-sm-offset-6 control-label" id="add-md" style="float: right; cursor: pointer;padding-top:0;">+ add metadata</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->

                                    <!-- HIDDEN PARAMS -->
                                    <input type="hidden" id="account-name" name="accountName" value=""/>
                                    <!-- END HIDDEN PARAMS -->
                                </form>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab">
                                <h5>Create SetupIntent Response</h5>
                                <pre id="siResponse"></pre>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <button class="btn btn-primary-stripe-blue" id="si-create-btn">Create a Setup Intent</button>
                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Create SI-->

                <!-- CLIENT SIDE PANEL -->
                <div class="row" id="client-params" style="display: none;">
                    <div class="panel panel-main panel-client" id="client-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-green">CLIENT</span>
                            <h3 class="panel-title"><span class="label label-default api-method">JS</span>handleCardSetup()</h3>
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
                                            <div class="col-sm-8 col-sm-offset-4" id="card-errors"></div>
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
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="panel-footer">
                            <button id="si-button" class="btn btn-primary-stripe-blue" data-toggle=""><span>save card</span></button>
                            <div class="alert alert-success payment-method" style="margin-bottom: 0; padding: 5px 10px 5px 15px; float: right; display: none;">
                                setup_intent_id: <a href="#" class="pm-id" id="pm-id"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END CLIENT SIDE PANEL -->

                <!-- SERVER SIDE PANEL - Confirm SI -->
                <div class="row" id="confirm-params" style="display: none;">
                    <div class="panel panel-main panel-server panel-tab" id="confirm-si-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>/v1/setup_intents/confirm</h3></a>
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
                                        <form id="siConfForm">
                                            <!-- HIDDEN PARAMS -->
                                            <input type="hidden" name="accountName" value=""/>
                                            <!-- END HIDDEN PARAMS -->
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">payment_method</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" name="payment_method" type="text" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">return_url</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" name="return_url" type="text" value=""/>
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
                                <h5>Confirm SetupIntent Response</h5>
                                <pre id="siConfResponse"></pre>
                            </div>


                        </div>
                        <div class="panel-footer">
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="si-confirm-btn">Confirm SetupIntent</button>
                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Confirm SI -->

                <!-- Save payment method to customer -->
                <div class="row" id="customer-params" style="display: none;">
                    <div class="panel panel-main panel-server panel-tab" id="create-customer-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server">
                                <h3 class="panel-title">
                                    <span class="label label-success api-method">POST</span>/v1/customers
                                </h3>
                            </a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-cust" class="active"><a href="#reqTab-cust" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-cust"><a href="#resTab-cust" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-cust">
                                <div class="form-horizontal" >
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <form id="custForm">
                                            <!-- END HIDDEN PARAMS -->
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">email</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" name="email" type="text" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">name</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" name="name" type="text" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">payment_method</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" name="payment_method" id="cust-payment-method" type="text" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->
                                </div>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-cust">
                                <h5>Create Customer Response</h5>
                                <pre id="custResponse"></pre>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="create-customer-btn">Create a Customer</button>
                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Confirm SI -->
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

        let user = $.cookie("user");
        console.log(user);

        let stripe;

        // toggle nav active
        $('#navPayment').toggleClass('active');
        $('#navSI').toggleClass('active');
        $('#navCreateSI').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function() {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        // set metadata
        $('#siForm').on('focusout', "input[id*='-metadatakey-']", function () {
            //console.log($(this));
            let key = $(this).val();
            let id = $(this).attr('id');
            $('#'+id+'-value').attr('name', 'metadata['+key+']');
        });

        // add more metadata
        let md_num = 1;
        $('#add-md').on('click', function () {
            let prefix = 'si-md-';
            addMetaData(prefix, md_num);
            md_num++;
        });

        /**
         * Select a Stripe account to make API calls
         */
        $('#stripe-account').on('change', function () {
            let accountName = $(this).children("option:selected").val();
            let publishKey = $(this).children("option:selected").data('toggle');
            $( "input[name='accountName']").val(accountName);
            stripe = Stripe(publishKey);
        });

        /**
         * Create a SetupIntent
         */
        $('#si-create-btn').on('click', function () {
            $('#toast-container').remove();

            let accountName = $('#account-name').val();
            if (accountName === ''){
                showErrorMsg('Select an account', 'You need to select an account before start creating a connect account!');
            } else {
                blockElement('#create-si-panel');
                let data = $('#siForm').serializeToJSON();
                console.log(data);

                $.ajax({
                    type : "POST",
                    url : "setup-intent",
                    data: JSON.stringify(data),
                    dataType: "json",
                    contentType: "application/json",

                    error: function(response){
                        const responseObj = JSON.parse(response.responseJSON.apiResponse);
                        showErrorMsg(responseObj.code, responseObj.message);
                    },

                    success: function(response){
                        //console.log(response.apiResponse);

                        $('#siResponse').html(response.apiResponse);
                        handleActions(response, '#si-create-btn');

                        let responseObj = JSON.parse(response.apiResponse);
                        $('#si-create-btn').after('<div class="alert alert-success alert-action" style="margin-right: 20px;"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;setup_intent_id: <b>' + responseObj.id + '</b> </span></li></div>');

                        if (response.code !== 'ERROR'){
                            // Show client parameters panel and render Stripe elements
                            renderStripeElements();
                            $('#client-params').show();
                        }
                    },

                    complete: function (response, status) {
                        unBlockElement('#create-si-panel');
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
                            //var responseObj = JSON.parse(response.responseJSON.apiResponse);
                            //var piId = responseObj.id;
                            //receiveWebhook(piId);
                        }
                    }
                });
            }
        });

        /**
         * Render Stripe Elements
         * @param account
         */
        function renderStripeElements(){
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

            // submit payment intent on client side
            $('#si-button').on('click', function () {

                blockElement('#client-panel');
                $('#toast-container').remove();

                var data = $('#card-form').serializeToJSON();
                //console.log(data);
                var client_secret = $(this).data('toggle');
                //console.log(data.payment_method);

                if (data.payment_method !== '' && data.payment_method !== null && typeof data.payment_method !== 'undefined'){
                    stripe.handleCardSetup(client_secret, data).then(function(result) {
                        handleResult(result);
                    });
                } else {
                    stripe.handleCardSetup(client_secret, cardElement, data).then(function(result) {
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
                    //$('#si-button').prop('disabled', false);
                    showErrorMsg(result.error.code, result.error.message);
                } else {
                    console.log(result);
                    let si = result.setupIntent;
                    let status = si.status;
                    switch (status) {
                        case 'succeeded':
                            $('#si-button').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;payment_method_id: <b>' + si.payment_method + '</b> </span></li></div>');
                            break;
                        case 'requires_confirmation':
                            $('#si-button').after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_CONFIRMATION</b> </span></li></div>');
                            $('#si-confirm-btn').attr('data-toggle', si.id);

                            var isShow = $('#confirm-params').css('display');
                            if (isShow === 'none'){
                                $('#confirm-params').find($('.api-method')).after('/v1/payment_intents/' + si.id + '/confirm');
                                $('#confirm-params').show();
                            } else {
                                $('#si-confirm-btn').prop('disabled', false);
                                $('#si-confirm-btn').parent().find($('.alert-action')).remove();
                            }

                            $('html, body').animate({scrollTop: $('#confirm-params').offset().top}, 500);
                            break;
                    }
                    // show create customer panel
                    let pm = si.payment_method;
                    $('#cust-payment-method').val(pm);
                    $('#customer-params').show();
                    $('html, body').animate({scrollTop: $('#create-customer-panel').offset().top}, 500);
                }
            }
        };

        /**
         * Confirm a PaymentIntent
         */
        $('#si-confirm-btn').on('click', function () {

            blockElement('#confirm-si-panel');
            $('#toast-container').remove();
            var data = $('#siConfForm').serializeToJSON();

            var id = $(this).data('toggle');
            //console.log(id);

            $.ajax({
                type: "POST",
                url: "setup-intent/"+id+"/confirm",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function (response) {
                    //console.log(response);
                    $('#siConfResponse').html(response.apiResponse);
                    handleActions(response, '#si-confirm-btn');
                },
                complete: function () {
                    unBlockElement('#confirm-si-panel');
                }
            });
        })

        /**
         * Set SetupIntent actions
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
                            $('#si-button').attr('data-toggle', responseObj.client_secret);
                            $('html, body').animate({scrollTop: $('#client-params').offset().top}, 500);
                            break;

                        case 'REQUIRES_CONFIRMATION':
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_CONFIRMATION</b> </span></li></div>');
                            $('#si-confirm-btn').attr('data-toggle', responseObj.id);
                            $('#confirm-params').find($('.api-method')).after('/v1/setup_intents/' + responseObj.id + '/confirm');
                            $('#confirm-params').show();
                            $('html, body').animate({scrollTop: $('#confirm-params').offset().top}, 500);
                            break;
                    }
                    break;
            }
        }

        /**
         * Create a customer
         */
        $('#create-customer-btn').on('click', function () {
            blockElement('#create-customer-panel');
            $('#toast-container').remove();
            let data = $('#custForm').serializeToJSON();
            let accountName = $('#account-name').val();

            $.ajax({
                type: "POST",
                url: "create-customer?accountName=" + accountName,
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function (response) {
                    //console.log(response);
                    var responseObj = JSON.parse(response.apiResponse);
                    var id = responseObj.id;
                    $('#custResponse').html(response.apiResponse);
                    $('#create-customer-btn').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;customer_id: <b>' + id + '</b> </span></li></div>');
                    $('#create-customer-btn').after('<button class="btn btn-primary-stripe-white" id="redirect-pi" data-toggle="'+ id +'">Create a Payment</button>');
                },
                complete: function () {
                    unBlockElement('#create-customer-panel');
                }
            });
        })


        $('#customer-params').on('click', '#redirect-pi', function () {
            let pm_id = $('#cust-payment-method').val();
            let cust_id = $(this).data('toggle');
            window.open('/payment-intent-manual?pm_id='+pm_id+'&cust_id='+cust_id, '_blank');
        });

        $('#redirect-pi').on('click', function () {
            let cust_id = $(this).data('cust');
            let pm_id = $(this).data('pm');
            window.open('/payment-intent-manual?pm_id='+ pm_id +'&cust_id=' + cust_id,'_blank');
        })
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