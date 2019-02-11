<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-07
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-default navbar-fixed-top">
    <!-- main navigation -->
    <div id="navbar-menu" class="bottom-bar clearfix">
        <div class="navbar-collapse collapse" id="main-nav">

            <ul class="nav navbar-nav">
                <li>
                    <a href="/" id="navHome"> <i><img style="width: 16px;" src="<c:url value="/resources/img/dashboard_grey.png"/>"></i> <span>Home</span></a>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" id="navPayment"><i><img style="width: 16px;" src="<c:url value="/resources/img/payment_grey.png"/>"></i> <span>Payments</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown dropdown-sub">
                            <a data-toggle="dropdown" id="navPi"> PaymentIntent <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="create-paymentintent" id="navCreatePi"> Create a PaymentIntent </a></li>
                                <li><a href="create-paymentintent-connect" id="navCreatePiConnect">  Create a PaymentIntent for Connect</a></li>
                                <li><a href="update-paymentintent" id="navUpdatePi"> Update a PaymentIntent </a></li>
                                <li><a href="confirm-paymentintent" id="navConfirmPi"> Confirm a PaymentIntent </a></li>
                                <li><a href="capture-paymentintent" id="navCapturePi"> Capture a PaymentIntent </a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-sub">
                            <a data-toggle="dropdown" id="navCharge"> Charge <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="create-charge" id="navCreateCharge"> Create a Charge </a></li>
                                <li><a href="create-charge-connect" id="navCreateChargeConnect">  Create a Charge for Connect</a></li>
                                <li><a href="capture-charge" id="navCaptureCharge"> Capture a Charge </a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="create-refund" id="navCreateRefund"> Create a Refund</a>
                        </li>
                        <li>
                            <a href="dispute" id="navDispute"> Dispute </a>
                        </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" id="navBilling"> <img style="width: 16px;" src="<c:url value="/resources/img/billing_grey.png"/>"></i> <span>Billing</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="product" id="navProduct" > Product </a></li>
                        <li><a href="plan" id="navPlan" > Plan </a></li>
                        <li class="dropdown dropdown-sub">
                            <a href="subscription" data-toggle="dropdown" id="navSub" > Subscription <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="subscription" id="navSubCreate"> Create subscription</a></li>
                                <li><a href="list-subscription" id="navSubList"> List all subscriptions </a></li>
                                <li><a href="update-subscription" id="navSubUpdate"> Update subscription</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" id="navConnect"><img style="width: 16px;" src="<c:url value="/resources/img/connect_grey.png"/>"></i> <span>Connect</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" id="navConnectAccount"> Connect Account <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="create-connect-account" id="navCreateAccount"> Create an Account </a></li>
                                <li><a href="retrieve-account-details" id="navAccountDetails"> Retrieve Account Details </a></li>
                                <li><a href="update-account" id="navUpdateAccount"> Update an Account </a></li>
                                <li><a href="delete-account" id="navDeleteAccount"> Delete an Account </a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" id="navTransfer">Submenu 2 <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Another menu level</a></li>
                                <li><a href="#" class="active">Another menu level</a></li>
                                <li><a href="#">Another menu level</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Submenu 3</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><img style="width: 16px;" src="<c:url value="/resources/img/terminal_grey.png"/>"></i> <span>Terminal</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown">Submenu 1 <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Another menu level</a></li>
                                <li><a href="#">Another menu level</a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" class="active">Submenu 2 <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Another menu level</a></li>
                                <li><a href="#" class="active">Another menu level</a></li>
                                <li><a href="#">Another menu level</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Submenu 3</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"> </i><img style="width: 16px;" src="<c:url value="/resources/img/issuing_grey.png"/>"></i> <span>Issuing</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown">Submenu 1 <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Another menu level</a></li>
                                <li><a href="#">Another menu level</a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" class="active">Submenu 2 <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Another menu level</a></li>
                                <li><a href="#" class="active">Another menu level</a></li>
                                <li><a href="#">Another menu level</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Submenu 3</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"> </i><img style="width: 16px;" src="<c:url value="/resources/img/dashboard_grey.png"/>"></i> <span>Other APIs</span> <i class="ti-angle-down icon-submenu"></i></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown">Submenu 1 <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Another menu level</a></li>
                                <li><a href="#">Another menu level</a></li>
                            </ul>
                        </li>
                        <li class="dropdown dropdown-sub">
                            <a href="#" data-toggle="dropdown" class="active">Submenu 2 <i class="icon-submenu ti-angle-right"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Another menu level</a></li>
                                <li><a href="#" class="active">Another menu level</a></li>
                                <li><a href="#">Another menu level</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Submenu 3</a></li>
                    </ul>
                </li>
            </ul>


            <ul class="nav navbar-nav navbar-right">
                <li class="hidden-xs hidden-sm">
                    <a href="#" class="btn-toggle-rightsidebar">
                        <i class="ti-settings"></i><span> Settings</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- end main navigation -->
</nav>
