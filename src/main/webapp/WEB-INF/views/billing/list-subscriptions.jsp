<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-02-04
  Time: 11:22
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
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables/css-main/jquery.dataTables.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables/css-bootstrap/dataTables.bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables-tabletools/css/dataTables.tableTools.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/sweetalert2/sweetalert2.css"/>">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe-colour.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">

</head>
<body class="layout-topnav">

<jsp:useBean id="dateValue" class="java.util.Date"/>
<jsp:useBean id="dateValue2" class="java.util.Date"/>
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
                        <h1 class="page-title-st">Subscriptions</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#">Billing</a></li>
                        <li><a href="#">Subscription</a></li>
                        <li class="active">List Subscriptions</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <!-- PLAN PANEL -->
                <div class="row">
                    <div class="panel panel-main">
                        <div class="panel-heading">
                            <form:form class="form-horizontal" id="acct-form" method="post" action="list-subscription" modelAttribute="stripeAccount">
                                <h3 class="panel-title">All Subscriptions - ${fn:length(subs)}</h3>
                                <span class="client-server stripe-blue" >SERVER SIDE</span>
                                <form:select path="accountProperties" id="stripe-account" class="panel-title right">
                                    <form:option value="" label="Select account"/>
                                    <c:forEach items="${viewObj.allAccounts.accountPropertiesList}" var="account">
                                        <form:option value="${account.accountName}" label="Account - ${account.accountName}"/>
                                    </c:forEach>
                                </form:select>
                            </form:form>
                        </div>
                        <div class="panel-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-primary-stripe-blue btn-toggle-create btn-plan" id="create-subscription"><i class="fa fa-plus"></i>New subscription</button>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <c:forEach items="${subs}" var="sub">
                                    <div class="col-md-6 col-lg-4">
                                        <c:choose>
                                            <c:when test="${sub.status == 'active'}">
                                                <div class="panel panel-second active project-item">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="panel panel-second inactive project-item">
                                            </c:otherwise>
                                        </c:choose>
                                                <div class="panel-heading">
                                                    <h2 class="panel-title"><a href="#" id="${sub.id}" class="sub-id">${sub.id}</a></h2>
                                                    <div class="right">

                                                        <div class="dropdown" style="float: right;">
                                                            <a href="#" class="toggle-dropdown" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a href="#" class="edit-sub" id="${sub.id}"><i class="fa fa-fw fa-edit"></i>Edit</a></li>
                                                                <li><a href="#" class="delete-sub" id="${sub.id}"><i class="fa fa-fw fa-trash-o"></i>Cancel</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="left">
                                                        <div class="info">
                                                            <span class="title">CUSTOMER</span>
                                                            <span class="value"><a href="#" id="${sub.customer}" class="customer-id">${sub.customer}</a></span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">BILLING</span>
                                                            <span class="value">${sub.billing}</span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">PLAN</span>
                                                            <c:forEach items="${sub.subscriptionItems.data}" var="item">
                                                                <span class="value"><a href="#" class="plan-id" id="${item.plan.id}">${item.plan.id}</a></span>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="right">
                                                        <div class="info">
                                                            <span class="title">CREATED</span>
                                                            <jsp:setProperty name="dateValue" property="time" value="${sub.created*1000}"/>
                                                            <span class="value"><fmt:formatDate value="${dateValue}" pattern="dd-MMM-yy HH:mm:SS"/></span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">START</span>
                                                            <jsp:setProperty name="dateValue" property="time" value="${sub.start*1000}"/>
                                                            <span class="value"><fmt:formatDate value="${dateValue}" pattern="dd-MMM-yy HH:mm:SS"/></span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">BILLING_CYCLE_ANCHOR</span>
                                                            <jsp:setProperty name="dateValue" property="time" value="${sub.billingCycleAnchor*1000}"/>
                                                            <span class="value"><fmt:formatDate value="${dateValue}" pattern="dd-MMM-yy HH:mm:SS"/></span>
                                                        </div>

                                                        <c:if test="${sub.trialStart != null}">
                                                            <div class="info">
                                                                <span class="title">TRIAL_START / END</span>
                                                                <jsp:setProperty name="dateValue" property="time" value="${sub.trialStart*1000}"/>
                                                                <jsp:setProperty name="dateValue2" property="time" value="${sub.trialEnd*1000}"/>
                                                                <span class="value"><fmt:formatDate value="${dateValue2}" pattern="dd-MMM-yy HH:mm:SS"/> / <fmt:formatDate value="${trialEnd}" pattern="dd-MMM-yy HH:mm:SS"/></span>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${sub.discount != null}">
                                                            <div class="info">
                                                                <span class="title">DISCOUNT</span>
                                                                <span class="value">${sub.discount}</span>
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                    <div class="clearfix">

                                                    </div>

                                                    <form id="subEditForm-${sub.id}" action="subscription/${sub.id}" method="post">
                                                        <input type="hidden" id="acct-${sub.id}" name="acct" value="">
                                                    </form>

                                                </div>
                                            </div>
                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PLAN PANEL -->
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
    <script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
    <script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
    <script src="https://js.stripe.com/v3/"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
    <script>

        $(function()
        {
            //var accountPropertiesList = JSON.parse('${accountCollections}').accountPropertiesList ;

            // toggle nav active
            $('#navBilling').toggleClass('active');
            $('#navSub').toggleClass('active');
            $('#navSubList').toggleClass('active');
            
            $('#create-subscription').on('click', function () {
                var account = $('#stripe-account option:selected').val();
                window.open('subscription?acct='+account, '_blank');
            });

            // Show error message
            if (${error != null}){
                showErrorMsg("${error.event}", "${error.message}");
            }

            // show notification message
            if (${notification != null}){
                showNotification("${notification.title}", "${notification.message}");
            }

            // preselect account
            var accountName = "${viewObj.currentAccount.accountName}";
            $('#stripe-account option').each(function () {
                var name = $(this).val();
                if (name === accountName){
                    $(this).attr("selected", "selected");
                }
            });

            $('#stripe-account').on('change', function () {
                var accountName = $(this).children("option:selected").val();

                $(this).parent().append('<input type="hidden" name="accountName" value="' + accountName + '" /> ');
                $(this).parent().submit();
            });


            // accordion toggle collapse
            $('.project-accordion [data-toggle="collapse"]').on('click', function()
            {
                $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
            });

            // Show error message
            if (${error != null}){
                showErrorMsg("RequestID: ${error.requestId}", "Error message: ${error.message}");
            }

            // retrieve subscription details
            $('.sub-id').on('click', function()
            {
                retrieveDetails("https://api.stripe.com/v1/subscriptions/" + $(this).get(0).id, "${viewObj.currentAccount.accountSecretKey}");
            });

            // retrieve plan details
            $('.plan-id').on('click', function()
            {
                console.log($(this).get(0).id);
                retrieveDetails("https://api.stripe.com/v1/plans/" + $(this).get(0).id, "${viewObj.currentAccount.accountSecretKey}");
            });

            // retrieve customer details
            $('.customer-id').on('click', function()
            {
                console.log($(this).get(0).id);
                retrieveDetails("https://api.stripe.com/v1/customers/" + $(this).get(0).id, "${viewObj.currentAccount.accountSecretKey}");
            });

            // edit a subscription
            $('.edit-sub').on('click', function () {

                var subId = $(this).get(0).id;
                var accountName = $('#stripe-account').children("option:selected").val();
                $('#acct-'+subId).val(accountName);
                Swal.fire({
                    text: "Do you want to edit this subscription?",
                    type: 'info',
                    showCancelButton: true,
                    confirmButtonText: 'OK'
                }).then(function (result) {
                    //window.location = getUpdateURL(window.location.href, accountName, subId);

                    //$('#subEditForm-'+subId).append('<input type="hidden" name="acct" value="' + accountName + '" /> ');
                    //$('acct-${sub.id}').val(accountName);
                    $('#subEditForm-'+subId).submit();

                });
            });


            // delete a subscription
            $('.delete-sub').on('click', function () {
                var subId = $(this).get(0).id;

                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, delete it!'
                }).then(function (result) {
                    if (result.value){
                        $.ajax({
                            type: "DELETE",
                            url: "https://api.stripe.com/v1/subscriptions/" + subId,
                            beforeSend: function (xhr) {

                                xhr.setRequestHeader("Authorization", "Bearer " + "${viewObj.currentAccount.accountSecretKey}");
                                xhr.setRequestHeader("X-Mobile", "false");
                            },
                            success: function(result){
                                console.log(result);
                                Swal.fire({
                                    text: 'The subscription '  + subId + ' has been deleted.',
                                    type: 'success'
                                }).then(function(result){
                                    if (result.value){
                                        window.location = getURL(window.location.href, "${viewObj.currentAccount.accountName}");
                                    }
                                });
                            },
                            error: function (result) {
                                //console.log(result.responseJSON.error);
                                Swal.close();
                                showErrorMsg(result.responseJSON.error.code, result.responseJSON.error.message);
                            }
                        });
                    }
                });
            });

            function getUpdateURL(originalURL, accountName, subId){
                var url = originalURL.replace("#", "");
                url = url.replace("list-subscription", "");
                url = url + "update-subscription?acct=" + accountName + "&subId=" + subId;
                return url;
            }
        });
    </script>

</body>
</html>
