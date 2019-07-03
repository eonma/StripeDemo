<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-14
  Time: 14:01
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
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" />">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="https://stripe.com/favicon.ico" />">

</head>
<body class="layout-topnav">

<!-- WRAPPER -->
<div id="wrapper">

    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div dir="ltr" style="text-align: left;" trbidi="on">
                <script>
                    (function(d, s, id) {
                        var js, ref = d.getElementsByTagName(s)[0];
                        if (!d.getElementById(id)) {
                            js = d.createElement(s);
                            js.id = id;
                            js.async = true;
                            js.src = "https://www.paypal.com/webapps/merchantboarding/js/lib/lightbox/partner.js";
                            ref.parentNode.insertBefore(js, ref);
                        }
                    }(document, "script", "paypal-js"));

                </script>
                <a data-paypal-button="true" href="https://www.sandbox.paypal.com/partnerexp/appEntry?referralToken=MGU2ZTcwYTAtM2UzYS00YmI5LTkzZDEtYTkzZWM1YTQ4YWJkbGFVVFZpbFhEUGZSQmxnQUJPeUJlN2s5d094U1lsMEhDNU1rdzJXb2xHVT0=&context_token=3344700881607067648&displayMode=minibrowser" target="PPFrame">Sign up for PayPal</a>
            </div>
        </div>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END MAIN -->
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script>

    $(function()
    {
        init();

        $('#business_type').on('change', function () {
            var name = $(this).children("option:selected").val();
            if ("company" == name){
                $('#req-individual').hide();
                $('#req-company').find($(':input')).removeAttr("disabled");
                $('#req-individual').find($(':input')).attr("disabled", "disabled");

                $('#req-company').show();

            } else if ("individual" == name){
                $('#req-company').hide();
                $('#req-individual').find($(':input')).removeAttr("disabled");
                $('#req-company').find($(':input')).attr("disabled", "disabled");

                $('#req-individual').show();
            } else {
                $('#req-company').hide();
                $('#req-individual').hide();
            }
        });

        var currentAccount;
        var currentCountrySpec;
        var bankAccountCurrencies;

        // load account list to form
        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $("input[name='accountName']").val(accountName);

            // get current account
            if (accountName != ""){
                $.ajax({
                    type : "GET",
                    url : "getAccount",
                    data: "acctName="+accountName,
                    success: function(result){
                        currentAccount = result;

                        var initCountry = $('#country'). children("option:selected").val();
                        setContryCurrency(initCountry, currentAccount);

                        $('#parameters').show();
                    }
                });
            } else {
                $('#parameters').hide();
            }

        });

        // populate country specs
        $('#country').on('change', function () {

            var country = $(this). children("option:selected").val();
            setContryCurrency(country, currentAccount);

        });

        // load countries and currencies of the bank account associated with the connect account
        function setContryCurrency(country, currentAccount){
            $.ajax({
                type: "GET",
                url: "https://api.stripe.com/v1/country_specs/"+country,

                beforeSend: function (xhr) {
                    /* Authorization header */
                    xhr.setRequestHeader("Authorization", "Bearer " + currentAccount.accountSecretKey);
                    xhr.setRequestHeader("X-Mobile", "false");
                },

                success: function(result){
                    //console.log(result);
                    currentCountrySpec = result;
                    $('#default_currency').val(currentCountrySpec.default_currency);
                    bankAccountCurrencies = currentCountrySpec.supported_bank_account_currencies;

                    var currencyList = [];

                    // clean the currency dropdown list
                    $('#external_account_currency').html('');
                    $('#external_account_country').html('');
                    $('#external_account_currency').append($('<option>', {
                        value: "",
                        text : "--------"
                    }));

                    Object.keys(bankAccountCurrencies).forEach(function(key){
                        currencyList.push(key);

                        // load bank account currencies to external_account object
                        $('#external_account_currency').append($('<option>', {
                            value: key,
                            text : key
                        }));
                    });
                }
            });
        }
        // load countries when the bank account currency is changed
        $('#external_account_currency').on('change', function () {
            var currency = $(this).children("option:selected").val();

            Object.keys(bankAccountCurrencies).forEach(function(key){

                if (currency == key){

                    // clean the currency dropdown list
                    $('#external_account_country').html('');
                    $('#external_account_country').append($('<option>', {
                        value: "",
                        text : "--------"
                    }));

                    var countries = bankAccountCurrencies[key];

                    // load bank account currencies to external_account object
                    $.each(countries, function (i, item) {
                        $('#external_account_country').append($('<option>', {
                            value: item,
                            text : item
                        }));
                    });
                }
            });

        });


        // submit form
        $('#btn-create-acct').on('click', function () {
            //$('#acct-form').submit();

            // disable button
            $(this).append("<i class=\"fa fa-spinner fa-spin btn-spinner\"></i>");
            $(this).prop('disabled', true);

            var tosDate = $('#tos_acceptance_date').val();
            var timestamp = Date.parse(tosDate)/1000;
            console.log(timestamp);

            var data = $('#acct-form').serializeArray();

            // convert date to millisecond
            data.forEach(function (item) {
                if (item.name === 'tos_acceptance.date') {
                    item.value = timestamp;
                }
            });


            // submit request
            $.ajax({
                type: "POST",
                url: "custom-account",
                dataType : "json",
                data: data,

                success: function(result){

                    if (result.error){
                        showErrorMsg(result.body.code, "Request ID: " + result.body.requestId + " Message: " + result.body.message);
                        $('#btn-create-acct').prop('disabled', false);

                    } else {
                        // change data.
                        data.forEach(function (item) {
                            // replace "." from the id name.
                            var name = item.name.replace(/\./g, '_');

                            // disable all submitted fields
                            if (item.value != ""){
                                $('#'+name).attr("disabled", "disabled");
                            }
                        });

                        //console.log(result.body);
                        var account = result.body;

                        // show update account / person button
                        $('#btn-create-acct').find('.btn-spinner').remove();

                        // highlight required fields


                        // show account details section
                        $('.account-id').append(account.id);
                        $('.account-id').attr("id", account.id);
                        $("input[name='accountId']").val(account.id);

                        //$('#account-details').text(JSON.stringify(result.body.requirements, null, 3));
                        $('#acct-display').show();


                        var requirements = account.requirements;
                        var currentDue = requirements.currentlyDue;
                        var isAccountReady = true;

                        currentDue.forEach(function (item) {
                            if ('external_account' == item){
                                $('#external-account-collapsed').toggleClass('collapsed');
                                $('#external-account').toggleClass('in');
                                $('#external-account').css('height', '');
                                $('#external-account-collapsed').find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
                                $('#external_account_object').toggleClass('mandatory');
                                $('#external_account_country').toggleClass('mandatory');
                                $('#external_account_currency').toggleClass('mandatory');
                                $('#external_account_account_number').toggleClass('mandatory');
                            }
                            isAccountReady = false;
                        });

                        var eventuallyDue = requirements.eventuallyDue;
                        var hasCompany = false;
                        var hasIndividual = false;
                        eventuallyDue.forEach(function (item) {
                            var fieldName = item.replace(/\./g, '_');
                            $('#'+fieldName).toggleClass('mandatory');
                            if (fieldName.includes('company')){
                                hasCompany = true;
                            }
                            if (fieldName.includes('individual')){
                                hasIndividual = true;
                            }
                            isAccountReady = false;
                        });

                        if (hasCompany){
                            $('#company').toggleClass('collapsed');
                            $('#company').toggleClass('in');
                            $('#company').css('height', '');
                            $('#company-collapsed').find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');

                            $('#btn-add-person').show();
                        }

                        if (hasIndividual){

                            $('#individual').toggleClass('collapsed');
                            $('#individual').toggleClass('in');
                            $('#individual').css('height', '');
                            $('#individual-collapsed').find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
                        }

                        if (!isAccountReady){
                            $('#btn-update-acct').show();
                        }
                    }
                }
            });
        });


        $('#btn-update-acct').on('click', function () {
            // disable button
            $(this).append("<i class=\"fa fa-spinner fa-spin btn-spinner\"></i>");
            $(this).prop('disabled', true);

            var data = $('#acct-form').serializeArray();

            // submit request
            $.ajax({
                type: "POST",
                url: "update-account",
                dataType: "json",
                data: data,

                success: function (result) {
                    // show update account / person button
                    $('#btn-update-acct').find('.btn-spinner').remove();

                    if (result.error){
                        showErrorMsg(result.body.code, "Request ID: " + result.body.requestId + " Message: " + result.body.message);
                        $('#btn-update-acct').prop('disabled', false);

                    } else {
                        // change data.
                        data.forEach(function (item) {
                            // replace "." from the id name.
                            var name = item.name.replace(/\./g, '_');

                            // disable all submitted fields
                            if (item.value != "") {
                                $('#' + name).attr("disabled", "disabled");
                            }
                        });

                        var account = result.body;
                        var currentDue = account.requirements.currentlyDue;
                        var eventuallyDue = account.requirements.eventuallyDue;

                        if (currentDue.length > 0 && eventuallyDue > 0){
                            $('#btn-update-acct').prop('disabled', false);
                        }
                    }
                }
            });
        });

        // show person panel
        $('#btn-add-person').on('click', function () {
            $('#person').show();
        });

        $('.account-id').on('click', function()
        {
            retrieveDetails("https://api.stripe.com/v1/accounts/" + $(this).get(0).id, currentAccount.accountSecretKey);
        });




        // date picker
        $('.input-group.date').datepicker({
            daysOfWeekDisabled: "0,6",
            autoclose: true,
            todayHighlight: true
        });



        function init(){
            // toggle nav active
            $('#navConnect').toggleClass('active');
            $('#navConnectAccount').toggleClass('active');
            $('#navCreateAccount').toggleClass('active');
            $('#parameters').hide();
            $('#req-individual').hide();
            $('#req-individual').find($(':input')).attr("disabled", "disabled");

            // accordion toggle collapse
            $('.project-accordion [data-toggle="collapse"]').on('click', function()
            {
                $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
            });

            // set current ip address
            $.getJSON('https://api.ipify.org?format=json', function (data) {
                $('#tos_acceptance_ip').val(data.ip);
            })

            // set today's date
            $('#tos_acceptance_date').val(getToday());
        }
    });

</script>

</body>
</html>
