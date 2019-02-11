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
    }
    toastr.error(msg, title);
};

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
        "hideMethod": "fadeOut"
    }
    toastr.info(msg, title);
};


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
};

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