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
    <link rel="stylesheet" href="<c:url value="/resources/vendor/themify-icons/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/pace/themes/orange/pace-theme-minimal.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables/css-main/jquery.dataTables.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables/css-bootstrap/dataTables.bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables-tabletools/css/dataTables.tableTools.css"/>">
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

    <div class="main">
        <div class="main-content">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Product - Plan</h1>
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
                        <li><a href="/billing">Billing</a></li>
                        <li class="active">Product - plan</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->

                <!-- Product Param Panel -->
                <div class="row" id="prod-params">
                    <div class="panel panel-main panel-server panel-tab" id="prod-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>/v1/products</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-prod" class="active"><a href="#reqTab-prod" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-prod"><a href="#resTab-prod" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-prod">
                                <form class="form-horizontal" id="prodForm">
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <div class="project-info">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><b>name</b></label>
                                                    <div class="col-sm-7">
                                                        <input name="name" class="form-control" id="prod-name" value="${prod.name}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><b>type</b></label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="type" id="prod-type" class="form-control" itemValue="${prod.type}">
                                                            <option value="service" label="service"/>
                                                            <option value="good" label="good"/>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">unit_label</label>
                                                    <div class="col-sm-7">
                                                        <input name="unit_label" class="form-control" id="prod-unit_label" value="${prod.unit_label}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">statement_descriptor</label>
                                                    <div class="col-sm-7">
                                                        <input name="statement_descriptor" class="form-control" id="prod-statement_descriptor" value="${prod.statement_descriptor}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4 metadata" >
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">metadata</label>
                                                    <div class="col-sm-4" style="padding-right:5px;">
                                                        <input class="form-control" id="prod-metadatakey-0" data-toggle="0" placeholder="key"/>
                                                    </div>
                                                    <div class="col-sm-4" style="padding-left:5px;">
                                                        <input class="form-control" id="prod-metadatakey-0-value" name="metadata" placeholder="value"/>
                                                    </div>
                                                </div>
                                                <div class="form-group" id="prod-md-1">
                                                    <label class="col-sm-4 control-label"></label>
                                                    <div class="col-sm-4" style="padding-right:5px;">
                                                        <input class="form-control" id="prod-metadatakey-1" data-toggle="1" placeholder="key"/>
                                                    </div>
                                                    <div class="col-sm-4" style="padding-left:5px;">
                                                        <input class="form-control" id="prod-metadatakey-1-value" name="metadata" placeholder="value"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <a class="col-sm-4 col-sm-offset-6 control-label" id="add-prod-md" style="float: right; cursor: pointer;padding-top:0;">+ add metadata</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->

                                    <!-- HIDDEN PARAMS -->
                                    <input type="hidden" name="accountName" id="prod-account-name" value=""/>
                                    <!-- END HIDDEN PARAMS -->
                                </form>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-prod">
                                <h5>Create Product Response</h5>
                                <pre id="prodResponse"></pre>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <button class="btn btn-primary-stripe-blue" id="prod-create-btn">Create a Product</button>
                            <button class="btn btn-primary-stripe-white" id="prod-list-btn" style="margin-right: 20px;">List all products</button>
                        </div>
                    </div>
                </div>
                <!-- END Product Param Panel -->

                <!-- Product details panel -->
                <div class="row hide" id="prod-details">
                    <div class="panel panel-main panel-server" id="all-prod">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <h3 class="panel-title"><span class="label label-primary api-method">GET</span>/v1/products</h3>
                        </div>
                        <!-- client params -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="featured-datatable" class="table table-striped table-hover">
                                        <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>active</th>
                                            <th>name</th>
                                            <th>type</th>
                                            <th>created</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Plan Param Panel -->
                <div class="row hide" id="plan-params">
                    <div class="panel panel-main panel-server panel-tab" id="plan-panel">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>/v1/plans</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-plan" class="active"><a href="#reqTab-plan" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-plan"><a href="#resTab-plan" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-plan">
                                <form class="form-horizontal" id="planForm">
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <div class="project-info">
                                            <div class="col-md-4 metadata">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><b>product</b></label>
                                                    <div class="col-sm-7">
                                                        <input name="product" class="form-control" id="plan-product" value="${plan.product}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><b>currency</b></label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="currency" id="plan-currency" class="form-control" itemValue="${plan.currency}">
                                                            <option value="gbp" label="gbp"/>
                                                            <option value="usd" label="usd"/>
                                                            <option value="eur" label="eur"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group per_unit">
                                                    <label class="col-sm-5 control-label"><b>amount</b></label>
                                                    <div class="col-sm-7">
                                                        <input name="amount" class="form-control" id="plan-amount" value="${plan.amount}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">trial_period_days</label>
                                                    <div class="col-sm-7">
                                                        <input name="trial_period_days" class="form-control" id="plan-trial_period_days" value="${plan.trial_period_days}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">metadata</label>
                                                    <div class="col-sm-3" style="padding-right:5px;">
                                                        <input class="form-control" id="plan-metadatakey-0" data-toggle="0" placeholder="key"/>
                                                    </div>
                                                    <div class="col-sm-4" style="padding-left:5px;">
                                                        <input class="form-control" id="plan-metadatakey-0-value" name="metadata" placeholder="value"/>
                                                    </div>
                                                </div>
                                                <div class="form-group" id="plan-md-1">
                                                    <label class="col-sm-5 control-label"></label>
                                                    <div class="col-sm-3" style="padding-right:5px;">
                                                        <input class="form-control" id="plan-metadatakey-1" data-toggle="1" placeholder="key"/>
                                                    </div>
                                                    <div class="col-sm-4" style="padding-left:5px;">
                                                        <input class="form-control" id="plan-metadatakey-1-value" name="metadata" placeholder="value"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <a class="col-sm-4 col-sm-offset-6 control-label" id="add-plan-md" style="float: right; cursor: pointer;padding-top:0;">+ add metadata</a>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">nickname</label>
                                                    <div class="col-sm-7">
                                                        <input name="nickname" class="form-control" id="plan-nickname" value="" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">usage_type</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="usage_type" id="plan-usage_type" class="form-control" itemValue="${plan.usage_type}">
                                                            <option value="licensed" label="licensed"/>
                                                            <option value="metered" label="metered"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group metered hide">
                                                    <label class="col-sm-5 control-label">aggregate_usage</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="aggregate_usage" id="plan-aggregate_usage" class="form-control" disabled="disabled" itemValue="${plan.aggregate_usage}">
                                                            <option value="" label="--------"/>
                                                            <option value="sum" label="sum"/>
                                                            <option value="last_during_period" label="last_during_period"/>
                                                            <option value="last_ever" label="last_ever"/>
                                                            <option value="max" label="max"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">billing_scheme</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="billing_scheme" id="plan-billing_scheme" class="form-control" itemValue="${plan.billing_scheme}">
                                                            <option value="per_unit" label="per_unit"/>
                                                            <option value="tiered" label="tiered"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group tiered hide">
                                                    <label class="col-sm-5 control-label">tiers_mode</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="tiers_mode" id="plan-tiers_mode" class="form-control" disabled="disabled" itemValue="${plan.tiers_mode}">
                                                            <option value="graduated" label="graduated"/>
                                                            <option value="volume" label="volume"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><b>interval</b></label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="interval" id="plan-interval" class="form-control" itemValue="${plan.interval}">
                                                            <option value="month" label="month"/>
                                                            <option value="day" label="day"/>
                                                            <option value="week" label="week"/>
                                                            <option value="year" label="year"/>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">interval_count</label>
                                                    <div class="col-sm-7">
                                                        <input name="interval_count" class="form-control" id="plan-interval_count" value="${plan.interval_count}" />
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-4">
                                                <div class="panel panel-inner tiered hide">
                                                    <div class="panel-heading">
                                                        <h3 class="panel-title">tiers</h3>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-sm-12">

                                                                <div id="tier1">
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">tiers[0].up_to</label>
                                                                        <div class="col-sm-7">
                                                                            <input name="tiers[0].up_to" class="form-control" disabled="disabled"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">tiers[0].unit_amount</label>
                                                                        <div class="col-sm-7">
                                                                            <input name="tiers[0].unit_amount" class="form-control" disabled="disabled"/>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-5 control-label">tiers[0].flat_amount</label>
                                                                        <div class="col-sm-7">
                                                                            <input name="tiers[0].flat_amount" class="form-control" disabled="disabled"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <a class="col-sm-4 col-sm-offset-6 control-label" id="add-tiers" style="float: right; cursor: pointer;padding-top:0;">+ add more tiers</a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="panel panel-inner per_unit">
                                                    <div class="panel-heading">
                                                        <h3 class="panel-title">transform_usage</h3>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">divide_by</label>
                                                                    <div class="col-sm-7">
                                                                        <input name="transform_usage.divide_by" class="form-control" id="plan-transform_usage.divide_by" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-5 control-label">round</label>
                                                                    <div class="col-sm-7 dropdown-select">
                                                                        <select name="transform_usage.round" id="plan-transform_usage.round" class="form-control" >
                                                                            <option value="" label="--------"/>
                                                                            <option value="up" label="up"/>
                                                                            <option value="down" label="down"/>
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
                                    <!-- END BASIC PARAMETERS -->

                                    <!-- HIDDEN PARAMS -->
                                    <input type="hidden" name="accountName" value=""/>
                                    <!-- END HIDDEN PARAMS -->
                                </form>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-plan">
                                <h5>Create Product Response</h5>
                                <pre id="planResponse"></pre>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <button class="btn btn-primary-stripe-blue" id="plan-create-btn">Create a Plan</button>
                            <button class="btn btn-primary-stripe-white" id="sub-create-btn" style="margin-right: 20px;">Create a Subscription</button>
                        </div>
                    </div>
                </div>
                <!-- END Plan Param Panel -->

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
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/scripts/serializeToJSON.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.cookie.js"/>"></script>
<script src="<c:url value="/resources/scripts/jquery.blockUI.js"/>"></script>

<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>

<script>
    $(function(){
        // toggle nav active
        $('#navBilling').toggleClass('active');
        $('#navProductPlan').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function() {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        // drop down
        $('fieldset [data-toggle="collapse"]').on('click', function() {
            $(this).find('.toggle-icon').toggleClass('fa-caret-up fa-caret-down ');
        });

        /**
         * Select a Stripe account to make API calls
         */
        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $( "input[name='accountName']").val(accountName);
        });

        // set metadata
        $('.metadata').on('focusout', "input[id*='-metadatakey-']", function () {

            var key = $(this).val();
            var id = $(this).attr('id');
            $('#'+id+'-value').attr('name', 'metadata['+key+']');
        });

        // plan-usage_type change
        $('#plan-usage_type').on('change', function () {
            var type = $(this).children("option:selected").val();
            $('.metered').toggleClass('hide');
            toggleDisable('.metered', 'select');
        });

        // plan-billing_scheme change
        $('#plan-billing_scheme').on('change', function () {
            var scheme = $(this).children("option:selected").val();
            if (scheme === 'tiered'){
                $('.tiered').toggleClass('hide');
                $('.per_unit').hide();

            } else {
                $('.tiered').toggleClass('hide');
                $('.per_unit').show();
            }
            toggleDisable('.tiered', 'select');
            toggleDisable('.tiered', 'input');
            toggleDisable('.per_unit', 'select');
            toggleDisable('.per_unit', 'input');
        });


        // add more tiers
        var num = 0;
        $('#add-tiers').on('click', function () {
            num++;
            var tier = $('#tier'+num).clone();
            tier.attr('id', 'tier'+(num+1));
            var formGroups = tier.find('.form-group');

            formGroups.each(function () {

                var label = $(this).find('label');
                var label_text = label.text().replace(num-1, num);
                label.html(label_text);

                var input = $(this).find('input');
                var input_name = input.attr('name').replace(num-1, num);
                input.attr('name', input_name);
            });
            $('#tier'+num).after(tier);

        });
        
        // add more metadata
        var md_num_prod = 1;
        $('#add-prod-md').on('click', function () {
            var prefix = 'prod-md-';
            addMetaData(prefix, md_num_prod);
            md_num_prod++;
        });

        var md_num_plan = 1;
        $('#add-plan-md').on('click', function () {
            var prefix = 'plan-md-';
            addMetaData(prefix, md_num_plan);
            md_num_plan++;
        });
    });


</script>

<script>
    $('#prod-create-btn').on('click', function () {
        let data = $('#prodForm').serializeToJSON();
        console.log(data);
        //$(this).prop('disabled', true);
        //$('#prod-create-btn').append("<i class=\"fa fa-spinner fa-spin btn-spinner\"></i>");
        $('#toast-container').remove();
        blockElement('#prod-panel');

        $.ajax({
            type: "POST",
            url: "create-product",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",

            error: function(response){
                const responseObj = JSON.parse(response.responseJSON.apiResponse);
                showErrorMsg(responseObj.code, responseObj.message);
            },

            success: function (response) {
                //$('#prod-create-btn').find('.btn-spinner').remove();
                $('#prodResponse').html(response.apiResponse);
                const product = JSON.parse(response.apiResponse);
                const id = product.id;
                $('#prod-create-btn').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Product created, id: <b>' + id + '</b> </span></div>');
                showPlanPanel(id);
            },
            complete: function () {
                unBlockElement('#prod-panel');
            }
        });
    });

    $('#plan-create-btn').on('click', function () {
        let data = $('#planForm').serializeToJSON();
        console.log(data);
        //$(this).prop('disabled', true);
        //$('#plan-create-btn').append("<i class=\"fa fa-spinner fa-spin btn-spinner\"></i>");
        blockElement('#plan-panel');
        $('#toast-container').remove();

        $.ajax({
            type: "POST",
            url: "create-plan",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",

            error: function(response){
                const responseObj = JSON.parse(response.responseJSON.apiResponse);
                showErrorMsg(responseObj.code, responseObj.message);
            },

            success: function (response) {
                $('#plan-create-btn').find('.btn-spinner').remove();
                $('#planResponse').html(response.apiResponse);
                const plan = JSON.parse(response.apiResponse);
                const id = plan.id;
                $('#plan-create-btn').after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Plan created, id: <b>' + id + '</b> </span></div>');
            },
            complete: function () {
                unBlockElement('#plan-panel');
            }
        });
    });

    $('#prod-list-btn').on('click', function () {
        //$(this).append("<i class=\"fa fa-spinner fa-spin btn-spinner\"></i>");

        $('#toast-container').remove();
        var accountName = $('#prod-account-name').val();
        if (accountName === ''){
            showErrorMsg('Select an account', 'You need to select an account before start creating a connect account!');
        } else {
            let isHide = $('#prod-details').attr('class').includes('hide');
            if (isHide){
                $('#prod-details').toggleClass('hide');
            }
            blockElement('#all-prod');

            $.ajax({
                type: "POST",
                url: "list-product",
                data: accountName,
                dataType: "json",
                contentType: "application/json",

                error: function(response){
                    //handleError(response, '#prod-list-btn');
                    unBlockElement('#all-prod');
                    const responseObj = JSON.parse(response.responseJSON.apiResponse);
                    showErrorMsg(responseObj.code, responseObj.message);
                },

                success: function (response) {
                    $('#featured-datatable').dataTable().fnClearTable();
                    console.log(response);
                    const products = response.apiResponse;

                    products.forEach(function (product) {
                        //console.log(product);
                        let table = $('#featured-datatable').dataTable();
                        /*let id = '<a id="'+product.id+'" class="product-id">'+product.id+'</a>';*/
                        let id = product.id;
                        let status = '';
                        let option = '';
                        if (product.active){
                            status = '<span class="label label-success plan-status">ACTIVE</span>';
                            option = '<div class="dropdown" style="float: right;"><a href="#" class="toggle-dropdown" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a><ul class="dropdown-menu dropdown-menu-right"><li><a style="cursor: pointer;" class="create-plan" id="'+product.id+'"><i class="fa fa-fw fa-file-code-o"></i>Create a Plan</a></li></ul></div>';
                        } else {
                            status = '<span class="label label-danger plan-status">INACTIVE</span>';
                        }
                        let name = product.name;
                        let type = product.type;

                        let created = new Date(product.created * 1000).toISOString().replace('T', ' ').replace('.000Z', '');
                        table.fnAddData([id, status, name, type, created, option]);
                    })
                },
                complete: function () {
                    unBlockElement('#all-prod');
                    $('#featured-datatable').dataTable().fnSort([4,'desc']);
                    $('html, body').animate({scrollTop: $('#prod-details').offset().top}, 500);
                    $('#prod-list-btn').find('.btn-spinner').remove();
                }
            });
        }

    });

    $('#featured-datatable').on('click', '.create-plan', function () {
        let id = $(this).attr('id');
        showPlanPanel(id);
    });

    $('#featured-datatable').on('click', '.product-id', function () {
        let id = $(this).attr('id');
        showPlanPanel(id);
    });


    function showPlanPanel(id){
        let isHide = $('#plan-params').attr('class').includes('hide');
        if (isHide){
            $('#plan-params').toggleClass('hide');
        }
        $('#plan-product').val(id);
        $('html, body').animate({scrollTop: $('#plan-params').offset().top}, 500);
    }

    function handleError(response, selector){
        $(selector).prop('disabled', false);
        $(selector).find('.btn-spinner').remove();
        const responseObj = JSON.parse(response.responseJSON.apiResponse);
        console.log(responseObj);
        showErrorMsg(responseObj.code, responseObj.message);
    }

    function handleActions(response, selector, name) {
        let responseObj = JSON.parse(response.apiResponse);
        //console.log(responseObj);
        let id = responseObj.id;
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

</script>

<script>
    // datatable column with reorder extension
    $('#datatable-column-reorder').dataTable(
        {
            pagingType: "full_numbers",
            sDom: "RC" +
                "t" +
                "<'row'<'col-sm-6'i><'col-sm-6'p>>",
            colReorder: true,
        });
    // datatable with column filter enabled
    var dtTable = $('#datatable-column-filter').DataTable(
        { // use DataTable, not dataTable
            sDom: // redefine sDom without lengthChange and default search box
                "t" +
                "<'row'<'col-sm-6'i><'col-sm-6'p>>"
        });
    $('#datatable-column-filter thead').append('<tr class="row-filter"><th></th><th></th><th></th><th></th><th></th></tr>');
    $('#datatable-column-filter thead .row-filter th').each(function()
    {
        $(this).html('<input type="text" class="form-control input-sm" placeholder="Search...">');
    });
    $('#datatable-column-filter .row-filter input').on('keyup change', function()
    {
        dtTable
            .column($(this).parent().index() + ':visible')
            .search(this.value)
            .draw();
    });
    // datatable with paging options and live search
    $('#featured-datatable').dataTable(
        {
            sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>r>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
        });

    // datatable with scrolling
    $('#datatable-basic-scrolling').dataTable(
        {
            scrollY: "300px",
            scrollCollapse: true,
            paging: true
        });
</script>

</body>
</html>
