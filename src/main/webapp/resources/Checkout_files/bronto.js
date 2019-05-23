var jsonCart = "";
var customerCartId = "";
var grandTotal = 0;
var orderId = 0;
var subTotal = 0;
var tax = 0;
var baseUrlImage = ECP.getBase();
var baseUrl = ECP.getBase();


function initCart()
{
	//var jsonCart;
	if(getCookie('__btr_id')!=""){
		customerCartId = getCookie('__btr_id');
	} 
	
	if(customerCartId=='')
	{
		customerCartId = parseFloat(Math.random()*10000000).toFixed(0);
	}

	$.ajax({
		type:'POST',
		url : baseUrl+"/secure/bronto/addCartToBronto",
		async: false,
		data:{'customerCartId':customerCartId,"grandTotal":0,"orderId":0,"subTotal":0,"discountAmount":0,"url":baseUrl,"currency":"GBP","taxAmount":0,"other":'',"imageUrl":'',"unitPrice":0,"sku":'',"category":'',"description":'',"productUrl":'','name':'','quantity':'','salePrice':0,'surchargePrice':0,'surchargeCode':0,'totalPrice':0,'update':false},
		success:function(data){
			jsonCart = data.jsonCartData;
			//console.log(jsonCart);
			grandTotal = jsonCart.grandTotal;
		}	
	});
	
//	refreshBrontoCart();
//	setInterval(refreshBrontoCart(), 10000);
	
}
function updateBrontoCart(customerCartId){
	//console.log('update basket js');
	$.ajax({
		type:'POST',
		url : baseUrl+"/secure/bronto/addCartToBronto",
		async: false,
		data:{'customerCartId':customerCartId,"url":baseUrl},
		success:function(data){
			jsonCart = data.jsonCartData;
			//console.log(jsonCart);
			grandTotal = jsonCart.grandTotal;
		}	
	});
}

function getCookie(cname) 
{
    var name = cname + "=";
    var ca = document.cookie.split(';');
	//console.log(ca.length);
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}
initCart();

/*
 * bronto code ends
 *
 */


function updateBrontoCartInfo(customerCartId, grandTotal, orderId, subTotal, discountAmount, url, currency, taxAmount, other, imageUrl, unitPrice, sku, category, description, productUrl, name, quantity, salePrice, totalPrice, surchargePrice, surchargeCode, productImage,update)
{
	var ifbr_id = getCookie("__btr_id");
	currency = "GBP";
	if( ifbr_id!= ""){
		customerCartId = ifbr_id;
	}
	
	if(productImage != ''){
		productImage = baseUrlImage+"/images/products/200x200/"+productImage;
	} else {
		productImage = 'No Image Available';
	}
	//console.log(customerCartId);
	
	var objAjax = new CAjax();
	
	if (objAjax.open("/dynamic/brontoJSONManager.php?customerCartId="+customerCartId+"&grandTotal="+grandTotal+"&orderId="+orderId+"&subTotal="+subTotal+"&discountAmount="+discountAmount+"&url="+baseUrl+"&currency="+currency+"&taxAmount="+taxAmount+"&other="+other+"&imageUrl="+productImage+"&unitPrice="+unitPrice+"&sku="+sku+"&category="+category+"&description="+escape(description)+"&name="+name+"&quantity="+quantity+"&salePrice="+salePrice+"&totalPrice="+totalPrice+"&surchargePrice="+surchargePrice+"&surchargeCode="+surchargeCode+"&update="+update+"&productUrl="+productUrl, true, true))	
	{
		jsonCart = objAjax.getResponse();
		//console.log(jsonCart);
		jsonCart = JSON.parse(jsonCart);
		//console.log(jsonCart);
	}
//	setInterval(refreshBrontoCart(), 10000);
//	refreshBrontoCart()
}


function updateBrontoGrandTotal()
{
	var objAjax = new CAjax();
	
	if (objAjax.open("/dynamic/brontoJSONManager.php?customerCartId="+customerCartId+"&updateGrandTotal=true&subTotal="+subTotal+"&discountAmount=0", true, true))	
	{
		jsonCart = objAjax.getResponse();
		//console.log(jsonCart);
		jsonCart = JSON.parse(jsonCart);
		//console.log(jsonCart);
	}
	//setInterval(refreshBrontoCart(), 10000);
}

function setCookie(cname, cvalue, exdays) 
{
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires + "; path=/";
}


function brontoEmailCapture(emailId){
	bronto.trigger('email:captured', { email: emailId });
}


//setInterval(refreshBrontoCart(), 10000);
