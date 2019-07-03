package stripe.api.playground.service;

import stripe.api.playground.model.Address;
import stripe.api.playground.model.PageElement;
import stripe.api.playground.model.PaymentIntentReq;
import stripe.api.playground.model.Shipping;

/**
 * User: chenma
 * Date: 2019-01-08
 */

public class PageServ {

    private static final String CLASSNAME = PageServ.class.getName();

    private PaymentIntentReq piReq;

    public PaymentIntentReq getPiReq() {
        return piReq;
    }

    /**
     * Initialise PaymentIntent page.
     * @param isConnect
     * @return pageElement
     */
    public PageElement initPaymentIntentPage(Boolean isConnect){

        // initialise PaymentIntent page data

        // initialise PaymentIntent page elements


        PaymentIntentReq piReq = new PaymentIntentReq();
        //TODO: initialise PaymentIntent page data;

        piReq.setAllowed_source_types("card");
        piReq.setCurrency("gbp");
        piReq.setCapture_method("automatic");
        Shipping shipping = new Shipping();
        shipping.setName("John Smith");
        Address address = new Address();
        //address.line1("221 Old Street");
        //address.city("London");
        //address.setPostal_code("EC1V 9NR");
        shipping.setAddress(address);
        piReq.setShipping(shipping);

        PageElement pageElement = new PageElement("publish_key", false, isConnect, false);
        return pageElement;
    }

    public PageElement handleResponse(Boolean isConnect, Object responseObj){
        PageElement pageElement = new PageElement("publish_key", true, isConnect, false);

        return pageElement;
    }
}
