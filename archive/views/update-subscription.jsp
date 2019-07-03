<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-02-21
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix=".c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" />">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">

</head>
<body class="layout-topnav ">
<jsp:useBean id="dateValue" class="java.util.Date"/>
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
                        <h1 class="page-title-st">Update Subscription</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#"><i class="fa fa-home"></i>Subscription</a></li>
                        <li class="active">Update Subscription</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <div class="row">
                    <div class="panel panel-main">
                        <div class="panel-heading">
                            <h3 class="panel-title">Subscription - ${sub.id}</h3>
                        </div>
                        <div class="panel-body">

                            <form:form class="form-horizontal" id="subForm" modelAttribute="subReq" action="subscription/${sub.id}/update" method="post">
                                <input type="hidden" id="account-name" name="acct" value="${param.acct}"/>
                                <div class="project-info">
                                    <div class="row" style="margin: 0 0 0 -10px !important;;">
                                        <div class="col-md-4">
                                            <c:set var="num" value="${sub.subscriptionItems.data.size()}"/>
                                            <c:forEach items="${sub.subscriptionItems.data}" var="subItem" varStatus="loop">
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">items[${loop.index}][id]</label>
                                                    <div class="col-sm-6">
                                                        <label class="control-label">items[${loop.index}][id]</label>
                                                        <form:hidden path="items[${loop.index}].id" class="form-control" id="item${loop.index}id" value="${subItem.id}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"><a href="#" class="list-plan" id="${loop.index}">items[${loop.index}][plan]</a></label>
                                                    <div class="col-sm-6">
                                                        <form:input path="items[${loop.index}].plan" class="form-control" id="item${loop.index}plan" value="${subItem.plan.id}" disabled="true"/>
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="item${loop.index}plan">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">items[${loop.index}][quantity]</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="items[${loop.index}].quantity" class="form-control" id="item${loop.index}quantity" value="${subItem.quantity}" disabled="true"/>
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="item${loop.index}quantity">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">items[${loop.index}][deleted]</label>
                                                    <div class="col-sm-6">
                                                        <form:select path="items[${loop.index}].deleted" id="item${loop.index}deleted" class="form-control" itemValue="" disabled="true">
                                                            <form:option value="" label="--------"/>
                                                            <form:option value="true" label="true"/>
                                                            <form:option value="false" label="false"/>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-sm-1">
                                                        <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="item${loop.index}deleted">
                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <%--<div class="form-group more-item">
                                                <label class="col-sm-5 control-label"><a href="#" class="list-plan" id="${num}">items[${num}][plan]</a></label>
                                                <div class="col-sm-6">
                                                    <form:input path="items[${num}].plan" class="form-control" id="item${num}plan" value="" />
                                                </div>
                                            </div>
                                            <div class="form-group more-item">
                                                <label class="col-sm-5 control-label">items[${num}][quantity]</label>
                                                <div class="col-sm-6">
                                                    <form:input path="items[${num}].quantity" class="form-control" id="item${num}quantity" value="" />
                                                </div>
                                            </div>--%>

                                            <div class="form-group">
                                                <div class="col-sm-6 col-md-offset-5">
                                                    <a id="add-item-btn" href="#" style="float: right"><i class="fa fa-plus"></i> <span> add item</span></a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">billing</label>
                                                <div class="col-sm-6">
                                                    <form:select path="billing" id="billing-id" class="form-control" itemValue="${sub.billing}" disabled="true">
                                                        <form:option value="charge_automatically" label="auto"/>
                                                        <form:option value="send_invoice" label="invoice"/>
                                                    </form:select>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="billing-id">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">cancel_at_end</label>
                                                <div class="col-sm-6">
                                                    <form:select path="cancel_at_period_end" id="cancelAtEnd" class="form-control" itemValue="${sub.cancelAtPeriodEnd}" disabled="true">
                                                        <form:option value="true" label="true"/>
                                                        <form:option value="false" label="false"/>
                                                    </form:select>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="cancelAtEnd">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">billing_cycle_anchor</label>
                                                <div class="col-sm-6">
                                                    <form:select path="billing_cycle_anchor" id="billingCycleAnchor" class="form-control" itemValue="" disabled="true">
                                                        <form:option value="unchanged" label="unchanged"/>
                                                        <form:option value="now" label="now"/>
                                                    </form:select>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="billingCycleAnchor">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">prorate</label>
                                                <div class="col-sm-6">
                                                    <form:select path="prorate" id="prorate-id" class="form-control" itemValue="${subReq.prorate}" disabled="true">
                                                        <form:option value="" label="----"/>
                                                        <form:option value="true" label="true"/>
                                                        <form:option value="false" label="false"/>
                                                    </form:select>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="prorate-id">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">proration_date</label>
                                                <div class="col-sm-6">
                                                    <div class="input-group date" data-date-autoclose="true" data-provide="datepicker">
                                                        <form:input path="proration_date" type="text" id="prorationDate" class="form-control" value="${subReq.proration_date }" disabled="true"/>
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="prorationDate">
                                                </div>
                                            </div>
                                           <%-- <div class="form-group">
                                                <label class="col-sm-6 control-label">billing_cycle_anchor</label>
                                                <div class="col-sm-6">

                                                        &lt;%&ndash;<form:input path="billing_cycle_anchor" class="form-control" id="billingCycleAnchor" value="${subReq.billing_cycle_anchor}" />&ndash;%&gt;

                                                    <div class="input-group date" data-date-autoclose="true" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <jsp:setProperty name="dateValue" property="time" value="${sub.billingCycleAnchor*1000}"/>
                                                        <fmt:formatDate value="${dateValue}" pattern="dd/MM/yyyy" var="formattedAnchorDate"/>
                                                        <form:input path="billing_cycle_anchor" type="text" class="form-control" value="${formattedAnchorDate}"/>
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">coupon</label>
                                                <div class="col-sm-6">
                                                    <form:input path="coupon" class="form-control" id="coupon-id" value="${sub.discount.coupon.id}" disabled="true"/>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="coupon-id">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">application_fee_percent</label>
                                                <div class="col-sm-6">
                                                    <form:input path="application_fee_percent" class="form-control" id="appFeePercent" value="${sub.applicationFeePercent}" disabled="true"/>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="appFeePercent">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">tax_percent</label>
                                                <div class="col-sm-6">
                                                    <form:input path="tax_percent" class="form-control" id="taxPercent" value="${sub.taxPercent}" disabled="true"/>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="taxPercent">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">days_until_due</label>
                                                <div class="col-sm-6">
                                                    <form:input path="days_until_due" class="form-control" id="daysUntilDue" value="${sub.daysUntilDue}" disabled="true"/>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="daysUntilDue">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-5 control-label">trial_end</label>
                                                <div class="col-sm-6">

                                                    <div class="input-group date" data-date-autoclose="true" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <jsp:setProperty name="dateValue" property="time" value="${sub.trialEnd*1000}"/>
                                                        <fmt:formatDate value="${dateValue}" pattern="dd/MM/yyyy" var="formattedAnchorDate"/>
                                                        <form:input path="trial_end" type="text" id="trialEnd" class="form-control" value="${formattedAnchorDate}" disabled="true"/>
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <span style="margin-left: -6px;">edit</span><input type="checkbox" class="edit-checkbox" name="trialEnd">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>

                            <div class="row">
                                <div class="col-sm-3 col-sm-offset-9">
                                    <button id="update-sub-btn" class="btn btn-primary-stripe-blue" style="width: 100%"><span>Update subscription</span></button>
                                </div>
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
<script src="<c:url value="/resources/vendor/datatables/js-main/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables/js-bootstrap/dataTables.bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables-colreorder/dataTables.colReorder.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables-tabletools/js/dataTables.tableTools.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script>

    $(function()
    {
        // toggle nav active
        $('#navBilling').toggleClass('active');
        $('#navSub').toggleClass('active');
        $('#navSubUpdate').toggleClass('active');

        $('.more-item').hide();

        $('#add-item-btn').on('click', function () {
            $('.more-item').show();
            /*var html = "<div class=\"form-group more-item\"><label class=\"col-sm-5 control-label\"><a href=\"#\" class=\"list-plan\">items[X][plan]</a></label><div class=\"col-sm-6\"><form\:input path=\"items[X].plan\" class=\"form-control\" id=\"itemXplan\" value=\"\" /></div></div>";
            $('.more-items').append(html);*/
        });

        $('.edit-checkbox').on('change', function () {
            //console.log($(this).is(":checked"));
            var id = $(this).prop('name');
            //console.log(id);
            if ($(this).is(":checked")){
                $('#'+id).removeAttr("disabled");
            } else {
                $('#'+id).attr("disabled", "disabled");
            }

        });


        // Show error message
        if (${error != null}){
            showErrorMsg("${error.event}", "${error.message}");
        };


        // date picker
        $('.input-group.date').datepicker({
            daysOfWeekDisabled: "0,6",
            autoclose: true,
            todayHighlight: true
        });


        preSelectOption("billing", "${sub.billing}");
        preSelectOption("cancelAtEnd", "${sub.cancelAtPeriodEnd}");

        function preSelectOption(id, value){
            $('#'+id+ ' option').each(function () {
                var pageValue = $(this).val();
                if (pageValue === value){
                    $(this).attr("selected", "selected");
                }
            });
        }

        $('#update-sub-btn').on('click', function () {

            var data = $('#subForm').serializeArray();
            console.log(data);

            $.ajax({
                type: "POST",
                url: "${sub.id}/update",
                dataType: "json",
                data: data,

                success: function (result) {
                   console.log(result);
                }
            });
        })
    });

</script>

</body>
</html>


