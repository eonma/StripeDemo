function showErrorMsg(title, msg){

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "0",
        "extendedTimeOut": "0",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut",
        "newestOnTop": true,
    };
    toastr.error(msg, title);
}
function showNotification(title, msg) {
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut",
        "newestOnTop": true,
    };
    toastr.info(msg, title);
}
function retrieveDetails(url){

    Swal.fire({
        html: '<pre style="text-align: left !important;"></pre>',
        onBeforeOpen: (
            Swal.showLoading(),
                function(){
                    $.ajax({
                        type : "GET",
                        url : url,
                        beforeSend: function (xhr) {
                            /* Authorization header */
                            xhr.setRequestHeader("Authorization", "Bearer sk_test_9wTiIIE9XtvLgbrpMVSVJrIS");
                            xhr.setRequestHeader("X-Mobile", "false");
                        },
                        success: function(result){
                            //console.log(JSON.stringify(result));
                            Swal.getContent().querySelector('pre').textContent = JSON.stringify(result, null, 3);
                        },
                        error: function (result) {
                            //console.log(result.responseJSON.error);
                            Swal.close();
                            showErrorMsg(result.responseJSON.error.code, result.responseJSON.error.message);
                        }
                    })
                }
        )
    });
}
function retrieveDetails(url, secretKey){

    Swal.fire({
        html: '<pre style="text-align: left !important;"></pre>',
        onBeforeOpen: (
            Swal.showLoading(),
                function(){
                    $.ajax({
                        type : "GET",
                        url : url,
                        beforeSend: function (xhr) {
                            /* Authorization header */
                            xhr.setRequestHeader("Authorization", "Bearer " + secretKey);
                            xhr.setRequestHeader("X-Mobile", "false");
                        },
                        success: function(result){
                            //console.log(JSON.stringify(result));
                            Swal.getContent().querySelector('pre').textContent = JSON.stringify(result, null, 3);
                        },
                        error: function (result) {
                            //console.log(result.responseJSON.error);
                            Swal.close();
                            showErrorMsg(result.responseJSON.error.code, result.responseJSON.error.message);
                        }
                    })
                }
        )
    });
}
function updateStatus(url){

}

function deleteObject(url){
    console.log(url);
    $.ajax({
        type: "DELETE",
        url: url,
        beforeSend: function (xhr) {
            /* Authorization header */
            xhr.setRequestHeader("Authorization", "Bearer sk_test_9wTiIIE9XtvLgbrpMVSVJrIS");
            xhr.setRequestHeader("X-Mobile", "false");
        },
        success: function(result){
            console.log(result);
            //return result;
        },
        error: function (result) {
            //console.log(result.responseJSON.error);
            Swal.close();
            showErrorMsg(result.responseJSON.error.code, result.responseJSON.error.message);
        }
    });
}



function getURL(originalURL, accountName)
{
    var url = originalURL.replace("#", "");
    url = url.split('?')[0];
    url = url + "?acct=" + accountName;
    return url;
}

function getToday(){
    var today = new Date();
    var dd = today.getDate();

    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd;
    }

    if(mm<10) {
        mm='0'+mm;
    }

    today = mm+'/'+dd+'/'+yyyy;
    return today;

}

function onSignIn(googleUser) {
    console.log("HERE");
    var profile = googleUser.getBasicProfile();
    if (profile !== ''){
        console.log("LOGGED OUT");
    } else {
        console.log(profile);
        console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        console.log('Name: ' + profile.getName());
        console.log('Image URL: ' + profile.getImageUrl());
        console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    }

    return profile;
}

function signOut() {
    console.log("logging out...");
    $.removeCookie('user');
}

function onLoad(){
    console.log("loading....");
    gapi.load('auth2', function() {
        auth2 = gapi.auth2.init({
            client_id: '927746323156-6n30vkqvoij4meib86mpcg2388k87t45.apps.googleusercontent.com',
        });
    });
}

function addMetaData(prefix, md_num){
    var md = $('#' + prefix + md_num).clone();
    md_num++;
    md.attr('id', prefix + md_num);
    var inputs = md.find('input');

    inputs.each(function () {
        var id = $(this).attr('id');
        id = id.replace(md_num-1, md_num);
        console.log(id);
        $(this).attr('id', id);
        var toggle = $(this).data('toggle');
        if (toggle !== 'undefined'){
            $(this).attr('data-toggle', md_num);
        }
        $(this).val('');
        $(this).attr('name', '');
    });

    $('#' + prefix + (md_num-1)).after(md);
}


function blockElement(element){
    $('div' + element).block({
        message: '<i class=\"lds-dual-ring\"></i>',
        css: {background : 'transparent',border: 'none', color: 'white', fontSize: '25px' }
    });
}

function unBlockElement(element){
    $('div' + element).unblock();
}

function setDatePicker(selector){
    //console.log(selector);
    // date picker
    $(selector).datepicker({
        daysOfWeekDisabled: "0,6",
        autoclose: true,
        todayHighlight: true
    });
}

function setDatePickers(selectors){
    //console.log(selectors);
    selectors.forEach(function (selector) {
        setDatePicker(selector);
    })
}

function replaceText(domElement, selector, num){
    var item = domElement.find(selector);
    var item_text = item.text().replace(num-1, num);
    //console.log(item_text);
    item.html(item_text);
}

// disable/undisable input/select
function toggleDisable(selector, type){
    var findings = $(selector).find(type);
    findings.each(function () {
        var isDisabled = $(this).attr('disabled');
        if (isDisabled === 'undefined' || isDisabled !== 'disabled'){
            $(this).attr('disabled', true);
        } else {
            $(this).attr('disabled', false);
        }
    });
}




