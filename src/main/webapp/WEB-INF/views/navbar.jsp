<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-07
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<div class="stripes-container">
    <!-- left side -->
    <div class="stripe"></div>
    <div class="stripe"></div>
    <div class="stripe"></div>
    <div class="stripe"></div>
    <div class="stripe"></div>
    <div class="stripe"></div>

    <!-- right side -->
    <div class="stripe"></div>
    <div class="stripe"></div>
    <div class="stripe"></div>
    <div class="stripe"></div>
    <div class="stripe"></div>
    <div class="stripe"></div>
</div>--%>
<nav class="navbar navbar-default ">
    <!-- main navigation -->
    <div id="navbar-menu" class="bottom-bar container clearfix">
        <a href="/" class="navbar-brand">
            <img src="<c:url value="/resources/img/stripe.svg"/>" style="height:26px;">
        </a>

        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav" aria-expanded="false">
            <span class="sr-only">Toggle Navigation</span>
            <i class="fa fa-bars"></i>
        </button>

        <div class="navbar-collapse collapse" id="main-nav" style="float: right;">
            <ul class="nav navbar-nav main-navbar-nav">
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" id="navPayment"><i><img style="width: 16px;" src="<c:url value="/resources/img/payment_grey.svg"/>"></i> <span>Payments</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown dropdown-sub">
                            <a data-toggle="dropdown" id="navSI"> SetupIntent  <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="/setup-intent" id="navCreateSI"> Create a SetupIntent </a></li>
                                <li><a href="/confirm-setup-intent" id="navConfirmSI"> Confirm SetupIntent </a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-sub">
                            <a data-toggle="dropdown" id="navPi"> PaymentIntent <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="/payment-intent-auto" id="navCreatePiAuto"> Create a PaymentIntent - auto </a></li>
                                <li><a href="/payment-intent-manual" id="navCreatePiManual"> Create a PaymentIntent - manual </a></li>
                                <li><a href="/confirm-payment-intent" id="navConfirmPi"> Confirm a PaymentIntent </a></li>
                                <li><a href="/capture-payment-intent" id="navCapturePi"> Capture a PaymentIntent </a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-sub">
                            <a data-toggle="dropdown" id="navRefund"> Refund <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="/refund" id="navCreateRefund"> Create a Refund </a></li>
                                <li><a href="/refund-fee" id="navRefAppFee"> Refund Application Fee </a></li>
                                <li><a href="/reverse-transfer" id="navReverseTransfer"> Reverse a Transfer </a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/dispute" id="navDispute"> Dispute </a>
                        </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" id="navBilling"> <img style="width: 16px;" src="<c:url value="/resources/img/billing_grey.svg"/>"></i> <span>Billing</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="/product-plan" id="navProductPlan" > Product - Plan </a></li>
                        <li><a href="/create-sub" id="navCreateSub" > Create Subscription </a></li>
                        <%--<li><a href="/product" id="navProduct" > Products </a></li>
                        <li><a href="/plan" id="navPlan" > Plans </a></li>
                        <li class="dropdown dropdown-sub">
                            <a href="/subscription" data-toggle="dropdown" id="navSub" > Subscriptions <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="/subscription" id="navSubCreate"> Create a Subscription </a></li>
                                <li><a href="/list-subscription" id="navSubList"> List all Subscriptions </a></li>
                                <li><a href="/update-subscription" id="navSubUpdate"> Update a Subscription </a></li>
                            </ul>
                        </li>--%>
                        <%--<li><a href="/coupon" id="navCoupon" > Coupons </a></li>--%>
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" id="navInvoice" > Invoices <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="/invoice" id="navInvCreate"> Create an Invoice </a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" id="navConnect"><img style="width: 16px;" src="<c:url value="/resources/img/connect_grey.svg"/>"></i> <span>Connect</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" id="navConnectAccount"> Accounts <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="/connect-account" id="navCreateAccount"> Create an Account </a></li>
                                <li><a href="/create-person" id="navCreatePerson"> Create a Person </a></li>
                            </ul>
                        </li>
                        <%--<li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" id="navConnectPayment"> Payment <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#" id="navConnectPI"> Create a PaymentIntent </a></li>
                                <li><a href="#" id="navConnectTrans"> Create a Transfer </a></li>
                            </ul>
                        </li>--%>
                        <%--<li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" id="navConnectRefund"> Refund <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="/connect-refund" id="navConnectPaymentRefund"> Create a Payment Refund </a></li>
                                <li><a href="/reverse-transfer" id="navConnectReverseTrans"> Reverse a Transfer </a></li>
                            </ul>
                        </li>--%>
                        <li><a href="/balance" id="navBalance" > Retrieve Balance </a></li>
                        <li><a href="/payout" id="navPayout" > Create a Payout </a></li>
                        <%--<li><a href="/topup" id="navTopup" > Create a Topup </a></li>--%>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><img style="width: 16px;" src="<c:url value="/resources/img/terminal_grey.svg"/>"></i> <span>Terminal</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">

                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"> </i><img style="width: 16px;" src="<c:url value="/resources/img/products.svg"/>"></i> <span>Other APIs</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">

                    </ul>
                </li>
            </ul>


            <ul class="nav navbar-nav navbar-right">
                <%--<li class="hidden-xs hidden-sm">
                    <a href="add-account" class="btn-toggle-addaccount" id="addAccount">
                        <span> &nbsp; </span><i class="ti-settings"></i>
                    </a>
                </li>--%>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <%--<img id="user-img" src="<c:url value="/resources/img/user2.png"/>" alt="">--%>
                        <img id="user-img" src="https://lh3.googleusercontent.com/-a4oA3xYEsyo/AAAAAAAAAAI/AAAAAAAAAAc/CuQgft9-vRo/s96-c/photo.jpg" alt="">
                        <i class="ti-angle-down icon-submenu"></i>
                    </a>
                    <ul class="dropdown-menu logged-user-menu">
                        <li><a href="login"><i class="ti-user"></i> <span>Login</span></a></li>
                        <%--<li><a href="#" data-onsuccess="onSuccess" class="g-signin2" data-width=""><i class="ti-user"></i> <span>Login</span></a></li>--%>
                        <%--<li><div id="my-signin2"></div></li>--%>
                        <li><a href="add-account"><i class="ti-settings"></i> <span>Add account</span></a></li>
                        <li><a onclick="signOut();" style="cursor: pointer;"><i class="ti-power-off"></i> <span>Logout</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!-- end main navigation -->
    <!-- mobile nav -->
</nav>
